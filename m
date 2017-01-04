Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33672 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965789AbdADISX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 03:18:23 -0500
Received: by mail-wm0-f67.google.com with SMTP id u144so90250643wmu.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Jan 2017 00:18:22 -0800 (PST)
Date: Wed, 4 Jan 2017 09:18:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 06/13] drm: bridge: Add LVDS encoder driver
Message-ID: <20170104081818.xhj6xqp5elwe3szf@phenom.ffwll.local>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480410283-28698-7-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20161129095409.36di7nm3wnxns4qp@phenom.ffwll.local>
 <4516476.dJ1bJMDj4s@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4516476.dJ1bJMDj4s@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 29, 2016 at 10:57:07PM +0200, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Tuesday 29 Nov 2016 10:54:09 Daniel Vetter wrote:
> > On Tue, Nov 29, 2016 at 11:04:36AM +0200, Laurent Pinchart wrote:
> > > The LVDS encoder driver is a DRM bridge driver that supports the
> > > parallel to LVDS encoders that don't require any configuration. The
> > > driver thus doesn't interact with the device, but creates an LVDS
> > > connector for the panel and exposes its size and timing based on
> > > information retrieved from DT.
> > > 
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Since it's 100% dummy, why put LVDS into the name? This little thing here
> > could be our generic "wrap drm_panel and attach it to a chain" helper. So
> > what about calling this _The_ drm_panel_bridge, and also linking it into
> > docs to feature it a bit more prominently.
> 
> I'm not opposed to that, except that this driver should not be considered as 
> just a helper to link a panel. It should only be used to support a real 
> hardware bridge that requires no control.
> 
> > I came up with this because I spotted some refactoring belows for building
> > this helper, until I realized that this driver _is_ the helper I think we
> > want ;-) Only thing missing is an exported function to instantiate a
> > bridge with just a drm_panel as the parameter. And putting it into the
> > drm_kms_helper.ko module.
> 
> What would that be used for ? The bridge should be instantiated by this bridge 
> driver, bound to a bridge device instantiated from DT (or the platform 
> firmware of your choice).

Atm every driver using drm_panel needs a bit of glue to bind it into it's
display chain. With this code, and bridge chaining, you'd get that for
free, and I think that would be rather useful. And from a software point
of view I'd say if it quacks like a bridge, and walks like a bridge, it
probably _is_ a bridge. Even if no one calls that, or if physical the only
thing on the board at that spot are a bunch of dumb wires.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
