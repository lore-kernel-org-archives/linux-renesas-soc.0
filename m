Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:38158 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbeHTMjK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 08:39:10 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <uli+renesas@fpond.eu>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: Re: [PROTO][PATCH 03/10] drm: rcar-du: Fix digital RGB routing for R8A77995
Date: Mon, 20 Aug 2018 12:25:12 +0300
Message-ID: <1858666.BrqN8bjDtY@avalon>
In-Reply-To: <1534254604-24204-4-git-send-email-uli+renesas@fpond.eu>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu> <1534254604-24204-4-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

Thank you for the patch.

On Tuesday, 14 August 2018 16:49:57 EEST Ulrich Hecht wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> This patch adds D3 definition for DU and fixes digital RGB routing.
> 
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 3 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h   | 2 ++
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 4 ++++
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 5c2f764..d930996 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -298,7 +298,8 @@ static const struct rcar_du_device_info
> rcar_du_r8a77995_info = { .gen = 3,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> 
>  		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
> 
> -		  | RCAR_DU_FEATURE_VSP1_SOURCE,
> +		  | RCAR_DU_FEATURE_VSP1_SOURCE
> +		  | RCAR_DU_FEATURE_R8A77995_REGS,
>  	.quirks = RCAR_DU_QUIRK_TVM_MASTER_ONLY,
>  	.channels_mask = BIT(1) | BIT(0),
>  	.routes = {
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.h index 6257405..9355b58 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -30,6 +30,8 @@ struct rcar_du_device;
>  #define RCAR_DU_FEATURE_CRTC_IRQ_CLOCK	(1 << 0)	/* Per-CRTC IRQ and clock
> */ #define RCAR_DU_FEATURE_EXT_CTRL_REGS	(1 << 1)	/* Has extended control
> registers */ #define RCAR_DU_FEATURE_VSP1_SOURCE	(1 << 2)	/* Has inputs
> from VSP1 */ +#define RCAR_DU_FEATURE_R8A77965_REGS	(1 << 3)	/* Use
> R8A77965 registers */ +#define RCAR_DU_FEATURE_R8A77995_REGS	(1 << 4)	/*
> Use R8A77995 registers */
> 
>  #define RCAR_DU_QUIRK_ALIGN_128B	(1 << 0)	/* Align pitches to 128 bytes 
*/
>  #define RCAR_DU_QUIRK_TVM_MASTER_ONLY	(1 << 1)	/* Does not have TV
> switch/sync modes */ diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> b/drivers/gpu/drm/rcar-du/rcar_du_group.c index 9a0a694..371d780 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -88,6 +88,10 @@ static void rcar_du_group_setup_defr8(struct
> rcar_du_group *rgrp)
> 
>  		if (crtc->index / 2 == rgrp->index)
>  			defr8 |= DEFR8_DRGBS_DU(crtc->index);
> +
> +		if (rcar_du_has(rcdu, RCAR_DU_FEATURE_R8A77995_REGS))
> +			defr8 |= (DEFR8_DRGBS_DU(rcdu->dpad0_source) |
> +				 DEFR8_DRGBS_DU(crtc->index));

Does this need a special case ? Can't we replace the existing logic with code 
based on dpad0_source, and make sure that dpad0_source always contains the 
correct value on SoCs that have a hardcoded connection between DU and DPAD ?

>  	}
> 
>  	rcar_du_group_write(rgrp, DEFR8, defr8);

-- 
Regards,

Laurent Pinchart
