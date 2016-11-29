Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34322 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752844AbcK2S7x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 13:59:53 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 04/13] drm: bridge: Detach bridge from encoder at encoder cleanup time
Date: Tue, 29 Nov 2016 21:00:07 +0200
Message-ID: <25975636.p3nvIuICQb@avalon>
In-Reply-To: <20161129094821.udbsu6cyixoc4mnw@phenom.ffwll.local>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1480410283-28698-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20161129094821.udbsu6cyixoc4mnw@phenom.ffwll.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Tuesday 29 Nov 2016 10:48:21 Daniel Vetter wrote:
> On Tue, Nov 29, 2016 at 11:04:34AM +0200, Laurent Pinchart wrote:
> > Most drivers that use bridges forgot to detach them at cleanup time.
> > Instead of fixing them one by one, detach the bridge in the core
> > drm_encoder_cleanup() function.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  drivers/gpu/drm/drm_encoder.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> > index 5c067719164d..9c1f99646e0d 100644
> > --- a/drivers/gpu/drm/drm_encoder.c
> > +++ b/drivers/gpu/drm/drm_encoder.c
> > @@ -164,6 +164,9 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
> > 
> >  	 * the indices on the drm_encoder after us in the encoder_list.
> >  	 */
> > 
> > +	if (encoder->bridge)
> > +		drm_bridge_detach(encoder->bridge);
> 
> Means we bake in drm_bridge much more as a core thing, but I guess that's
> ok.
> 
> But there's 3 callers of drm_bridge_detach outside of the drm core, can't
> we remove them and drop the EXPORT_SYMBOL for drm_bridge_detach? What's
> it still needed for?

Agreed, I'll fix that.

> I think that cleanup should done in this patch here - drm_bridge_detach
> WARN_ONs if the bridge is already detached ...
>
> > +
> >  	drm_modeset_lock_all(dev);
> >  	drm_mode_object_unregister(dev, &encoder->base);
> >  	kfree(encoder->name);

-- 
Regards,

Laurent Pinchart
