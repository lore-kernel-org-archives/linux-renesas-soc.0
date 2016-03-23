Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4 v3] drm: Introduce drm_connector_register_all() helper
Date: Wed, 23 Mar 2016 11:42:53 +0300
Message-Id: <1458722577-20283-1-git-send-email-abrodkin@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

As a pair to already existing drm_connector_unplug_all()
(which we'll rename in this series to drm_connector_unregister_all())
we're adding generic implementation of what is already done in some drivers
for registering all connectors.

After implementation of that new helper we're updating 2 drivers
that used to use it's own implementation:
 [1] atmel_hlcdc
 [2] rcar_du

And one driver that uses unregister():
 [1] udl

Other drivers still use load() callback and so should be first modified so
their load() gets called from their probe() explicitly.

Build- and run-tested on yet to be upstreamed ARC PGU (part of AXS10x board).

Changes v2 -> v3:
 * Added acks for 1, 3 and 4 patches
 * Updated kerneldoc descriptins of both register_ and unregister_all()
 * Updated commit messages (mostly spellos and grammar issues)

Changes v1 -> v2:
 * Rename drm_connector_unplug_all() to drm_connector_unregister_all()
 * Use drm_for_each_connector() instead of list_for_each_entry()
 * Updated kerneldoc for drm_dev_register()

Alexey Brodkin (4):
  drm: Rename drm_connector_unplug_all() to
    drm_connector_unregister_all()
  drm: Introduce drm_connector_register_all() helper
  drm: atmel_hldc: Use generic drm_connector_register_all() helper
  drm: rcar-du: Use generic drm_connector_register_all() helper

 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 39 +-----------------
 drivers/gpu/drm/drm_crtc.c                   | 59 ++++++++++++++++++++++++----
 drivers/gpu/drm/drm_drv.c                    |  6 ++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c        | 14 +------
 drivers/gpu/drm/udl/udl_drv.c                |  2 +-
 include/drm/drm_crtc.h                       |  5 ++-
 6 files changed, 64 insertions(+), 61 deletions(-)

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
-- 
2.5.0
