Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38787 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751069AbdLDQlp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 11:41:45 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org,
        Mauro Carvalho Chehab <mchehab@s-opensource.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR v4.16] R-Car DU changes
Date: Mon, 04 Dec 2017 18:41:58 +0200
Message-ID: <1784882.AJy1sGis87@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dave,

The following changes since commit ca797d29cd63e7b71b4eea29aff3b1cefd1ecb59:

  Merge tag 'drm-intel-next-2017-11-17-1' of git://anongit.freedesktop.org/
drm/drm-intel into drm-next (2017-12-04 10:56:53 +1000)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git drm/next/du

for you to fetch changes up to 401712e035c699d569dbd37024f4b21dc76cc870:

  drm: rcar-du: Clip planes to screen boundaries (2017-12-04 18:38:31 +0200)

The series contains one patch that touches the V4L2 VSP driver. Mauro has 
acked it for merge through your tree, it doesn't conflict with anything 
scheduled for merge in v4.16 through Mauro's tree.

----------------------------------------------------------------
Fabrizio Castro (3):
      dt-bindings: display: rcar-du: Document R8A774[35] DU
      drm: rcar-du: Add R8A7743 support
      drm: rcar-du: Add R8A7745 support

Kieran Bingham (2):
      drm: rcar-du: Implement system suspend/resume support
      drm: rcar-du: Remove unused CRTC suspend/resume functions

Laurent Pinchart (4):
      drm: rcar-du: Don't set connector DPMS property
      v4l: vsp1: Start and stop DRM pipeline independently of planes
      drm: rcar-du: Share plane atomic check code between Gen2 and Gen3
      drm: rcar-du: Clip planes to screen boundaries

 .../devicetree/bindings/display/renesas,du.txt          | 30 +++++-----
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c                  | 38 +------------
 drivers/gpu/drm/rcar-du/rcar_du_drv.c                   | 62 +++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h                   |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c               |  4 --
 drivers/gpu/drm/rcar-du/rcar_du_plane.c                 | 75 ++++++++++++----
 drivers/gpu/drm/rcar-du/rcar_du_plane.h                 |  4 ++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c                   | 64 ++++++----------
 drivers/media/platform/vsp1/vsp1_drm.c                  | 37 ++++++++----
 9 files changed, 187 insertions(+), 128 deletions(-)

-- 
Regards,

Laurent Pinchart
