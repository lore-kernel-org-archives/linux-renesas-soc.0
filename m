Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59893 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752454AbdCFAKB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Mar 2017 19:10:01 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/9] R-Car Gen3 HDMI output support
Date: Mon,  6 Mar 2017 02:02:53 +0200
Message-Id: <20170306000302.14149-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series implements support for the HDMI output on Renesas R-Car Gen3
SoCs, and more specifically on the R-Car H3.

Compared to the previous version, I've left out all the dw-hdmi patches that
have been updated separately and are on their way to being merged. I've also
left out the DT integration patches that will be submitted separately. I have
on the other hand included patches 1/9 to 4/9 that were an implicit dependency
of the previous version.

The patches are based on a merge of the following branches and tags from
git://linuxtv.org/pinchartl/media.git

- DWC HDMI Driver: drm-next-dw-hdmi-v5.1-20170306
- DRM LVDS Encoder Driver: drm-next-lvds-encoder-v4-20170302
- DRM LVDS Panel Driver: drm/next/lvds-panel
- R-Car DU Driver: drm/next/du

I plan to send a pull request for theses patches and the dependencies that
won't be merged through drm-misc in the next few days.

Koji Matsuoka (3):
  drm: rcar-du: Add Gen3 HDMI encoder support
  drm: rcar-du: Add DPLL support
  drm: rcar-du: Add HDMI outputs to R8A7795 device description

Laurent Pinchart (6):
  drm: rcar-du: Use the DRM panel API
  drm: rcar-du: Add support for LVDS mode selection
  drm: rcar-du: Replace manual bridge implementation with DRM bridge
  drm: rcar-du: Hardcode encoders types to DRM_MODE_ENCODER_NONE
  dt-bindings: display: renesas: Add R-Car Gen3 HDMI TX DT bindings
  drm: rcar-du: Skip disabled outputs

 .../bindings/display/bridge/renesas,dw-hdmi.txt    |  75 +++++++++
 MAINTAINERS                                        |   1 +
 drivers/gpu/drm/rcar-du/Kconfig                    |  10 +-
 drivers/gpu/drm/rcar-du/Makefile                   |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |  81 +++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |   4 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  28 ++--
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   3 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          | 179 +++++++++++++--------
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |  14 +-
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c          | 134 ---------------
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h          |  35 ----
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  44 ++---
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c          |  68 +++-----
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c          |  11 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h          |  13 ++
 drivers/gpu/drm/rcar-du/rcar_du_regs.h             |  23 +++
 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c           |  82 ----------
 drivers/gpu/drm/rcar-du/rcar_du_vgacon.h           |  23 ---
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c             | 100 ++++++++++++
 20 files changed, 475 insertions(+), 459 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c

-- 
Regards,

Laurent Pinchart
