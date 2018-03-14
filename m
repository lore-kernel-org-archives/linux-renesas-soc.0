Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52726 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752361AbeCNPqv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Mar 2018 11:46:51 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [GIT PULL FOR renesas-drivers] vsp1/du/interlaced/v2
Date: Wed, 14 Mar 2018 16:46:42 +0100
Message-Id: <1521042402-30927-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Please consider including this release in renesas-drivers.

--
Regards

Kieran

The following changes since commit 397eb3811ec096d0ceefa1dbea2d0ae68feb0587:

  media: vsp1: Move video configuration to a cached dlb (2018-03-07 21:19:29 +0000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/vsp1/du/interlaced/v2

for you to fetch changes up to 334f0b14fde0ddcfd02a12c41878a1b792221e4d:

  drm: rcar-du: Support interlaced video output through vsp1 (2018-03-13 18:50:00 +0100)

----------------------------------------------------------------
Kieran Bingham (11):
      media: vsp1: drm: Fix minor grammar error
      media: vsp1: Remove packed attributes from aligned structures
      media: vsp1: Rename dl_child to dl_next
      media: vsp1: Remove unused display list structure field
      media: vsp1: Clean up DLM objects on error
      media: vsp1: Provide VSP1 feature helper macro
      media: vsp1: Use header display lists for all WPF outputs linked to the DU
      media: vsp1: Add support for extended display list headers
      media: vsp1: Provide support for extended command pools
      media: vsp1: Support Interlaced display pipelines
      drm: rcar-du: Support interlaced video output through vsp1

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   |   3 +
 drivers/media/platform/vsp1/vsp1.h      |   3 +
 drivers/media/platform/vsp1/vsp1_dl.c   | 406 +++++++++++++++++++++++++-------
 drivers/media/platform/vsp1/vsp1_dl.h   |  32 ++-
 drivers/media/platform/vsp1/vsp1_drm.c  |  13 +-
 drivers/media/platform/vsp1/vsp1_drv.c  |  23 +-
 drivers/media/platform/vsp1/vsp1_regs.h |   6 +-
 drivers/media/platform/vsp1/vsp1_rpf.c  |  72 +++++-
 drivers/media/platform/vsp1/vsp1_rwpf.h |   1 +
 drivers/media/platform/vsp1/vsp1_wpf.c  |   6 +-
 include/media/vsp1.h                    |   1 +
 12 files changed, 455 insertions(+), 112 deletions(-)
