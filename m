Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:53348 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727431AbeJRPXF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Oct 2018 11:23:05 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] drm: rcar-du: Fix vblank initialization
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20181017192040.16017-1-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <120d9340-96b1-c98d-6531-aa6b1aefb2b0@ideasonboard.com>
Date: Thu, 18 Oct 2018 08:23:23 +0100
MIME-Version: 1.0
In-Reply-To: <20181017192040.16017-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thank you for the patch,

On 17/10/18 20:20, Laurent Pinchart wrote:
> The drm_vblank_init() takes the total number of CRTCs as an argument,
> but the rcar-du driver passes a bitmask of the CRTC indices. Fix it.
> 

That seems like an oops! But I guess it's not particularly fatal - just
some wasted memory perhaps.


> Fixes: 4bf8e1962f91 ("drm: Renesas R-Car Display Unit DRM driver")
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 4ebd61ecbee1..fe6f65c94eef 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -582,7 +582,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  	 * Initialize vertical blanking interrupts handling. Start with vblank
>  	 * disabled for all CRTCs.
>  	 */
> -	ret = drm_vblank_init(dev, (1 << rcdu->num_crtcs) - 1);
> +	ret = drm_vblank_init(dev, rcdu->num_crtcs);
>  	if (ret < 0)
>  		return ret;
>  
> 
