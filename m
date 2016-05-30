Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34177 "EHLO
	mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932508AbcE3QAb (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:00:31 -0400
Received: by mail-lf0-f66.google.com with SMTP id 65so14283526lfq.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 09:00:30 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: kuninori.morimoto.gx@renesas.com,
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [RFC 00/21] Renesas r8a7795/Salvator-X HDMI output prototype
Date: Mon, 30 May 2016 17:59:59 +0200
Message-Id: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This is a prototype of HDMI output support for the Renesas r8a7795 SoC and
Salvator-X board.  It is based on the renesas-devel-20160516-v4.6 tree and
includes the bridge API conversion patches to the adv7511 and rcar-du
drivers written by Archit Taneja.

The obvious issue with this series is the awkward binding of the dw-hdmi
bridge IP, which can be seen in the "drm: rcar-du: Add dw_hdmi driver
startup" patch.  Any comments on how to implement this interface properly
are much appreciated.

Functionally, this series works as expected on both connectors, but EDID
reading is currently broken.

CU
Uli


Archit Taneja (2):
  drm: rcar-du: Remove i2c slave encoder interface for hdmi encoder
  drm: i2c: adv7511: Convert to drm_bridge

Koji Matsuoka (12):
  media: vsp1: Set format to RPF input source
  drm: bridge/dw_hdmi: Fix R-Car Gen3 device support
  drm: rcar-du: Add R8A7795 device support
  drm: rcar-du: Add dw_hdmi driver startup
  drm: rcar-du: Add DPLL support
  drm: rcar-du: Fix display registers for R-Car Gen3
  drm: rcar-du: Fix VSP plane number per devices
  drm: rcar-du: Fix VSP feed plane number
  drm: rcar-du: Add pixel format support
  drm: rcar-du: Fix display max size to 4096x2160 size
  arm64: dts: salvator-x: Add DU pins, HDMI connectors and encoder
  arm64: configs: Enable R-Car DU related config

Kuninori Morimoto (1):
  arm64: defconfig: add VIDEO_RENESAS_FCP

Ulrich Hecht (5):
  v4l: vsp1: Change VSP1 LIF linebuffer FIFO
  pinctrl: sh-pfc: r8a7795: Add DU support
  pinctrl: sh-pfc: r8a7795: Add HDMI CEC support
  arm64: dts: r8a7795: Add HDMI encoder support
  arm64: dts: r8a7795: add HDMI support to DU

Vladimir Zapolskiy (1):
  drm: bridge/dw_hdmi: add dw hdmi i2c bus adapter support

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 107 +++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  33 +-
 arch/arm64/configs/defconfig                       |  15 +
 drivers/gpu/drm/bridge/dw-hdmi.c                   | 489 +++++++++++++++++++--
 drivers/gpu/drm/i2c/adv7511.c                      | 224 ++++++----
 drivers/gpu/drm/rcar-du/Kconfig                    |   2 +
 drivers/gpu/drm/rcar-du/Makefile                   |   3 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |  97 +++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |  12 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  20 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |  12 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |  13 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |   5 +
 drivers/gpu/drm/rcar-du/rcar_du_hdmicon.c          | 117 -----
 drivers/gpu/drm/rcar-du/rcar_du_hdmicon.h          |  31 --
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c          | 260 ++++++++---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  68 ++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.h              |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            |   8 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.h            |   7 +-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h             |  19 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |  51 ++-
 drivers/media/platform/vsp1/vsp1_drm.c             |   6 +
 drivers/media/platform/vsp1/vsp1_lif.c             |   6 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 113 +++++
 include/drm/bridge/dw_hdmi.h                       |   9 +
 27 files changed, 1388 insertions(+), 346 deletions(-)
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmicon.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmicon.h

-- 
2.7.4
