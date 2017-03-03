Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39925 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751476AbdCCOhB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Mar 2017 09:37:01 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Make sure planes are created by VSP
Date: Fri, 03 Mar 2017 16:37:32 +0200
Message-ID: <5459985.lx9WbAG3kz@avalon>
In-Reply-To: <1488545936-1321-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1488545936-1321-1-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

On Friday 03 Mar 2017 13:58:56 Jacopo Mondi wrote:
> On Gen3 platforms compositing planes are allocated  by VSP on behalf of
> DRM/KMS.
> If VSP support is not compiled in, vsp initialization stub routine is
> called. Return an error from that stub to fail explicitly, otherwise
> accessing planes leads to invalid memory errors.

I'll rephrase this to talk about "VSP compositor support in the DU driver", as 
"VSP support" is ambiguous and could mean the VSP driver. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

No need to resubmit, I'll fix the commit message when applying.

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h index 510dcc9..f1d0f18 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> @@ -68,7 +68,7 @@ void rcar_du_vsp_disable(struct rcar_du_crtc *crtc);
>  void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
>  void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc);
>  #else
> -static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp) { return 0; };
> +static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp) { return
> -ENXIO; }; static inline void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
> { }; static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
> static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };

-- 
Regards,

Laurent Pinchart
