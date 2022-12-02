Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1251C4321E
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  2 Dec 2022 23:57:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233308AbiLBX5L (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 2 Dec 2022 18:57:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234150AbiLBX5K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 18:57:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6670CBC20
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 15:57:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDC1C11B4;
        Sat,  3 Dec 2022 00:57:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670025428;
        bh=uUZwgJMyU1x1LHcQ74fEWq0AZlAcfpnHSbwYA/1NWp4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QlCaNKl637QjvtVgPlimIVlU3P3K0mJXYcYVCGNfyLUK8b/jjYDtJBWUjU+eqruEV
         EZO8UJLap90DGFIeKtzStsVfI7XZn8zZsB23EWlWDlaWfaJs537RPWsg2ra5NofpQF
         5i4oAUknn4FIB8DNAx66JKiH6hd7tO1IIFXCL8MA=
Date:   Sat, 3 Dec 2022 01:57:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH kms++ 2/4] kms++: PixelFormats: Add Y210 format
Message-ID: <Y4qQ0l7aIaYKt2q0@pendragon.ideasonboard.com>
References: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221202131658.434114-3-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221202131658.434114-3-tomi.valkeinen+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Dec 02, 2022 at 03:16:56PM +0200, Tomi Valkeinen wrote:
> Add Y210 pixel format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  kms++/inc/kms++/pixelformats.h | 2 ++
>  kms++/src/pixelformats.cpp     | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/kms++/inc/kms++/pixelformats.h b/kms++/inc/kms++/pixelformats.h
> index 6f2671b..35261a9 100644
> --- a/kms++/inc/kms++/pixelformats.h
> +++ b/kms++/inc/kms++/pixelformats.h
> @@ -31,6 +31,8 @@ enum class PixelFormat : uint32_t {
>  	YVYU = MakeFourCC("YVYU"),
>  	VYUY = MakeFourCC("VYUY"),
>  
> +	Y210 = MakeFourCC("Y210"),
> +
>  	XRGB8888 = MakeFourCC("XR24"),
>  	XBGR8888 = MakeFourCC("XB24"),
>  	RGBX8888 = MakeFourCC("RX24"),
> diff --git a/kms++/src/pixelformats.cpp b/kms++/src/pixelformats.cpp
> index 7afbf09..89eece4 100644
> --- a/kms++/src/pixelformats.cpp
> +++ b/kms++/src/pixelformats.cpp
> @@ -28,6 +28,12 @@ static const map<PixelFormat, PixelFormatInfo> format_info_array = {
>  				     1,
>  				     { { 16, 2, 1 } },
>  			     } },
> +	{ PixelFormat::Y210, {
> +				     PixelColorType::YUV,
> +				     1,
> +				     { { 32, 2, 1 } },
> +			     } },
> +
>  	/* YUV semi-planar */
>  	{ PixelFormat::NV12, {
>  				     PixelColorType::YUV,

-- 
Regards,

Laurent Pinchart
