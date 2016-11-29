Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34699 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756495AbcK2U4y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 15:56:54 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 06/13] drm: bridge: Add LVDS encoder driver
Date: Tue, 29 Nov 2016 22:57:07 +0200
Message-ID: <4516476.dJ1bJMDj4s@avalon>
In-Reply-To: <20161129095409.36di7nm3wnxns4qp@phenom.ffwll.local>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1480410283-28698-7-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20161129095409.36di7nm3wnxns4qp@phenom.ffwll.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Tuesday 29 Nov 2016 10:54:09 Daniel Vetter wrote:
> On Tue, Nov 29, 2016 at 11:04:36AM +0200, Laurent Pinchart wrote:
> > The LVDS encoder driver is a DRM bridge driver that supports the
> > parallel to LVDS encoders that don't require any configuration. The
> > driver thus doesn't interact with the device, but creates an LVDS
> > connector for the panel and exposes its size and timing based on
> > information retrieved from DT.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Since it's 100% dummy, why put LVDS into the name? This little thing here
> could be our generic "wrap drm_panel and attach it to a chain" helper. So
> what about calling this _The_ drm_panel_bridge, and also linking it into
> docs to feature it a bit more prominently.

I'm not opposed to that, except that this driver should not be considered as 
just a helper to link a panel. It should only be used to support a real 
hardware bridge that requires no control.

> I came up with this because I spotted some refactoring belows for building
> this helper, until I realized that this driver _is_ the helper I think we
> want ;-) Only thing missing is an exported function to instantiate a
> bridge with just a drm_panel as the parameter. And putting it into the
> drm_kms_helper.ko module.

What would that be used for ? The bridge should be instantiated by this bridge 
driver, bound to a bridge device instantiated from DT (or the platform 
firmware of your choice).

> > +static enum drm_connector_status
> > +lvds_connector_detect(struct drm_connector *connector, bool force)
> > +{
> > +	return connector_status_connected;
> > +}
> 
> We have piles of this exact dummy callback all over, maybe make it the
> default and rip them all out?

Done, "[PATCH] drm: Make the connector .detect() callback optional".

-- 
Regards,

Laurent Pinchart
