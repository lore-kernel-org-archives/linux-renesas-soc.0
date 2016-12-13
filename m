Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41710 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752941AbcLMV2N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2016 16:28:13 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] drm: shmobile: Perform initialization/cleanup at probe/remove time
Date: Tue, 13 Dec 2016 23:28:44 +0200
Message-ID: <3406417.RXamfUdFgG@avalon>
In-Reply-To: <20161213210136.dh5qfzgt55lzjr5x@phenom.ffwll.local>
References: <20161213084300.5kvq6ymgrkqldf3t@phenom.ffwll.local> <2835101.vUU6uQBUMJ@avalon> <20161213210136.dh5qfzgt55lzjr5x@phenom.ffwll.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Tuesday 13 Dec 2016 22:01:36 Daniel Vetter wrote:
> On Tue, Dec 13, 2016 at 07:19:15PM +0200, Laurent Pinchart wrote:
> > On Tuesday 13 Dec 2016 18:11:34 Daniel Vetter wrote:
> >> On Tue, Dec 13, 2016 at 02:59:48PM +0200, Laurent Pinchart wrote:
> >>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> 
> >>> The drm driver .load() operation is prone to race conditions as it
> >>> initializes the driver after registering the device nodes. Its usage
> >>> is deprecated, inline it in the probe function and call
> >>> drm_dev_alloc() and drm_dev_register() explicitly.
> >>> 
> >>> For consistency inline the .unload() handler in the remove function as
> >>> well.
> >>> 
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>> ---
> >>> Changes since v1:
> >>> 
> >>> - Removed manual the drm_connector_register() that caused
> >>>   sysfs-related warnings
> >> 
> >> Hm, what did go boom there? We should catch multiple calls to
> >> drm_connector_register ...
> > 
> > Trying to register the connector before the DRM device is registered makes
> > sysfs unhappy due to the lack of a parent.
> 
> Autch. I think for i915 we're safe though - our trouble is that mst
> hotplug starts to happen before we call drm_dev_register (but it's still
> safe there already), because atm the initial topology detection works out
> to be async. But we already have the drm_device at least initialized,
> which I guess with DT and probe-defer isn't guaranteed.
> 
> Or does this even go boom if you just register a child before the parent?

I think it does, but I haven't investigated this any further. Given that we 
have support for auto-registration of connectors at drm_device registration 
time, and that I don't need to register connectors later, I just went the easy 
way. For connectors that can be registered at any time, something more 
elaborate is likely needed.

> >>>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c |   7 +-
> >>>  drivers/gpu/drm/shmobile/shmob_drm_drv.c  | 206 ++++++++++-------------
> >>>  2 files changed, 104 insertions(+), 109 deletions(-)

-- 
Regards,

Laurent Pinchart
