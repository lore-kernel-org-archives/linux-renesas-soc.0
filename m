Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f194.google.com ([209.85.210.194]:36394 "EHLO
        mail-wj0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752706AbcK2UZZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 15:25:25 -0500
Received: by mail-wj0-f194.google.com with SMTP id jb2so19631604wjb.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Nov 2016 12:25:25 -0800 (PST)
Date: Tue, 29 Nov 2016 21:25:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 09/13] drm: Add encoder_type field to the drm_bridge
 structure
Message-ID: <20161129202527.euaztnizctfmtgen@phenom.ffwll.local>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <9030087.LEDx357bJm@avalon>
 <20161129102720.alacxa4bxcyyrn3j@phenom.ffwll.local>
 <2516383.b9AMKiZRXv@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2516383.b9AMKiZRXv@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 29, 2016 at 07:49:22PM +0200, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Tuesday 29 Nov 2016 11:27:20 Daniel Vetter wrote:
> > On Tue, Nov 29, 2016 at 11:58:44AM +0200, Laurent Pinchart wrote:
> > > On Tuesday 29 Nov 2016 10:56:53 Daniel Vetter wrote:
> > >> On Tue, Nov 29, 2016 at 11:04:39AM +0200, Laurent Pinchart wrote:
> > >>> The drm_bridge object models on- or off-chip hardware encoders and
> > >>> provide an abstract control API to display drivers. In order to help
> > >>> display drivers creating the right kind of drm_encoder object, expose
> > >>> the type of the hardware encoder associated with each bridge.
> > >>> 
> > >>> Signed-off-by: Laurent Pinchart
> > >>> <laurent.pinchart+renesas@ideasonboard.com>
> > >> 
> > >> DRM_MODE_ENCODER_BRIDGE. Problem solved, because in reality no one cares
> > >> one iota about the encoder type.
> > > 
> > > It's exposed to userspace though, are you 100% sure we won't break
> > > anything ?
> >
> > We've added DP, DSI, DPMST and DPI encoder types thus far, no one
> > screamed.
> 
> In that case why don't we go one step further and remove the encoder type 
> completely ? We can't remove the field from the API, but we can hardcode it to 
> a single value.
> 
> There are however drivers that rely on the encoder type (radeon, nouveau, sti, 
> amdgpu, msm and rcar-du, but I'll fix the last one) so we'd need to address 
> that first. If we don't want to remove the encoder_type field from in-kernel 
> structures and let drivers use it, then I don't think DRM_MODE_ENCODER_BRIDGE 
> would be a good option, we should report the real type instead.

If you strongly believe that I will not stop you. This was just a
suggestion to get all your stuff landed with minimal amounts of effort and
across-the-subsystem cleanup needed. I'd do it that ;-)

And if you don't like DRM_MODE_ENCODER_BRIDGE you could also pick
DRM_MODE_ENCODER_NONE, which is what most seem to do today. In the end it
doesn't matter no matter which option you pick. The only difference is in
the amount of effort you need to spend to get it merged ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
