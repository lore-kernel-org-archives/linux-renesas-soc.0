Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36244 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751726AbcK2JsT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 04:48:19 -0500
Received: by mail-wm0-f66.google.com with SMTP id m203so23275989wma.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Nov 2016 01:48:18 -0800 (PST)
Date: Tue, 29 Nov 2016 10:48:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 04/13] drm: bridge: Detach bridge from encoder at
 encoder cleanup time
Message-ID: <20161129094821.udbsu6cyixoc4mnw@phenom.ffwll.local>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480410283-28698-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480410283-28698-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 29, 2016 at 11:04:34AM +0200, Laurent Pinchart wrote:
> Most drivers that use bridges forgot to detach them at cleanup time.
> Instead of fixing them one by one, detach the bridge in the core
> drm_encoder_cleanup() function.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_encoder.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 5c067719164d..9c1f99646e0d 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -164,6 +164,9 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
>  	 * the indices on the drm_encoder after us in the encoder_list.
>  	 */
>  
> +	if (encoder->bridge)
> +		drm_bridge_detach(encoder->bridge);

Means we bake in drm_bridge much more as a core thing, but I guess that's
ok.

But there's 3 callers of drm_bridge_detach outside of the drm core, can't
we remove them and drop the EXPORT_SYMBOL for drm_bridge_detach? What's
it still needed for?

I think that cleanup should done in this patch here - drm_bridge_detach
WARN_ONs if the bridge is already detached ...
-Daniel

> +
>  	drm_modeset_lock_all(dev);
>  	drm_mode_object_unregister(dev, &encoder->base);
>  	kfree(encoder->name);
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
