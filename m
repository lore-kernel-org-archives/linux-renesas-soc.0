Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35068 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936549AbcJSOOD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Oct 2016 10:14:03 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/8] R-Car DU: Use drm bridge API
Date: Wed, 19 Oct 2016 17:07:48 +0300
Message-Id: <1476886076-24178-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series replaces the custom external encoders support implementation
in the R-Car DU driver with code based on the DRM bridge API.

While the overall diffstat isn't impressive, the rcar-du-drm driver gets
notably thinner in the process:

	9 files changed, 38 insertions(+), 358 deletions(-)

This is offset by a reusable driver for LVDS encoders along with the
corresponding DT bindings (+ 277 lines).

Patch 1/8 adds the new LVDS encoder driver. It supports "dumb" LVDS encoders
only, similarly to the dumb-vga-dac driver. One notable difference, though, is
that LVDS encoders can't be purely passive, and thus require at least one
power supply (and usually multiple of them) and have a few control GPIOs (most
notably to control reset, power down, clock polarity and/or LVDS slew rate).
However, on many systems those encoders are integrated in such a way that the
control pins are pulled up or down appropriately and the power supplies are
either always on or shared with other display components that make them
operate as if they were always on. For that reason a common drivers for those
systems is useful, with simple DT bindings that don't try to cover any device-
specific control pin or power supply.

To ensure backward compatibility most LVDS encoders should *not* use the
common simple "lvds-encoder" compatible string, but should instead define a
device-specific compatible string that can then be added to the lvds-encoder
driver (patch 3/8). This way, when the need to control pins or supplies will
arise, a new driver can be developed matching on the device-specific
compatible string, which will then be removed from the simple driver. Existing
systems will migrate transparently without requiring a change to their device
tree.

A similar reasoning applies to VGA DACs, leading to the addition of the
"adi,adv7123" compatible string to the dumb-vga-dac driver's OF match table in
patch 2/8.

Patch 4/8 adds a new type field to the drm_bridge structure to inform bridge
users of the bridge type. This is useful for display driver to create a DRM
encoder of the appropriate type without having to resort to heuristics.
Patches 5/8 and 6/8 update all bridge drivers to initialize the new field to
the appropriate value.

Patches 7/8 and 8/8 finally migrate the rcar-du-drm driver to the DRM bridge
API, removing the custom VGA DAC implementation in patch 7/8 and the table of
bridge compatible strings used to find the encoder type in patch 8/8.

Laurent Pinchart (8):
  drm: bridge: Add LVDS encoder driver
  drm: bridge: vga-dac: Add adi,adv7123 compatible string
  drm: bridge: lvds-encoder: Add thine,thc63lvdm83d compatible string
  drm: Add encoder_type field to the drm_bridge structure
  drm: bridge: Set bridges' encoder type
  drm: Set on-chip bridges' encoder type
  drm: rcar-du: Replace manual VGA DAC implementation with DRM bridge
  drm: rcar-du: Initialize encoder's type based on the bridge's type

 .../bindings/display/bridge/lvds-transmitter.txt   |  64 +++++++
 drivers/gpu/drm/bridge/Kconfig                     |   8 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   1 +
 drivers/gpu/drm/bridge/analogix-anx78xx.c          |   1 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   1 +
 drivers/gpu/drm/bridge/dumb-vga-dac.c              |   2 +
 drivers/gpu/drm/bridge/dw-hdmi.c                   |   2 +
 drivers/gpu/drm/bridge/lvds-encoder.c              | 204 +++++++++++++++++++++
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |   2 +
 drivers/gpu/drm/bridge/parade-ps8622.c             |   2 +
 drivers/gpu/drm/bridge/sii902x.c                   |   2 +
 drivers/gpu/drm/bridge/tc358767.c                  |   2 +
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |   2 +
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   2 +
 drivers/gpu/drm/rcar-du/Kconfig                    |   6 -
 drivers/gpu/drm/rcar-du/Makefile                   |   5 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |  67 +++----
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |   3 -
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c          | 137 --------------
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h          |  35 ----
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  38 +---
 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c           |  82 ---------
 drivers/gpu/drm/rcar-du/rcar_du_vgacon.h           |  23 ---
 drivers/gpu/drm/sti/sti_dvo.c                      |   2 +
 include/drm/drm_bridge.h                           |   8 +
 26 files changed, 344 insertions(+), 358 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
 create mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.h

-- 
Regards,

Laurent Pinchart
