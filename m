Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 20 Apr 2016 13:29:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	David Herrmann <dh.herrmann@gmail.com>
Subject: Re: [PATCH 0/3 v6] drm: Introduce drm_connector_register_all() helper
Message-ID: <20160420112957.GP2510@phenom.ffwll.local>
References: <1461068693-11260-1-git-send-email-abrodkin@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461068693-11260-1-git-send-email-abrodkin@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 19, 2016 at 03:24:50PM +0300, Alexey Brodkin wrote:
> As a pair to already existing drm_connector_unplug_all()
> (which we'll rename in this series to drm_connector_unregister_all())
> we're adding generic implementation of what is already done in some drivers
> for registering all connectors.
> 
> After implementation of that new helper we're updating 2 drivers
> that used to use it's own implementation:
>  [1] atmel_hlcdc
>  [2] rcar_du
> 
> Other drivers still use load() callback and so should be first modified so
> their load() gets called from their probe() explicitly.
> 
> Build- and run-tested on yet to be upstreamed ARC PGU (part of AXS10x board).
> 
> Changes v5 -> v6:
>  * In atmel_hlcdc only substitute its own atmel_hlcdc_dc_connector_plug_all().
>    drm_connector_unregister_all() is already used there since
>    222b90943446 "drm/atmel: Fixup drm_connector_/unplug/unregister/_all"
> 
> Changes v4 -> v5:
>  * Added missing mutex unlock on a fail path in drm_connector_register_all()
>    Thanks David for his attention and patience!
> 
> Changes v3 -> v4:
>  * Based on current drm-intel/topic/drm-misc
>    It's now on commit 6c87e5c3ec6db052f3744804a517b6fb003906e1
>    And since thet new base already has
>    "drm: Rename drm_connector_unplug_all() to drm_connector_unregister_all()"
>    this series now only includes 3 subsequent patches.
> 
>  * In drm_connector_register_all() fail path which calls unregister_all()
>    is moved outside of loop&locked section (as suggested by Daniel)
> 
> Changes v2 -> v3:
>  * Added acks for 1, 3 and 4 patches
>  * Updated kerneldoc descriptins of both register_ and unregister_all()
>  * Updated commit messages (mostly spellos and grammar issues)
> 
> Changes v1 -> v2:
>  * Rename drm_connector_unplug_all() to drm_connector_unregister_all()
>  * Use drm_for_each_connector() instead of list_for_each_entry()
>  * Updated kerneldoc for drm_dev_register()
> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: David Herrmann <dh.herrmann@gmail.com>

All three applied to drm-misc, thanks.
-Daniel

> 
> Alexey Brodkin (3):
>   drm: Introduce drm_connector_register_all() helper
>   drm: atmel_hldc: Use generic drm_connector_register_all() helper
>   drm: rcar-du: Use generic drm_connector_register_all() helper
> 
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 30 +--------------------
>  drivers/gpu/drm/drm_crtc.c                   | 40 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_drv.c                    |  6 ++++-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c        |  9 +------
>  include/drm/drm_crtc.h                       |  3 ++-
>  5 files changed, 49 insertions(+), 39 deletions(-)
> 
> -- 
> 2.5.5
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
