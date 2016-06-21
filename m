Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lb0-f194.google.com ([209.85.217.194]:33122 "EHLO
	mail-lb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752118AbcFUI4P (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 21 Jun 2016 04:56:15 -0400
Received: by mail-lb0-f194.google.com with SMTP id o4so1044818lbp.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jun 2016 01:56:14 -0700 (PDT)
Date: Tue, 21 Jun 2016 10:56:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Airlie <airlied@linux.ie>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 7/7] drm/rcar-du: Remove redundant calls to
 drm_connector_register_all()
Message-ID: <20160621085611.GU23520@phenom.ffwll.local>
References: <1466151923-1572-1-git-send-email-chris@chris-wilson.co.uk>
 <1466151923-1572-8-git-send-email-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1466151923-1572-8-git-send-email-chris@chris-wilson.co.uk>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 17, 2016 at 09:25:23AM +0100, Chris Wilson wrote:
> Up to now, the recommendation was for drivers to call drm_dev_register()
> followed by drm_connector_register_all(). Now that
> drm_connector_register() is safe against multiple invocations, we can
> move drm_connector_register_all() to drm_dev_register() and not suffer
> from any backwards compatibility issues with drivers not following the
> more rigorous init ordering.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org

Ok, merged the driver patches now. Would be good to unexport/static
drm_connector_register_all, and I think there's a few drivers (like vc4)
which open-coded it.
-Daniel

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 48ec4b6e8b26..36d390093c92 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -278,7 +278,6 @@ static int rcar_du_remove(struct platform_device *pdev)
>  	struct rcar_du_device *rcdu = platform_get_drvdata(pdev);
>  	struct drm_device *ddev = rcdu->ddev;
>  
> -	drm_connector_unregister_all(ddev);
>  	drm_dev_unregister(ddev);
>  
>  	if (rcdu->fbdev)
> @@ -360,10 +359,6 @@ static int rcar_du_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto error;
>  
> -	ret = drm_connector_register_all(ddev);
> -	if (ret < 0)
> -		goto error;
> -
>  	DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
>  
>  	return 0;
> -- 
> 2.8.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
