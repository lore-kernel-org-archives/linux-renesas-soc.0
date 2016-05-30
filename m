Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35928 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933000AbcE3QMr (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:12:47 -0400
Received: by mail-wm0-f65.google.com with SMTP id q62so24149652wmg.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 09:12:46 -0700 (PDT)
Subject: Re: [RFC 08/21] drm: rcar-du: Add DPLL support
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1464624020-27709-9-git-send-email-ulrich.hecht+renesas@gmail.com>
Cc: kuninori.morimoto.gx@renesas.com,
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>
From: Dirk Behme <dirk.behme@gmail.com>
Message-ID: <574C6677.8060500@gmail.com>
Date: Mon, 30 May 2016 18:12:39 +0200
MIME-Version: 1.0
In-Reply-To: <1464624020-27709-9-git-send-email-ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 30.05.2016 18:00, Ulrich Hecht wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 97 ++++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |  8 +++
>   drivers/gpu/drm/rcar-du/rcar_du_drv.c   |  1 +
>   drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  1 +
>   drivers/gpu/drm/rcar-du/rcar_du_plane.h |  7 ++-
>   drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 19 +++++++
>   6 files changed, 131 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 0d8bdda..e10943b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -30,6 +30,12 @@
>   #include "rcar_du_regs.h"
>   #include "rcar_du_vsp.h"
>
> +#define PRODUCT_REG	0xfff00044
> +#define PRODUCT_H3_BIT	(0x4f << 8)
> +#define PRODUCT_MASK	(0x7f << 8)
> +#define CUT_ES1		(0x00)
> +#define CUT_ES1_MASK	(0x000000ff)


NACK for the hard coded register.

We've already discussed this in the thread

https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg04008.html

and found that this isn't ready this way:

https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg04079.html

Best regards

Dirk



>   static u32 rcar_du_crtc_read(struct rcar_du_crtc *rcrtc, u32 reg)
>   {
>   	struct rcar_du_device *rcdu = rcrtc->group->dev;
> @@ -106,14 +112,74 @@ static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
>    * Hardware Setup
>    */
>
> +static void rcar_du_dpll_divider(struct dpll_info *dpll, unsigned int extclk,
> +				 unsigned int mode_clock)
> +{
> +	unsigned long dpllclk;
> +	unsigned long diff;
> +	unsigned long n, m, fdpll;
> +	bool match_flag = false;
> +	bool clk_diff_set = true;
> +
> +	for (n = 39; n < 120; n++) {
> +		for (m = 0; m < 4; m++) {
> +			for (fdpll = 1; fdpll < 32; fdpll++) {
> +				/* 1/2 (FRQSEL=1) for duty rate 50% */
> +				dpllclk = extclk * (n + 1) / (m + 1)
> +						 / (fdpll + 1) / 2;
> +				if (dpllclk >= 400000000)
> +					continue;
> +
> +				diff = abs((long)dpllclk - (long)mode_clock);
> +				if (clk_diff_set ||
> +					((diff == 0) || (dpll->diff > diff))) {
> +					dpll->diff = diff;
> +					dpll->n = n;
> +					dpll->m = m;
> +					dpll->fdpll = fdpll;
> +					dpll->dpllclk = dpllclk;
> +
> +					if (clk_diff_set)
> +						clk_diff_set = false;
> +
> +					if (diff == 0) {
> +						match_flag = true;
> +						break;
> +					}
> +				}
> +			}
> +			if (match_flag)
> +				break;
> +		}
> +		if (match_flag)
> +			break;
> +	}
> +}
> +
>   static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>   {
>   	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
> +	struct rcar_du_device *rcdu = rcrtc->group->dev;
>   	unsigned long mode_clock = mode->clock * 1000;
>   	unsigned long clk;
>   	u32 value;
>   	u32 escr;
>   	u32 div;
> +	u32 dpll_reg = 0;
> +	struct dpll_info *dpll;
> +	void __iomem *product_reg;
> +	bool h3_es1_workaround = false;
> +
> +	dpll = kzalloc(sizeof(*dpll), GFP_KERNEL);
> +	if (dpll == NULL)
> +		return;
> +
> +	/* DU2 DPLL Clock Select bit workaround in R-Car H3(ES1.0) */
> +	product_reg = ioremap(PRODUCT_REG, 0x04);
> +	if (((readl(product_reg) & PRODUCT_MASK) == PRODUCT_H3_BIT)
> +		&& ((readl(product_reg) & CUT_ES1_MASK) == CUT_ES1))
> +		h3_es1_workaround = true;
> +	iounmap(product_reg);
>
>   	/* Compute the clock divisor and select the internal or external dot
>   	 * clock based on the requested frequency.
> @@ -130,6 +196,15 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>   		u32 extdiv;
>
>   		extclk = clk_get_rate(rcrtc->extclock);
> +
> +		if (rcdu->info->dpll_ch & (0x01 << rcrtc->index)) {
> +			rcar_du_dpll_divider(dpll, extclk, mode_clock);
> +			extclk = dpll->dpllclk;
> +			dev_dbg(rcrtc->group->dev->dev,
> +				"dpllclk:%d, fdpll:%d, n:%d, m:%d, diff:%d\n",
> +				 dpll->dpllclk, dpll->fdpll, dpll->n, dpll->m,
> +				 dpll->diff);
> +		}
>   		extdiv = DIV_ROUND_CLOSEST(extclk, mode_clock);
>   		extdiv = clamp(extdiv, 1U, 64U) - 1;
>
> @@ -140,7 +215,27 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>   		    abs((long)rate - (long)mode_clock)) {
>   			dev_dbg(rcrtc->group->dev->dev,
>   				"crtc%u: using external clock\n", rcrtc->index);
> -			escr = extdiv | ESCR_DCLKSEL_DCLKIN;
> +			if (rcdu->info->dpll_ch & (0x01 << rcrtc->index)) {
> +				escr = ESCR_DCLKSEL_DCLKIN | 0x01;
> +				dpll_reg =  DPLLCR_CODE | DPLLCR_M(dpll->m) |
> +					DPLLCR_FDPLL(dpll->fdpll) |
> +					DPLLCR_CLKE | DPLLCR_N(dpll->n) |
> +					DPLLCR_STBY;
> +
> +				if (rcrtc->index == DU_CH_1)
> +					dpll_reg |= (DPLLCR_PLCS1 |
> +						 DPLLCR_INCS_DPLL01_DOTCLKIN13);
> +				if (rcrtc->index == DU_CH_2) {
> +					dpll_reg |= (DPLLCR_PLCS0 |
> +						 DPLLCR_INCS_DPLL01_DOTCLKIN02);
> +					if (h3_es1_workaround)
> +						dpll_reg |=  (0x01 << 21);
> +				}
> +
> +				rcar_du_group_write(rcrtc->group, DPLLCR,
> +								  dpll_reg);
> +			} else
> +				escr = extdiv | ESCR_DCLKSEL_DCLKIN;
>   		}
>   	}
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> index 459e539..9a56cc7 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> @@ -54,6 +54,14 @@ struct rcar_du_crtc {
>   	struct rcar_du_vsp *vsp;
>   };
>
> +struct dpll_info {
> +	unsigned int dpllclk;
> +	unsigned int diff;
> +	unsigned int fdpll;
> +	unsigned int n;
> +	unsigned int m;
> +};
> +
>   #define to_rcar_crtc(c)	container_of(c, struct rcar_du_crtc, crtc)
>
>   enum rcar_du_output {
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 0a93d2a..5ed0d61 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -165,6 +165,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
>   		},
>   	},
>   	.num_lvds = 1,
> +	.dpll_ch =  BIT(1) | BIT(2),
>   };
>
>   static const struct of_device_id rcar_du_of_table[] = {
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index d1d1d8d..790829b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -69,6 +69,7 @@ struct rcar_du_device_info {
>   	unsigned int num_crtcs;
>   	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
>   	unsigned int num_lvds;
> +	unsigned int dpll_ch;
>   };
>
>   #define RCAR_DU_MAX_CRTCS		4
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.h b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
> index b18b7b2..47fad23 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
> @@ -1,7 +1,7 @@
>   /*
>    * rcar_du_plane.h  --  R-Car Display Unit Planes
>    *
> - * Copyright (C) 2013-2014 Renesas Electronics Corporation
> + * Copyright (C) 2013-2015 Renesas Electronics Corporation
>    *
>    * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>    *
> @@ -34,6 +34,11 @@ enum rcar_du_plane_source {
>   	RCAR_DU_PLANE_VSPD1,
>   };
>
> +#define DU_CH_0		0
> +#define DU_CH_1		1
> +#define DU_CH_2		2
> +#define DU_CH_3		3
> +
>   struct rcar_du_plane {
>   	struct drm_plane plane;
>   	struct rcar_du_group *group;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> index fedb016..7a34bf3 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> @@ -277,6 +277,25 @@
>   #define DEFR10_TSEL_H3_TCON1	(0 << 1) /* DEFR102 register only (DU2/DU3) */
>   #define DEFR10_DEFE10		(1 << 0)
>
> +#define DPLLCR			0x20044
> +#define DPLLCR_CODE		(0x95 << 24)
> +#define DPLLCR_PLCS1		(1 << 23)
> +#define DPLLCR_PLCS0		(1 << 20)
> +#define DPLLCR_CLKE		(1 << 18)
> +#define DPLLCR_FDPLL(n)		((n) << 12)	/* n=0 Setting prohibited */
> +/* H'00 to H'26, H'78 to H'7F: Setting prohibited.*/
> +#define DPLLCR_N(n)		((n) << 5)
> +#define DPLLCR_M(n)		((n) << 3)
> +#define DPLLCR_STBY		(1 << 2)
> +#define DPLLCR_INCS_DPLL01_DOTCLKIN02	(0 << 0)
> +#define DPLLCR_INCS_DPLL01_DOTCLKIN13	(1 << 1)
> +
> +#define DPLLC2R			0x20048
> +#define DPLLC2R_CODE		(0x95 << 24)
> +#define DPLLC2R_SELC		(1 << 12)
> +#define DPLLC2R_M(n)		((n) << 8)
> +#define DPLLC2R_FDPLL(n)	((n) << 0)	/* n=0 Setting prohibited */
> +
>   /* -----------------------------------------------------------------------------
>    * Display Timing Generation Registers
>    */
>
