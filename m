Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:55888 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755592AbeDZKqf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 06:46:35 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: rcar-du: of: Include header to define prototypes
Date: Thu, 26 Apr 2018 13:46:50 +0300
Message-ID: <1671050.mdHx6Eelbf@avalon>
In-Reply-To: <20180424153942.2526-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180424153942.2526-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Tuesday, 24 April 2018 18:39:42 EEST Kieran Bingham wrote:
> The symbol 'rcar_du_of_init' is defined by the rcar_du_of module header,
> but it is not included by the C implementation.
> 
> Include the header to correctly define the function prototypes.
> 
> Fixes the following warning:
> 
> linux/drivers/gpu/drm/rcar-du/rcar_du_of.c:319:13:
>    warning: symbol 'rcar_du_of_init' was not declared. Should it be static?
>     CC      drivers/gpu/drm/rcar-du/rcar_du_of.o
> 
> Fixes: 81c0e3dd8292 ("drm: rcar-du: Fix legacy DT to create LVDS encoder
> nodes") Signed-off-by: Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_of.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c
> b/drivers/gpu/drm/rcar-du/rcar_du_of.c index 68a0b82cb17e..afef69669bb4
> 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> @@ -18,6 +18,7 @@
> 
>  #include "rcar_du_crtc.h"
>  #include "rcar_du_drv.h"
> +#include "rcar_du_of.h"
> 
>  /*
> ---------------------------------------------------------------------------
> -- * Generic Overlay Handling


-- 
Regards,

Laurent Pinchart
