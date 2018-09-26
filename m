Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:48488 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726915AbeIZSWh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Sep 2018 14:22:37 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [RESEND PATCH] drm/rcar-du: Replace drm_dev_unref with
 drm_dev_put
To: Thomas Zimmermann <tzimmermann@suse.de>,
        laurent.pinchart@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20180926115312.24158-1-tzimmermann@suse.de>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <dabee9ce-af07-47c5-32ed-ec673a238fa8@ideasonboard.com>
Date: Wed, 26 Sep 2018 13:09:51 +0100
MIME-Version: 1.0
In-Reply-To: <20180926115312.24158-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Thomas,

Thank you for the patch,

On 26/09/18 12:53, Thomas Zimmermann wrote:
> This patch unifies the naming of DRM functions for reference counting
> of struct drm_device. The resulting code is more aligned with the rest
> of the Linux kernel interfaces.> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Looks good to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

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
