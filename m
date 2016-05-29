Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35447 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752862AbcE2WJK (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 29 May 2016 18:09:10 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>,
	linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] VSP HGO support and assorted fixes
Date: Mon, 30 May 2016 01:09:11 +0300
Message-ID: <1500003.sLylZGEauQ@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

The following changes since commit aff093d4bbca91f543e24cde2135f393b8130f4b:

  [media] exynos-gsc: avoid build warning without CONFIG_OF (2016-05-09 
18:38:33 -0300)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git vsp1/functions

for you to fetch changes up to f2d1880aa12bcf6b9d78bbba15ec9df14f3802fd:

  v4l: vsp1: Set entities functions (2016-05-23 17:01:49 +0300)

The branch contains patches that have been posted to the linux-media mailing 
list (as well as the dri-devel mailing list for the rcar-du patches) and 
reviewed. Some of them will need to be resubmitted, and I hope to get them all 
merged upstream in v4.8.

----------------------------------------------------------------
Laurent Pinchart (26):
      dt-bindings: Add Renesas R-Car FCP DT bindings
      v4l: Add Renesas R-Car FCP driver
      v4l: vsp1: Implement runtime PM support
      v4l: vsp1: Don't handle clocks manually
      v4l: vsp1: Add FCP support
      v4l: vsp1: Add output node value to routing table
      v4l: vsp1: Replace container_of() with dedicated macro
      v4l: vsp1: Make vsp1_entity_get_pad_compose() more generic
      v4l: vsp1: Move frame sequence number from video node to pipeline
      v4l: vsp1: Group DRM RPF parameters in a structure
      drm: rcar-du: Add alpha support for VSP planes
      drm: rcar-du: Add Z-order support for VSP planes
      v4l: vsp1: Remove deprecated DRM API
      v4l: vsp1: Fix typo in register field names
      v4l: vsp1: Fix descriptions of Gen2 VSP instances
      v4l: vsp1: Fix crash when resetting pipeline
      v4l: Add metadata buffer type and format
      v4l: Add metadata video device type
      v4l: Define a pixel format for the R-Car VSP1 1-D histogram engine
      v4l: vsp1: Add HGO support
      media: Add video processing entity functions
      media: Add video statistics computation functions
      v4l: vsp1: Base link creation on availability of entities
      v4l: vsp1: Don't register media device when userspace API is disabled
      v4l: vsp1: Don't create LIF entity when the userspace API is enabled
      v4l: vsp1: Set entities functions

 Documentation/DocBook/media/v4l/dev-meta.xml            |  97 +++++
 Documentation/DocBook/media/v4l/media-types.xml         |  64 +++
 .../DocBook/media/v4l/pixfmt-meta-vsp1-hgo.xml          | 307 +++++++++++++++
 Documentation/DocBook/media/v4l/pixfmt.xml              |   9 +
 Documentation/DocBook/media/v4l/v4l2.xml                |   1 +
 Documentation/devicetree/bindings/media/renesas,fcp.txt |  32 ++
 .../devicetree/bindings/media/renesas,vsp1.txt          |   5 +
 MAINTAINERS                                             |  10 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c                   |  45 ++-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h                   |   2 +
 drivers/media/platform/Kconfig                          |  15 +
 drivers/media/platform/Makefile                         |   1 +
 drivers/media/platform/rcar-fcp.c                       | 181 +++++++++
 drivers/media/platform/vsp1/Makefile                    |   2 +
 drivers/media/platform/vsp1/vsp1.h                      |   9 +-
 drivers/media/platform/vsp1/vsp1_bru.c                  |   3 +-
 drivers/media/platform/vsp1/vsp1_drm.c                  |  70 ++--
 drivers/media/platform/vsp1/vsp1_drv.c                  | 197 ++++++----
 drivers/media/platform/vsp1/vsp1_entity.c               | 225 +++++++++--
 drivers/media/platform/vsp1/vsp1_entity.h               |  21 +-
 drivers/media/platform/vsp1/vsp1_hgo.c                  | 497 +++++++++++++++
 drivers/media/platform/vsp1/vsp1_hgo.h                  |  50 +++
 drivers/media/platform/vsp1/vsp1_histo.c                | 307 +++++++++++++++
 drivers/media/platform/vsp1/vsp1_histo.h                |  68 ++++
 drivers/media/platform/vsp1/vsp1_hsit.c                 |   5 +-
 drivers/media/platform/vsp1/vsp1_lif.c                  |   7 +-
 drivers/media/platform/vsp1/vsp1_lut.c                  |   3 +-
 drivers/media/platform/vsp1/vsp1_pipe.c                 |  48 ++-
 drivers/media/platform/vsp1/vsp1_pipe.h                 |   4 +
 drivers/media/platform/vsp1/vsp1_regs.h                 |  32 +-
 drivers/media/platform/vsp1/vsp1_rpf.c                  |  10 +-
 drivers/media/platform/vsp1/vsp1_sru.c                  |   3 +-
 drivers/media/platform/vsp1/vsp1_uds.c                  |   3 +-
 drivers/media/platform/vsp1/vsp1_video.c                |  26 +-
 drivers/media/platform/vsp1/vsp1_video.h                |   1 -
 drivers/media/platform/vsp1/vsp1_wpf.c                  |   3 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c           |  19 +
 drivers/media/v4l2-core/v4l2-dev.c                      |  37 +-
 drivers/media/v4l2-core/v4l2-ioctl.c                    |  40 ++
 drivers/media/v4l2-core/videobuf2-v4l2.c                |   3 +
 include/media/rcar-fcp.h                                |  37 ++
 include/media/v4l2-dev.h                                |   3 +-
 include/media/v4l2-ioctl.h                              |   8 +
 include/media/vsp1.h                                    |  29 +-
 include/uapi/linux/media.h                              |  12 +
 include/uapi/linux/videodev2.h                          |  17 +
 46 files changed, 2312 insertions(+), 256 deletions(-)
 create mode 100644 Documentation/DocBook/media/v4l/dev-meta.xml
 create mode 100644 Documentation/DocBook/media/v4l/pixfmt-meta-vsp1-hgo.xml
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.txt
 create mode 100644 drivers/media/platform/rcar-fcp.c
 create mode 100644 drivers/media/platform/vsp1/vsp1_hgo.c
 create mode 100644 drivers/media/platform/vsp1/vsp1_hgo.h
 create mode 100644 drivers/media/platform/vsp1/vsp1_histo.c
 create mode 100644 drivers/media/platform/vsp1/vsp1_histo.h
 create mode 100644 include/media/rcar-fcp.h

-- 
Regards,

Laurent Pinchart
