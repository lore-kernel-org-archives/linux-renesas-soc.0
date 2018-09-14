Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:34724 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbeINQTb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 12:19:31 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm: rcar-du: Update Gen3 output limitations
Date: Fri, 14 Sep 2018 14:05:44 +0300
Message-ID: <4037354.l5ltzbp0ev@avalon>
In-Reply-To: <20180831181259.29529-2-kieran.bingham+renesas@ideasonboard.com>
References: <20180831181259.29529-1-kieran.bingham+renesas@ideasonboard.com> <20180831181259.29529-2-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Friday, 31 August 2018 21:12:57 EEST Kieran Bingham wrote:
> The R-Car Gen3 DU utilises the VSP1 hardware for memory access. The
> limits on the RPF and WPF in this pipeline are 8190x8190.
> 
> Update the supported maximum sizes accordingly.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> b/drivers/gpu/drm/rcar-du/rcar_du_kms.c index ed7fa3204892..7c7aff8cdf77
> 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -512,12 +512,22 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> 
>  	dev->mode_config.min_width = 0;
>  	dev->mode_config.min_height = 0;
> -	dev->mode_config.max_width = 4095;
> -	dev->mode_config.max_height = 2047;
>  	dev->mode_config.normalize_zpos = true;
>  	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
>  	dev->mode_config.helper_private = &rcar_du_mode_config_helper;
> 
> +	if (rcdu->info->gen < 3) {
> +		dev->mode_config.max_width = 4095;
> +		dev->mode_config.max_height = 2047;
> +	} else {
> +		/*
> +		 * The Gen3 DU uses the VSP1 for memory access, and is limited
> +		 * to frame sizes of 8190x8190.
> +		 */
> +		dev->mode_config.max_width = 8190;
> +		dev->mode_config.max_height = 8190;
> +	}
> +
>  	rcdu->num_crtcs = hweight8(rcdu->info->channels_mask);
> 
>  	ret = rcar_du_properties_init(rcdu);

-- 
Regards,

Laurent Pinchart
