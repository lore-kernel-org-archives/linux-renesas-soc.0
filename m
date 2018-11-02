Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34760 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbeKBSie (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 14:38:34 -0400
Received: by mail-lj1-f195.google.com with SMTP id u6-v6so1178057ljd.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Nov 2018 02:31:59 -0700 (PDT)
Date: Fri, 2 Nov 2018 10:31:56 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        geert+renesas@glider.be, wsa@sang-engineering.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Fix does not have interrupts
 counting
Message-ID: <20181102093156.GB22306@bigcity.dyn.berto.se>
References: <1540890601-20126-1-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1540890601-20126-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Hoan-san,

Thanks for your patch.

On 2018-10-30 18:10:01 +0900, Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> This patch fixes thermal interrupts that did not happen when temprature changed.
> Add the function rcar_gen3_thermal_update_threshold(), this function is used to
> calculate the value written to the threshold registers REG_GEN3_IRQTEMP1 and
> REG_GEN3_IRQTEMP2.

Is it really a error if the IRQ don't happen and the thermal framework 
use the .set_trip() callback to move the window due to the polling 
instead of a IRQ due to a rapid thermal increase? I think not. I do not 
like this patch but I'm not expert on thermal subsystem so I'm open to 
be proven wrong :-)

> 
> This patch is based on renesas-bsp/rcar-3.5.4.rc2 !
> 
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>  drivers/thermal/rcar_gen3_thermal.c | 45 +++++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 7aed533..009c0db 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -185,37 +185,39 @@ static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
>  static int rcar_gen3_thermal_mcelsius_to_temp(struct rcar_gen3_thermal_tsc *tsc,
>  					      int mcelsius)
>  {
> -	int celsius, val1, val2;
> +	int val1, val2;
>  
> -	celsius = DIV_ROUND_CLOSEST(mcelsius, 1000);
> -	val1 = celsius * tsc->coef.a1 + tsc->coef.b1;
> -	val2 = celsius * tsc->coef.a2 + tsc->coef.b2;
> +	val1 = (mcelsius * tsc->coef.a1)/1000 + tsc->coef.b1;
> +	val2 = (mcelsius * tsc->coef.a2)/1000 + tsc->coef.b2;

This won't work I'm afraid as it can overflow. As the thcodes and ptat 
values can be read from hardware there theoretical max size is 0xfff 
according to the documentation. Those values are then used to calculate 
a1, b1, a2 and b2 constants. If you can prove that no overflow can 
happen I'm happy for this change as it increases accuracy. If so this 
should be posted as a separate patch.

>  
>  	return INT_FIXPT((val1 + val2) / 2);
>  }
>  
> -static int rcar_gen3_thermal_set_trips(void *devdata, int low, int high)
> +static int rcar_gen3_thermal_update_threshold(struct rcar_gen3_thermal_tsc *tsc)
>  {
> -	struct rcar_gen3_thermal_tsc *tsc = devdata;
> -
> -	low = clamp_val(low, -40000, 120000);
> -	high = clamp_val(high, -40000, 120000);
> -
> -	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQTEMP1,
> -				rcar_gen3_thermal_mcelsius_to_temp(tsc, low));
> +	u32 ctemp;
> +	int temp_code;
> +	int mcelsius, val1, val2;
>  
> -	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQTEMP2,
> -				rcar_gen3_thermal_mcelsius_to_temp(tsc, high));
> +	ctemp = rcar_gen3_thermal_read(tsc, REG_GEN3_TEMP) & CTEMP_MASK;
> +	val1 = FIXPT_DIV(FIXPT_INT(ctemp) - tsc->coef.b1, tsc->coef.a1);
> +	val2 = FIXPT_DIV(FIXPT_INT(ctemp) - tsc->coef.b2, tsc->coef.a2);
> +	mcelsius = FIXPT_TO_MCELSIUS((val1 + val2) / 2);
>  
> -	tsc->low = low;
> -	tsc->high = high;
> +	/* set the interrupts to exceed the temperature */
> +	temp_code = rcar_gen3_thermal_mcelsius_to_temp(tsc,
> +			mcelsius + MCELSIUS(1));
> +	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQTEMP1, temp_code);
> +	/* set the interrupts to fall below the temperature */
> +	temp_code = rcar_gen3_thermal_mcelsius_to_temp(tsc,
> +			mcelsius - MCELSIUS(1));
> +	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQTEMP2, temp_code);
>  
>  	return 0;
>  }
>  
>  static const struct thermal_zone_of_device_ops rcar_gen3_tz_of_ops = {
>  	.get_temp	= rcar_gen3_thermal_get_temp,
> -	.set_trips	= rcar_gen3_thermal_set_trips,

My understanding of the thermal framework is that implementing 
.set_trips() is correct and removing it here and rewriting is just 
wrong.  The driver should use the framework not do it's own thing, that 
way all the DT properties set for hysteresis and such are used in a 
correct way.

>  };
>  
>  static void rcar_thermal_irq_set(struct rcar_gen3_thermal_priv *priv, bool on)
> @@ -256,8 +258,11 @@ static irqreturn_t rcar_gen3_thermal_irq_thread(int irq, void *data)
>  	int i;
>  
>  	for (i = 0; i < priv->num_tscs; i++)
> +	{
> +		rcar_gen3_thermal_update_threshold(priv->tscs[i]);
>  		thermal_zone_device_update(priv->tscs[i]->zone,
>  					   THERMAL_EVENT_UNSPECIFIED);
> +	}
>  
>  	spin_lock_irqsave(&priv->lock, flags);
>  	rcar_thermal_irq_set(priv, true);
> @@ -306,7 +311,7 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
>  
>  	usleep_range(1000, 2000);
>  
> -	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0x3F);
> +	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0);

This looks correct according to the new datasheets but should be posted 
in a separate patch.

>  	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
>  	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, IRQ_TEMPD1 | IRQ_TEMP2);
>  
> @@ -414,6 +419,8 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>  		priv->thermal_init(tsc);
>  		rcar_gen3_thermal_calc_coefs(&tsc->coef, ptat, thcode[i]);
>  
> +		rcar_gen3_thermal_update_threshold(tsc);
> +
>  		zone = devm_thermal_zone_of_sensor_register(dev, i, tsc,
>  							    &rcar_gen3_tz_of_ops);
>  		if (IS_ERR(zone)) {
> @@ -465,7 +472,7 @@ static int __maybe_unused rcar_gen3_thermal_resume(struct device *dev)
>  		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
>  
>  		priv->thermal_init(tsc);
> -		rcar_gen3_thermal_set_trips(tsc, tsc->low, tsc->high);
> +		rcar_gen3_thermal_update_threshold(tsc);
>  	}
>  
>  	rcar_thermal_irq_set(priv, true);
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
