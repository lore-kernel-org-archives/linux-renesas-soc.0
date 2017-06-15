Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37101 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750801AbdFOSyI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jun 2017 14:54:08 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] R-Car H3 ES2.0 display support
Date: Thu, 15 Jun 2017 21:54:31 +0300
Message-ID: <8149481.gNmlvl7hsu@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

The following changes implement display support for the R-Car H3 ES2.0. They 
have been split in three distinct branches:

- tags/drm-h3-es2-dt-20170615 contains the DT changes and is based on top of 
topic/r8a7795es2-integration

The following changes since commit 2009b241fbbc368f290e18e829f723eeb25a9bdd:

  Merge branches 'clk-renesas-for-v4.13', 'sh-pfc-for-v4.13' and 
'topic/r8a7795es2-dt-v4' into topic/r8a7795es2-integration (2017-05-15 
13:54:40 +0200)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-h3-es2-dt-20170615

for you to fetch changes up to 0e174a552a84f638b00549eda58ba97c5bf1832c:

  arm64: dts: r8a7795: salvator-x: Unify DU node between ES1.x and ES2.0 
(2017-06-15 21:20:11 +0300)

----------------------------------------------------------------
Laurent Pinchart (2):
      arm64: dts: r8a7795: Add support for the DU
      arm64: dts: r8a7795: salvator-x: Unify DU node between ES1.x and ES2.0

 arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts | 14 --------------
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts     | 14 --------------
 arch/arm64/boot/dts/renesas/r8a7795.dtsi               |  2 ++
 arch/arm64/boot/dts/renesas/salvator-x.dtsi            | 12 ++++++++++++
 4 files changed, 14 insertions(+), 28 deletions(-)

- tags/drm-h3-es2-pinctrl-20170615 contains the pinctrl changes for the DU and 
is based on top of sh-pfc-for-v4.13-tag1

The following changes since commit c8bac70f079bb3ecaf9a716f141f3d85cef27231:

  pinctrl: sh-pfc: r8a7794: Add R8A7745 support (2017-05-16 13:53:15 +0200)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-h3-es2-pinctrl-20170615

for you to fetch changes up to d83572a23b5b636cef20074fad4b7d2ca073a6f5:

  pinctrl: sh-pfc: r8a7795: Add DU parallel RGB output support (2017-06-15 
10:42:34 +0300)

----------------------------------------------------------------
Geert Uytterhoeven (1):
      pinctrl: sh-pfc: r8a7795: Add EtherAVB pins, groups and function

Laurent Pinchart (1):
      pinctrl: sh-pfc: r8a7795: Add DU parallel RGB output support

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 212 ++++++++++++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

- tags/drm-h3-es2-vsp-20170615 contains the VSP changes and is based on top of 
v4.12-rc1

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-h3-es2-vsp-20170615

for you to fetch changes up to 378c824b087ca9b02a9b690007aec707aed8d457:

  v4l: vsp1: Add support for header display lists in continuous mode 
(2017-06-15 21:39:16 +0300)

----------------------------------------------------------------
Laurent Pinchart (6):
      v4l: vsp1: Remove WPF vertical flip support on VSP2-B[CD] and VSP2-D
      v4l: vsp1: Add support for the BRS entity
      v4l: vsp1: Add support for new VSP2-BS, VSP2-DL and VSP2-D instances
      v4l: vsp1: Add pipe index argument to the VSP-DU API
      v4l: vsp1: Fill display list headers without holding dlm spinlock
      v4l: vsp1: Add support for header display lists in continuous mode

 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     |   9 +-
 drivers/media/platform/vsp1/vsp1.h        |   2 +
 drivers/media/platform/vsp1/vsp1_bru.c    |  45 ++++++---
 drivers/media/platform/vsp1/vsp1_bru.h    |   4 +-
 drivers/media/platform/vsp1/vsp1_dl.c     | 202 +++++++++++++++++++----------
 drivers/media/platform/vsp1/vsp1_drm.c    |  28 ++++--
 drivers/media/platform/vsp1/vsp1_drv.c    |  49 ++++++++-
 drivers/media/platform/vsp1/vsp1_entity.c |  13 ++-
 drivers/media/platform/vsp1/vsp1_entity.h |   1 +
 drivers/media/platform/vsp1/vsp1_pipe.c   |   7 +-
 drivers/media/platform/vsp1/vsp1_regs.h   |  41 ++++++--
 drivers/media/platform/vsp1/vsp1_video.c  |  63 +++++++-----
 drivers/media/platform/vsp1/vsp1_wpf.c    |   4 +-
 include/media/vsp1.h                      |   8 +-
 14 files changed, 334 insertions(+), 142 deletions(-)

-- 
Regards,

Laurent Pinchart
