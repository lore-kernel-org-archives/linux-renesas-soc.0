Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751534AbdHNRHk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2017 13:07:40 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [GIT PULL FOR renesas-drivers] Display List Optimizations
Date: Mon, 14 Aug 2017 18:07:35 +0100
Message-Id: <1502730455-8951-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Hi Geert,

Please consider pulling the following changes into renesas-drivers.

This series is based upon a merge of my previous pa-improvements/v4 and
airlied-drm/drm-next to base on top of all pending VSP1 changes.


The following changes since commit f44bd631453bf7dcbe57f79b924db3a6dd038bff:

  Merge remote-tracking branch 'airlied-drm/drm-next' into vsp1/next (2017-08-08 19:51:06 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/vsp1/tlb-optimise-v2

for you to fetch changes up to fa078611769415d7adbad208f1299d05bee3bda8:

  v4l: vsp1: Reduce display list body size (2017-08-14 15:58:38 +0100)

----------------------------------------------------------------
Kieran Bingham (8):
      v4l: vsp1: Protect fragments against overflow
      v4l: vsp1: Provide a fragment pool
      v4l: vsp1: Convert display lists to use new fragment pool
      v4l: vsp1: Use reference counting for fragments
      v4l: vsp1: Refactor display list configure operations
      v4l: vsp1: Adapt entities to configure into a body
      v4l: vsp1: Move video configuration to a cached dlb
      v4l: vsp1: Reduce display list body size

 drivers/media/platform/vsp1/vsp1_bru.c    |  32 ++-
 drivers/media/platform/vsp1/vsp1_clu.c    |  86 +++++---
 drivers/media/platform/vsp1/vsp1_clu.h    |   1 +
 drivers/media/platform/vsp1/vsp1_dl.c     | 331 ++++++++++++++++--------------
 drivers/media/platform/vsp1/vsp1_dl.h     |  13 +-
 drivers/media/platform/vsp1/vsp1_drm.c    |  21 +-
 drivers/media/platform/vsp1/vsp1_entity.c |  23 ++-
 drivers/media/platform/vsp1/vsp1_entity.h |  31 ++-
 drivers/media/platform/vsp1/vsp1_hgo.c    |  26 +--
 drivers/media/platform/vsp1/vsp1_hgt.c    |  28 ++-
 drivers/media/platform/vsp1/vsp1_hsit.c   |  20 +-
 drivers/media/platform/vsp1/vsp1_lif.c    |  23 +--
 drivers/media/platform/vsp1/vsp1_lut.c    |  65 ++++--
 drivers/media/platform/vsp1/vsp1_lut.h    |   1 +
 drivers/media/platform/vsp1/vsp1_pipe.c   |   8 +-
 drivers/media/platform/vsp1/vsp1_pipe.h   |   7 +-
 drivers/media/platform/vsp1/vsp1_rpf.c    | 179 ++++++++--------
 drivers/media/platform/vsp1/vsp1_sru.c    |  24 +--
 drivers/media/platform/vsp1/vsp1_uds.c    |  73 ++++---
 drivers/media/platform/vsp1/vsp1_uds.h    |   2 +-
 drivers/media/platform/vsp1/vsp1_video.c  |  82 ++++----
 drivers/media/platform/vsp1/vsp1_video.h  |   2 +
 drivers/media/platform/vsp1/vsp1_wpf.c    | 325 +++++++++++++++--------------
 23 files changed, 753 insertions(+), 650 deletions(-)
