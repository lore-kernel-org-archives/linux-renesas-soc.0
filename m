Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:53490 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbeHGNjH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 09:39:07 -0400
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [GIT PULL FOR renesas-drivers] gmsl/for-renesas-drivers
Date: Tue,  7 Aug 2018 12:25:08 +0100
Message-Id: <20180807112508.29152-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Please consider including this release in renesas-drivers.

This brings in our GMSL developments for inclusion in renesas-drivers, but does
not by default enable any FAKRA overlays. Anyone wishing to try out the GMSL
work must manually configure their specific camera configuration.

Please note, this branch is based on a merge commit of linux-media/master and
Sakari's VC branch, and includes Niklas' conversions for adv748x to support VC
which are still in development as a pre-requisite.

--
Regards

Kieran

The following changes since commit 12f336c88090fb8004736fd4329184326a49673b:

  media: sh_mobile_ceu: convert to SPDX identifiers (2018-08-03 16:06:08 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git gmsl/for-renesas-drivers

for you to fetch changes up to a6764190f2671dbcf86a59d42957bbcf56bb9301:

  media: i2c: max9286: [POC] Power down GPIO lines to enable the V3M cameras (2018-08-07 12:08:12 +0100)

----------------------------------------------------------------
Jacopo Mondi (1):
      dt-bindings: media: i2c: Add bindings for IMI RDACM20

Kieran Bingham (6):
      Merge remote-tracking branch 'sailus/vc' into gmsl/base
      media: i2c: Add MAX9286 driver
      media: i2c: Add RDACM20 driver
      arm64: dts: renesas: eagle: Provide MAX9286 GMSL deserialiser
      arm64: dts: renesas: eagle: Provide Eagle FAKRA dynamic overlay
      media: i2c: max9286: [POC] Power down GPIO lines to enable the V3M cameras

Laurent Pinchart (6):
      media: entity: Add has_route entity operation
      media: entity: Add media_has_route() function
      media: entity: Use routing information during graph traversal
      v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations
      dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286
      arm64: dts: renesas: salvator-x: Add MAX9286 expansion board

Niklas Söderlund (10):
      rcar-vin: use pad as the starting point for a pipeline
      rcar-csi2: use frame description information to configure CSI-2 bus
      rcar-csi2: add get_routing support
      adv748x: csi2: add module param for virtual channel
      adv748x: csi2: add translation from pixelcode to CSI-2 datatype
      adv748x: csi2: implement get_frame_desc
      adv748x: csi2: only allow formats on sink pads
      adv748x: csi2: add get_routing support
      adv748x: afe: add routing support
      arm64: dts: renesas: eagle: enable VIN

Sakari Ailus (26):
      media: entity: Use pad as a starting point for graph walk
      media: entity: Use pads instead of entities in the media graph walk stack
      media: entity: Walk the graph based on pads
      v4l: mc: Start walk from a specific pad in use count calculation
      media: entity: Move the pipeline from entity to pads
      media: entity: Use pad as the starting point for a pipeline
      media: entity: Swap pads if route is checked from source to sink
      media: entity: Skip link validation for pads to which there is no route to
      media: entity: Add an iterator helper for connected pads
      media: entity: Add only connected pads to the pipeline
      media: entity: Add debug information in graph walk route check
      media: entity: Look for indirect routes
      v4l: subdev: compat: Implement handling for VIDIOC_SUBDEV_[GS]_ROUTING
      v4l: subdev: Take routing information into account in link validation
      v4l: subdev: Improve link format validation debug messages
      v4l: mc: Add an S_ROUTING helper function for power state changes
      v4l: Add bus type to frame descriptors
      v4l: Add CSI-2 bus configuration to frame descriptors
      v4l: Add stream to frame descriptor
      smiapp: Add MIPI CSI-2 data type definitions
      smiapp: Add smiapp_has_quirk() to tell whether a quirk is implemented
      media: Add media bus codes for 8-bit SMIAPP embedded data
      v4l: Add format definitions for 8-, 10-, 12- and 14-bit SMIA embedded data
      smiapp: Support frame descriptors
      smiapp: Provide a way to differentiate sub-device ops
      smiapp: Add MUX and metadata sub-devices for embedded data

 .../devicetree/bindings/media/i2c/imi,rdacm20.txt  |   62 +
 .../bindings/media/i2c/maxim,max9286.txt           |  180 +++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 Documentation/media/kapi/mc-core.rst               |   15 +-
 MAINTAINERS                                        |   20 +
 arch/arm64/boot/dts/renesas/eagle-fakra.dtsi       |  131 +++
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |  136 +++
 .../arm64/boot/dts/renesas/salvator-x-max9286.dtsi |  391 +++++++
 drivers/media/i2c/Kconfig                          |   22 +
 drivers/media/i2c/Makefile                         |    2 +
 drivers/media/i2c/adv748x/adv748x-afe.c            |   65 ++
 drivers/media/i2c/adv748x/adv748x-core.c           |   10 +
 drivers/media/i2c/adv748x/adv748x-csi2.c           |   80 +-
 drivers/media/i2c/adv748x/adv748x.h                |    1 +
 drivers/media/i2c/max9286.c                        | 1196 ++++++++++++++++++++
 drivers/media/i2c/rdacm20-ov10635.h                |  953 ++++++++++++++++
 drivers/media/i2c/rdacm20.c                        |  635 +++++++++++
 drivers/media/i2c/smiapp/smiapp-core.c             |  259 ++++-
 drivers/media/i2c/smiapp/smiapp-quirk.h            |   10 +-
 drivers/media/i2c/smiapp/smiapp.h                  |   32 +-
 drivers/media/media-entity.c                       |  252 +++--
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |    6 +-
 drivers/media/platform/exynos4-is/fimc-capture.c   |    8 +-
 drivers/media/platform/exynos4-is/fimc-isp-video.c |    8 +-
 drivers/media/platform/exynos4-is/fimc-isp.c       |    2 +-
 drivers/media/platform/exynos4-is/fimc-lite.c      |   10 +-
 drivers/media/platform/exynos4-is/media-dev.c      |   20 +-
 drivers/media/platform/omap3isp/isp.c              |    2 +-
 drivers/media/platform/omap3isp/ispvideo.c         |   25 +-
 drivers/media/platform/omap3isp/ispvideo.h         |    2 +-
 drivers/media/platform/qcom/camss/camss-video.c    |    6 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c        |  181 ++-
 drivers/media/platform/rcar-vin/rcar-dma.c         |    8 +-
 drivers/media/platform/s3c-camif/camif-capture.c   |    6 +-
 drivers/media/platform/vimc/vimc-capture.c         |    6 +-
 drivers/media/platform/vsp1/vsp1_video.c           |   18 +-
 drivers/media/platform/xilinx/xilinx-dma.c         |   20 +-
 drivers/media/platform/xilinx/xilinx-dma.h         |    2 +-
 drivers/media/usb/au0828/au0828-core.c             |    4 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c      |   75 ++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   20 +-
 drivers/media/v4l2-core/v4l2-mc.c                  |   76 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |  285 ++++-
 drivers/staging/media/davinci_vpfe/vpfe_video.c    |   21 +-
 drivers/staging/media/imx/imx-media-utils.c        |    8 +-
 drivers/staging/media/omap4iss/iss.c               |    2 +-
 drivers/staging/media/omap4iss/iss_video.c         |   38 +-
 drivers/staging/media/omap4iss/iss_video.h         |    2 +-
 include/media/media-entity.h                       |  120 +-
 include/media/v4l2-mc.h                            |   22 +
 include/media/v4l2-subdev.h                        |   30 +
 include/uapi/linux/media-bus-format.h              |    7 +
 include/uapi/linux/v4l2-subdev.h                   |   40 +
 include/uapi/linux/videodev2.h                     |    9 +
 54 files changed, 5197 insertions(+), 345 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imi,rdacm20.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.txt
 create mode 100644 arch/arm64/boot/dts/renesas/eagle-fakra.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
 create mode 100644 drivers/media/i2c/max9286.c
 create mode 100644 drivers/media/i2c/rdacm20-ov10635.h
 create mode 100644 drivers/media/i2c/rdacm20.c
