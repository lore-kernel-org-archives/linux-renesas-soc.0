Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36832 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752167AbcK2J4v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 04:56:51 -0500
Received: by mail-wm0-f66.google.com with SMTP id m203so23312678wma.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Nov 2016 01:56:50 -0800 (PST)
Date: Tue, 29 Nov 2016 10:56:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 09/13] drm: Add encoder_type field to the drm_bridge
 structure
Message-ID: <20161129095653.gkfavyo23ewadatx@phenom.ffwll.local>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480410283-28698-10-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480410283-28698-10-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 29, 2016 at 11:04:39AM +0200, Laurent Pinchart wrote:
> The drm_bridge object models on- or off-chip hardware encoders and
> provide an abstract control API to display drivers. In order to help
> display drivers creating the right kind of drm_encoder object, expose
> the type of the hardware encoder associated with each bridge.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

DRM_MODE_ENCODER_BRIDGE. Problem solved, because in reality no one cares
one iota about the encoder type.
-Daniel

> ---
> Changes since v1:
> 
> - Clarify documentation
> ---
>  include/drm/drm_bridge.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 94e5ee96b3b5..0643b6ce27de 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -194,6 +194,14 @@ struct drm_bridge {
>  #endif
>  	struct list_head list;
>  
> +	/**
> +	 * @encoder_type:
> +	 *
> +	 * Type of the hardware encoder modeled by the bridge as one of the
> +	 * DRM_MODE_ENCODER_* types. For the last bridge in the chain this will
> +	 * usually be identical to the bridge's &drm_encoder encoder_type.
> +	 */
> +	int encoder_type;
>  	const struct drm_bridge_funcs *funcs;
>  	void *driver_private;
>  };
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
