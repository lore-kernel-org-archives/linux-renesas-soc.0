Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751294AbdGQKwt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2017 06:52:49 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: geert@glider.be
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: [PULL REQUEST: Renesas Drivers] vsp1/pa-improvements (v2)
Date: Mon, 17 Jul 2017 11:52:45 +0100
Message-Id: <1500288765-25463-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Please consider the following for integration in Renesas Drivers

This branch (based on a vanilla v4.13-rc1) has been tested successfully on a
Salvator-X (ES 1.0) and Salvator-XS (ES 2.0) (with 5 iterations of the tests
each)


The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/kbingham/rcar.git vsp1/pa-improvements/v2

for you to fetch changes up to 0bc6b19d31e26b4ee0b5cddff249a9b9493a5d7f:

  v4l: vsp1: Allow entities to participate in the partition algorithm (2017-07-17 09:53:18 +0100)

----------------------------------------------------------------
Kieran Bingham (6):
      v4l: vsp1: Move vsp1_video_pipeline_setup_partitions() function
      v4l: vsp1: Calculate partition sizes at stream start.
      v4l: vsp1: Remove redundant context variables
      v4l: vsp1: Move partition rectangles to struct and operate directly
      v4l: vsp1: Provide UDS register updates
      v4l: vsp1: Allow entities to participate in the partition algorithm

 drivers/media/platform/vsp1/vsp1_entity.h |   8 ++
 drivers/media/platform/vsp1/vsp1_pipe.c   |  22 ++++
 drivers/media/platform/vsp1/vsp1_pipe.h   |  48 ++++++++-
 drivers/media/platform/vsp1/vsp1_regs.h   |  14 +++
 drivers/media/platform/vsp1/vsp1_rpf.c    |  31 +++---
 drivers/media/platform/vsp1/vsp1_sru.c    |  30 ++++++
 drivers/media/platform/vsp1/vsp1_uds.c    |  43 +++++++-
 drivers/media/platform/vsp1/vsp1_video.c  | 163 +++++++++++++++++-------------
 drivers/media/platform/vsp1/vsp1_wpf.c    |  33 ++++--
 9 files changed, 289 insertions(+), 103 deletions(-)
