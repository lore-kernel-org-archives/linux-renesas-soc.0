Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39142 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751375AbdGMXeY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 19:34:24 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: kieran.bingham@ideasonboard.com
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, maxime.ripard@free-electrons.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Setup planes before enabling CRTC to avoid flicker
Date: Fri, 14 Jul 2017 02:34:25 +0300
Message-ID: <5229221.0cIGQtEDv4@avalon>
In-Reply-To: <92490bac-1731-41b0-ac1c-93699963959c@ideasonboard.com>
References: <20170628185055.16379-1-laurent.pinchart+renesas@ideasonboard.com> <9120be80-cefe-e52a-e512-15145ded1e82@ideasonboard.com> <92490bac-1731-41b0-ac1c-93699963959c@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Thursday 13 Jul 2017 16:51:18 Kieran Bingham wrote:
> Hi Laurent,
> 
> I've just seen Maxime's latest series "[PATCH 0/4] drm/sun4i: Fix a register
> access bug" and it relates directly to a comment I had in this patch:
> On 12/07/17 17:35, Kieran Bingham wrote:
>
> > On 28/06/17 19:50, Laurent Pinchart wrote:
> >> Commit 52055bafa1ff ("drm: rcar-du: Move plane commit code from CRTC
> >> start to CRTC resume") changed the order of the plane commit and CRTC
> >> enable operations to accommodate the runtime PM requirements. However,
> >> this introduced corruption in the first displayed frame, as the CRTC is
> >> now enabled without any plane configured. On Gen2 hardware the first
> >> frame will be black and likely unnoticed, but on Gen3 hardware we end up
> >> starting the display before the VSP compositor, which is more
> >> noticeable.
> >> 
> >> To fix this, revert the order of the commit operations back, and handle
> >> runtime PM requirements in the CRTC .atomic_begin() and .atomic_enable()
> >> helper operation handlers.
> >> 
> >> Signed-off-by: Laurent Pinchart
> >> <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > I only have code reduction or comment suggestions below - so either with
> > or without those changes, feel free to add my:
> > 
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> >> ---
> >> 
> >>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 66 +++++++++++++++++-----------
> >>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  4 +--
> >>  drivers/gpu/drm/rcar-du/rcar_du_kms.c  |  2 +-
> >>  3 files changed, 43 insertions(+), 29 deletions(-)

[snip]

> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >> b/drivers/gpu/drm/rcar-du/rcar_du_kms.c index 82b978a5dae6..c2f382feca07
> >> 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >> @@ -255,9 +255,9 @@ static void rcar_du_atomic_commit_tail(struct
> >> drm_atomic_state *old_state)>> 
> >>  	/* Apply the atomic update. */
> >>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> >> -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> >>  	drm_atomic_helper_commit_planes(dev, old_state,
> >>  					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> > 
> > Except for DRM_PLANE_COMMIT_ACTIVE_ONLY, this function now looks very much
> > like the default drm_atomic_helper_commit_tail() code.
> > 
> > Reading around other uses /variants of commit_tail() style functions in
> > other drivers has left me confused as to how the ordering affects things
> > here.
> > 
> > Could be worth adding a comment at least to describe why we can't use the
> > default helper...
> 
> Or better still ... Use Maxime's new :
> 
> [PATCH 1/4] drm/atomic: implement drm_atomic_helper_commit_tail for
> runtime_pm users

Note that Maxime's patch implements the commit tail as

	drm_atomic_helper_commit_modeset_disables(dev, old_state);
	drm_atomic_helper_commit_modeset_enables(dev, old_state);
	drm_atomic_helper_commit_planes(dev, old_state,
					DRM_PLANE_COMMIT_ACTIVE_ONLY);

while this patches moves the drm_atomic_helper_commit_planes() back between 
drm_atomic_helper_commit_modeset_disables() and 
drm_atomic_helper_commit_modeset_enables().

> >> +	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> >> 
> >>  	drm_atomic_helper_commit_hw_done(old_state);
> >>  	drm_atomic_helper_wait_for_vblanks(dev, old_state);

-- 
Regards,

Laurent Pinchart
