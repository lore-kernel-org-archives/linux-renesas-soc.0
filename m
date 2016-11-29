Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:47104 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755157AbcK2KeN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 05:34:13 -0500
Subject: Re: [PATCH v3 04/13] drm: bridge: Detach bridge from encoder at
 encoder cleanup time
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480410283-28698-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <510cedf6-ce51-5eaf-3053-0002f7757f6f@codeaurora.org>
Date: Tue, 29 Nov 2016 16:04:08 +0530
MIME-Version: 1.0
In-Reply-To: <1480410283-28698-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 11/29/2016 02:34 PM, Laurent Pinchart wrote:
> Most drivers that use bridges forgot to detach them at cleanup time.
> Instead of fixing them one by one, detach the bridge in the core
> drm_encoder_cleanup() function.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_encoder.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 5c067719164d..9c1f99646e0d 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -164,6 +164,9 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
>  	 * the indices on the drm_encoder after us in the encoder_list.
>  	 */
>
> +	if (encoder->bridge)
> +		drm_bridge_detach(encoder->bridge);

This would require the kms driver to still detach the remaining
n - 1 bridges in a possible chain. We could probably detach all of
them here, or maybe leave detaching of all to the kms driver, and just
report a warning here.

Archit

> +
>  	drm_modeset_lock_all(dev);
>  	drm_mode_object_unregister(dev, &encoder->base);
>  	kfree(encoder->name);
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
