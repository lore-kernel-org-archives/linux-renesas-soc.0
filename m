Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:50100 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750722AbeELIJ1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 May 2018 04:09:27 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [GIT PULL FOR renesas-drivers] drm/du/m3n
Date: Sat, 12 May 2018 09:09:22 +0100
Message-Id: <20180512080922.22025-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Please consider including this release in renesas-drivers.

--
Regards

Kieran

The following changes since commit 6d08b06e67cd117f6992c46611dfb4ce267cd71e:

  Linux 4.17-rc2 (2018-04-22 19:20:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/drm/du/m3n

for you to fetch changes up to f1e9a22ac3cff749077f40bf1a149aaaf587ae2d:

  drm: rcar-du: Add R8A77965 support (2018-05-05 17:11:20 +0300)

----------------------------------------------------------------
drm: rcar-du: Provide support for the M3-N

The M3-N has non linear addressing of it's group objects, which was not
supported by the rcar-du driver implementation due to asumptions on the
match between a CRTC index, and the hardware indexes.

Implement support to remove this assumption and enable the M3-N

----------------------------------------------------------------
Kieran Bingham (9):
      drm: rcar-du: of: Include header to define prototypes
      drm: rcar-du: Use NULL for table initialisation
      dt-bindings: display: renesas: du: Increase indent in output table
      dt-bindings: display: renesas: du: Document the r8a77965 bindings
      drm: rcar-du: Use the correct naming for ODPM fields in DEFR6
      dt-bindings: display: renesas: Add R-Car M3-N HDMI TX DT bindings
      drm: rcar-du: Split CRTC handling to support hardware indexing
      drm: rcar-du: Allow DU groups to work with hardware indexing
      drm: rcar-du: Add R8A77965 support

Laurent Pinchart (1):
      drm: rcar-du: Zero-out sg_tables when duplicating plane state

 .../bindings/display/bridge/renesas,dw-hdmi.txt    |  1 +
 .../devicetree/bindings/display/renesas,du.txt     | 28 ++++++------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             | 26 ++++++-----
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |  3 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              | 51 +++++++++++++++++-----
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |  4 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.c            | 16 ++++---
 drivers/gpu/drm/rcar-du/rcar_du_group.h            |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              | 25 ++++++++---
 drivers/gpu/drm/rcar-du/rcar_du_of.c               |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_regs.h             | 16 +++----
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |  5 +--
 12 files changed, 115 insertions(+), 63 deletions(-)
