Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=HTCQ=X4=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>,
	linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [GIT PULL FOR renesas-drivers] Fix suspend/resume and race on M2M pipelines
Date: Tue, 13 Dec 2016 18:38:14 +0000
Message-Id: <1481654294-8214-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

The following changes since commit 69973b830859bc6529a7a0468ba0d80ee5117826:

  Linux 4.9 (2016-12-11 11:17:54 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git vsp1/suspend-resume-race

for you to fetch changes up to a952e0103f86d818a444923adeef50fdcb3f70b9:

  media: Catch null pipes on pipeline stop (2016-12-13 16:25:13 +0000)

----------------------------------------------------------------
Kieran Bingham (4):
      v4l: vsp1: Move vsp1_video_setup_pipeline()
      v4l: vsp1: Refactor video pipeline configuration
      v4l: vsp1: Use local display lists and remove global pipe->dl
      media: Catch null pipes on pipeline stop

 drivers/media/media-entity.c             |   2 +
 drivers/media/platform/vsp1/vsp1_drm.c   |  20 ++---
 drivers/media/platform/vsp1/vsp1_drv.c   |   4 +
 drivers/media/platform/vsp1/vsp1_pipe.c  |   1 +
 drivers/media/platform/vsp1/vsp1_pipe.h  |   4 +-
 drivers/media/platform/vsp1/vsp1_video.c | 127 +++++++++++++++----------------
 6 files changed, 79 insertions(+), 79 deletions(-)
