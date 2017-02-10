Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=Wi0l=ZX=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: geert@glider.be,
	linux-renesas-soc@vger.kernel.org,
	kieran.bingham@ideasonboard.com
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [GIT PULL] v4l: vsp1: Partition phase developments
Date: Fri, 10 Feb 2017 20:36:10 +0000
Message-Id: <pull.ff94a00847faf7ed37768cea68c474926bfc8bd9.1486758696.git-series.kieran.bingham+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

The following changes since commit 0c3b6ad6a559391f367879fd4be6d2d85625bd5a:

  v4l: vsp1: Remove redundant context variables (Tue,  1 Nov 2016 15:01:02 +0000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git refs/tags/vsp1/pa-phases-2017-02-10

for you to fetch changes up to 19c6a7d542809dc814b5dfb11ba8ab737eab56f9:

  v4l: vsp1: Implement left edge partition algorithm overlap (Thu,  9 Feb 2017 22:08:34 +0000)

This work further continues my developments on the partition algorithm
for the VSP UDS and SRU components.

----------------------------------------------------------------
Kieran Bingham (8):
  v4l: vsp1: Provide UDS register updates
  v4l: vsp1: Track the SRU entity in the pipeline
  v4l: vsp1: Correct image partition parameters
  v4l: vsp1: Move partition rectangles to struct
  v4l: vsp1: Operate on partition struct data directly
  v4l: vsp1: Allow entities to participate in the partition algorithm
  v4l: vsp1: Calculate UDS phase for partitions
  v4l: vsp1: Implement left edge partition algorithm overlap

 drivers/media/platform/vsp1/vsp1_entity.h |   8 +-
 drivers/media/platform/vsp1/vsp1_pipe.c   |  22 ++++-
 drivers/media/platform/vsp1/vsp1_pipe.h   |  49 +++++++-
 drivers/media/platform/vsp1/vsp1_regs.h   |  14 ++-
 drivers/media/platform/vsp1/vsp1_rpf.c    |  40 +++---
 drivers/media/platform/vsp1/vsp1_sru.c    |  29 +++++-
 drivers/media/platform/vsp1/vsp1_uds.c    | 144 ++++++++++++++++++++++-
 drivers/media/platform/vsp1/vsp1_video.c  |  82 ++++++++-----
 drivers/media/platform/vsp1/vsp1_wpf.c    |  34 +++--
 9 files changed, 364 insertions(+), 58 deletions(-)

-- 
git-series 0.9.1
