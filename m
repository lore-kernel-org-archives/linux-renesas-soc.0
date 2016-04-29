Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:32968 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751657AbcD2JNa (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 29 Apr 2016 05:13:30 -0400
Received: by mail-wm0-f66.google.com with SMTP id r12so3486305wme.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2016 02:13:29 -0700 (PDT)
Date: Fri, 29 Apr 2016 11:13:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 1/4] drm_mode: add TCON encoder/connector
Message-ID: <20160429083529.GA14148@phenom.ffwll.local>
References: <1787748.qAADjKK4gv@wasted.cogentembedded.com>
 <19760070.fVPA1G30uu@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19760070.fVPA1G30uu@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 29, 2016 at 12:02:15AM +0300, Sergei Shtylyov wrote:
> TCON (Timing  Controller) usually means  a chip that drives a LCD panel.
> In  our case, such controller  is a part of the Renesas R-Car SoCs. Add
> the TCON encoder/connector #define's  to be used by the TCON support code
> in the Renesas R-Car Display Unit (DU) driver.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  include/uapi/drm/drm_mode.h |    2 ++
>  1 file changed, 2 insertions(+)
> 
> Index: linux/include/uapi/drm/drm_mode.h
> ===================================================================
> --- linux.orig/include/uapi/drm/drm_mode.h
> +++ linux/include/uapi/drm/drm_mode.h
> @@ -202,6 +202,7 @@ struct drm_mode_get_plane_res {
>  #define DRM_MODE_ENCODER_VIRTUAL 5
>  #define DRM_MODE_ENCODER_DSI	6
>  #define DRM_MODE_ENCODER_DPMST	7
> +#define DRM_MODE_ENCODER_TCON	8
>  
>  struct drm_mode_get_encoder {
>  	__u32 encoder_id;
> @@ -241,6 +242,7 @@ struct drm_mode_get_encoder {
>  #define DRM_MODE_CONNECTOR_eDP		14
>  #define DRM_MODE_CONNECTOR_VIRTUAL      15
>  #define DRM_MODE_CONNECTOR_DSI		16
> +#define DRM_MODE_CONNECTOR_TCON		17
>  
>  struct drm_mode_get_connector {

The trouble with adding more here is that everytime you do this all the
userspace needs to be extended to print something reasonable for this type
of connector. For external connectors that makes sense (since users need
to know whether it's the hdmi or DP plug), but for internal panels I'd
honestly just go with lvds for anything that's not a more complex standard
like eDP or DSI.

Just my 2 cents really, not strong opinion, and we'll not run out of
connector type numbers anytime soon ;-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
