Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55485 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbeI1Nkp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 09:40:45 -0400
Date: Fri, 28 Sep 2018 09:18:20 +0200
From: Simon Horman <horms@verge.net.au>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RESEND PATCH] drm/rcar-du: Replace drm_dev_unref with
 drm_dev_put
Message-ID: <20180928071820.o4bzzcaihcpsi3qd@verge.net.au>
References: <20180926115312.24158-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180926115312.24158-1-tzimmermann@suse.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 26, 2018 at 01:53:12PM +0200, Thomas Zimmermann wrote:
> This patch unifies the naming of DRM functions for reference counting
> of struct drm_device. The resulting code is more aligned with the rest
> of the Linux kernel interfaces.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 0954ecd2f943..476d4d427044 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -413,7 +413,7 @@ static int rcar_du_remove(struct platform_device *pdev)
>  	drm_kms_helper_poll_fini(ddev);
>  	drm_mode_config_cleanup(ddev);
> 
> -	drm_dev_unref(ddev);
> +	drm_dev_put(ddev);
> 
>  	return 0;
>  }
> --
> 2.19.0
> 
