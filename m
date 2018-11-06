Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:28196 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727448AbeKFMQg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 07:16:36 -0500
Date: Tue, 06 Nov 2018 11:53:37 +0900
From: =?UTF-8?B?IuOCsOOCp+ODs+ODu+OCouODs+ODu+ODm+OCoeODsyI=?=
        <na-hoan@jinso.co.jp>
To: N=?UTF-8?B?aWtsYXMgU8O2ZGVybHVuZA==?=
        <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <1541472817738861000053ae@nat.cybozu.com>
References: <20181105140913.GA461@bigcity.dyn.berto.se>
In-Reply-To: <20181105140913.GA461@bigcity.dyn.berto.se>
Subject: Re: [v2 PATCH] thermal: rcar_gen3_thermal: Fix init value of IRQCTL
  register
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Niklas-san

Thank you for your review!


Niklas Söderlund wrote:
> Hi Hoan-san,
> 
> Thanks for your patch.
> 
> On 2018-10-25 11:13:41 +0900, Nguyen An Hoan wrote:
> > From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> > 
> > Fix setting value for IRQCTL register. We are setting the last 6 bits
> > of (IRQCTL) to be 1 (0x3f), this is only suitable for H3ES1.*, according
> > to new Hardware manual values 1 are "setting prohibited" for Gen3!
> 
> Hum, as you point out this change is not suitable for H3 ES1.x so this 
> would introduce a regression, which is not good. I will leave the final 
> word to Wolfram but in my view you need to introduce quirk handling to 
> keep support for H3 ES1.x or blacklist that SoC in the driver.
> 

With this patch and current state of the Gen3 thermal driver, H3ES1.* is still correctly supported.

    priv->thermal_init = rcar_gen3_thermal_init;
    if (soc_device_match(r8a7795es1))
        priv->thermal_init = rcar_gen3_thermal_init_r8a7795es1;

General common Gen3(H3, M3) and H3ES1. * using two different thermal_init（） function.

As the v1 of this patch

"https://patchwork.kernel.org/patch/10654457/"

I was  to change the init_r8a7795es1() function, but then test again

(I used the patch that improves interrupts for testing) and realized

(The count of interrupts  rising or falling temperature)
Unstable with H3ES1.1! So I update v2

I also have re-read the Hardware Manual,

with Rev0.5 is consistent with ES1 , but  Since Rev0.8 or Rev1.0 HWM is not compatible with H3ES1.

So that this update will be correct and consistent with rcar_gen3_thermal_init.
H3ES1.1 is already supported correctly at rcar_gen3_thermal_init_r8a7795es1!

I'm still thinking this change is correct! Thank you very much :)

Hoan.


> > 
> > Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> > ---
> >  drivers/thermal/rcar_gen3_thermal.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> > index 7aed533..fde3fd8 100644
> > --- a/drivers/thermal/rcar_gen3_thermal.c
> > +++ b/drivers/thermal/rcar_gen3_thermal.c
> > @@ -306,7 +306,7 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
> >  
> >  	usleep_range(1000, 2000);
> >  
> > -	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0x3F);
> > +	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0);
> >  	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
> >  	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, IRQ_TEMPD1 | IRQ_TEMP2);
> >  
> > -- 
> > 2.7.4
> > 
> 
> -- 
> Regards,
> Niklas Söderlund
