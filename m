Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BD5C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 14:36:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CCB802084F
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 14:36:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bQGCJ29H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388443AbfCAOgs (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 09:36:48 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37840 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387965AbfCAOgs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 09:36:48 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 114EC49;
        Fri,  1 Mar 2019 15:36:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551451006;
        bh=gMCLkp6XXQ0qH3z/BfZO5eqRoNbjsOngS6i75zpgc/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bQGCJ29Hi/mMfdWkBClmqrGmcxL7Ilw7qCs2DNpdWxqj2nPGmulGMGpbnFx3A1gTp
         /Ps7bBKYEN3/uvvYDGc3KF+HJRQiMwPknb5fR/+gplUzzfowkPErjKPoEfOph+3ur5
         Lvesp4qVFJKrgYZuXlqZtv6O1N+TTXW0YE4ADLrU=
Date:   Fri, 1 Mar 2019 16:36:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 12/17] drm/rcar-du: Convert to using
 __drm_atomic_helper_crtc_reset() for reset.
Message-ID: <20190301143640.GD32244@pendragon.ideasonboard.com>
References: <20190301125627.7285-1-maarten.lankhorst@linux.intel.com>
 <20190301125627.7285-13-maarten.lankhorst@linux.intel.com>
 <20190301131358.GC32244@pendragon.ideasonboard.com>
 <93a242fe-41fc-bbe5-0ccd-f26eb729fe85@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93a242fe-41fc-bbe5-0ccd-f26eb729fe85@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marteen,

On Fri, Mar 01, 2019 at 03:08:20PM +0100, Maarten Lankhorst wrote:
> Op 01-03-2019 om 14:13 schreef Laurent Pinchart:
> > On Fri, Mar 01, 2019 at 01:56:22PM +0100, Maarten Lankhorst wrote:
> >> Convert rcar-du to using __drm_atomic_helper_crtc_reset(), instead of
> >> writing its own version. Instead of open coding destroy_state(), call
> >> it directly for freeing the old state.
> > I don't think the second sentence applies to this patch.
> >
> >> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> ---
> >>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 11 +++--------
> >>  1 file changed, 3 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> >> index 4cdea14d552f..7766551e67fc 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> >> @@ -891,22 +891,17 @@ static void rcar_du_crtc_cleanup(struct drm_crtc *crtc)
> >>  
> >>  static void rcar_du_crtc_reset(struct drm_crtc *crtc)
> >>  {
> >> -	struct rcar_du_crtc_state *state;
> >> +	struct rcar_du_crtc_state *state = kzalloc(sizeof(*state), GFP_KERNEL);
> >>  
> >> -	if (crtc->state) {
> >> +	if (crtc->state)
> >>  		rcar_du_crtc_atomic_destroy_state(crtc, crtc->state);
> >> -		crtc->state = NULL;
> >> -	}
> >>  
> >> -	state = kzalloc(sizeof(*state), GFP_KERNEL);
> >> +	__drm_atomic_helper_crtc_reset(crtc, &state->state);
> > 
> > state may be NULL here if the above kzalloc() failed. Let's keep the
> > original order of the function, and simply call
> > __drm_atomic_helper_crtc_reset() after the NULL check below.
> 
> There were 10 different ways crtc was implemented, I felt it was good to settle on one.
> 
> We don't handle during reset at all, would need to start propagating this first before we should handle errors, imho.

That's not the point. As state can be NULL, you could end up
dereferencing a NULL pointer. The fact that the base state is the first
field in the rcar_du_crtc_state structure is just luck, and shouldn't be
relied on.

> Looking more closely, it's the same way that errors in
> rcar_du_plane_reset() are handled. :)

It's not, the return value of kzalloc() is checked explicitly in
rcar_du_plane_reset() before calling __drm_atomic_helper_plane_reset().
Please copy the code flow of rcar_du_plane_reset() to implement
rcar_du_crtc_reset().

-- 
Regards,

Laurent Pinchart
