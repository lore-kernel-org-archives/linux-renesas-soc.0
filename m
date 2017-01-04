Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f194.google.com ([209.85.210.194]:36754 "EHLO
        mail-wj0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965382AbdADO63 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 09:58:29 -0500
Received: by mail-wj0-f194.google.com with SMTP id j10so75975610wjb.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Jan 2017 06:58:28 -0800 (PST)
Date: Wed, 4 Jan 2017 15:58:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 06/13] drm: bridge: Add LVDS encoder driver
Message-ID: <20170104145824.bnjdsv77bay75ie2@phenom.ffwll.local>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <5172242.1xI6ry2aS1@avalon>
 <CAKMK7uGO6Esj=-Ht=ZwQ0cO1Fp0d5_DPE7TEV5KTRKBVaECdWw@mail.gmail.com>
 <2223998.87cnrdv6Vi@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2223998.87cnrdv6Vi@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 04, 2017 at 04:33:57PM +0200, Laurent Pinchart wrote:
> On Wednesday 04 Jan 2017 14:51:48 Daniel Vetter wrote:
> > Hm, something like drm_bridge_panel_bridge_init(dev, panel) should be
> > enough, or not? My idea is to use this for the case where the only
> > thing in dt is the panel, with no real bridge chip. And I think we
> > don't need anything beyond that one _init function, plus maybe some
> > additional paramaters ...
> 
> There should be no bridge then. If you want the DRM core to manage panels 
> automatically, then we should create specific helpers for that, not abuse the 
> bridge infrastructure. Bridges should be instantiated from a hardware device 
> and bound to drivers as usual.

I guess that's the part where I disagree: Just because there's physically
no bridge doesn't mean we shouldn't just treat it as one in the software
abstraction. If it looks and acts like a bridge (even an empty one), then
imo it can be a bridge.

If you insist on panels being panels, then I guess we need some other kind
of glue to bind them into arbitrary bridge chains. But given that the
callbacks match very closely, I don't see the point.

In an idea world a panel would probably derive from a drm_bridge, but
we're not in that universe unfortunately ;-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
