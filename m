Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:46261 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751755AbdHARXe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Aug 2017 13:23:34 -0400
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2.1 14/14] drm: rcar-du: Configure DPAD0 routing through
 last group on Gen3
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20170626181226.29575-15-laurent.pinchart+renesas@ideasonboard.com>
 <20170801172027.7570-1-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <edcd0bd8-d6dd-bee8-1f62-94993c1b54ad@ideasonboard.com>
Date: Tue, 1 Aug 2017 18:23:30 +0100
MIME-Version: 1.0
In-Reply-To: <20170801172027.7570-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for the fast update.

On 01/08/17 18:20, Laurent Pinchart wrote:
> On Gen3 SoCs DPAD0 routing is configured through the last CRTC group,
> unlike on Gen2 where it is configured through the first CRTC group. Fix
> the driver accordingly.
> 
> Fixes: 2427b3037710 ("drm: rcar-du: Add R8A7795 device support")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Compute the group index correctly on Gen2
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index a3e29bb420fd..2f37ea901873 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -212,6 +212,9 @@ void rcar_du_group_restart(struct rcar_du_group *rgrp)
>  
>  int rcar_du_set_dpad0_vsp1_routing(struct rcar_du_device *rcdu)
>  {
> +	struct rcar_du_group *rgrp;
> +	struct rcar_du_crtc *crtc;
> +	unsigned int index;
>  	int ret;
>  
>  	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_EXT_CTRL_REGS))
> @@ -219,17 +222,22 @@ int rcar_du_set_dpad0_vsp1_routing(struct rcar_du_device *rcdu)
>  
>  	/*
>  	 * RGB output routing to DPAD0 and VSP1D routing to DU0/1/2 are
> -	 * configured in the DEFR8 register of the first group. As this function
> -	 * can be called with the DU0 and DU1 CRTCs disabled, we need to enable
> -	 * the first group clock before accessing the register.
> +	 * configured in the DEFR8 register of the first group on Gen2 and the
> +	 * last group on Gen3. As this function can be called with the DU
> +	 * channels of the corresponding CRTCs disabled, we need to enable the
> +	 * group clock before accessing the register.
>  	 */
> -	ret = clk_prepare_enable(rcdu->crtcs[0].clock);
> +	index = rcdu->info->gen < 3 ? 0 : DIV_ROUND_UP(rcdu->num_crtcs, 2) - 1;

Ahh yes, that reads a lot better.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +	rgrp = &rcdu->groups[index];
> +	crtc = &rcdu->crtcs[index * 2];
> +
> +	ret = clk_prepare_enable(crtc->clock);
>  	if (ret < 0)
>  		return ret;
>  
> -	rcar_du_group_setup_defr8(&rcdu->groups[0]);
> +	rcar_du_group_setup_defr8(rgrp);
>  
> -	clk_disable_unprepare(rcdu->crtcs[0].clock);
> +	clk_disable_unprepare(crtc->clock);
>  
>  	return 0;
>  }
> 
