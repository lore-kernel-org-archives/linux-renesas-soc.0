Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:42442 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753556AbeEOQCP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 12:02:15 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm: rcar-du: disable dtc graph-endpoint warnings on DT overlays
Date: Tue, 15 May 2018 19:02:32 +0300
Message-ID: <3586089.sSXMJGLhP3@avalon>
In-Reply-To: <20180511143323.6148-1-robh@kernel.org>
References: <20180511143323.6148-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Rob,

Thank you for the patch.

On Friday, 11 May 2018 17:33:23 EEST Rob Herring wrote:
> The rcar DT overlays are missing symetrical remote-endpoint properties
> in their graph nodes because the remote-endpoint is fixed up at
> run-time. Disable the dtc 'graph-endpoint' warnings when compiling these
> overlays. If this becomes a common problem for overlays, then perhaps
> this check needs to be disabled for all overlays.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> This needs to go thru my tree because it is dependent on the dtc update
> that adds the warning (perhaps we're going to need to add option
> checking for dtc).
> 
> Rob
> 
>  drivers/gpu/drm/rcar-du/Makefile | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Makefile
> b/drivers/gpu/drm/rcar-du/Makefile index 3e58ed93d5b1..2a3b8d7972b5 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -17,3 +17,10 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
>  obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
>  obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
>  obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
> +
> +# 'remote-endpoint' is fixed up at run-time
> +DTC_FLAGS_rcar_du_of_lvds_r8a7790 += -Wno-graph_endpoint
> +DTC_FLAGS_rcar_du_of_lvds_r8a7791 += -Wno-graph_endpoint
> +DTC_FLAGS_rcar_du_of_lvds_r8a7793 += -Wno-graph_endpoint
> +DTC_FLAGS_rcar_du_of_lvds_r8a7795 += -Wno-graph_endpoint
> +DTC_FLAGS_rcar_du_of_lvds_r8a7796 += -Wno-graph_endpoint


-- 
Regards,

Laurent Pinchart
