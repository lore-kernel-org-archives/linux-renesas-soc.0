Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:48860 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbeIZTGC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Sep 2018 15:06:02 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [RESEND PATCH] drm/shmobile: Replace drm_dev_unref with drm_dev_put
Date: Wed, 26 Sep 2018 15:53:25 +0300
Message-ID: <1865239.8JzXlkvomL@avalon>
In-Reply-To: <2721d64e-f3a4-9e0a-3af8-dfec8b1bd90c@suse.de>
References: <20180926115525.24500-1-tzimmermann@suse.de> <7e35303c-7bcd-1c6b-6986-40c4413e57aa@ideasonboard.com> <2721d64e-f3a4-9e0a-3af8-dfec8b1bd90c@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Thomas,

On Wednesday, 26 September 2018 15:26:38 EEST Thomas Zimmermann wrote:
> Hi,
> 
> thanks for reviewing the patch and the one for rcar-du. Please also add
> them to your tree.

I took both patches in my tree. Thank you.

> Am 26.09.18 um 14:14 schrieb Kieran Bingham:
> > On 26/09/18 12:55, Thomas Zimmermann wrote:
> >> This patch unifies the naming of DRM functions for reference counting
> >> of struct drm_device. The resulting code is more aligned with the rest
> >> of the Linux kernel interfaces.
> >> 
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> > 
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> >> ---
> >> 
> >>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> >> b/drivers/gpu/drm/shmobile/shmob_drm_drv.c index
> >> 6ececad6f845..8554102a6ead 100644
> >> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> >> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> >> @@ -194,7 +194,7 @@ static int shmob_drm_remove(struct platform_device
> >> *pdev)
> >>  	drm_kms_helper_poll_fini(ddev);
> >>  	drm_mode_config_cleanup(ddev);
> >>  	drm_irq_uninstall(ddev);
> >> -	drm_dev_unref(ddev);
> >> +	drm_dev_put(ddev);
> >> 
> >>  	return 0;
> >>  }
> >> 
> >> @@ -290,7 +290,7 @@ static int shmob_drm_probe(struct platform_device
> >> *pdev)
> >>  	drm_kms_helper_poll_fini(ddev);
> >>  	drm_mode_config_cleanup(ddev);
> >>  
> >>  err_free_drm_dev:
> >> -	drm_dev_unref(ddev);
> >> +	drm_dev_put(ddev);
> >>  	return ret;
> >>  }
> >> 

-- 
Regards,

Laurent Pinchart
