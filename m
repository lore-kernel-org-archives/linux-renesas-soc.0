Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:50941 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965203AbeCGTpA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Mar 2018 14:45:00 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: geert@glider.be
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] VSP1 dynamic BRU/BRS allocation
Date: Wed, 07 Mar 2018 21:45:55 +0200
Message-ID: <1550269.Ny8GyIV5Bq@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

The following changes since commit 15ea2df9143729a2b722d4ca2b52cfa14a819d8e:

  media: ov2685: mark PM functions as __maybe_unused (2018-02-26 10:38:56 
-0500)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-vsp1-bru-brs-v1-20180226

for you to fetch changes up to 66de53df73042978c8560a2a596a4e9b7a6bb485:

  v4l: vsp1: Rename BRU to BRx (2018-03-07 21:41:34 +0200)

----------------------------------------------------------------
Laurent Pinchart (15):
      v4l: vsp1: Don't start/stop media pipeline for DRM
      v4l: vsp1: Remove outdated comment
      v4l: vsp1: Remove unused field from vsp1_drm_pipeline structure
      v4l: vsp1: Store pipeline pointer in vsp1_entity
      v4l: vsp1: Use vsp1_entity.pipe to check if entity belongs to a pipeline
      v4l: vsp1: Share duplicated DRM pipeline configuration code
      v4l: vsp1: Move DRM atomic commit pipeline setup to separate function
      v4l: vsp1: Setup BRU at atomic commit time
      v4l: vsp1: Replace manual DRM pipeline input setup in vsp1_du_setup_lif
      v4l: vsp1: Move DRM pipeline output setup code to a function
      v4l: vsp1: Add per-display list completion notification support
      v4l: vsp1: Generalize detection of entity removal from DRM pipeline
      v4l: vsp1: Assign BRU and BRS to pipelines dynamically
      v4l: vsp1: Add BRx dynamic assignment debugging messages
      v4l: vsp1: Rename BRU to BRx

 drivers/media/platform/vsp1/Makefile                   |   2 +-
 drivers/media/platform/vsp1/vsp1.h                     |   6 +-
 drivers/media/platform/vsp1/{vsp1_bru.c => vsp1_brx.c} | 202 +++---
 drivers/media/platform/vsp1/{vsp1_bru.h => vsp1_brx.h} |  18 +-
 drivers/media/platform/vsp1/vsp1_dl.c                  |  27 +-
 drivers/media/platform/vsp1/vsp1_dl.h                  |   4 +-
 drivers/media/platform/vsp1/vsp1_drm.c                 | 829 ++++++++++------
 drivers/media/platform/vsp1/vsp1_drm.h                 |  16 +-
 drivers/media/platform/vsp1/vsp1_drv.c                 |   8 +-
 drivers/media/platform/vsp1/vsp1_entity.h              |   2 +
 drivers/media/platform/vsp1/vsp1_histo.c               |   2 +-
 drivers/media/platform/vsp1/vsp1_histo.h               |   3 -
 drivers/media/platform/vsp1/vsp1_pipe.c                |  50 +-
 drivers/media/platform/vsp1/vsp1_pipe.h                |   7 +-
 drivers/media/platform/vsp1/vsp1_rpf.c                 |  12 +-
 drivers/media/platform/vsp1/vsp1_rwpf.h                |   4 +-
 drivers/media/platform/vsp1/vsp1_video.c               |  37 +-
 drivers/media/platform/vsp1/vsp1_wpf.c                 |   8 +-
 18 files changed, 705 insertions(+), 532 deletions(-)
 rename drivers/media/platform/vsp1/{vsp1_bru.c => vsp1_brx.c} (63%)
 rename drivers/media/platform/vsp1/{vsp1_bru.h => vsp1_brx.h} (66%)

-- 
Regards,

Laurent Pinchart
