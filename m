Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:44942 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbeLGLjL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 06:39:11 -0500
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 1/5] drm: rcar-du: Replace EXT_CTRL_REGS feature flag with
 generation check
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com>
 <20181125144031.4407-2-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <f6b36716-bcd1-a3e6-9d1e-b2d9a1f2e450@ideasonboard.com>
Date: Fri, 7 Dec 2018 11:39:05 +0000
MIME-Version: 1.0
In-Reply-To: <20181125144031.4407-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thank you for the patch,

On 25/11/2018 14:40, Laurent Pinchart wrote:
> The RCAR_DU_FEATURE_EXT_CTRL_REGS feature flag is missing for H1 only,
> which is a first generation device, not a second generation device as
> reported in the device information table. Fix the H1 generation and use
> generation checks to replace the feature flag.

Looks like a good simplification

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 14 +-------------
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  7 +++----
>  drivers/gpu/drm/rcar-du/rcar_du_group.c |  4 ++--
>  3 files changed, 6 insertions(+), 19 deletions(-)

-13 lines ... sounds like a (small) win :D


> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 94f055186b95..814c1099dacb 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -35,7 +35,6 @@
>  static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
>  	.gen = 2,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> -		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>  		  | RCAR_DU_FEATURE_INTERLACED
>  		  | RCAR_DU_FEATURE_TVM_SYNC,
>  	.channels_mask = BIT(1) | BIT(0),
> @@ -58,7 +57,6 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
>  static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
>  	.gen = 2,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> -		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>  		  | RCAR_DU_FEATURE_INTERLACED
>  		  | RCAR_DU_FEATURE_TVM_SYNC,
>  	.channels_mask = BIT(1) | BIT(0),
> @@ -80,7 +78,6 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
>  static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
>  	.gen = 2,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> -		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>  		  | RCAR_DU_FEATURE_INTERLACED
>  		  | RCAR_DU_FEATURE_TVM_SYNC,
>  	.channels_mask = BIT(1) | BIT(0),
> @@ -105,7 +102,7 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7779_info = {
> -	.gen = 2,
> +	.gen = 1,
>  	.features = RCAR_DU_FEATURE_INTERLACED
>  		  | RCAR_DU_FEATURE_TVM_SYNC,
>  	.channels_mask = BIT(1) | BIT(0),
> @@ -128,7 +125,6 @@ static const struct rcar_du_device_info rcar_du_r8a7779_info = {
>  static const struct rcar_du_device_info rcar_du_r8a7790_info = {
>  	.gen = 2,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> -		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>  		  | RCAR_DU_FEATURE_INTERLACED
>  		  | RCAR_DU_FEATURE_TVM_SYNC,
>  	.quirks = RCAR_DU_QUIRK_ALIGN_128B,
> @@ -158,7 +154,6 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
>  static const struct rcar_du_device_info rcar_du_r8a7791_info = {
>  	.gen = 2,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> -		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>  		  | RCAR_DU_FEATURE_INTERLACED
>  		  | RCAR_DU_FEATURE_TVM_SYNC,
>  	.channels_mask = BIT(1) | BIT(0),
> @@ -182,7 +177,6 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
>  static const struct rcar_du_device_info rcar_du_r8a7792_info = {
>  	.gen = 2,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> -		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>  		  | RCAR_DU_FEATURE_INTERLACED
>  		  | RCAR_DU_FEATURE_TVM_SYNC,
>  	.channels_mask = BIT(1) | BIT(0),
> @@ -202,7 +196,6 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
>  static const struct rcar_du_device_info rcar_du_r8a7794_info = {
>  	.gen = 2,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> -		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>  		  | RCAR_DU_FEATURE_INTERLACED
>  		  | RCAR_DU_FEATURE_TVM_SYNC,
>  	.channels_mask = BIT(1) | BIT(0),
> @@ -225,7 +218,6 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
>  static const struct rcar_du_device_info rcar_du_r8a7795_info = {
>  	.gen = 3,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> -		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>  		  | RCAR_DU_FEATURE_VSP1_SOURCE
>  		  | RCAR_DU_FEATURE_INTERLACED
>  		  | RCAR_DU_FEATURE_TVM_SYNC,
> @@ -259,7 +251,6 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
>  static const struct rcar_du_device_info rcar_du_r8a7796_info = {
>  	.gen = 3,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> -		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>  		  | RCAR_DU_FEATURE_VSP1_SOURCE
>  		  | RCAR_DU_FEATURE_INTERLACED
>  		  | RCAR_DU_FEATURE_TVM_SYNC,
> @@ -289,7 +280,6 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
>  static const struct rcar_du_device_info rcar_du_r8a77965_info = {
>  	.gen = 3,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> -		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>  		  | RCAR_DU_FEATURE_VSP1_SOURCE
>  		  | RCAR_DU_FEATURE_INTERLACED
>  		  | RCAR_DU_FEATURE_TVM_SYNC,
> @@ -319,7 +309,6 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
>  static const struct rcar_du_device_info rcar_du_r8a77970_info = {
>  	.gen = 3,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> -		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>  		  | RCAR_DU_FEATURE_VSP1_SOURCE
>  		  | RCAR_DU_FEATURE_INTERLACED
>  		  | RCAR_DU_FEATURE_TVM_SYNC,
> @@ -341,7 +330,6 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
>  static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
>  	.gen = 3,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> -		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>  		  | RCAR_DU_FEATURE_VSP1_SOURCE,
>  	.channels_mask = BIT(1) | BIT(0),
>  	.routes = {
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index 9f5563296c5a..8ef9165957cb 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -24,10 +24,9 @@ struct drm_fbdev_cma;
>  struct rcar_du_device;
>  
>  #define RCAR_DU_FEATURE_CRTC_IRQ_CLOCK	BIT(0)	/* Per-CRTC IRQ and clock */
> -#define RCAR_DU_FEATURE_EXT_CTRL_REGS	BIT(1)	/* Has extended control registers */
> -#define RCAR_DU_FEATURE_VSP1_SOURCE	BIT(2)	/* Has inputs from VSP1 */
> -#define RCAR_DU_FEATURE_INTERLACED	BIT(3)	/* HW supports interlaced */
> -#define RCAR_DU_FEATURE_TVM_SYNC	BIT(4)	/* Has TV switch/sync modes */
> +#define RCAR_DU_FEATURE_VSP1_SOURCE	BIT(1)	/* Has inputs from VSP1 */
> +#define RCAR_DU_FEATURE_INTERLACED	BIT(2)	/* HW supports interlaced */
> +#define RCAR_DU_FEATURE_TVM_SYNC	BIT(3)	/* Has TV switch/sync modes */
>  
>  #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index cebf313c6e1f..3366cda6086c 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -147,7 +147,7 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  
>  	rcar_du_group_setup_pins(rgrp);
>  
> -	if (rcar_du_has(rgrp->dev, RCAR_DU_FEATURE_EXT_CTRL_REGS)) {
> +	if (rcdu->info->gen >= 2) {
>  		rcar_du_group_setup_defr8(rgrp);
>  		rcar_du_group_setup_didsr(rgrp);
>  	}
> @@ -262,7 +262,7 @@ int rcar_du_set_dpad0_vsp1_routing(struct rcar_du_device *rcdu)
>  	unsigned int index;
>  	int ret;
>  
> -	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_EXT_CTRL_REGS))
> +	if (rcdu->info->gen < 2)
>  		return 0;
>  
>  	/*
> 

-- 
Regards
--
Kieran
