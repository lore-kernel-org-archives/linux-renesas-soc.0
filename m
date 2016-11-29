Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60430 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756325AbcK2JEe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 04:04:34 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Stefan Agner <stefan@agner.ch>,
        Alison Wang <alison.wang@freescale.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Eric Anholt <eric@anholt.net>, Sinclair Yeh <syeh@vmware.com>,
        Thomas Hellstrom <thellstrom@vmware.com>
Subject: [PATCH v3 01/13] drm: Don't include <drm/drm_encoder.h> in <drm/drm_crtc.h>
Date: Tue, 29 Nov 2016 11:04:31 +0200
Message-Id: <1480410283-28698-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

<drm/drm_crtc.h> used to define most of the in-kernel KMS API. It has
now been split into separate files for each object type, but still
includes most other KMS headers to avoid breaking driver compilation.

As a step towards fixing that problem, remove the inclusion of
<drm/drm_encoder.h> from <drm/drm_crtc.h> and include it instead where
appropriate. Also remove the forward declarations of the drm_encoder and
drm_encoder_helper_funcs structures from <drm/drm_crtc.h> as they're not
needed in the header.

<drm/drm_encoder.h> now has to include <drm/drm_mode.h> and contain a
forward declaration of struct drm_encoder in order to allow including it
as the first header in a compilation unit.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h    | 1 +
 drivers/gpu/drm/ast/ast_drv.h               | 1 +
 drivers/gpu/drm/bochs/bochs.h               | 1 +
 drivers/gpu/drm/cirrus/cirrus_drv.h         | 1 +
 drivers/gpu/drm/drm_connector.c             | 1 +
 drivers/gpu/drm/drm_crtc_helper.c           | 1 +
 drivers/gpu/drm/drm_edid.c                  | 1 +
 drivers/gpu/drm/drm_mode_config.c           | 1 +
 drivers/gpu/drm/drm_of.c                    | 1 +
 drivers/gpu/drm/drm_plane_helper.c          | 1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h   | 2 ++
 drivers/gpu/drm/gma500/psb_intel_drv.h      | 1 +
 drivers/gpu/drm/i915/intel_drv.h            | 1 +
 drivers/gpu/drm/mgag200/mgag200_drv.h       | 1 +
 drivers/gpu/drm/nouveau/nouveau_connector.h | 1 +
 drivers/gpu/drm/qxl/qxl_drv.h               | 1 +
 drivers/gpu/drm/radeon/radeon_mode.h        | 1 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h   | 1 +
 drivers/gpu/drm/shmobile/shmob_drm_crtc.h   | 1 +
 drivers/gpu/drm/tegra/drm.h                 | 1 +
 drivers/gpu/drm/vc4/vc4_drv.h               | 2 ++
 drivers/gpu/drm/virtio/virtgpu_drv.h        | 1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h         | 1 +
 include/drm/drm_crtc.h                      | 3 ---
 include/drm/drm_encoder.h                   | 3 +++
 include/drm/drm_encoder_slave.h             | 1 +
 include/drm/drm_modeset_helper_vtables.h    | 1 +
 27 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 1e23334b07fb..fac06064a8f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -32,6 +32,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_crtc_helper.h>
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 908011d2c8f5..6f3b6f50cf52 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -28,6 +28,7 @@
 #ifndef __AST_DRV_H__
 #define __AST_DRV_H__
 
+#include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 
 #include <drm/ttm/ttm_bo_api.h>
diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
index 32dfe418cc98..f626bab7f5e3 100644
--- a/drivers/gpu/drm/bochs/bochs.h
+++ b/drivers/gpu/drm/bochs/bochs.h
@@ -4,6 +4,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 
 #include <drm/drm_gem.h>
diff --git a/drivers/gpu/drm/cirrus/cirrus_drv.h b/drivers/gpu/drm/cirrus/cirrus_drv.h
index 2188d6b61b3e..b59aeef4635a 100644
--- a/drivers/gpu/drm/cirrus/cirrus_drv.h
+++ b/drivers/gpu/drm/cirrus/cirrus_drv.h
@@ -13,6 +13,7 @@
 
 #include <video/vga.h>
 
+#include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 
 #include <drm/ttm/ttm_bo_api.h>
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b5c6a8ee831e..5f1e1f190d30 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -23,6 +23,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 5d2cb138eba6..b3fc23313cc3 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -36,6 +36,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 7eec18925b70..a9e3cc3990c1 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -35,6 +35,7 @@
 #include <linux/vga_switcheroo.h>
 #include <drm/drmP.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_displayid.h>
 
 #define version_greater(edid, maj, min) \
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 2735a5847ffa..09b1d8f267a6 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -20,6 +20,7 @@
  * OF THIS SOFTWARE.
  */
 
+#include <drm/drm_encoder.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drmP.h>
 
diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 47848ed8ca48..b5f2f0fece99 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -4,6 +4,7 @@
 #include <linux/of_graph.h>
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 
 static void drm_release_of(struct device *dev, void *data)
diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
index 7a7dddf604d7..191a5f095cf9 100644
--- a/drivers/gpu/drm/drm_plane_helper.c
+++ b/drivers/gpu/drm/drm_plane_helper.c
@@ -29,6 +29,7 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_atomic_helper.h>
 
 #define SUBPIXEL_MASK 0xffff
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
index 3b371fe7491e..4c22edd4c746 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
@@ -12,6 +12,8 @@
 #ifndef __FSL_DCU_DRM_DRV_H__
 #define __FSL_DCU_DRM_DRV_H__
 
+#include <drm/drm_encoder.h>
+
 #include "fsl_dcu_drm_crtc.h"
 #include "fsl_dcu_drm_output.h"
 #include "fsl_dcu_drm_plane.h"
diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
index 2a3b7c684db2..6a10215fc42d 100644
--- a/drivers/gpu/drm/gma500/psb_intel_drv.h
+++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
@@ -23,6 +23,7 @@
 #include <linux/i2c-algo-bit.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder.h>
 #include <linux/gpio.h>
 #include "gma_display.h"
 
diff --git a/drivers/gpu/drm/i915/intel_drv.h b/drivers/gpu/drm/i915/intel_drv.h
index 398195bf6dd1..7fb8ac824b01 100644
--- a/drivers/gpu/drm/i915/intel_drv.h
+++ b/drivers/gpu/drm/i915/intel_drv.h
@@ -32,6 +32,7 @@
 #include "i915_drv.h"
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_dp_dual_mode_helper.h>
 #include <drm/drm_dp_mst_helper.h>
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 3e02ac20777c..87e0934773de 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -15,6 +15,7 @@
 
 #include <video/vga.h>
 
+#include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index 096983c42a1f..a4d1a059bd3d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -30,6 +30,7 @@
 #include <nvif/notify.h>
 
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_dp_helper.h>
 #include "nouveau_crtc.h"
 
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 84995ebc6ffc..56df6b4ddbab 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -43,6 +43,7 @@
 #include <ttm/ttm_placement.h>
 #include <ttm/ttm_module.h>
 
+#include <drm/drm_encoder.h>
 #include <drm/drm_gem.h>
 
 /* just for ttm_validate_buffer */
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index bb75201a24ba..7ceea8ffd0db 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -32,6 +32,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_dp_mst_helper.h>
 #include <drm/drm_fixed.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
index 269fbab15907..b79b2f075a74 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -15,6 +15,7 @@
 #define __RCAR_DU_ENCODER_H__
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_encoder.h>
 
 struct drm_panel;
 struct rcar_du_device;
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
index 38ed4ff8aaf2..818b31549ddc 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
@@ -16,6 +16,7 @@
 
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_encoder.h>
 
 struct backlight_device;
 struct shmob_drm_device;
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 0ddcce1b420d..5205790dd679 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -17,6 +17,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fixed.h>
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index fef172804345..f89a95cb98cf 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -9,6 +9,8 @@
 #include "drmP.h"
 #include "drm_gem_cma_helper.h"
 
+#include <drm/drm_encoder.h>
+
 struct vc4_dev {
 	struct drm_device *dev;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index ec1ebdcfe80b..475ac93848c3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -35,6 +35,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder.h>
 #include <ttm/ttm_bo_api.h>
 #include <ttm/ttm_bo_driver.h>
 #include <ttm/ttm_placement.h>
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index ff4803c107bc..5ee25fb07ea2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -30,6 +30,7 @@
 
 #include <drm/drmP.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder.h>
 #include "vmwgfx_drv.h"
 
 /**
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 946672f97e1e..9ef0ac0ce69f 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -39,7 +39,6 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_connector.h>
-#include <drm/drm_encoder.h>
 #include <drm/drm_property.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
@@ -68,14 +67,12 @@ static inline uint64_t I642U64(int64_t val)
 }
 
 struct drm_crtc;
-struct drm_encoder;
 struct drm_pending_vblank_event;
 struct drm_plane;
 struct drm_bridge;
 struct drm_atomic_state;
 
 struct drm_crtc_helper_funcs;
-struct drm_encoder_helper_funcs;
 struct drm_plane_helper_funcs;
 
 /**
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index c7438ff0d609..cec6ac45c6cc 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -25,8 +25,11 @@
 
 #include <linux/list.h>
 #include <linux/ctype.h>
+#include <drm/drm_mode.h>
 #include <drm/drm_mode_object.h>
 
+struct drm_encoder;
+
 /**
  * struct drm_encoder_funcs - encoder controls
  *
diff --git a/include/drm/drm_encoder_slave.h b/include/drm/drm_encoder_slave.h
index 82cdf611393d..1107b4b1c599 100644
--- a/include/drm/drm_encoder_slave.h
+++ b/include/drm/drm_encoder_slave.h
@@ -29,6 +29,7 @@
 
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_encoder.h>
 
 /**
  * struct drm_encoder_slave_funcs - Entry points exposed by a slave encoder driver
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 72478cf82147..21d9823d4872 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -30,6 +30,7 @@
 #define __DRM_MODESET_HELPER_VTABLES_H__
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_encoder.h>
 
 /**
  * DOC: overview
-- 
Regards,

Laurent Pinchart
