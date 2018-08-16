Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:36941 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbeHPUPa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Aug 2018 16:15:30 -0400
Date: Thu, 16 Aug 2018 19:15:37 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Message-ID: <687887330.263004.1534439737368@webmail.strato.com>
In-Reply-To: <20180808075928.31107-3-wsa+renesas@sang-engineering.com>
References: <20180808075928.31107-1-wsa+renesas@sang-engineering.com>
 <20180808075928.31107-3-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 2/2] i2c: rcar: implement STOP and REP_START according
 to docs
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Thank you for your patch.

> On August 8, 2018 at 9:59 AM Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> 
> 
> When doing a REP_START after a read message, the driver used to trigger
> a STOP first which would then be overwritten by REP_START. This was the
> only stable method found when doing the last refactoring. However, this
> was not in accordance with the documentation.
> 
> After research from our BSP team and myself, we now can implement a
> version which works and is according to the documentation. The new
> approach ensures the ICMCR register is only changed when really needed.
> 
> Tested on a R-Car Gen2 (H2) and Gen3 with DMA (M3N).
> 
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-rcar.c | 34 ++++++++++++++++++++--------------
>  1 file changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index a9f1880e2eae..43ad933df0f0 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -113,9 +113,10 @@
>  #define ID_ARBLOST	(1 << 3)
>  #define ID_NACK		(1 << 4)
>  /* persistent flags */
> +#define ID_P_REP_AFTER_RD	BIT(29)
>  #define ID_P_NO_RXDMA		BIT(30) /* HW forbids RXDMA sometimes */
>  #define ID_P_PM_BLOCKED		BIT(31)
> -#define ID_P_MASK		GENMASK(31, 30)
> +#define ID_P_MASK		GENMASK(31, 29)
>  
>  enum rcar_i2c_type {
>  	I2C_RCAR_GEN1,
> @@ -345,7 +346,10 @@ static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
>  		rcar_i2c_write(priv, ICMSR, 0);
>  		rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
>  	} else {
> -		rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
> +		if (priv->flags & ID_P_REP_AFTER_RD)
> +			priv->flags &= ~ID_P_REP_AFTER_RD;
> +		else
> +			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
>  		rcar_i2c_write(priv, ICMSR, 0);
>  	}
>  	rcar_i2c_write(priv, ICMIER, read ? RCAR_IRQ_RECV : RCAR_IRQ_SEND);
> @@ -550,15 +554,15 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
>  		priv->pos++;
>  	}
>  
> -	/*
> -	 * If next received data is the _LAST_, go to STOP phase. Might be
> -	 * overwritten by REP START when setting up a new msg. Not elegant
> -	 * but the only stable sequence for REP START I have found so far.
> -	 * If you want to change this code, make sure sending one transfer with
> -	 * four messages (WR-RD-WR-RD) works!
> -	 */
> -	if (priv->pos + 1 >= msg->len)
> -		rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_STOP);
> +	/* If next received data is the _LAST_, go to new phase. */
> +	if (priv->pos + 1 == msg->len) {
> +		if (priv->flags & ID_LAST_MSG) {
> +			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_STOP);
> +		} else {
> +			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
> +			priv->flags |= ID_P_REP_AFTER_RD;
> +		}
> +	}

So "priv->pos + 1 <= msg->len" is an invariant? (The current code seems to imply that it isn't.)

If it is,
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
