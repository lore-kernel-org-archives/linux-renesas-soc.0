Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39352 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751203AbdBLNMr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Feb 2017 08:12:47 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] R-Car DU fences support
Date: Sun, 12 Feb 2017 15:13:10 +0200
Message-ID: <2544319.rV1JboMAgI@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

The following changes since commit 5685cab84a6dc376a8d0e4534ae4b973546158b4:

  Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm/next/base 
(2017-02-12 13:18:50 +0200)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git drm/next/du

for you to fetch changes up to a194138cd82dff52d4c39895fd89dc6f26eafc97:

  drm: rcar-du: Use DRM core's atomic commit helper (2017-02-12 14:15:36 
+0200)

Please note that the branch is based on a merge of Dave's DRM master and the 
drm-misc master. Assuming that the 7 patches by Maarten get merged early 
enough in Dave's tree, I plan to submit a pull request for the rcar-du patches 
for v4.12.

----------------------------------------------------------------
Laurent Pinchart (4):
      drm: rcar-du: Switch to encoder .atomic_mode_set() helper function
      drm: rcar-du: Handle event when disabling CRTCs
      drm: rcar-du: Clear handled event pointer in CRTC state
      drm: rcar-du: Use DRM core's atomic commit helper

Maarten Lankhorst (7):
      drm/atomic: Add new iterators over all state, v3.
      drm/atomic: Make add_affected_connectors look at crtc_state.
      drm/atomic: Use new atomic iterator macros.
      drm/atomic: Fix atomic helpers to use the new iterator macros.
      drm/atomic: Add macros to access existing old/new state
      drm/atomic: Convert get_existing_state callers to get_old/new_state, v2.
      drm/blend: Use new atomic iterator macros.

Wolfram Sang (1):
      drm: rcar-du: Don't open code of_device_get_match_data()

 drivers/gpu/drm/drm_atomic.c              |  39 ++--
 drivers/gpu/drm/drm_atomic_helper.c       | 377 +++++++++++++++++------------
 drivers/gpu/drm/drm_blend.c               |  23 ++-
 drivers/gpu/drm/i915/intel_display.c      |  13 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    |  13 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c     |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |   8 +-
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c |   8 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  99 +---------
 include/drm/drm_atomic.h                  | 180 +++++++++++++++++-
 include/drm/drm_atomic_helper.h           |   2 +
 11 files changed, 466 insertions(+), 298 deletions(-)

-- 
Regards,

Laurent Pinchart
