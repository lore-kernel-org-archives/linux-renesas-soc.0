Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f193.google.com ([209.85.210.193]:33162 "EHLO
        mail-wj0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753917AbcLMVPR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2016 16:15:17 -0500
Received: by mail-wj0-f193.google.com with SMTP id kp2so18584305wjc.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Dec 2016 13:14:55 -0800 (PST)
Date: Tue, 13 Dec 2016 22:01:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] drm: shmobile: Perform initialization/cleanup at
 probe/remove time
Message-ID: <20161213210136.dh5qfzgt55lzjr5x@phenom.ffwll.local>
References: <20161213084300.5kvq6ymgrkqldf3t@phenom.ffwll.local>
 <1481633988-31267-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20161213171134.xg7ihewey7aa7gej@phenom.ffwll.local>
 <2835101.vUU6uQBUMJ@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2835101.vUU6uQBUMJ@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 13, 2016 at 07:19:15PM +0200, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Tuesday 13 Dec 2016 18:11:34 Daniel Vetter wrote:
> > On Tue, Dec 13, 2016 at 02:59:48PM +0200, Laurent Pinchart wrote:
> > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > 
> > > The drm driver .load() operation is prone to race conditions as it
> > > initializes the driver after registering the device nodes. Its usage is
> > > deprecated, inline it in the probe function and call drm_dev_alloc() and
> > > drm_dev_register() explicitly.
> > > 
> > > For consistency inline the .unload() handler in the remove function as
> > > well.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > ---
> > > Changes since v1:
> > > 
> > > - Removed manual the drm_connector_register() that caused sysfs-related
> > > 
> > >   warnings
> > 
> > Hm, what did go boom there? We should catch multiple calls to
> > drm_connector_register ...
> 
> Trying to register the connector before the DRM device is registered makes 
> sysfs unhappy due to the lack of a parent.

Autch. I think for i915 we're safe though - our trouble is that mst
hotplug starts to happen before we call drm_dev_register (but it's still
safe there already), because atm the initial topology detection works out
to be async. But we already have the drm_device at least initialized,
which I guess with DT and probe-defer isn't guaranteed.

Or does this even go boom if you just register a child before the parent?
-Daniel

> 
> > >  drivers/gpu/drm/shmobile/shmob_drm_crtc.c |   7 +-
> > >  drivers/gpu/drm/shmobile/shmob_drm_drv.c  | 206 +++++++++++-------------
> > >  2 files changed, 104 insertions(+), 109 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
