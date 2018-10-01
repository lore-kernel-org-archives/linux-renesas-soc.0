Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34884 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbeJBFdF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Oct 2018 01:33:05 -0400
Received: by mail-ed1-f66.google.com with SMTP id y19-v6so388164edd.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Oct 2018 15:53:00 -0700 (PDT)
Subject: Re: [RFC] i2c: reject transfers when adapter is suspended
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-pm@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Tony Lindgren <tony@atomide.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Phil Reid <preid@electromag.com.au>
References: <20181001174450.16625-1-wsa+renesas@sang-engineering.com>
 <53acc817-b982-6fc5-f5c1-5104968a2b33@redhat.com>
 <20181001215913.GA861@kunai>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <671f2ad7-7ef1-c3a5-3d9b-69ffb7e1d64e@redhat.com>
Date: Tue, 2 Oct 2018 00:52:57 +0200
MIME-Version: 1.0
In-Reply-To: <20181001215913.GA861@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On 01-10-18 23:59, Wolfram Sang wrote:
> 
>> IMHO the is_suspended flag should be set by the adapter driver from its
>> own suspend callback (which may be a normal, late or noirq suspend callback),
>> as this is the point past which the bus should no longer be used because
>> e.g. the suspend callbacks has disabled clocks and/or put the controller
>> in reset, etc.
> 
> That's what I meant with "not seeing the woods for the trees". Thanks
> for clearing my view!
> 
>> the i2c-controller device where necessary. But you're hooking into the
>> child-device of the actual "hardware" device which represents the i2c_adapter
>> bits.
> 
> That was intentional because this is the device the I2C core has access
> to. Because the callbacks deal only with 'is_suspended' and not with HW,
> I thought the logic device could be suitable. I didn't think of
> additional relations only affecting its parent.
> 
>> on the adapter-device. I believe that instead we should add
>> i2c_adapter_mark_suspended and i2c_adapter_mark_resumed helpers and let
>> the adapter-driver suspend/resume callbacks call these. This will ensure
>> that they get called at the right phase and at the exact moment that
>> the adapter is actually suspending.
> 
> Agreed. And these helpers are basically this:
> 
>>> +	i2c_lock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
>>> +	adap->is_suspended = true;
>>> +	i2c_unlock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
> 
> and this:
> 
>>> +	i2c_lock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
>>> +	adap->is_suspended = false;
>>> +	i2c_unlock_bus(adap, I2C_LOCK_ROOT_ADAPTER);

Yes that is correct.

> together with this still in the I2C core:
> 
>>> @@ -1867,6 +1904,9 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>>>    	if (WARN_ON(!msgs || num < 1))
>>>    		return -EINVAL;
>>> +	if (WARN_ON(adap->is_suspended))
>>> +		return -ESHUTDOWN;
>>> +
>>>    	if (adap->quirks && i2c_check_for_quirks(adap, msgs, num))
>>>    		return -EOPNOTSUPP;

Ack.

>>> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
>>> index 65b4eaed1d96..ee46295a67d4 100644
>>> --- a/include/linux/i2c.h
>>> +++ b/include/linux/i2c.h
>>> @@ -692,6 +692,8 @@ struct i2c_adapter {
>>>    	const struct i2c_adapter_quirks *quirks;
>>>    	struct irq_domain *host_notify_domain;
>>> +
>>> +	int is_suspended:1;
> 
> Are we aligned?

I believe we are.

Regards,

Hans
