Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60146 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752398AbdCFBYk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Mar 2017 20:24:40 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: [GIT PULL FOR renesas-drivers] DU + VSP display flicker fixes
Date: Mon, 06 Mar 2017 03:14:23 +0200
Message-ID: <1733929.kTfEm8KghY@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

(Resending with the linux-renesas-soc mailing list CC'ed, sorry about the 
trouble)

The following changes since commit a10afcaf9d180e2cc1dff623081e12fe5275fd38:

  Merge branch 'vsp1/next' into HEAD (2017-03-05 01:55:06 +0200)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-next-du-vsp-v3-20170305

for you to fetch changes up to 6208a2aec17b45be0d10921135c112c57138bca0:

  drm: rcar-du: Register a completion callback with VSP1 (2017-03-06 03:05:58 
+0200)

----------------------------------------------------------------
Kieran Bingham (4):
      v4l: vsp1: Adapt vsp1_du_setup_lif() interface to use a structure
      v4l: vsp1: Postpone frame end handling in event of display list race
      v4l: vsp1: Extend VSP1 module API to allow DRM callbacks
      drm: rcar-du: Register a completion callback with VSP1

Laurent Pinchart (1):
      drm: rcar-du: Arm the page flip event after queuing the page flip

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 30 ++++++++++++++-----------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 17 ++++++++++++--
 drivers/media/platform/vsp1/vsp1_dl.c   | 19 ++++++++++++++--
 drivers/media/platform/vsp1/vsp1_dl.h   |  2 +-
 drivers/media/platform/vsp1/vsp1_drm.c  | 50 ++++++++++++++++++++------------
 drivers/media/platform/vsp1/vsp1_drm.h  | 11 +++++++++
 drivers/media/platform/vsp1/vsp1_pipe.c | 13 ++++++++++-
 include/media/vsp1.h                    | 20 +++++++++++++++--
 9 files changed, 125 insertions(+), 38 deletions(-)

-- 
Regards,

Laurent Pinchart
