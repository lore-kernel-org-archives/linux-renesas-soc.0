Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40977 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbeKBS5B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 14:57:01 -0400
Received: by mail-lj1-f195.google.com with SMTP id z80-v6so1188938ljb.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Nov 2018 02:50:25 -0700 (PDT)
Date: Fri, 2 Nov 2018 10:50:22 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        wsa@sang-engineering.com, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Add Standby-Mode function
 support
Message-ID: <20181102095022.GC22306@bigcity.dyn.berto.se>
References: <1541142370-15225-1-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1541142370-15225-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Hoan,

Thanks for your work.

On 2018-11-02 16:06:10 +0900, Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> According to the hardware manual, Gen3 supports Standby-mode.
> Add this function, and we should use this function while
> suspend to reduce the energy consumption.

Out of curiosity is the power saved measurable?

> 
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>  drivers/thermal/rcar_gen3_thermal.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 7aed533..85fc4b2 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -447,11 +447,32 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static int rcar_gen3_thermal_standby(struct rcar_gen3_thermal_priv* priv)

I don't want to bikeshed about the name but the datasheet confuses me as 
it documents the standby and reset procedures to be exactly the same, or 
am I missing something? If they are indeed one and the same I would 
prefers this function to be called rcar_gen3_thermal_reset() and in 
rcar_gen3_thermal_suspend() add a comment "Reset to enter standby mode" 
or something similar. But it's up to you.

> +{
> +	unsigned int i;
> +	u32 reg_val;
> +
> +	for (i = 0; i < TSC_MAX_NUM; i++) {
> +		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
> +
> +		rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, 0);
> +		rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
> +
> +		reg_val = rcar_gen3_thermal_read(tsc, REG_GEN3_THCTR);
> +		rcar_gen3_thermal_write(tsc, REG_GEN3_THCTR, reg_val & ~THCTR_THSST);

Too many new lines.

> +
> +
> +		usleep_range(1000, 2000);

Can't the sleep be moved outside the loop? We can reset all TSC and then 
wait the required 1 ms only once while they all are reset or are they 
somehow dependent on being reset in sequence?

> +	}
> +
> +	return 0;
> +}
> +
>  static int __maybe_unused rcar_gen3_thermal_suspend(struct device *dev)
>  {
>  	struct rcar_gen3_thermal_priv *priv = dev_get_drvdata(dev);
>  
> -	rcar_thermal_irq_set(priv, false);
> +	rcar_gen3_thermal_standby(priv);
>  
>  	return 0;
>  }
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
