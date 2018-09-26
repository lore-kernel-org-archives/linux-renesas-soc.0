Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:48546 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbeIZS1b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Sep 2018 14:27:31 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [RESEND PATCH] drm/shmobile: Replace drm_dev_unref with
 drm_dev_put
To: Thomas Zimmermann <tzimmermann@suse.de>,
        laurent.pinchart@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20180926115525.24500-1-tzimmermann@suse.de>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <7e35303c-7bcd-1c6b-6986-40c4413e57aa@ideasonboard.com>
Date: Wed, 26 Sep 2018 13:14:45 +0100
MIME-Version: 1.0
In-Reply-To: <20180926115525.24500-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Thomas,

Thank you for the patch,

On 26/09/18 12:55, Thomas Zimmermann wrote:
> This patch unifies the naming of DRM functions for reference counting
> of struct drm_device. The resulting code is more aligned with the rest
> of the Linux kernel interfaces.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index 6ececad6f845..8554102a6ead 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -194,7 +194,7 @@ static int shmob_drm_remove(struct platform_device *pdev)
>  	drm_kms_helper_poll_fini(ddev);
>  	drm_mode_config_cleanup(ddev);
>  	drm_irq_uninstall(ddev);
> -	drm_dev_unref(ddev);
> +	drm_dev_put(ddev);
> 
>  	return 0;
>  }
> @@ -290,7 +290,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	drm_kms_helper_poll_fini(ddev);
>  	drm_mode_config_cleanup(ddev);
>  err_free_drm_dev:
> -	drm_dev_unref(ddev);
> +	drm_dev_put(ddev);
> 
>  	return ret;
>  }
> --
> 2.19.0
> 
