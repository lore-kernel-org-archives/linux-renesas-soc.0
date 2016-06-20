Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:53074 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754308AbcFTXsl (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 20 Jun 2016 19:48:41 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] Latest VSP code
Date: Tue, 21 Jun 2016 02:31 +0300
Message-ID: <3404781.poC9HarVFn@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

The following changes since commit a0877f52035280370707bdefeddc6faa6478b892:

  Merge tag 'topic/drm-misc-2016-06-15' of git://anongit.freedesktop.org/drm-
intel into drm-next (2016-06-16 05:49:32 +1000)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git for/renesas-drivers

for you to fetch changes up to a0c43cc96e4f42cd192ca957991419497a8432ec:

  Merge branch 'drm/next/dt' into for/renesas-drivers (2016-06-21 02:05:28 
+0300)

The branch contains patches that have been posted to the linux-media mailing 
list (as well as the dri-devel mailing list for the rcar-du patches). Most of 
the patches have been reviewed and all comments have been addressed. I hope to 
get them all merged upstream in v4.8.

I've tweaked the diffstat below to ignore the merge commits, as the 
drm/next/du branch is based on the latest master branch from the DRM tree 
which contains newer upstream code than the renesas-drivers master branch. 
Feel free to instead fetch the three topic branches drm/next/du, drm/next/dt 
and vsp1/flip and merge them separately if that's easier for you.

This pull request supersedes the "[GIT PULL FOR renesas-drivers] VSP HGO 
support and assorted fixes" request sent on May the 30th. Please let me know 
if there's a different way to submit branch updates to renesas-drivers that 
would make your life easier.

The code has been tested on both Lager and Salvator-X with the VSP unit test 
framework available at http://git.ideasonboard.com/renesas/vsp-tests.git. The 
scaling tests fail on Gen3 due to a known issue that we will investigate. The 
capture test in VYUY format fails on Gen3 as well, I'm investigating this. 
Neither of the failures are a regression compared to the current renesas-
drivers tree.

----------------------------------------------------------------
Kuninori Morimoto (2):
      drm: rcar-du: error message is not needed for drm_vblank_init()
      drm: rcar-du: error message is not needed for EPROBE_DEFER

Laurent Pinchart (46):
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
      v4l: Define a pixel format for the R-Car VSP1 1-D histogram engine
      v4l: vsp1: Add HGO support
      v4l: vsp1: Don't create HGO entity when the userspace API is disabled
      media: Add video processing entity functions
      media: Add video statistics computation functions
      v4l: vsp1: Base link creation on availability of entities
      v4l: vsp1: Don't register media device when userspace API is disabled
      v4l: vsp1: Don't create LIF entity when the userspace API is enabled
      v4l: vsp1: Set entities functions
      v4l: vsp1: pipe: Fix typo in comment
      v4l: vsp1: dl: Don't free fragments with interrupts disabled
      v4l: vsp1: lut: Initialize the mutex
      v4l: vsp1: lut: Expose configuration through a control
      v4l: vsp1: Add Cubic Look Up Table (CLU) support
      v4l: vsp1: sru: Fix intensity control ID
      v4l: vsp1: Support runtime modification of controls
      v4l: vsp1: lut: Support runtime modification of controls
      v4l: vsp1: clu: Support runtime modification of controls
      v4l: vsp1: Simplify alpha propagation
      v4l: vsp1: rwpf: Support runtime modification of controls
      v4l: vsp1: wpf: Add flipping support
      v4l: vsp1: Constify operation structures
      v4l: vsp1: Stop the pipeline upon the first STREAMOFF
      Merge branch 'drm/next/du' into for/renesas-drivers
      arm64: dts: renesas: r8a7795: Add FCPV nodes
      arm64: dts: renesas: r8a7795: Add VSP instances
      arm64: dts: renesas: r8a7795: Add DU device to DT
      arm64: dts: renesas: salvator-x: Enable DU
      Merge branch 'drm/next/dt' into for/renesas-drivers

Sergei Shtylyov (1):
      rcar-du: add/rename DEFR6 TCON bits

 Documentation/DocBook/media/v4l/dev-meta.xml             |   93 ++
 Documentation/DocBook/media/v4l/media-types.xml          |   64 +
 Documentation/DocBook/media/v4l/pixfmt-meta-vsp1-hgo.xml |  307 +++++++++
 Documentation/DocBook/media/v4l/pixfmt.xml               |    9 
 Documentation/DocBook/media/v4l/v4l2.xml                 |    1 
 Documentation/devicetree/bindings/media/renesas,fcp.txt  |   32 
 Documentation/devicetree/bindings/media/renesas,vsp1.txt |    5 
 MAINTAINERS                                              |   10 
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts       |   44 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi                 |  199 +++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c                    |    8 
 drivers/gpu/drm/rcar-du/rcar_du_regs.h                   |    5 
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c                    |   45 -
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h                    |    2 
 drivers/media/platform/Kconfig                           |   15 
 drivers/media/platform/Makefile                          |    1 
 drivers/media/platform/rcar-fcp.c                        |  181 +++++
 drivers/media/platform/vsp1/Makefile                     |    4 
 drivers/media/platform/vsp1/vsp1.h                       |   14 
 drivers/media/platform/vsp1/vsp1_bru.c                   |   12 
 drivers/media/platform/vsp1/vsp1_clu.c                   |  292 ++++++++
 drivers/media/platform/vsp1/vsp1_clu.h                   |   48 +
 drivers/media/platform/vsp1/vsp1_dl.c                    |   72 +-
 drivers/media/platform/vsp1/vsp1_drm.c                   |   76 +-
 drivers/media/platform/vsp1/vsp1_drv.c                   |  217 +++---
 drivers/media/platform/vsp1/vsp1_entity.c                |  226 +++++-
 drivers/media/platform/vsp1/vsp1_entity.h                |   24 
 drivers/media/platform/vsp1/vsp1_hgo.c                   |  500 +++++++++++++
 drivers/media/platform/vsp1/vsp1_hgo.h                   |   50 +
 drivers/media/platform/vsp1/vsp1_histo.c                 |  307 +++++++++
 drivers/media/platform/vsp1/vsp1_histo.h                 |   68 ++
 drivers/media/platform/vsp1/vsp1_hsit.c                  |   14 
 drivers/media/platform/vsp1/vsp1_lif.c                   |   16 
 drivers/media/platform/vsp1/vsp1_lut.c                   |  101 ++-
 drivers/media/platform/vsp1/vsp1_lut.h                   |    7 
 drivers/media/platform/vsp1/vsp1_pipe.c                  |   80 +-
 drivers/media/platform/vsp1/vsp1_pipe.h                  |   10 
 drivers/media/platform/vsp1/vsp1_regs.h                  |   48 +
 drivers/media/platform/vsp1/vsp1_rpf.c                   |   38 -
 drivers/media/platform/vsp1/vsp1_rwpf.c                  |    6 
 drivers/media/platform/vsp1/vsp1_rwpf.h                  |   14 
 drivers/media/platform/vsp1/vsp1_sru.c                   |   14 
 drivers/media/platform/vsp1/vsp1_uds.c                   |   16 
 drivers/media/platform/vsp1/vsp1_uds.h                   |    2 
 drivers/media/platform/vsp1/vsp1_video.c                 |   40 -
 drivers/media/platform/vsp1/vsp1_video.h                 |    1 
 drivers/media/platform/vsp1/vsp1_wpf.c                   |  159 ++++
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c            |   19 
 drivers/media/v4l2-core/v4l2-dev.c                       |   16 
 drivers/media/v4l2-core/v4l2-ioctl.c                     |   35 +
 drivers/media/v4l2-core/videobuf2-v4l2.c                 |    3 
 include/media/rcar-fcp.h                                 |   37 +
 include/media/v4l2-ioctl.h                               |    8 
 include/media/vsp1.h                                     |   29 
 include/uapi/linux/media.h                               |   10 
 include/uapi/linux/videodev2.h                           |   17 
 include/uapi/linux/vsp1.h                                |   34 -
 57 files changed, 3277 insertions(+), 428 deletions(-)

-- 
Regards,

Laurent Pinchart
