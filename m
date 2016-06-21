Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:53379 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751589AbcFUJO7 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 21 Jun 2016 05:14:59 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 7/7] drm/rcar-du: Remove redundant calls to drm_connector_register_all()
Date: Tue, 21 Jun 2016 12:15:17 +0300
Message-ID: <2881992.mZhRLFloE1@avalon>
In-Reply-To: <1466151923-1572-8-git-send-email-chris@chris-wilson.co.uk>
References: <1466151923-1572-1-git-send-email-chris@chris-wilson.co.uk> <1466151923-1572-8-git-send-email-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

Thank you for the patch.

On Friday 17 Jun 2016 09:25:23 Chris Wilson wrote:
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 48ec4b6e8b26..36d390093c92
> 100644
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

-- 
Regards,

Laurent Pinchart
