Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:39156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S938636AbcKNURt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 15:17:49 -0500
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [GIT PULL FOR renesas-drivers] VSP Writeback prototype
Date: Mon, 14 Nov 2016 20:17:38 +0000
Message-Id: <1479154658-28558-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Hi Geert,

The following changes since commit 8bc55e5947b58dee3c8b126d7c303991ae0db130:

  tty: serial_core: Fix serial console crash on port shutdown (2016-10-25 13:53:49 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/vsp1/writeback/v2

for you to fetch changes up to 7ce3d143d5c287e5786b3471c32112363bcbdca2:

  v4l: vsp1: Provide a writeback video device (2016-11-03 10:34:29 +0000)

This implementation of a writeback video node allows frames to be
captured from the display pipeline using standard V4L2 calls.

----------------------------------------------------------------
Kieran Bingham (2):
      Revert "[media] v4l: vsp1: Supply frames to the DU continuously"
      v4l: vsp1: Provide a writeback video device

 drivers/media/platform/vsp1/vsp1.h       |   1 +
 drivers/media/platform/vsp1/vsp1_drm.c   |  19 ++++
 drivers/media/platform/vsp1/vsp1_drv.c   |   5 +-
 drivers/media/platform/vsp1/vsp1_rwpf.h  |   1 +
 drivers/media/platform/vsp1/vsp1_video.c | 161 ++++++++++++++++++++++++++++---
 drivers/media/platform/vsp1/vsp1_video.h |   5 +
 drivers/media/platform/vsp1/vsp1_wpf.c   |  19 +++-
 7 files changed, 193 insertions(+), 18 deletions(-)
