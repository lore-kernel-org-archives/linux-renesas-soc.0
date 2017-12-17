Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:50557 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756922AbdLQAR4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Dec 2017 19:17:56 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL for renesas-drivers] Display color keying support for Gen3
Date: Sun, 17 Dec 2017 02:18:05 +0200
Message-ID: <5151514.osXWQNHT4Q@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

The following changes since commit 9428088c90b6f7d5edd2a1b0d742c75339b36f6e:

  drm/qxl: reapply cursor after resetting primary (2017-12-08 13:37:02 +1000)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-next-colorkey-v1-20171215

for you to fetch changes up to 3e6d38e62e3542a8d5f93773ef42f2d0920d9629:

  drm: rcar-du: Add support for color keying on Gen3 (2017-12-17 01:44:29 
+0200)

----------------------------------------------------------------
Alexandru Gheorghe (1):
      v4l: vsp1: Add support for colorkey alpha blending

Laurent Pinchart (3):
      drm: Add colorkey properties
      drm: rcar-du: Use standard colorkey properties
      drm: rcar-du: Add support for color keying on Gen3

 drivers/gpu/drm/drm_atomic.c            |  16 ++++++
 drivers/gpu/drm/drm_blend.c             | 108 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_plane.c |  60 +++++++++++++++-------
 drivers/gpu/drm/rcar-du/rcar_du_plane.h |   2 -
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   |  17 ++++++-
 drivers/media/platform/vsp1/vsp1_drm.c  |   3 ++
 drivers/media/platform/vsp1/vsp1_rpf.c  |  10 +++-
 drivers/media/platform/vsp1/vsp1_rwpf.h |   5 ++
 include/drm/drm_blend.h                 |   4 ++
 include/drm/drm_plane.h                 |  28 ++++++++++-
 include/media/vsp1.h                    |   5 ++
 11 files changed, 235 insertions(+), 23 deletions(-)
-- 
Regards,

Laurent Pinchart
