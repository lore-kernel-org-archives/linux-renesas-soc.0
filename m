Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:41952 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392588AbeKWKFN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 05:05:13 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, magnus.damm@gmail.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH] drm: rcar-du: fix probe error when DRM_RCAR_DW_HDMI disabled
Date: Fri, 23 Nov 2018 01:23:47 +0200
Message-ID: <3976026.jii4pGMLAq@avalon>
In-Reply-To: <1537530543-29518-2-git-send-email-na-hoan@jinso.co.jp>
References: <1537530543-29518-1-git-send-email-na-hoan@jinso.co.jp> <1537530543-29518-2-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Hoan,

Thank you for the patch.

On Friday, 21 September 2018 14:49:03 EET Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> Skip return EPROBE_DEFER when DRM_RCAR_DW_HDMI is disabled in case HDMI
> initialize. At this time, the rcar-du driver not be able to successfully
> initialize if disable DRM_RCAR_DW_HDMI (rcar_du_probe return error),
> so can not use other features such as RGB Analog, this patch to fix.
> 
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c index f9c933d..4dbc508 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -66,8 +66,15 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	/* Locate the DRM bridge from the encoder DT node. */
>  	bridge = of_drm_find_bridge(enc_node);
>  	if (!bridge) {
> +#if IS_ENABLED(CONFIG_DRM_RCAR_DW_HDMI)
>  		ret = -EPROBE_DEFER;
>  		goto done;
> +#else
> +		if (output == RCAR_DU_OUTPUT_HDMI0 ||
> +		    output == RCAR_DU_OUTPUT_HDMI1)
> +		    ret = 0;
> +		    goto done;
> +#endif

The dw-hdmi driver could be compiled out of tree, I don't think is the right 
fix. If the HDMI output should be disabled on a particular system, the 
corresponding DT node should be marked as disable, and no change to the DU 
driver is needed. Otherwise the necessary drivers should be present.

In the long term we should implement support for registration of additional 
encoders at runtime, but that's way down the road.

>  	}
> 
>  	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,

-- 
Regards,

Laurent Pinchart
