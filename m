Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60427 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756328AbcK2JEe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 04:04:34 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v3 00/13] R-Car DU: Use drm bridge API
Date: Tue, 29 Nov 2016 11:04:30 +0200
Message-Id: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series replaces the custom external encoders support implementation
in the R-Car DU driver with code based on the DRM bridge API.

While the overall diffstat isn't impressive, the rcar-du-drm driver gets
notably thinner in the process:

        9 files changed, 64 insertions(+), 384 deletions(-)

This is offset by a reusable driver for LVDS encoders along with the
corresponding DT bindings (+ 218 lines).

The series starts with a few cleanups. Patch 01/13 fixes all drivers to
include <drm/drm_encoder.h> where needed, allowing to remove inclusion of the
header from <drm/drm_crtc.h> (there are plenty of other headers that need
similar cleanup, volunteers are welcome). Patch 02/13 then includes
<drm/drm_crtc.h> in <drm/drm_encoder.h> to fix a compilation warning.

The next patche moves copied&pasted code from a large number of drivers to the
DRM bridge core drm_bridge_attach() function. The function now links bridges
to encoders or other bridges instead of letting the caller perform that
operation. Patch 04/13 can then detach bridges in the encoder cleanup
function, removing the need to call drm_bridge_detach() explicitly in drivers
(all but one of the drivers that use bridges were missing that call).

Patches 05/13 and 06/13 add DT bindings for LVDS encoders with a corresponding
driver. It supports "dumb" LVDS encoders only, similarly to the dumb-vga-dac
driver. One notable difference, though, is that LVDS encoders can't be purely
passive, and thus require at least one power supply (and usually multiple of
them) and have a few control GPIOs (most notably to control reset, power down,
clock polarity and/or LVDS slew rate). However, on many systems those encoders
are integrated in such a way that the control pins are pulled up or down
appropriately and the power supplies are either always on or shared with other
display components that make them operate as if they were always on. For that
reason a common drivers for those systems is useful, with simple DT bindings
that don't try to cover any device-specific control pin or power supply.

To ensure backward compatibility most LVDS encoders should *not* use the
common simple "lvds-encoder" compatible string, but should instead define a
device-specific compatible string that can then be added to the lvds-encoder
driver (patch 08/13). This way, when the need to control pins or supplies will
arise, a new driver can be developed matching on the device-specific
compatible string, which will then be removed from the simple driver. Existing
systems will migrate transparently without requiring a change to their device
tree.

A similar reasoning applies to VGA DACs, leading to the addition of the
"adi,adv7123" compatible string to the dumb-vga-dac driver's OF match table in
patch 07/13.

Patch 09/13 adds a new type field to the drm_bridge structure to inform bridge
users of the bridge type. This is useful for display driver to create a DRM
encoder of the appropriate type without having to resort to heuristics.
Patches 10/13 and 11/13 update all bridge drivers to initialize the new field
to the appropriate value.

Patches 12/13 and 13/13 finally migrate the rcar-du-drm driver to the DRM
bridge API, removing the custom VGA DAC implementation in patch 12/13 and the
table of bridge compatible strings used to find the encoder type in patch
13/13.

Changes since v2:

- Added patches 01/13 to 04/13.
- Rebased on top of latest DRM master branch

Changes since v1:

- The patches have been rebased on top of the "[PATCH v2 00/13] R-Car DU: Add
  support for LVDS mode selection" series.
- The LVDS encoder DT bindings have been split from the LVDS encoder driver
  into a separate patch.
- The wording of the DRM bridge documentation new property has been updated.

Laurent Pinchart (13):
  drm: Don't include <drm/drm_encoder.h> in <drm/drm_crtc.h>
  drm: Fix compilation warning caused by static inline forward
    declaration
  drm: bridge: Link encoder and bridge in core code
  drm: bridge: Detach bridge from encoder at encoder cleanup time
  drm: bridge: Add LVDS encoder DT bindings
  drm: bridge: Add LVDS encoder driver
  drm: bridge: vga-dac: Add adi,adv7123 compatible string
  drm: bridge: lvds-encoder: Add thine,thc63lvdm83d compatible string
  drm: Add encoder_type field to the drm_bridge structure
  drm: bridge: Set bridges' encoder type
  drm: Set on-chip bridges' encoder type
  drm: rcar-du: Replace manual bridge implementation with DRM bridge
  drm: rcar-du: Initialize encoder's type based on the bridge's type

 .../bindings/display/bridge/lvds-transmitter.txt   |  64 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |   1 +
 drivers/gpu/drm/ast/ast_drv.h                      |   1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |   4 +-
 drivers/gpu/drm/bochs/bochs.h                      |   1 +
 drivers/gpu/drm/bridge/Kconfig                     |   8 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   1 +
 drivers/gpu/drm/bridge/analogix-anx78xx.c          |   1 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   5 +-
 drivers/gpu/drm/bridge/dumb-vga-dac.c              |   2 +
 drivers/gpu/drm/bridge/dw-hdmi.c                   |   5 +-
 drivers/gpu/drm/bridge/lvds-encoder.c              | 218 +++++++++++++++++++++
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |   2 +
 drivers/gpu/drm/bridge/parade-ps8622.c             |   2 +
 drivers/gpu/drm/bridge/sii902x.c                   |   2 +
 drivers/gpu/drm/bridge/tc358767.c                  |   2 +
 drivers/gpu/drm/cirrus/cirrus_drv.h                |   1 +
 drivers/gpu/drm/drm_bridge.c                       |  46 +++--
 drivers/gpu/drm/drm_connector.c                    |   1 +
 drivers/gpu/drm/drm_crtc_helper.c                  |   1 +
 drivers/gpu/drm/drm_edid.c                         |   1 +
 drivers/gpu/drm/drm_encoder.c                      |   3 +
 drivers/gpu/drm/drm_mode_config.c                  |   1 +
 drivers/gpu/drm/drm_of.c                           |   1 +
 drivers/gpu/drm/drm_plane_helper.c                 |   1 +
 drivers/gpu/drm/drm_simple_kms_helper.c            |   4 +-
 drivers/gpu/drm/exynos/exynos_dp.c                 |   5 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |   2 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h          |   2 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |   5 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h             |   1 +
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |   5 +-
 drivers/gpu/drm/i915/intel_drv.h                   |   1 +
 drivers/gpu/drm/imx/imx-ldb.c                      |   6 +-
 drivers/gpu/drm/imx/parallel-display.c             |   4 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   8 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  24 +--
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  13 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   1 +
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  17 +-
 drivers/gpu/drm/msm/edp/edp_bridge.c               |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h        |   1 +
 drivers/gpu/drm/qxl/qxl_drv.h                      |   1 +
 drivers/gpu/drm/radeon/radeon_mode.h               |   1 +
 drivers/gpu/drm/rcar-du/Kconfig                    |   6 -
 drivers/gpu/drm/rcar-du/Makefile                   |   5 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          | 119 +++++------
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |   4 +-
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c          | 137 -------------
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h          |  35 ----
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  37 +---
 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c           |  82 --------
 drivers/gpu/drm/rcar-du/rcar_du_vgacon.h           |  23 ---
 drivers/gpu/drm/shmobile/shmob_drm_crtc.h          |   1 +
 drivers/gpu/drm/sti/sti_dvo.c                      |   5 +-
 drivers/gpu/drm/sti/sti_hda.c                      |   3 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   3 +-
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  |  13 +-
 drivers/gpu/drm/tegra/drm.h                        |   1 +
 drivers/gpu/drm/vc4/vc4_drv.h                      |   2 +
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |   1 +
 include/drm/drm_bridge.h                           |  11 +-
 include/drm/drm_crtc.h                             |   3 -
 include/drm/drm_encoder.h                          |   7 +-
 include/drm/drm_encoder_slave.h                    |   1 +
 include/drm/drm_modeset_helper_vtables.h           |   1 +
 70 files changed, 499 insertions(+), 489 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
 create mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.h

-- 
Regards,

Laurent Pinchart
