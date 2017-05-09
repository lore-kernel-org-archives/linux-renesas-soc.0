Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:44974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752737AbdEIQqR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2017 12:46:17 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [GIT PULL FOR renesas-drivers] 
Date: Tue,  9 May 2017 17:46:12 +0100
Message-Id: <1494348372-18117-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Hi Geert,

The following changes since commit 13e0988140374123bead1dd27c287354cb95108e:

  docs: complete bumping minimal GNU Make version to 3.81 (2017-05-06 18:49:09 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/submissions/vsp1/writeback/v3

for you to fetch changes up to 5debeb08338b520f52577ca6cf9be815a54c07ea:

  v4l: vsp1: Provide a writeback video device (2017-05-08 15:06:58 +0100)

----------------------------------------------------------------
v4l: vsp1: vsp1 writeback prototype

This short series extends the VSP1 on the RCar platforms to allow creating a
V4L2 video node on display pipelines where the hardware allows writing to
memory simultaneously.

In this instance, the hardware restricts the output to match the display size
(no rescaling) but does allow pixel format conversion.

A current limitation (that the DRI devs might have ideas about) is that the vb2
buffers are swapped on the atomic_flush() calls rather than on vsync events.

Ideally swapping buffers would occur on every vsync such that the output rate
of the video node would match the display rate, however the timing here proves
more difficult to synchronise the updates from a vsync and flush without adding
latency to the flush.

Is there anything I can do to synchronise the v4l2 buffers with the DRM/KMS
interfaces currently? Or does anyone have any suggestions for extending as
such?

And of course ideas on anything that could be done generically to support other
targets as well would be worth considering - though currently this
implementation is very RCar/VSP1 specific.

v3:
 - Rebased to v4.12-rc1

v2:
 - Fix checkpatch.pl warnings
 - Adapt to use a single source pad for the Writeback and LIF
 - Use WPF properties to determine when to create links instead of VSP
 - Remove incorrect vsp1_video_verify_format() changes
 - Spelling and grammar fixes

----------------------------------------------------------------
Kieran Bingham (2):
      Revert "[media] v4l: vsp1: Supply frames to the DU continuously"
      v4l: vsp1: Provide a writeback video device

 drivers/media/platform/vsp1/vsp1.h       |   1 +
 drivers/media/platform/vsp1/vsp1_drm.c   |  18 ++++
 drivers/media/platform/vsp1/vsp1_drv.c   |   5 +-
 drivers/media/platform/vsp1/vsp1_rwpf.h  |   1 +
 drivers/media/platform/vsp1/vsp1_video.c | 161 ++++++++++++++++++++++++++++---
 drivers/media/platform/vsp1/vsp1_video.h |   5 +
 drivers/media/platform/vsp1/vsp1_wpf.c   |  19 +++-
 7 files changed, 192 insertions(+), 18 deletions(-)
