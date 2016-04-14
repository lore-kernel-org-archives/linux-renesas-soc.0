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
Subject: Re: [PATCH 09/14] drm/rcar-du: use drm_crtc_send_vblank_event()
Date: Fri, 15 Apr 2016 00:59:13 +0300
Message-ID: <16243013.Njob2NOWPF@avalon>
In-Reply-To: <1460656118-16766-9-git-send-email-gustavo@padovan.org>
References: <1460656118-16766-1-git-send-email-gustavo@padovan.org> <1460656118-16766-9-git-send-email-gustavo@padovan.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Gustavo,

Thank you for the patch.

On Thursday 14 Apr 2016 10:48:20 Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> Replace the legacy drm_send_vblank_event() with the new helper function.
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c index d9f06cc..0d8bdda 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -314,7 +314,7 @@ static void rcar_du_crtc_finish_page_flip(struct
> rcar_du_crtc *rcrtc) return;
> 
>  	spin_lock_irqsave(&dev->event_lock, flags);
> -	drm_send_vblank_event(dev, rcrtc->index, event);
> +	drm_crtc_send_vblank_event(&rcrtc->crtc, event);
>  	wake_up(&rcrtc->flip_wait);
>  	spin_unlock_irqrestore(&dev->event_lock, flags);

-- 
Regards,

Laurent Pinchart
