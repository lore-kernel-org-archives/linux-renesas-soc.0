Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38390 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933258AbcKOBu4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 20:50:56 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] R-Car DU M3-W support
Date: Tue, 15 Nov 2016 03:51:04 +0200
Message-ID: <4931005.BM71n5habh@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git drm/next/lvds

for you to fetch changes up to d2a726e6d677e4032595569b3e7cddefe638cd84:

  arm64: dts: r8a7795: salvator-x: Add DU LVDS output endpoint (2016-11-15 02:39:36 +0200)

----------------------------------------------------------------
Koji Matsuoka (3):
      drm: rcar-du: Fix display timing controller parameter
      drm: rcar-du: Fix H/V sync signal polarity configuration
      drm: rcar-du: Fix LVDS start sequence on Gen3

Laurent Pinchart (13):
      video: of: Constify node argument to display timing functions
      drm: rcar-du: Constify node argument to rcar_du_lvds_connector_init()
      drm: rcar-du: Bring HDMI encoder comments in line with the driver
      drm: rcar-du: Remove test for impossible error condition
      drm: rcar-du: Remove memory allocation error message
      drm: rcar-du: Fix crash in encoder failure error path
      drm: rcar-du: Simplify and fix probe error handling
      drm: rcar-du: Add R8A7796 support
      drm: rcar-du: Fix dot clock routing configuration
      devicetree/bindings: display: Add bindings for LVDS panels
      drm: rcar-du: Add support for LVDS mode selection
      ARM: shmobile: dts: Switch to panel-lvds bindings for Mitsubishi panels
      arm64: dts: r8a7795: salvator-x: Add DU LVDS output endpoint

Sergei Shtylyov (1):
      drm: rcar-du: Add R8A7792 support

 .../bindings/display/panel/panel-lvds.txt          | 119 ++++++++++++++++++++
 .../devicetree/bindings/display/renesas,du.txt     |  12 +-
 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi     |   3 +-
 arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi     |   3 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |   4 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  83 +++++++++-----
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |  22 ++--
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c          |   4 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  17 ++-
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c          |  31 ++++-
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h          |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c          |  30 +++--
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h          |  13 +++
 drivers/video/of_display_timing.c                  |   6 +-
 include/video/of_display_timing.h                  |  15 +--
 16 files changed, 295 insertions(+), 75 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-lvds.txt

-- 
Regards,

Laurent Pinchart
