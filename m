Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33984 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933443AbcKKRH4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2016 12:07:56 -0500
Received: by mail-wm0-f66.google.com with SMTP id g23so10794558wme.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2016 09:07:55 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
Cc: kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org,
        airlied@linux.ie, koji.matsuoka.xm@renesas.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 00/10] Renesas R8A7795/Salvator-X HDMI output
Date: Fri, 11 Nov 2016 18:07:36 +0100
Message-Id: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This implements HDMI output support for the Renesas R8A7795 (H3) SoC and
Salvator-X board.  It is based on mainline v4.9-rc4 and depends on Geert's
"[PATCH v2 0/7] soc: renesas: Identify SoC and register with the SoC bus"
series.

It fixes two major issues in the previous RFC series:

1. It uses soc_device_match() to distinguish chip revisions instead of
accessing the product register directly.
2. It describes the Gen3 HDMI encoder devices in a sane manner in the device
tree, which also eliminates many contortions in the driver code.

The "drm: bridge/dw_hdmi: add dw hdmi i2c bus adapter support" patch has
been updated to version 6, and some minor non-essential parts (such as
support for additional pixel formats) have been split off, to be addressed
later.

For testing, use the defconfig and enable CONFIG_VIDEO_RENESAS_VSP1,
CONFIG_DRM_RCAR_VSP and CONFIG_DRM_DW_HDMI.

CU
Uli


Koji Matsuoka (6):
  drm: bridge/dw_hdmi: Add R-Car Gen3 device support
  drm: rcar-du: Add R8A7795 device support
  drm: rcar-du: Add dw_hdmi driver startup
  drm: rcar-du: Add DPLL support
  drm: rcar-du: Fix display registers for R-Car Gen3
  arm64: dts: salvator-x: Add DU pins, HDMI connectors and encoder

Ulrich Hecht (3):
  arm64: dts: r8a7795: Add HDMI encoder support
  arm64: dts: r8a7795: add HDMI support to DU
  dt-bindings: drm/bridge: Add renesas,rcar-dw-hdmi

Vladimir Zapolskiy (1):
  drm: bridge/dw_hdmi: add dw hdmi i2c bus adapter support

 .../devicetree/bindings/display/bridge/dw_hdmi.txt |   5 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  95 ++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  56 ++-
 drivers/gpu/drm/bridge/dw-hdmi.c                   | 378 ++++++++++++++++++---
 drivers/gpu/drm/bridge/dw-hdmi.h                   |  19 ++
 drivers/gpu/drm/rcar-du/Kconfig                    |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |  88 ++++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |  12 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  22 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   5 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |   9 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |   5 +
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c          | 215 +++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            |   4 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.h            |   7 +-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h             |  21 +-
 include/drm/bridge/dw_hdmi.h                       |   9 +
 19 files changed, 890 insertions(+), 74 deletions(-)

-- 
2.7.4
