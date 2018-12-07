Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47717 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbeLGJNm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 04:13:42 -0500
Date: Fri, 7 Dec 2018 10:13:37 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: thierry.reding@gmail.com, linux-pwm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/5] pwm: rcar: add workaround to output "pseudo" low
 level
Message-ID: <20181207091337.mvrzzbgqa77adgbd@pengutronix.de>
References: <1544171373-29618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1544171373-29618-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1544171373-29618-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 07, 2018 at 05:29:33PM +0900, Yoshihiro Shimoda wrote:
> This PWM Timer cannot output low because setting 0x000 is prohibited
> on PWMCNT.PH0 (High-Level Period) bitfields. So, avoiding
> the prohibited, this patch adds a workaround function to change
> the value from 0 to 1 as pseudo low level.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/pwm/pwm-rcar.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
> index e479b6a..888cb37 100644
> --- a/drivers/pwm/pwm-rcar.c
> +++ b/drivers/pwm/pwm-rcar.c
> @@ -166,6 +166,20 @@ static void rcar_pwm_disable(struct rcar_pwm_chip *rp)
>  	rcar_pwm_update(rp, RCAR_PWMCR_EN0, 0, RCAR_PWMCR);
>  }
>  
> +static void rcar_pwm_workaround_output_low(struct rcar_pwm_chip *rp)
> +{
> +	/*
> +	 * This PWM Timer cannot output low because setting 0x000 is
> +	 * prohibited on PWMCNT.PH0 (High-Level Period) bitfields. So, avoiding
> +	 * the prohibited, this function changes the value from 0 to 1 as
> +	 * pseudo low level.
> +	 *
> +	 * TODO: Add GPIO handling to output low level.
> +	 */
> +	if ((rp->pwmcnt & RCAR_PWMCNT_PH0_MASK) == 0)
> +		rp->pwmcnt |= 1;

In my eyes this is too broken to do. Not sure I have the complete
picture, but given a small period (say 2) this 1 cycle might result in
50 % duty cycle. Depending on how the hardware behaves if you disable
it, better do this instead.

Are you aware of the series adding such gpio support to the imx driver?

@Thierry: So there are three drivers now that could benefit for a
generic approach.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
