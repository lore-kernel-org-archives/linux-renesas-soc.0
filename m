Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E8EC10F03
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 13:14:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 746F720850
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 13:14:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MgdmGj/Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbfCANOH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 08:14:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37456 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbfCANOH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 08:14:07 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D379A49;
        Fri,  1 Mar 2019 14:14:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551446045;
        bh=75ixaH/DPUy5M2t6S4HGXWD3H2FmRIUPlpohU+5cu3E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MgdmGj/Qto9/s2r0Tg/oxkVkctAk0CENGgljXU359dhy8h02MP3G1wUNQDHJd6PNb
         84EBp1q2PoiTIRIpkh8VcrWrxIcZdMbYSaH5nX15Evrz3+aJOgQFcwKfqAJimkcI3f
         i/Vt2ou73PVHpX4jH2Ca7EWqLlMIW7DFE7TrAqno=
Date:   Fri, 1 Mar 2019 15:13:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 12/17] drm/rcar-du: Convert to using
 __drm_atomic_helper_crtc_reset() for reset.
Message-ID: <20190301131358.GC32244@pendragon.ideasonboard.com>
References: <20190301125627.7285-1-maarten.lankhorst@linux.intel.com>
 <20190301125627.7285-13-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190301125627.7285-13-maarten.lankhorst@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Maarten,

Thank you for the patch.

On Fri, Mar 01, 2019 at 01:56:22PM +0100, Maarten Lankhorst wrote:
> Convert rcar-du to using __drm_atomic_helper_crtc_reset(), instead of
> writing its own version. Instead of open coding destroy_state(), call
> it directly for freeing the old state.

I don't think the second sentence applies to this patch.

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 4cdea14d552f..7766551e67fc 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -891,22 +891,17 @@ static void rcar_du_crtc_cleanup(struct drm_crtc *crtc)
>  
>  static void rcar_du_crtc_reset(struct drm_crtc *crtc)
>  {
> -	struct rcar_du_crtc_state *state;
> +	struct rcar_du_crtc_state *state = kzalloc(sizeof(*state), GFP_KERNEL);
>  
> -	if (crtc->state) {
> +	if (crtc->state)
>  		rcar_du_crtc_atomic_destroy_state(crtc, crtc->state);
> -		crtc->state = NULL;
> -	}
>  
> -	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	__drm_atomic_helper_crtc_reset(crtc, &state->state);

state may be NULL here if the above kzalloc() failed. Let's keep the
original order of the function, and simply call
__drm_atomic_helper_crtc_reset() after the NULL check below.

>  	if (state == NULL)
>  		return;
>  
>  	state->crc.source = VSP1_DU_CRC_NONE;
>  	state->crc.index = 0;
> -
> -	crtc->state = &state->state;
> -	crtc->state->crtc = crtc;
>  }
>  
>  static int rcar_du_crtc_enable_vblank(struct drm_crtc *crtc)

-- 
Regards,

Laurent Pinchart
