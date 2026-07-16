Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9707B3AA9D8;
	Thu, 16 Jul 2026 09:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194436; cv=none; b=BftJBhN9IYlIOhghW0DeNLhy3+22lT9CwfQc12YJ2JIo4k04HZVS/slsey05Or1y+Hs9INi5zufhiZsEW8C5m9kXtrKtp6Sb50ddGL4kW9wV7/hc0RzCiMUKGLz/a2EAOgdw5MPzQZar2ScGhfg/LmsDBYx5ngAvf+5NDETqaJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194436; c=relaxed/simple;
	bh=yRHxXtAZQYQoy2fcTRsItZ7f0eFPqEaCCEm3Sue8wpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kk1eznRUQSTbHOwnwUhQzZKNNI9jV7BfVoWpVHN1s0lCeZB60SR9L77Oa1rcdQDeeJctG30ceoGSONINl/FV4x5txnWpZ0t4birX0jNVtadtr2hGeqU2ZTN8R91tggaFp1/908IyTBox/kS/6qAzA67k4u3H55ZI77FivIGl8nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00D81F000E9;
	Thu, 16 Jul 2026 09:33:47 +0000 (UTC)
Message-ID: <9d300b0b-7241-4e6c-a665-6b86b176473d@tuxon.dev>
Date: Thu, 16 Jul 2026 12:33:45 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/17] i3c: renesas: Add runtime PM support
To: Frank Li <Frank.li@oss.nxp.com>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, p.zabel@pengutronix.de,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-18-claudiu.beznea+renesas@tuxon.dev>
 <ale7SS4VZ8aIwhJ3@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ale7SS4VZ8aIwhJ3@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/15/26 19:54, Frank Li wrote:
> On Mon, Jul 13, 2026 at 04:05:45PM +0300, Claudiu Beznea wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> On the SoCs where the Renesas I3C driver is enabled (RZ/G3S and RZ/G3E),
>> the clocks of the IP are managed through a clock PM domain. To keep the
>> I3C code simpler, the explicit clock handling was dropped along with the
>> addition of runtime PM support, in favor of the runtime PM APIs. Only the
>> code for getting tclk was preserved, as it is necessary to compute the
>> I3C clock rate.
>>
>> All the APIs provided to the I3C subsystem through struct
>> i3c_master_controller_ops are guarded with runtime PM APIs to
>> enable/disable the controller at runtime.
>>
>> As the Renesas I3C driver implements an asynchronous transmit model by
>> preparing a transfer and waiting for its completion through the ISR,
>> renesas_i3c_abort_xfer() was added to disable interrupts and clear any
>> pending IRQ status bits when there is no completion in the defined
>> timeout. Along with this, renesas_i3c_wait_xfer() return type was changed
>> to unsigned long.
>>
>> Add runtime PM support for the Renesas I3C driver.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v5:
>> - updated renesas_i3c_irqs_mask_and_clear() to use the
>>    renesas_i3c_irqs_mask_and_clear_locked() introduced in patch 1 from
>>    this series
>>
>> Changes in v4:
>> - renamed renesas_i3c_abort_xfer() from v3 to
>>    renesas_i3c_irqs_mask_and_clear(); along with it renamed local varibles
>>    abort_xfer to xfer_failed
>>
>> Changes in v3:
>> - dropped the RPM resume/suspend in renesas_i3c_suspend() to read the
>>    DATBASn registers as the DATBASn register are not used on suspend/resume
>>    path anymore in this version
>>
>> Changes in v2:
>> - dropped the runtime suspend/resume functions as for now, there will be
>>    no pinctrl sleep state described in DT
>> - do not synchronize the IRQs in renesas_i3c_abort_xfer() as some handlers
>>    may re-enable interrupts; instead just disable the interrupts and clean
>>    any status bits that the IRQ handlers are touching; with this the
>>    struct renesas_i3c::{irqs, num_irqs} and the associated code was removed
>> - dropped the renesas_i3c_dont_use_autosuspend() along with the
>>    devm_add_action_or_reset() call to set it since the same operation is
>>    done by the devres cleanup helper of devm_pm_runtime_enable()
>> - adjusted the renesas_i3c_suspend() with RPM calls to save the DATBAS
>>    registers
>> - use pm_runtime_resume_and_get() in renesas_i3c_resume() to avoid
>>    mixing gotos with cleanup helpers
>> - adjusted the patch description to reflect these changes
>>
> ...
>>
>> @@ -1384,12 +1458,16 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>>   	if (IS_ERR(i3c->regs))
>>   		return PTR_ERR(i3c->regs);
>>
>> -	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
>> -	if (ret <= RENESAS_I3C_TCLK_IDX)
>> -		return dev_err_probe(&pdev->dev, ret < 0 ? ret : -EINVAL,
>> -				     "Failed to get clocks (need > %d, got %d)\n",
>> -				     RENESAS_I3C_TCLK_IDX, ret);
>> -	i3c->num_clks = ret;
>> +	i3c->tclk = devm_clk_get(&pdev->dev, "tclk");
> 
> only one tclk? you remove devm_clk_bulk_get_all_enabled()
On all the SoCs where this driver is used the clocks are managed through clock 
PM domains. The clock PM domain registration is done though the drivers at [1] 
or [2].

The genpd registered by those drivers are passing GENPD_FLAG_PM_CLK flag to the
pm_genpd_init(). In that case the start/stop APIs of the genpd are
pm_clk_suspend/pm_clk_resume [3].

Thus, we can make use of runtime PM APIs to request, enable, disable the clocks 
using generic runtime PM APIs.

Every time this driver calls runtime suspend/resume APIs this goes down to the 
IP clocks and clk_disable()/clk_enable() them.

Since we are relying on clock PM domains there is no need to implement runtime 
suspend/resume ops for this driver that does just only 
clock_disable()/clk_enable(), thus, the final code is simpler. We only request 
the tclk as we need to compute the bus rate based on it.

Thank you,
Claudiu

[1]
https://elixir.bootlin.com/linux/v7.1-rc3/source/drivers/clk/renesas/rzg2l-cpg.c#L2013
[2]
https://elixir.bootlin.com/linux/v7.1-rc3/source/drivers/clk/renesas/rzv2h-cpg.c#L1549
[3] https://elixir.bootlin.com/linux/v7.1-rc3/source/drivers/pmdomain/core.c#L2439
