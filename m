Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:44045 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756125AbdLOKMe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 05:12:34 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] Display CRC calculation support
Date: Fri, 15 Dec 2017 12:12:42 +0200
Message-ID: <2645075.ThVs6ruk3K@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

The following changes since commit 0f2278cc90181f0e1d938ba9d20928eaf1fd31ce:

  Merge branch 'drm/next/base' into vsp1/base (2017-12-14 01:11:25 +0200)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git tags/vsp1-discom-v1-20171215

for you to fetch changes up to cef620afa09ca165cbcdbdedbff0120e409ad946:

  drm: rcar-du: Add support for CRC computation (2017-12-14 01:11:50 +0200)

This will pull in the -next branches of the Linux media and DRM trees.

----------------------------------------------------------------
Laurent Pinchart (9):
      v4l: vsp1: Fix display stalls when requesting too many inputs
      v4l: vsp1: Print the correct blending unit name in debug messages
      v4l: vsp1: Share the CLU, LIF and LUT set_fmt pad operation code
      v4l: vsp1: Reset the crop and compose rectangles in the set_fmt helper
      v4l: vsp1: Document the vsp1_du_atomic_config structure
      v4l: vsp1: Extend the DU API to support CRC computation
      v4l: vsp1: Add support for the DISCOM entity
      v4l: vsp1: Integrate DISCOM in display pipeline
      drm: rcar-du: Add support for CRC computation

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 148 +++++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h    |  19 +++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     |  13 +-
 drivers/media/platform/vsp1/Makefile      |   2 +-
 drivers/media/platform/vsp1/vsp1.h        |   4 +
 drivers/media/platform/vsp1/vsp1_clu.c    |  65 ++-------
 drivers/media/platform/vsp1/vsp1_drm.c    | 138 +++++++++++++++++--
 drivers/media/platform/vsp1/vsp1_drm.h    |  14 +-
 drivers/media/platform/vsp1/vsp1_drv.c    |  20 +++
 drivers/media/platform/vsp1/vsp1_entity.c |  97 ++++++++++++++
 drivers/media/platform/vsp1/vsp1_entity.h |   7 +
 drivers/media/platform/vsp1/vsp1_histo.c  |  59 +-------
 drivers/media/platform/vsp1/vsp1_lif.c    |  65 ++-------
 drivers/media/platform/vsp1/vsp1_lut.c    |  65 ++-------
 drivers/media/platform/vsp1/vsp1_regs.h   |  41 ++++++
 drivers/media/platform/vsp1/vsp1_uif.c    | 275 +++++++++++++++++++++++++++++
 drivers/media/platform/vsp1/vsp1_uif.h    |  36 +++++
 include/media/vsp1.h                      |  39 +++++-
 18 files changed, 870 insertions(+), 237 deletions(-)
 create mode 100644 drivers/media/platform/vsp1/vsp1_uif.c
 create mode 100644 drivers/media/platform/vsp1/vsp1_uif.h

-- 
Regards,

Laurent Pinchart
