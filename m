Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46610 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727147AbeHXPDg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 11:03:36 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] drm: rcar-du: lvds: add R8A77980 support
Date: Fri, 24 Aug 2018 14:29:08 +0300
Message-ID: <1617569.b0YBP59UFH@avalon>
In-Reply-To: <668491ee-915d-66fc-feea-c2afed5d645d@cogentembedded.com>
References: <ef3c6b7e-98f2-7012-71c5-6693e6e48999@cogentembedded.com> <668491ee-915d-66fc-feea-c2afed5d645d@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thank you for the patch.

On Tuesday, 5 June 2018 23:30:36 EEST Sergei Shtylyov wrote:
> Add support for the R-Car V3H (R8A77980) SoC to the LVDS encoder driver.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: drm/drivers/gpu/drm/rcar-du/rcar_lvds.c
> ===================================================================
> --- drm.orig/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ drm/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -519,6 +519,7 @@ static const struct of_device_id rcar_lv
>  	{ .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info },
>  	{ .compatible = "renesas,r8a7796-lvds", .data = &rcar_lvds_gen3_info },
>  	{ .compatible = "renesas,r8a77970-lvds", .data = &rcar_lvds_r8a77970_info
> }, +	{ .compatible = "renesas,r8a77980-lvds", .data = &rcar_lvds_gen3_info
> }, { }
>  };


-- 
Regards,

Laurent Pinchart
