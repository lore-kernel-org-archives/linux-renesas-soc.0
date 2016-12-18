Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59606 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753531AbcLRUbB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Dec 2016 15:31:01 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thierry Reding <thierry.reding@gmail.com>,
        Stefan Agner <stefan@agner.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 04/13] drm: Add data mirror bus flag
Date: Sun, 18 Dec 2016 22:31:28 +0200
Message-ID: <1945420.2ppkyQgY5N@avalon>
In-Reply-To: <1479526093-7014-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1479526093-7014-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Stefan and Thierry,

As the author and suggester of the other bus flags, could you please review 
this patch ?

On Saturday 19 Nov 2016 05:28:04 Laurent Pinchart wrote:
> The flag indicates that data is mirrored on the bus. The exact meaning
> is bus-type dependent. For LVDS buses it indicates that the seven data
> bits that transmitted in a clock pulse are sent in slots 6 to 0 order.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  include/drm/drm_connector.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index ac9d7d8e0e43..5c1dda236760 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -159,6 +159,8 @@ struct drm_display_info {
>  #define DRM_BUS_FLAG_PIXDATA_POSEDGE	(1<<2)
>  /* drive data on neg. edge */
>  #define DRM_BUS_FLAG_PIXDATA_NEGEDGE	(1<<3)
> +/* data is mirrored on the bus */
> +#define DRM_BUS_FLAG_DATA_MIRROR	(1<<4)
> 
>  	/**
>  	 * @bus_flags: Additional information (like pixel signal polarity) for

-- 
Regards,

Laurent Pinchart
