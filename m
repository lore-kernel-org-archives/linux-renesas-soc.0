Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran@bingham.xyz>
From: Kieran Bingham <kieran@bingham.xyz>
To: geert@linux-m68k.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran@bingham.xyz>
Subject: [PULL REQUEST] VSP1 Image Partitioning algorithm
Date: Wed, 14 Sep 2016 17:45:10 +0100
Message-Id: <1473871510-13807-1-git-send-email-kieran@bingham.xyz>
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Please consider integrating the latest VSP1 next branch to provide the
image partitioning algorithm into renesas-drivers

Regards

Kieran


The following changes since commit c3b809834db8b1a8891c7ff873a216eac119628d:

  [media] pulse8-cec: fix compiler warning (2016-09-12 06:42:44 -0300)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git vsp1/next

for you to fetch changes up to 9f39e31fbb3fb6ebd75d7012d3574def2f5da596:

  v4l: vsp1: Fix spinlock in mixed IRQ context function (2016-09-14 13:06:51 +0300)

----------------------------------------------------------------
Kieran Bingham (6):
      v4l: vsp1: Ensure pipeline locking in resume path
      v4l: vsp1: Repair race between frame end and qbuf handler
      v4l: vsp1: Use DFE instead of FRE for frame end
      v4l: vsp1: Support chained display lists
      v4l: vsp1: Determine partition requirements for scaled images
      v4l: vsp1: Support multiple partitions per frame

Laurent Pinchart (8):
      v4l: vsp1: Prevent pipelines from running when not streaming
      v4l: vsp1: Protect against race conditions between get and set format
      v4l: vsp1: Disable cropping on WPF sink pad
      v4l: vsp1: Fix RPF cropping
      v4l: vsp1: Pass parameter type to entity configuration operation
      v4l: vsp1: Replace .set_memory() with VSP1_ENTITY_PARAMS_PARTITION
      v4l: vsp1: wpf: Implement rotation support
      v4l: vsp1: Fix spinlock in mixed IRQ context function

 drivers/media/platform/vsp1/vsp1_bru.c    |  33 +++-
 drivers/media/platform/vsp1/vsp1_clu.c    |  61 ++++---
 drivers/media/platform/vsp1/vsp1_dl.c     | 119 +++++++++++--
 drivers/media/platform/vsp1/vsp1_dl.h     |   1 +
 drivers/media/platform/vsp1/vsp1_drm.c    |  15 +-
 drivers/media/platform/vsp1/vsp1_drv.c    |   2 +-
 drivers/media/platform/vsp1/vsp1_entity.c |  22 ++-
 drivers/media/platform/vsp1/vsp1_entity.h |  25 ++-
 drivers/media/platform/vsp1/vsp1_hsit.c   |  20 ++-
 drivers/media/platform/vsp1/vsp1_lif.c    |  20 ++-
 drivers/media/platform/vsp1/vsp1_lut.c    |  42 +++--
 drivers/media/platform/vsp1/vsp1_pipe.c   |   3 +
 drivers/media/platform/vsp1/vsp1_pipe.h   |   8 +
 drivers/media/platform/vsp1/vsp1_rpf.c    | 106 ++++++++----
 drivers/media/platform/vsp1/vsp1_rwpf.c   |  86 +++++----
 drivers/media/platform/vsp1/vsp1_rwpf.h   |  16 +-
 drivers/media/platform/vsp1/vsp1_sru.c    |  50 +++++-
 drivers/media/platform/vsp1/vsp1_uds.c    |  71 ++++++--
 drivers/media/platform/vsp1/vsp1_video.c  | 188 ++++++++++++++++++--
 drivers/media/platform/vsp1/vsp1_wpf.c    | 279 ++++++++++++++++++++++--------
 20 files changed, 883 insertions(+), 284 deletions(-)
