Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751015AbdKQQgK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2017 11:36:10 -0500
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: geert@glider.be, kieran.bingham@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] vsp1: TLB optimisation and DL caching
Date: Fri, 17 Nov 2017 16:36:06 +0000
Message-Id: <1510936566-14196-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Hi Geert,

Please consider this updated tag for the next renesas drivers release.

Regards

Kieran


The following changes since commit bebc6082da0a9f5d47a1ea2edc099bf671058bd4:

  Linux 4.14 (2017-11-12 10:46:13 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/vsp1/tlb-optimise/v4

for you to fetch changes up to 84592170dbe4ffdb4cc8d33aa20c23218e029ee7:

  v4l: vsp1: Reduce display list body size (2017-11-17 15:38:43 +0000)

----------------------------------------------------------------
Kieran Bingham (9):
      v4l: vsp1: Reword uses of 'fragment' as 'body'
      v4l: vsp1: Protect bodies against overflow
      v4l: vsp1: Provide a body pool
      v4l: vsp1: Convert display lists to use new body pool
      v4l: vsp1: Use reference counting for bodies
      v4l: vsp1: Refactor display list configure operations
      v4l: vsp1: Adapt entities to configure into a body
      v4l: vsp1: Move video configuration to a cached dlb
      v4l: vsp1: Reduce display list body size

 drivers/media/platform/vsp1/vsp1_bru.c    |  32 ++-
 drivers/media/platform/vsp1/vsp1_clu.c    |  94 ++++---
 drivers/media/platform/vsp1/vsp1_clu.h    |   1 +
 drivers/media/platform/vsp1/vsp1_dl.c     | 393 +++++++++++++++++-------------
 drivers/media/platform/vsp1/vsp1_dl.h     |  21 +-
 drivers/media/platform/vsp1/vsp1_drm.c    |  21 +-
 drivers/media/platform/vsp1/vsp1_entity.c |  23 +-
 drivers/media/platform/vsp1/vsp1_entity.h |  31 ++-
 drivers/media/platform/vsp1/vsp1_hgo.c    |  26 +-
 drivers/media/platform/vsp1/vsp1_hgt.c    |  28 +--
 drivers/media/platform/vsp1/vsp1_hsit.c   |  20 +-
 drivers/media/platform/vsp1/vsp1_lif.c    |  23 +-
 drivers/media/platform/vsp1/vsp1_lut.c    |  71 ++++--
 drivers/media/platform/vsp1/vsp1_lut.h    |   1 +
 drivers/media/platform/vsp1/vsp1_pipe.c   |  11 +-
 drivers/media/platform/vsp1/vsp1_pipe.h   |   7 +-
 drivers/media/platform/vsp1/vsp1_rpf.c    | 179 +++++++-------
 drivers/media/platform/vsp1/vsp1_sru.c    |  24 +-
 drivers/media/platform/vsp1/vsp1_uds.c    |  73 +++---
 drivers/media/platform/vsp1/vsp1_uds.h    |   2 +-
 drivers/media/platform/vsp1/vsp1_video.c  |  82 ++++---
 drivers/media/platform/vsp1/vsp1_video.h  |   2 +
 drivers/media/platform/vsp1/vsp1_wpf.c    | 325 ++++++++++++------------
 23 files changed, 820 insertions(+), 670 deletions(-)
