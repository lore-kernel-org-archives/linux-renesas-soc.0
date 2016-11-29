Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35539 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757110AbcK2K1U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 05:27:20 -0500
Received: by mail-wm0-f66.google.com with SMTP id a20so23540058wme.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Nov 2016 02:27:19 -0800 (PST)
Date: Tue, 29 Nov 2016 11:27:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 09/13] drm: Add encoder_type field to the drm_bridge
 structure
Message-ID: <20161129102720.alacxa4bxcyyrn3j@phenom.ffwll.local>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480410283-28698-10-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20161129095653.gkfavyo23ewadatx@phenom.ffwll.local>
 <9030087.LEDx357bJm@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9030087.LEDx357bJm@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 29, 2016 at 11:58:44AM +0200, Laurent Pinchart wrote:
> On Tuesday 29 Nov 2016 10:56:53 Daniel Vetter wrote:
> > On Tue, Nov 29, 2016 at 11:04:39AM +0200, Laurent Pinchart wrote:
> > > The drm_bridge object models on- or off-chip hardware encoders and
> > > provide an abstract control API to display drivers. In order to help
> > > display drivers creating the right kind of drm_encoder object, expose
> > > the type of the hardware encoder associated with each bridge.
> > > 
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > DRM_MODE_ENCODER_BRIDGE. Problem solved, because in reality no one cares
> > one iota about the encoder type.
> 
> It's exposed to userspace though, are you 100% sure we won't break anything ?

We've added DP, DSI, DPMST and DPI encoder types thus far, no one
screamed. We should be fine I think. Connector types are a bit different,
userspace (at least X) wants to pretty-print them for xrandr names.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
