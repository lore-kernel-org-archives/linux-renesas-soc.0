Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35037 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754150AbdCBHFm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Mar 2017 02:05:42 -0500
Received: by mail-wm0-f65.google.com with SMTP id u63so10794004wmu.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Mar 2017 23:05:41 -0800 (PST)
Date: Thu, 2 Mar 2017 08:05:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS"
        <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 06/13] drm: bridge: Add LVDS encoder driver
Message-ID: <20170302070536.be67cx2wbusxw3cb@phenom.ffwll.local>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20170104145824.bnjdsv77bay75ie2@phenom.ffwll.local>
 <7936513.8Ot9e1G3ck@avalon>
 <2659133.LIMvdVgYOv@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2659133.LIMvdVgYOv@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 02, 2017 at 02:30:09AM +0200, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Wednesday 04 Jan 2017 17:13:23 Laurent Pinchart wrote:
> > On Wednesday 04 Jan 2017 15:58:25 Daniel Vetter wrote:
> > > On Wed, Jan 04, 2017 at 04:33:57PM +0200, Laurent Pinchart wrote:
> > >> On Wednesday 04 Jan 2017 14:51:48 Daniel Vetter wrote:
> > >>> Hm, something like drm_bridge_panel_bridge_init(dev, panel) should be
> > >>> enough, or not? My idea is to use this for the case where the only
> > >>> thing in dt is the panel, with no real bridge chip. And I think we
> > >>> don't need anything beyond that one _init function, plus maybe some
> > >>> additional paramaters ...
> > >> 
> > >> There should be no bridge then. If you want the DRM core to manage
> > >> panels automatically, then we should create specific helpers for that,
> > >> not abuse the bridge infrastructure. Bridges should be instantiated from
> > >> a hardware device and bound to drivers as usual.
> > > 
> > > I guess that's the part where I disagree: Just because there's physically
> > > no bridge doesn't mean we shouldn't just treat it as one in the software
> > > abstraction. If it looks and acts like a bridge (even an empty one), then
> > > imo it can be a bridge.
> > > 
> > > If you insist on panels being panels, then I guess we need some other kind
> > > of glue to bind them into arbitrary bridge chains. But given that the
> > > callbacks match very closely, I don't see the point.
> > > 
> > > In an idea world a panel would probably derive from a drm_bridge, but
> > > we're not in that universe unfortunately ;-)
> > 
> > Or both would derive from another object, but I agree that's how it should
> > work. That's what I want to achieve, one step at a time. Creating dummy
> > bridges isn't a step in that direction in my opinion, so I'd rather not do
> > that, but work towards the right abstraction.
> 
> Do you object getting this patch merged as-is as a first step in the right 
> direction ? :-)

Well, I'm definitely no fan at all of typing code that's only there to
satisfy some fairly arbitrary normative choices we attach to the words we
pick for our abstraction.

But I'm also not going to stop you, just don't complain if I ask the next
dummy panel to reuse your LVDS bridge :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
