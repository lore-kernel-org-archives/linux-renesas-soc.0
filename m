Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33138 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753551AbdADNH7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 08:07:59 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 06/13] drm: bridge: Add LVDS encoder driver
Date: Wed, 04 Jan 2017 15:08:02 +0200
Message-ID: <5172242.1xI6ry2aS1@avalon>
In-Reply-To: <20170104081818.xhj6xqp5elwe3szf@phenom.ffwll.local>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <4516476.dJ1bJMDj4s@avalon> <20170104081818.xhj6xqp5elwe3szf@phenom.ffwll.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Wednesday 04 Jan 2017 09:18:18 Daniel Vetter wrote:
> On Tue, Nov 29, 2016 at 10:57:07PM +0200, Laurent Pinchart wrote:
> > On Tuesday 29 Nov 2016 10:54:09 Daniel Vetter wrote:
> >> On Tue, Nov 29, 2016 at 11:04:36AM +0200, Laurent Pinchart wrote:
> >>> The LVDS encoder driver is a DRM bridge driver that supports the
> >>> parallel to LVDS encoders that don't require any configuration. The
> >>> driver thus doesn't interact with the device, but creates an LVDS
> >>> connector for the panel and exposes its size and timing based on
> >>> information retrieved from DT.
> >>> 
> >>> Signed-off-by: Laurent Pinchart
> >>> <laurent.pinchart+renesas@ideasonboard.com>
> >> 
> >> Since it's 100% dummy, why put LVDS into the name? This little thing
> >> here could be our generic "wrap drm_panel and attach it to a chain"
> >> helper. So what about calling this _The_ drm_panel_bridge, and also
> >> linking it into docs to feature it a bit more prominently.
> > 
> > I'm not opposed to that, except that this driver should not be considered
> > as just a helper to link a panel. It should only be used to support a
> > real hardware bridge that requires no control.
> > 
> >> I came up with this because I spotted some refactoring belows for
> >> building this helper, until I realized that this driver _is_ the helper I
> >> think we want ;-) Only thing missing is an exported function to
> >> instantiate a bridge with just a drm_panel as the parameter. And putting
> >> it into the drm_kms_helper.ko module.
> > 
> > What would that be used for ? The bridge should be instantiated by this
> > bridge driver, bound to a bridge device instantiated from DT (or the
> > platform firmware of your choice).
> 
> Atm every driver using drm_panel needs a bit of glue to bind it into it's
> display chain. With this code, and bridge chaining, you'd get that for
> free, and I think that would be rather useful.

You would trade the bit of panel glue for a bit of bridge glue. Bridge 
chaining could perhaps help slightly at runtime there, but at init time the 
amount of glue would be similar.

I've noticed one piece of code that is LVDS-specific in this driver, and 
that's connector creation. The connector type is hardcoded to LVDS. To make 
the driver more generic, we would need a way to find the connector type at 
runtime. I'm wondering whether I should do this now, or keep the driver LVDS-
specific until someone comes up with a similar need. Without several potential 
users it's often hard to design a properly generic API.

> And from a software point of view I'd say if it quacks like a bridge, and
> walks like a bridge, it probably _is_ a bridge. Even if no one calls that,
> or if physical the only thing on the board at that spot are a bunch of dumb
> wires.

I dream of moving all encoders to DRM bridge, and then unifying drm_bridge and 
drm_panel with a common set of operations that could be invoked on both 
objects. That way the core could chain bridges and panels quite easily. I plan 
to experiment with this when moving the omapdrm driver to DRM bridge and DRM 
panel (it currently includes a bunch of custom encoder and panel drivers).

-- 
Regards,

Laurent Pinchart
