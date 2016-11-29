Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f195.google.com ([209.85.210.195]:36389 "EHLO
        mail-wj0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756318AbcK2JbQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 04:31:16 -0500
Received: by mail-wj0-f195.google.com with SMTP id jb2so17302993wjb.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Nov 2016 01:31:01 -0800 (PST)
Date: Tue, 29 Nov 2016 10:31:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 02/13] drm: Fix compilation warning caused by static
 inline forward declaration
Message-ID: <20161129093104.xgszoojkh23c756k@phenom.ffwll.local>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480410283-28698-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1480410283-28698-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 29, 2016 at 11:04:32AM +0200, Laurent Pinchart wrote:
> The drm_crtc_mask() function used in <drm/drm_encoder.h> is a static
> inline defined in <drm/drm_crtc.h>. If the first header is included in a
> compilation unit without the second one, the following compilation
> warning will be issued.
> 
> In file included from <linux>/drivers/gpu/drm/drm_bridge.c:29:0:
> <linux>/include/drm/drm_encoder.h:192:95: warning: ‘drm_crtc_mask’ used but never defined
>  static inline uint32_t drm_crtc_mask(const struct drm_crtc *crtc);
> 
> Fix this by including the header defining the function instead of using
> a forward declaration.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/drm/drm_encoder.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index cec6ac45c6cc..5f58f65344e0 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -25,6 +25,7 @@
>  
>  #include <linux/list.h>
>  #include <linux/ctype.h>
> +#include <drm/drm_crtc.h>
>  #include <drm/drm_mode.h>
>  #include <drm/drm_mode_object.h>
>  
> @@ -191,9 +192,6 @@ static inline unsigned int drm_encoder_index(struct drm_encoder *encoder)
>  	return encoder->index;
>  }
>  
> -/* FIXME: We have an include file mess still, drm_crtc.h needs untangling. */
> -static inline uint32_t drm_crtc_mask(const struct drm_crtc *crtc);
> -
>  /**
>   * drm_encoder_crtc_ok - can a given crtc drive a given encoder?
>   * @encoder: encoder to test
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
