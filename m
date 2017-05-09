Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:41458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753448AbdEINFf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2017 09:05:35 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [GIT PULL FOR renesas-drivers] v4l: vsp1: Suspend/resume on M2M pipelines
Date: Tue,  9 May 2017 14:05:28 +0100
Message-Id: <1494335128-30563-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Hi Geert,

The following changes since commit 13e0988140374123bead1dd27c287354cb95108e:

  docs: complete bumping minimal GNU Make version to 3.81 (2017-05-06 18:49:09 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/submissions/vsp1/suspend-resume/v5

for you to fetch changes up to 24697ebba024a6375ff2e793203296c70112537e:

  v4l: vsp1: Repair suspend resume operations for video pipelines (2017-05-08 15:20:58 +0100)

----------------------------------------------------------------
v4l: vsp1: Fix suspend/resume and race on M2M pipelines

This small patchset helps rework the VSP1 driver to repair an issue on
suspend/resume operations whereby the pipeline does not get reconfigured after
it has been re-initialised following a resume operation.

Patch [1/2] is a code move only, with no functional change.
Patch [2/2] fixes the suspend/resume operations for video pipelines by marking
            the new pipe configured flag as false, and configuring the pipe
            during the vsp1_video_pipeline_run() call.

v5:
 - Rebased for v4.12-rc1
 - Dropped two patches from v4 as they are integrated already:
    - BRU streamon race
    - DRM scoped pipe->dl removal

v4:
 - Rework and separate out the BRU race back to v1 style implementation
 - Split BRU race and Suspend Resume fixes into separate commits.

v3:
 - Move configured=false from vsp1_device_init to vsp1_reset_wpf()
 - Clean up flag dereferencing with a local struct *

v2:
 - Refactor video pipeline configuration implementation to solve both suspend
   resume and the VSP BRU race in a single change

v1:
 - Original pipeline configuration rework

----------------------------------------------------------------
Kieran Bingham (2):
      v4l: vsp1: Move vsp1_video_setup_pipeline()
      v4l: vsp1: Repair suspend resume operations for video pipelines

 drivers/media/platform/vsp1/vsp1_drv.c   |   4 +
 drivers/media/platform/vsp1/vsp1_pipe.c  |   1 +
 drivers/media/platform/vsp1/vsp1_pipe.h  |   4 +-
 drivers/media/platform/vsp1/vsp1_video.c | 123 ++++++++++++++-----------------
 4 files changed, 64 insertions(+), 68 deletions(-)
