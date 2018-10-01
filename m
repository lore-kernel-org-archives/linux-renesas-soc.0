Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40461 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbeJBDUX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Oct 2018 23:20:23 -0400
Received: by mail-ed1-f67.google.com with SMTP id j62-v6so103241edd.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Oct 2018 13:40:47 -0700 (PDT)
Subject: Re: [RFC] i2c: reject transfers when adapter is suspended
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Tony Lindgren <tony@atomide.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Phil Reid <preid@electromag.com.au>
References: <20181001174450.16625-1-wsa+renesas@sang-engineering.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <53acc817-b982-6fc5-f5c1-5104968a2b33@redhat.com>
Date: Mon, 1 Oct 2018 22:40:44 +0200
MIME-Version: 1.0
In-Reply-To: <20181001174450.16625-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On 01-10-18 19:44, Wolfram Sang wrote:
> When an I2C adapter is suspended, it should reject incoming transfers
> from other layers. Some drivers open code this. However, because the
> logical I2C adapter device has its own lock for serialization, we can
> let the I2C core do that to save the (error prone) boilerplate code.
> Make use of a newly added 'is_suspended' flag which gets set if the
> suspend_noirq stage of the driver was successful.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> This needs some text. I twisted my brain around all those different PM
> requirements for days. So, I might not see the woods for the trees. Anyway:
> 
> This is only tackling that resumed I2C adapters should not accept transfers any
> longer. If this happens, it will be rejected with a WARNing. Basically, any
> regression is considered a bug.
> 
> This is a bit different to the shutdown/reboot case we were discussing, too. In
> that case (with also no irqs), we decided to introduce a new callback
> 'master_xfer_irqless' and if it is not present, then we just try the old
> callback just to avoid regressions, e.g. I have a board which needs to be reset
> using the PMIC watchdog connected via I2C.
> 
> I don't like the different handling of these two cases. Ideally, we should
> whitelist such special transfers? The best I could come up with that idea was
> to introduce a flag I2C_CLIENT_I_M_SPECIAL for such I2C clients which will then
> tag all the I2C transfers with a similar flag, so we know these need special
> treatment. I am not really happy with it, though...

I've seen various cases where an i2c access to the  PMIC is the last thing
done at shutdown and those are relying on IRQs working at that time, so yeah
some cases will need some special handling.

> I didn't test the below patch as is because I couldn't write a test case to
> trigger it. I tested it by moving these new PM handlers away from _noirq and
> triggered a transfer in a I2C clients' noirq stage. That worked as expected,
> the transfer was rejected.
> 
> Which made me wonder if the _noirq stage is really the best hook for this? We
> might not catch drivers doing unwanted transfers in their noirq stage.

Actually on Intel devices the LPSS I2C controllers are left running until
their no_irq suspend method gets run because PCI devices are also left
running until their no_irq suspend and they LPSS I2C controllers are
needed to access the PMIC which may happen when turning off the PCI devices.

IMHO the is_suspended flag should be set by the adapter driver from its
own suspend callback (which may be a normal, late or noirq suspend callback),
as this is the point past which the bus should no longer be used because
e.g. the suspend callbacks has disabled clocks and/or put the controller
in reset, etc.

> I am also not super happy about using the bus_type PM callbacks here. With
> I2C adapters being logical devices only and having no driver attached, I
> didn't see another way, though.

I'm a bit surprised that you are using the bus_type PM callbacks here, we've
been fixing suspend ordering issues by putting RPM consumer device-links to
the i2c-controller device where necessary. But you're hooking into the
child-device of the actual "hardware" device which represents the i2c_adapter
bits. But this child may be suspended earlier then the hardware device and
the device-links we add will only influence the ordering wrt the suspend
of the actual "hardware" device, the child will stay in the same place in
the sorted list and thus may be suspended earlier leading to false-positive
-ESHUTDOWN errors.

TL;DR:

1) Some controllers stop being ready for transfers in the normal suspend phase,
others in the late or noirq phases

2) Putting the suspend/resume callbacks on a child device, rather then the
device which has the actual adapter-drivers suspend method may lead to the
device being marked as suspended earlier then it actually is, triggering
false positives.

Together to me this means that we should not play tricks with the bus pm_ops
on the adapter-device. I believe that instead we should add
i2c_adapter_mark_suspended and i2c_adapter_mark_resumed helpers and let
the adapter-driver suspend/resume callbacks call these. This will ensure
that they get called at the right phase and at the exact moment that
the adapter is actually suspending.

Regards,

Hans







> 
> All these issues aside, I hope it is a good starting point for a discussion.
> 
> Looking forward to comments,
> 
>     Wolfram
> 
> 
>   drivers/i2c/i2c-core-base.c | 40 ++++++++++++++++++++++++++++++++++++++++
>   include/linux/i2c.h         |  2 ++
>   2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9ee9a15e7134..ebd1ca38f768 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -448,6 +448,42 @@ static void i2c_device_shutdown(struct device *dev)
>   		driver->shutdown(client);
>   }
>   
> +static int i2c_adap_suspend_noirq(struct device *dev)
> +{
> +	struct i2c_adapter *adap = i2c_verify_adapter(dev);
> +	int ret;
> +
> +	if (!adap)
> +		return pm_generic_suspend_noirq(dev);
> +
> +	i2c_lock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
> +	ret = pm_generic_suspend_noirq(dev);
> +	if (ret == 0)
> +		adap->is_suspended = true;
> +	i2c_unlock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
> +	return ret;
> +}
> +
> +static int i2c_adap_resume_noirq(struct device *dev)
> +{
> +	struct i2c_adapter *adap = i2c_verify_adapter(dev);
> +	int ret;
> +
> +	if (!adap)
> +		return pm_generic_resume_noirq(dev);
> +
> +	i2c_lock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
> +	ret = pm_generic_resume_noirq(dev);
> +	if (ret == 0)
> +		adap->is_suspended = false;
> +	i2c_unlock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops i2c_bus_pm_ops = {
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(i2c_adap_suspend_noirq, i2c_adap_resume_noirq)
> +};
> +
>   static void i2c_client_dev_release(struct device *dev)
>   {
>   	kfree(to_i2c_client(dev));
> @@ -493,6 +529,7 @@ struct bus_type i2c_bus_type = {
>   	.probe		= i2c_device_probe,
>   	.remove		= i2c_device_remove,
>   	.shutdown	= i2c_device_shutdown,
> +	.pm		= &i2c_bus_pm_ops,
>   };
>   EXPORT_SYMBOL_GPL(i2c_bus_type);
>   
> @@ -1867,6 +1904,9 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>   	if (WARN_ON(!msgs || num < 1))
>   		return -EINVAL;
>   
> +	if (WARN_ON(adap->is_suspended))
> +		return -ESHUTDOWN;
> +
>   	if (adap->quirks && i2c_check_for_quirks(adap, msgs, num))
>   		return -EOPNOTSUPP;
>   
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 65b4eaed1d96..ee46295a67d4 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -692,6 +692,8 @@ struct i2c_adapter {
>   	const struct i2c_adapter_quirks *quirks;
>   
>   	struct irq_domain *host_notify_domain;
> +
> +	int is_suspended:1;
>   };
>   #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
>   
> 
