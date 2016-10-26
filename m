Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:34850 "EHLO
        mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750832AbcJZDja (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Oct 2016 23:39:30 -0400
From: Magnus Damm <magnus.damm@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, airlied@linux.ie,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com
Date: Wed, 26 Oct 2016 12:31:43 +0900
Message-Id: <20161026033143.6617.5834.sendpatchset@little-apple>
Subject: [PATCH] drm: rcar-du: Fix R-Car Gen3 crash when VSP is disabled
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

For the DU to operate on R-Car Gen3 hardware a combination of DU
and VSP devices are required. Since the DU driver also supports
earlier generations hardware the VSP portion is enabled via Kconfig.

The arm64 defconfig is as of v4.9-rc1 having the DU driver enabled
as a module, however this is not enough to support R-Car Gen3. In
the current case of CONFIG_DRM_RCAR_VSP=n then the kernel crashes
when loading the module. This patch is fixing that particular case.

In more detail, the crash triggers in drm_atomic_get_plane_state()
when __drm_atomic_helper_set_config() passes NULL as crtc->primary.

This patch corrects this issue by failing to load the DU driver on
R-Car Gen3 when VSP is not available.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/gpu/drm/rcar-du/rcar_du_vsp.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ work/drivers/gpu/drm/rcar-du/rcar_du_vsp.h	2016-10-26 00:01:12.920607110 +0900
@@ -70,7 +70,7 @@ void rcar_du_vsp_disable(struct rcar_du_
 void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc);
 #else
-static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp) { return 0; };
+static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp) { return -ENXIO; };
 static inline void rcar_du_vsp_enable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
