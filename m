Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57154 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752187AbdFZS6Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jun 2017 14:58:16 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] R-Car H3 ES2.0 display support, v2
Date: Mon, 26 Jun 2017 21:58:16 +0300
Message-ID: <2356788.ZAuqMOLJcJ@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

The following changes implement display support for the R-Car H3 ES2.0. They 
have been split in two distinct branches:

- tags/drm-h3-es2-dt-20170626 contains the DT changes and is based on top of 
arm64-dt-for-v4.14

The following changes since commit cee30e674b8e54d3bf27eab26907e706f3304757:

  arm64: renesas: salvator-common: sound clock-frequency needs descending 
order (2017-06-16 15:37:51 +0200)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-h3-es2-dt-20170626

for you to fetch changes up to bcde4206f75575e825446dcd3a271741b997a483:

  arm64: dts: r8a7795: Add support for the DU (2017-06-26 14:17:32 +0300)

----------------------------------------------------------------
Laurent Pinchart (2):
      drm: rcar-du: Add a VSP channel index to the vsps DT property
      arm64: dts: r8a7795: Add support for the DU

 .../devicetree/bindings/display/renesas,du.txt          | 51 +++++++++-------
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi            |  1 -
 arch/arm64/boot/dts/renesas/r8a7795.dtsi                |  2 +
 3 files changed, 32 insertions(+), 22 deletions(-)

- tags/drm-h3-es2-vsp-du-20170626 contains the VSP changes and is based on top 
of the latest DRM -next branch

The following changes since commit 047b8e21e3bfa9faa4ed9a0c337fe0c687710251:

  Merge tag 'drm-misc-next-2017-06-19_0' of 
git://anongit.freedesktop.org/git/drm-misc into drm-next (2017-06-21 08:57:34 
+1000)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-h3-es2-vsp-du-20170626

for you to fetch changes up to 8d09cbf4a12a4c79619c0edf23f9e219e29f5749:

  drm: rcar-du: Configure DPAD0 routing through last group on Gen3 (2017-06-26 
19:08:54 +0300)

----------------------------------------------------------------
Laurent Pinchart (14):
      v4l: vsp1: Fill display list headers without holding dlm spinlock
      v4l: vsp1: Don't recycle active list at display start
      v4l: vsp1: Don't set WPF sink pointer
      v4l: vsp1: Store source and sink pointers as vsp1_entity
      v4l: vsp1: Don't create links for DRM pipeline
      v4l: vsp1: Add pipe index argument to the VSP-DU API
      v4l: vsp1: Add support for the BRS entity
      v4l: vsp1: Add support for new VSP2-BS, VSP2-DL and VSP2-D instances
      v4l: vsp1: Add support for multiple LIF instances
      v4l: vsp1: Add support for multiple DRM pipelines
      v4l: vsp1: Add support for header display lists in continuous mode
      drm: rcar-du: Support multiple sources from the same VSP
      drm: rcar-du: Restrict DPLL duty cycle workaround to H3 ES1.x
      drm: rcar-du: Configure DPAD0 routing through last group on Gen3

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    |  39 ++++--
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h    |   3 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c   |  21 ++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  91 ++++++++++--
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     |  37 +++--
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h     |  10 +-
 drivers/media/platform/vsp1/vsp1.h        |   7 +-
 drivers/media/platform/vsp1/vsp1_bru.c    |  45 ++++--
 drivers/media/platform/vsp1/vsp1_bru.h    |   4 +-
 drivers/media/platform/vsp1/vsp1_dl.c     | 205 ++++++++++++++++-----------
 drivers/media/platform/vsp1/vsp1_dl.h     |   1 -
 drivers/media/platform/vsp1/vsp1_drm.c    | 283 ++++++++++++++---------------
 drivers/media/platform/vsp1/vsp1_drm.h    |  38 ++---
 drivers/media/platform/vsp1/vsp1_drv.c    | 115 +++++++++++-----
 drivers/media/platform/vsp1/vsp1_entity.c |  40 ++++--
 drivers/media/platform/vsp1/vsp1_entity.h |   5 +-
 drivers/media/platform/vsp1/vsp1_lif.c    |   5 +-
 drivers/media/platform/vsp1/vsp1_lif.h    |   2 +-
 drivers/media/platform/vsp1/vsp1_pipe.c   |   7 +-
 drivers/media/platform/vsp1/vsp1_regs.h   |  46 +++++--
 drivers/media/platform/vsp1/vsp1_video.c  |  63 +++++----
 drivers/media/platform/vsp1/vsp1_wpf.c    |   4 +-
 include/media/vsp1.h                      |  10 +-
 23 files changed, 676 insertions(+), 405 deletions(-)

-- 
Regards,

Laurent Pinchart
