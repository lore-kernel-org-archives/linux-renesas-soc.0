Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Gustavo Padovan <gustavo@padovan.org>
Cc: dri-devel@lists.freedesktop.org,
	Gustavo Padovan <gustavo.padovan@collabora.co.uk>,
	David Airlie <airlied@linux.ie>,
	"open list:DRM DRIVERS FOR RENESAS"
	<linux-renesas-soc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/14] drm/shmobile: use drm_crtc_send_vblank_event()
Date: Fri, 15 Apr 2016 00:59:26 +0300
Message-ID: <1613192.Vg6X4UTTAB@avalon>
In-Reply-To: <1460656118-16766-10-git-send-email-gustavo@padovan.org>
References: <1460656118-16766-1-git-send-email-gustavo@padovan.org> <1460656118-16766-10-git-send-email-gustavo@padovan.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Gustavo,

Thank you for the patch.

On Thursday 14 Apr 2016 10:48:21 Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> Replace the legacy drm_send_vblank_event() with the new helper function.
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c index 88643ab..1e154fc 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> @@ -440,7 +440,7 @@ void shmob_drm_crtc_finish_page_flip(struct
> shmob_drm_crtc *scrtc) event = scrtc->event;
>  	scrtc->event = NULL;
>  	if (event) {
> -		drm_send_vblank_event(dev, 0, event);
> +		drm_crtc_send_vblank_event(&scrtc->crtc, event);
>  		drm_vblank_put(dev, 0);
>  	}
>  	spin_unlock_irqrestore(&dev->event_lock, flags);

-- 
Regards,

Laurent Pinchart
