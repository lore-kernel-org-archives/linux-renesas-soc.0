Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:39016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S938636AbcKNURc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 15:17:32 -0500
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [GIT PULL FOR renesas-drivers] VSP Partition algorithm improvements
Date: Mon, 14 Nov 2016 20:17:24 +0000
Message-Id: <1479154644-28475-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Hi Geert,

The following changes since commit 8bc55e5947b58dee3c8b126d7c303991ae0db130:

  tty: serial_core: Fix serial console crash on port shutdown (2016-10-25 13:53:49 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/vsp1/pa-improvements/v1

for you to fetch changes up to 97ec8cd22aae933399b84b1a84eedcc48ad35eb8:

  v4l: vsp1: Remove redundant context variables (2016-11-14 18:49:57 +0000)

This tag contains some improvements to the performance of the partition
algorithm by moving the calculations to the stream on calls, instead of
calculating each partition in every frame during interrupt context.

----------------------------------------------------------------
Kieran Bingham (4):
      v4l: vsp1: Implement partition algorithm restrictions
      v4l: vsp1: Move vsp1_video_pipeline_setup_partitions() function
      v4l: vsp1: Calculate partition sizes at stream start.
      v4l: vsp1: Remove redundant context variables

 drivers/media/platform/vsp1/vsp1_pipe.h  |  10 ++-
 drivers/media/platform/vsp1/vsp1_sru.c   |   7 +-
 drivers/media/platform/vsp1/vsp1_sru.h   |   1 +
 drivers/media/platform/vsp1/vsp1_video.c | 124 +++++++++++++++++++------------
 4 files changed, 89 insertions(+), 53 deletions(-)
