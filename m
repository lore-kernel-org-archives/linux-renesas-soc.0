Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:56464 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754678AbeDZK7m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 06:59:42 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: rcar-du: Use NULL for table initialisation
Date: Thu, 26 Apr 2018 13:59:56 +0300
Message-ID: <3899757.qNu51Qhhj6@avalon>
In-Reply-To: <20180424154003.2604-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180424154003.2604-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Tuesday, 24 April 2018 18:40:03 EEST Kieran Bingham wrote:
> Replace the initialisation of the vsps table with a NULL specifier.
> 
> Fixes the following warning:
>  linux/drivers/gpu/drm/rcar-du/rcar_du_kms.c:483:40:
>     warning: Using plain integer as NULL pointer
>       CC      drivers/gpu/drm/rcar-du/rcar_du_kms.o
> 
> Fixes: 3e81374e2014 ("drm: rcar-du: Support multiple sources from the same
> VSP") Signed-off-by: Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> b/drivers/gpu/drm/rcar-du/rcar_du_kms.c index ef72dff00763..cf5b422fc753
> 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -480,7 +480,7 @@ static int rcar_du_vsps_init(struct rcar_du_device
> *rcdu) struct {
>  		struct device_node *np;
>  		unsigned int crtcs_mask;
> -	} vsps[RCAR_DU_MAX_VSPS] = { { 0, }, };
> +	} vsps[RCAR_DU_MAX_VSPS] = { { NULL, }, };
>  	unsigned int vsps_count = 0;
>  	unsigned int cells;
>  	unsigned int i;

-- 
Regards,

Laurent Pinchart
