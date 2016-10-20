Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:40312 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757417AbcJTMPx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Oct 2016 08:15:53 -0400
Subject: Re: [PATCH 4/8] drm: Add encoder_type field to the drm_bridge
 structure
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
References: <1476887143-24831-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1476887143-24831-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <644b6ca7-64d3-3bf0-1995-34e9f60f4c85@codeaurora.org>
Date: Thu, 20 Oct 2016 17:45:46 +0530
MIME-Version: 1.0
In-Reply-To: <1476887143-24831-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On 10/19/2016 07:55 PM, Laurent Pinchart wrote:
> The drm_bridge object models on- or off-chip hardware encoders and
> provide an abstract control API to display drivers. In order to help
> display drivers creating the right kind of drm_encoder object, expose
> the type of the hardware encoder associated with each bridge.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  include/drm/drm_bridge.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 530a1d6e8cde..e93105bffc3c 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -194,6 +194,14 @@ struct drm_bridge {
>  #endif
>  	struct list_head list;
>
> +	/**
> +	 * @encoder_type:
> +	 *
> +	 * Type of the hardware encoder modeled by the bridge as one of the
> +	 * DRM_MODE_ENCODER_* types. This will usually be identical to the
> +	 * ->encoder.encoder_type for the last bridge in the chain only.

It isn't entirely clear in the comment that we're mentioning
drm_encoder's encoder_type here. Maybe we can give a &drm_encoder
back reference?


> +	 */
> +	int encoder_type;
>  	const struct drm_bridge_funcs *funcs;
>  	void *driver_private;
>  };
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
