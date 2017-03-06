Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60070 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752509AbdCFAcE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Mar 2017 19:32:04 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] R-Car Gen3 HDMI output support
Date: Mon, 06 Mar 2017 02:32:39 +0200
Message-ID: <19852948.3die4YcTFG@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Please find two pull requests below for renesas-drivers (in a single e-mail, 
lucky you :-)).

The first tag contains driver changes only and is based on a merge of drm-next 
and drm-misc-next. The 5 patches from Maarten Lankhorst should be merged in 
drm-misc-next tomorrow (if all goes according to the plan). I'll rebase my 
tree on top of that, but that will only affect branches, not tags. More 
patches should also be merged in drm-misc-next in the next couple of days, 
I'll then send a pull request for the rest to Dave Airlie. In a few weeks I 
hope all of this to be in mainline.

The second tag contains DT changes only and is based on Simon's latest devel 
branch. Nothing special there, it should just not make it to mainline before 
the driver changes get accepted.


The following changes since commit 8d9874ba9561805fa7134c3371f8bf6b0650eb43:

  Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm/next/base 
(2017-03-03 16:57:48 +0200)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-du-hdmi-v3-20170306

for you to fetch changes up to a429bed1995ed091f5b02c0b48405351a999fb14:

  drm: rcar-du: Add HDMI outputs to R8A7795 device description (2017-03-06 
01:46:58 +0200)

----------------------------------------------------------------
Jacopo Mondi (1):
      drm: rcar-du: Make sure the VSP is initialized on platforms that need it

Kieran Bingham (2):
      drm: bridge: dw-hdmi: Add support for custom PHY configuration
      drm: bridge: dw-hdmi: Remove device type from platform data

Koji Matsuoka (3):
      drm: rcar-du: Add Gen3 HDMI encoder support
      drm: rcar-du: Add DPLL support
      drm: rcar-du: Add HDMI outputs to R8A7795 device description

Laurent Pinchart (30):
      drm: rcar-du: Switch to encoder .atomic_mode_set() helper function
      drm: rcar-du: Handle event when disabling CRTCs
      drm: rcar-du: Clear handled event pointer in CRTC state
      drm: rcar-du: Use DRM core's atomic commit helper
      devicetree/bindings: display: bridge: Add LVDS encoder DT bindings
      drm: bridge: Add LVDS encoder driver
      drm: bridge: vga-dac: Add adi,adv7123 compatible string
      drm: bridge: lvds-encoder: Add thine,thc63lvdm83d compatible string
      devicetree/bindings: display: Document common panel properties
      devicetree/bindings: display: Add bindings for LVDS panels
      devicetree/bindings: display: Add bindings for two Mitsubishi panels
      drm: Add data transmission order bus flag
      drm: panels: Add LVDS panel driver
      drm: rcar-du: Remove wait field from rcar_du_device structure
      drm: bridge: dw-hdmi: Remove unused functions
      drm: bridge: dw-hdmi: Move CSC configuration out of PHY code
      drm: bridge: dw-hdmi: Fix the PHY power down sequence
      drm: bridge: dw-hdmi: Fix the PHY power up sequence
      drm: bridge: dw-hdmi: Create PHY operations
      drm: bridge: dw-hdmi: Move the driver to a separate directory.
      Merge branch 'drm/next/lvds-encoder' into drm/du/base
      Merge branch 'drm/next/lvds-panel' into drm/du/base
      Merge branch 'drm/next/du' into drm/du/base
      Merge branch 'drm/next/dw-hdmi' (early part) into drm/du/base
      drm: rcar-du: Use the DRM panel API
      drm: rcar-du: Add support for LVDS mode selection
      drm: rcar-du: Replace manual bridge implementation with DRM bridge
      drm: rcar-du: Hardcode encoders types to DRM_MODE_ENCODER_NONE
      dt-bindings: display: renesas: Add R-Car Gen3 HDMI TX DT bindings
      drm: rcar-du: Skip disabled outputs

Maarten Lankhorst (5):
      drm/atomic: Fix atomic helpers to use the new iterator macros, v3.
      drm/atomic: Make drm_atomic_plane_disabling easier to understand.
      drm/atomic: Add macros to access existing old/new state, v2.
      drm/atomic: Convert get_existing_state callers to get_old/new_state, v4.
      drm/blend: Use new atomic iterator macros.

Neil Armstrong (2):
      drm: bridge: dw-hdmi: Enable CSC even for DVI
      drm: bridge: dw-hdmi: Switch to regmap for register access

Wolfram Sang (1):
      drm: rcar-du: Don't open code of_device_get_match_data()

 .../bindings/display/bridge/lvds-transmitter.txt        |  64 ++++
 .../bindings/display/bridge/renesas,dw-hdmi.txt         |  75 ++++
 .../bindings/display/panel/mitsubishi,aa104xd12.txt     |  47 +++
 .../bindings/display/panel/mitsubishi,aa121td01.txt     |  47 +++
 .../devicetree/bindings/display/panel/panel-common.txt  |  91 +++++
 .../devicetree/bindings/display/panel/panel-lvds.txt    | 120 ++++++
 MAINTAINERS                                             |   1 +
 drivers/gpu/drm/bridge/Kconfig                          |  29 +-
 drivers/gpu/drm/bridge/Makefile                         |   5 +-
 drivers/gpu/drm/bridge/dumb-vga-dac.c                   |   1 +
 drivers/gpu/drm/bridge/lvds-encoder.c                   | 210 ++++++++++
 drivers/gpu/drm/bridge/synopsys/Kconfig                 |  23 ++
 drivers/gpu/drm/bridge/synopsys/Makefile                |   5 +
 .../gpu/drm/bridge/{ => synopsys}/dw-hdmi-ahb-audio.c   |   0
 drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi-audio.h   |   0
 .../gpu/drm/bridge/{ => synopsys}/dw-hdmi-i2s-audio.c   |   0
 drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.c         | 467 
++++++++++++++---------
 drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.h         |   0
 drivers/gpu/drm/drm_atomic.c                            |   6 +-
 drivers/gpu/drm/drm_atomic_helper.c                     | 484 
++++++++++++------------
 drivers/gpu/drm/drm_blend.c                             |  23 +-
 drivers/gpu/drm/drm_plane_helper.c                      |   2 +-
 drivers/gpu/drm/drm_simple_kms_helper.c                 |   4 +-
 drivers/gpu/drm/imx/dw_hdmi-imx.c                       |   2 -
 drivers/gpu/drm/panel/Kconfig                           |  10 +
 drivers/gpu/drm/panel/Makefile                          |   1 +
 drivers/gpu/drm/panel/panel-lvds.c                      | 286 ++++++++++++++
 drivers/gpu/drm/rcar-du/Kconfig                         |  10 +-
 drivers/gpu/drm/rcar-du/Makefile                        |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c                  |  94 ++++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h                  |   4 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c                   |  32 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h                   |   8 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c               | 187 +++++----
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h               |  14 +-
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c               | 134 -------
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h               |  35 --
 drivers/gpu/drm/rcar-du/rcar_du_kms.c                   | 143 +------
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c               |  68 ++--
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c               |  11 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h               |  13 +
 drivers/gpu/drm/rcar-du/rcar_du_regs.h                  |  23 ++
 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c                |  82 ----
 drivers/gpu/drm/rcar-du/rcar_du_vgacon.h                |  23 --
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h                   |   2 +-
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c                  | 100 +++++
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c             |   1 -
 include/drm/bridge/dw_hdmi.h                            |  33 +-
 include/drm/drm_atomic.h                                | 108 ++++++
 include/drm/drm_atomic_helper.h                         |  26 +-
 include/drm/drm_connector.h                             |   4 +
 51 files changed, 2106 insertions(+), 1058 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-
transmitter.txt
 create mode 100644 
Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
 create mode 100644 
Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.txt
 create mode 100644 
Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-
common.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-
lvds.txt
 create mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c
 create mode 100644 drivers/gpu/drm/bridge/synopsys/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/synopsys/Makefile
 rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi-ahb-audio.c (100%)
 rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi-audio.h (100%)
 rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi-i2s-audio.c (100%)
 rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.c (88%)
 rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.h (100%)
 create mode 100644 drivers/gpu/drm/panel/panel-lvds.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c


The following changes since commit 2537532db23bdd9ecd2c1c956ac430a9a08738a8:

  Merge branch 'arm64-dt-for-v4.12' into devel (2017-03-02 16:02:44 +0100)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-next-dt-v3-20170306

for you to fetch changes up to 111e8637fa9ad8261c25d437255c16f8e4e57116:

  ARM: shmobile: dts: Switch to panel-lvds bindings for Mitsubishi panels 
(2017-03-06 02:12:00 +0200)

----------------------------------------------------------------
Koji Matsuoka (1):
      arm64: dts: r8a7795: salvator-x: Enable HDMI outputs

Laurent Pinchart (3):
      arm64: dts: r8a7795: salvator-x: Add DU1 and DU2 external dot clocks
      arm64: dts: r8a7795: salvator-x: Add DU0 and DU3 external dot clocks
      ARM: shmobile: dts: Switch to panel-lvds bindings for Mitsubishi panels

Ulrich Hecht (1):
      arm64: dts: r8a7795: Add HDMI encoder support

 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi     |  3 +-
 arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi     |  3 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 95 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 50 ++++++++++++++++
 4 files changed, 149 insertions(+), 2 deletions(-)

-- 
Regards,

Laurent Pinchart
