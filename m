Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:36460 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbeINTPK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 15:15:10 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: kieran.bingham+renesas@ideasonboard.com
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Remove packed VYUY support
Date: Fri, 14 Sep 2018 17:00:43 +0300
Message-ID: <2071986.YnXjGQr2Jv@avalon>
In-Reply-To: <7d2740f2-923c-4b5d-0d1e-c24fb4a8bceb@ideasonboard.com>
References: <20180914132149.26354-1-kieran.bingham+renesas@ideasonboard.com> <1759929.4apJ9N5u4E@avalon> <7d2740f2-923c-4b5d-0d1e-c24fb4a8bceb@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Friday, 14 September 2018 16:55:38 EEST Kieran Bingham wrote:
> On 14/09/18 14:51, Laurent Pinchart wrote:
> > On Friday, 14 September 2018 16:21:49 EEST Kieran Bingham wrote:
> >> The Gen3 VSP used by the DU for display does not support packed the VYUY
> >> pixel format. Gen2 VSP hardware is able to process this format, but it
> >> is not officially supported there either and thus it's output can not be
> >> guaranteed.
> > 
> > I think we could guarantee proper operation on Gen2, but as DU + VSP
> > operation isn't enabled in the drivers by default, and as the VYUY format
> > isn't a strategic target, I think we can ignore that.
> > 
> > How about updating the commit message as follows ?
> > 
> > "The Gen3 VSP used by the DU for display does not support packed the VYUY
> 
> s/packed the/the packed/
> 
> Which was a fault in my original text :)
> 
> > pixel format. Gen2 VSP hardware is able to process this format, but DU +
> > VSP operation isn't enabled on Gen2, and VYUY isn't a strategic format,
> > so it can be ignored."
> 
> That sounds fine to me, though I don't think we would even need to state
> that 'VYUY isn't a strategic format' once it's simply not available on
> the only platform that is enabled to use the VSP. But I don't object to
> stating it otherwise.

It could be enabled in the drivers (I have out-of-tree patches for testing 
purpose), so the fact that we don't need the format is still important I 
think.

> >> Remove the format from the capabilities of the DU driver.
> >> 
> >> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> >> ---
> >> 
> >>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 2 --
> >>  1 file changed, 2 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> >> b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c index 4480243813ec..4576119e7777
> >> 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> >> @@ -126,7 +126,6 @@ static const u32 formats_kms[] = {
> >>  	DRM_FORMAT_ARGB8888,
> >>  	DRM_FORMAT_XRGB8888,
> >>  	DRM_FORMAT_UYVY,
> >> -	DRM_FORMAT_VYUY,
> >>  	DRM_FORMAT_YUYV,
> >>  	DRM_FORMAT_YVYU,
> >>  	DRM_FORMAT_NV12,
> >> @@ -155,7 +154,6 @@ static const u32 formats_v4l2[] = {
> >>  	V4L2_PIX_FMT_ABGR32,
> >>  	V4L2_PIX_FMT_XBGR32,
> >>  	V4L2_PIX_FMT_UYVY,
> >> -	V4L2_PIX_FMT_VYUY,
> >>  	V4L2_PIX_FMT_YUYV,
> >>  	V4L2_PIX_FMT_YVYU,
> >>  	V4L2_PIX_FMT_NV12M,

-- 
Regards,

Laurent Pinchart
