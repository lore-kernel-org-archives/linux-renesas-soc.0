Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57308 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751114AbdJDK0D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 06:26:03 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 03/14] pinctrl: sh-pfc: Add generic bias register description
Date: Wed, 04 Oct 2017 13:26:05 +0300
Message-ID: <2239854.HOEZ61P5Ok@avalon>
In-Reply-To: <1507108033-8606-4-git-send-email-geert+renesas@glider.be>
References: <1507108033-8606-1-git-send-email-geert+renesas@glider.be> <1507108033-8606-4-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Wednesday, 4 October 2017 12:07:02 EEST Geert Uytterhoeven wrote:
> Add a generic way to describe bias registers (for pull-up/down control),
> like is already done for config and drive registers.
> 
> This makes the sh-pfc core code aware of these registers, which will
> ease introducing suspend/resume support later.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/pinctrl/sh-pfc/sh_pfc.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h
> b/drivers/pinctrl/sh-pfc/sh_pfc.h index 8688b405e0813ad7..1914f4b5fef569b3
> 100644
> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -148,6 +148,17 @@ struct pinmux_drive_reg {
>  	.reg = r, \
>  	.fields =
> 
> +struct pinmux_bias_reg {
> +	u32 puen;		/* Pull-enable or pull-up control register */
> +	u32 pud;		/* Pull-up/down control register (optional) */
> +	const u16 pins[32];
> +};
> +
> +#define PINMUX_BIAS_REG(name1, r1, name2, r2) \
> +	.puen = r1,	\
> +	.pud = r2,	\
> +	.pins =
> +
>  struct pinmux_data_reg {
>  	u32 reg;
>  	u8 reg_width;
> @@ -245,6 +256,7 @@ struct sh_pfc_soc_info {
> 
>  	const struct pinmux_cfg_reg *cfg_regs;
>  	const struct pinmux_drive_reg *drive_regs;
> +	const struct pinmux_bias_reg *bias_regs;
>  	const struct pinmux_data_reg *data_regs;
> 
>  	const u16 *pinmux_data;


-- 
Regards,

Laurent Pinchart
