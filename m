Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:56000 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753486AbeAaIMf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jan 2018 03:12:35 -0500
Received: by mail-wm0-f66.google.com with SMTP id 143so6149912wma.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2018 00:12:35 -0800 (PST)
Date: Wed, 31 Jan 2018 09:12:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Remove zpos field from
 rcar_du_vsp_plane_state structure
Message-ID: <20180131081231.GX25930@phenom.ffwll.local>
References: <20180117184429.7809-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180117184429.7809-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 17, 2018 at 08:44:29PM +0200, Laurent Pinchart wrote:
> Since commit 2fc4d838aaf2 ("drm: rcar: use generic code for managing
> zpos plane property") the rcar-du driver stores the plane zpos in the
> drm_plane_state structure. The commit however forgot to remove the zpos
> field from the rcar_du_vsp_plane_state structure. Remove it.
> 
> Fixes: 2fc4d838aaf2 ("drm: rcar: use generic code for managing zpos plane property")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

More Cc: helps sometimes, e.g. dim fixes autoadds all you ever want :-)

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> index f876c512163c..4c5d7bbce6aa 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> @@ -45,7 +45,6 @@ static inline struct rcar_du_vsp_plane *to_rcar_vsp_plane(struct drm_plane *p)
>   * @format: information about the pixel format used by the plane
>   * @sg_tables: scatter-gather tables for the frame buffer memory
>   * @alpha: value of the plane alpha property
> - * @zpos: value of the plane zpos property
>   */
>  struct rcar_du_vsp_plane_state {
>  	struct drm_plane_state state;
> @@ -54,7 +53,6 @@ struct rcar_du_vsp_plane_state {
>  	struct sg_table sg_tables[3];
>  
>  	unsigned int alpha;
> -	unsigned int zpos;
>  };
>  
>  static inline struct rcar_du_vsp_plane_state *
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
