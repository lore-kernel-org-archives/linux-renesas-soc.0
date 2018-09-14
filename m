Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:42476 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727773AbeIOCTT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 22:19:19 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [GIT PULL FOR renesas-drivers] du/2018q3
Date: Fri, 14 Sep 2018 22:03:04 +0100
Message-Id: <20180914210304.30843-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Please consider including this release in renesas-drivers.

Please note - unlike the previous VSP1 pull request, which is a direct request
of Laurent's v4l2/vsp1/next, this one is actually a branch on my tree. 

This pull request covers both Laurent's drm/du/next and one extra commit in my
tree. It's a temporary fix. I expect either Laurent will pick up the revert, or
we may have a better fix by the time you do a renesas-drivers release.

Please feel free to drop this and use Laurent's updated drm/du/next branch as
necessary.


--
Regards

Kieran

The following changes since commit 2dc7bad71cd310dc94d1c9907909324dd2b0618f:

  Merge tag 'drm-misc-next-2018-09-13' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2018-09-14 09:43:16 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git du/2018q3

for you to fetch changes up to ebf4cb8acd5fff350500dae25a8e868c79e25b40:

  drm: rcar-du: Revert "drm: rcar-du: Use __drm_atomic_helper_plane_reset instead of copying the logic" (2018-09-14 20:50:19 +0100)

----------------------------------------------------------------
Jacopo Mondi (3):
      drm: rcar-du: Improve non-DPLL clock selection
      drm: rcar-du: Rename and document dpll_ch field
      drm: rcar-du: Write ESCR and OTAR as CRTC registers

Kieran Bingham (7):
      MAINTAINERS: rcar-du: Add co-maintainer
      drm: rcar-du: Support interlaced video output through vsp1
      drm: rcar-du: Refactor Feature and Quirk definitions
      drm: rcar-du: Add interlaced feature flag
      drm: rcar-du: Update Gen3 output limitations
      drm: rcar-du: Remove packed VYUY support
      drm: rcar-du: Revert "drm: rcar-du: Use __drm_atomic_helper_plane_reset instead of copying the logic"

Koji Matsuoka (1):
      drm: rcar-du: Add support for missing pixel formats

Kuninori Morimoto (3):
      drm: shmobile: convert to SPDX identifiers
      drm: panel-lvds: convert to SPDX identifiers
      drm: rcar-du: Convert to SPDX identifiers

Laurent Pinchart (3):
      MAINTAINERS: Update tree location for the Renesas DRM drivers
      drm: rcar-du: Rework clock configuration based on hardware limits
      drm: rcar-du: Update framebuffer pitch and alignment limits for Gen3

Sergei Shtylyov (3):
      dt-bindings: display: renesas: du: document R8A77980 bindings
      dt-bindings: display: renesas: lvds: document R8A77980 bindings
      drm: rcar-du: lvds: add R8A77980 support

 .../bindings/display/bridge/renesas,lvds.txt       |   1 +
 .../devicetree/bindings/display/renesas,du.txt     |   2 +
 MAINTAINERS                                        |   3 +-
 drivers/gpu/drm/panel/panel-lvds.c                 |   6 +-
 drivers/gpu/drm/rcar-du/Kconfig                    |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             | 181 +++++++++++++--------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  44 ++---
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |  18 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.h            |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  87 +++++++---
 drivers/gpu/drm/rcar-du/rcar_du_kms.h              |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            |  12 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.h            |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h             |  13 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |  14 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h              |   6 +-
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c             |   6 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |   1 +
 drivers/gpu/drm/rcar-du/rcar_lvds_regs.h           |   5 +-
 drivers/gpu/drm/shmobile/Kconfig                   |   1 +
 drivers/gpu/drm/shmobile/shmob_drm_backlight.c     |   6 +-
 drivers/gpu/drm/shmobile/shmob_drm_backlight.h     |   6 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |   6 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.h          |   6 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |   6 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.h           |   6 +-
 drivers/gpu/drm/shmobile/shmob_drm_kms.c           |   6 +-
 drivers/gpu/drm/shmobile/shmob_drm_kms.h           |   6 +-
 drivers/gpu/drm/shmobile/shmob_drm_plane.c         |   6 +-
 drivers/gpu/drm/shmobile/shmob_drm_plane.h         |   6 +-
 drivers/gpu/drm/shmobile/shmob_drm_regs.h          |   6 +-
 include/linux/platform_data/shmob_drm.h            |   6 +-
 36 files changed, 261 insertions(+), 254 deletions(-)
