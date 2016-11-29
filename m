Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f193.google.com ([209.85.210.193]:32948 "EHLO
        mail-wj0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753066AbcK2UWh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 15:22:37 -0500
Received: by mail-wj0-f193.google.com with SMTP id kp2so19627618wjc.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Nov 2016 12:22:37 -0800 (PST)
Date: Tue, 29 Nov 2016 21:22:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Archit Taneja <architt@codeaurora.org>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 04/13] drm: bridge: Detach bridge from encoder at
 encoder cleanup time
Message-ID: <20161129202239.ip7xctghyoxypbz2@phenom.ffwll.local>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480410283-28698-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <510cedf6-ce51-5eaf-3053-0002f7757f6f@codeaurora.org>
 <11051003.Od02k5E7cU@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11051003.Od02k5E7cU@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 29, 2016 at 08:56:44PM +0200, Laurent Pinchart wrote:
> Hi Archit,
> 
> On Tuesday 29 Nov 2016 16:04:08 Archit Taneja wrote:
> > On 11/29/2016 02:34 PM, Laurent Pinchart wrote:
> > > Most drivers that use bridges forgot to detach them at cleanup time.
> > > Instead of fixing them one by one, detach the bridge in the core
> > > drm_encoder_cleanup() function.
> > > 
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > > 
> > >  drivers/gpu/drm/drm_encoder.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> > > index 5c067719164d..9c1f99646e0d 100644
> > > --- a/drivers/gpu/drm/drm_encoder.c
> > > +++ b/drivers/gpu/drm/drm_encoder.c
> > > @@ -164,6 +164,9 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
> > >  	 * the indices on the drm_encoder after us in the encoder_list.
> > >  	 */
> > > +	if (encoder->bridge)
> > > +		drm_bridge_detach(encoder->bridge);
> > 
> > This would require the kms driver to still detach the remaining
> > n - 1 bridges in a possible chain. We could probably detach all of
> > them here, or maybe leave detaching of all to the kms driver, and just
> > report a warning here.
> 
> I'd prefer detaching them all here, but that's a bit intrusive and should be 
> tested correctly. The patch series is already growing big, could we do that in 
> a separate patch ?

I think you're bridge-for-panels driver is the first one that's actually
getting chained. I guess you do have to fix this here ;-) And if you go
through with making drm_bridge_detach be a purely drm.ko internal thing,
we can make it recursive like all the other functions. Problem solved.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
