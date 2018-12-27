Return-Path: <SRS0=84+3=PE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519D6C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 27 Dec 2018 12:18:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 122B62148E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 27 Dec 2018 12:18:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="TLFPU1u2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730919AbeL0MSr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 27 Dec 2018 07:18:47 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46194 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbeL0MSr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Dec 2018 07:18:47 -0500
Received: by mail-ed1-f68.google.com with SMTP id o10so15072736edt.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Dec 2018 04:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mj//mn4XW2T80OZaDc47pxDysex9r1WKaxCJ+vDEwlU=;
        b=TLFPU1u2BKtzh0QIIRHX1v0LW+/F+1ez8nw/yWWDXcIZ33jh5c0/qTzxDE8BoCu+ax
         ZzuqptQ0pK6wJ4xtr4/euzXvJabZudx35nwf3EGQK6z2rgLQ5BmwNDgiMUPArIifImbB
         u6+pqjrd6Ji0X7uXh6sgWkSi8AWmr3vfSbKt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=mj//mn4XW2T80OZaDc47pxDysex9r1WKaxCJ+vDEwlU=;
        b=jqTtYDLLg1a8G8xN3LIQTuHd1xwwQCC+aM9xty+pXPZLtzfsl0NrdlpXUv9tbxBNpi
         zTxwgUMMjiS35anySIcirr0wNNVRoqpFNqYmRYuQfK31Fpt+Wl+jwCTBBWemOypSqzNN
         8STDN0+Pf+Ehmakl7oT5HwAtCFO15VMUREiaozLjRz+nuOXhn99xthp+9VToe0BS3cGK
         bbklXBML3UFUfLU+2lEowS1Mjc+/PUIQEJcJLMICggvVienyevW3PczPCWE2fqbb2RBb
         688V7QRVhf7K4sDp66vMwlujuyY/REW+aV4D0KtDkpB0atIvhPvNi77ZophekJ0LVXnC
         bzkA==
X-Gm-Message-State: AA+aEWbjGMi5IVuwuizln4XCSpCtur46CusrCj6TZCBdZC6vPrIwXqi/
        RGlnGZVcOlJPi1YxlT4bS7nAtQ==
X-Google-Smtp-Source: AFSGD/XHircYcpmq5o0meUJvlZmmCtX0Fl7c5Sm/QBmD6v5P6J/77rzil7EfAb0hvahexiXUpVf64g==
X-Received: by 2002:a17:906:734c:: with SMTP id h12-v6mr15273205ejl.50.1545913124803;
        Thu, 27 Dec 2018 04:18:44 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([194.230.159.220])
        by smtp.gmail.com with ESMTPSA id g40sm11103643edg.39.2018.12.27.04.18.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Dec 2018 04:18:43 -0800 (PST)
Date:   Thu, 27 Dec 2018 13:18:41 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] drm: rcar-du: Remove inclusion of drmP.h
Message-ID: <20181227121841.GG9058@dvetter-linux.ger.corp.intel.com>
References: <20181227101206.1143-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181227101206.1143-1-laurent.pinchart+renesas@ideasonboard.com>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 4.19.10-200.fc28.x86_64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 27, 2018 at 12:12:06PM +0200, Laurent Pinchart wrote:
> The DRM kernel API used to be defined in a handful of headers, pulled in
> through drmP.h. It has since been split in multiple headers for the
> different DRM components, and drmP.h turned into a legacy header that
> just pulls in most of the DRM kernel API (and a large number of other
> miscellaneous kernel headers).
> 
> In order to speed up compilation, replace inclusion of drmP.h with only
> the required headers. It turns out that the rcar-du-drm driver already
> includes most of the necessary headers, so the change is simple.
> 
> While at it, remove unneeder inclusion of other headers, and unneeded
> forward declarations of structures.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Nice, first driver where all that header cleanup work finally lead
somewhere useful!

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 1 -
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h    | 1 -
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c     | 1 -
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h     | 1 +
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 1 -
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.h | 2 --
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 1 -
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c   | 1 -
>  drivers/gpu/drm/rcar-du/rcar_du_plane.h   | 3 +--
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 1 -
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.h     | 3 +--
>  11 files changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 40b7f17159b0..771b460c7216 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -11,7 +11,6 @@
>  #include <linux/mutex.h>
>  #include <linux/sys_soc.h>
>  
> -#include <drm/drmP.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> index ec47f164e69b..bcb35b0b7612 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> @@ -14,7 +14,6 @@
>  #include <linux/spinlock.h>
>  #include <linux/wait.h>
>  
> -#include <drm/drmP.h>
>  #include <drm/drm_crtc.h>
>  
>  #include <media/vsp1.h>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index eef86c48edad..d1f305694367 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -17,7 +17,6 @@
>  #include <linux/slab.h>
>  #include <linux/wait.h>
>  
> -#include <drm/drmP.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fb_cma_helper.h>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index 752617c73c73..6c187d0bf7c2 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -20,6 +20,7 @@
>  struct clk;
>  struct device;
>  struct drm_device;
> +struct drm_property;
>  struct rcar_du_device;
>  
>  #define RCAR_DU_FEATURE_CRTC_IRQ_CLOCK	BIT(0)	/* Per-CRTC IRQ and clock */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index a123c28ea6ed..f16209499117 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -9,7 +9,6 @@
>  
>  #include <linux/export.h>
>  
> -#include <drm/drmP.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_panel.h>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
> index ce3cbc85695e..552f2a02e5b5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
> @@ -10,10 +10,8 @@
>  #ifndef __RCAR_DU_ENCODER_H__
>  #define __RCAR_DU_ENCODER_H__
>  
> -#include <drm/drm_crtc.h>
>  #include <drm/drm_encoder.h>
>  
> -struct drm_panel;
>  struct rcar_du_device;
>  
>  struct rcar_du_encoder {
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index d8ef3a86b0b2..e4b248e368d6 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -7,7 +7,6 @@
>   * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>  
> -#include <drm/drmP.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> index 39d5ae3fdf72..fa6b9aabc832 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -7,7 +7,6 @@
>   * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>  
> -#include <drm/drmP.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.h b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
> index 2f223a4c1d33..81bbf207ad0e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
> @@ -10,8 +10,7 @@
>  #ifndef __RCAR_DU_PLANE_H__
>  #define __RCAR_DU_PLANE_H__
>  
> -#include <drm/drmP.h>
> -#include <drm/drm_crtc.h>
> +#include <drm/drm_plane.h>
>  
>  struct rcar_du_format_info;
>  struct rcar_du_group;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index 4576119e7777..dec314a687e0 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -7,7 +7,6 @@
>   * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>  
> -#include <drm/drmP.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> index e8c14dc5cb93..db232037f24a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> @@ -10,8 +10,7 @@
>  #ifndef __RCAR_DU_VSP_H__
>  #define __RCAR_DU_VSP_H__
>  
> -#include <drm/drmP.h>
> -#include <drm/drm_crtc.h>
> +#include <drm/drm_plane.h>
>  
>  struct rcar_du_format_info;
>  struct rcar_du_vsp;
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
