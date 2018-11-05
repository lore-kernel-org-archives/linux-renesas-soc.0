Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33880 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728543AbeKEX3N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 18:29:13 -0500
Received: by mail-lj1-f196.google.com with SMTP id u6-v6so8161946ljd.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Nov 2018 06:09:17 -0800 (PST)
Date: Mon, 5 Nov 2018 15:09:13 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        wsa@sang-engineering.com, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [v2 PATCH] thermal: rcar_gen3_thermal: Fix init value of IRQCTL
 register
Message-ID: <20181105140913.GA461@bigcity.dyn.berto.se>
References: <1540433621-24114-1-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1540433621-24114-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Hoan-san,

Thanks for your patch.

On 2018-10-25 11:13:41 +0900, Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> Fix setting value for IRQCTL register. We are setting the last 6 bits
> of (IRQCTL) to be 1 (0x3f), this is only suitable for H3ES1.*, according
> to new Hardware manual values 1 are "setting prohibited" for Gen3!

Hum, as you point out this change is not suitable for H3 ES1.x so this 
would introduce a regression, which is not good. I will leave the final 
word to Wolfram but in my view you need to introduce quirk handling to 
keep support for H3 ES1.x or blacklist that SoC in the driver.

> 
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>  drivers/thermal/rcar_gen3_thermal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 7aed533..fde3fd8 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -306,7 +306,7 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
>  
>  	usleep_range(1000, 2000);
>  
> -	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0x3F);
> +	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0);
>  	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
>  	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, IRQ_TEMPD1 | IRQ_TEMP2);
>  
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
