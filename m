Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34301 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932362AbcK2S4b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 13:56:31 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Archit Taneja <architt@codeaurora.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 04/13] drm: bridge: Detach bridge from encoder at encoder cleanup time
Date: Tue, 29 Nov 2016 20:56:44 +0200
Message-ID: <11051003.Od02k5E7cU@avalon>
In-Reply-To: <510cedf6-ce51-5eaf-3053-0002f7757f6f@codeaurora.org>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1480410283-28698-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <510cedf6-ce51-5eaf-3053-0002f7757f6f@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Archit,

On Tuesday 29 Nov 2016 16:04:08 Archit Taneja wrote:
> On 11/29/2016 02:34 PM, Laurent Pinchart wrote:
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
> >  	 * the indices on the drm_encoder after us in the encoder_list.
> >  	 */
> > +	if (encoder->bridge)
> > +		drm_bridge_detach(encoder->bridge);
> 
> This would require the kms driver to still detach the remaining
> n - 1 bridges in a possible chain. We could probably detach all of
> them here, or maybe leave detaching of all to the kms driver, and just
> report a warning here.

I'd prefer detaching them all here, but that's a bit intrusive and should be 
tested correctly. The patch series is already growing big, could we do that in 
a separate patch ?

> > +
> > 
> >  	drm_modeset_lock_all(dev);
> >  	drm_mode_object_unregister(dev, &encoder->base);
> >  	kfree(encoder->name);

-- 
Regards,

Laurent Pinchart
