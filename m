Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59562 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752072AbdKZLaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 26 Nov 2017 06:30:25 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 0/2] R-Car DU: Clip planes to screen boundaries
Date: Sun, 26 Nov 2017 13:30:20 +0200
Message-Id: <20171126113022.27808-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series fixes support for planes that cross the screen boundaries.
The KMS API supports such a configuration, but the DU and VSP hardware
doesn't. This leads to different kind of dispay artifacts or hangs.

The series starts with a bit of refactoring to share existing code and make it
easier to share new code. The second patch then clips planes that are either
partially or fully off-screen, disabling planes that end up being completely
invisible.

Compared to v2, the series has been rebased on top of the latest drm+drm-misc
to benefit from Ville's rework of the plane state check helper, and now
actually uses the clipped source and destination rectangles (and hence passes
the tests).

Compared to v1, fully off-screen planes are now accepted (but obviously not
shown).

The patches are based on top of Dave's latest master branch.

The series has been tested on a Salvator-XS board.

Laurent Pinchart (2):
  drm: rcar-du: Share plane atomic check code between Gen2 and Gen3
  drm: rcar-du: Clip planes to screen boundaries

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |  3 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 75 +++++++++++++++++++++++----------
 drivers/gpu/drm/rcar-du/rcar_du_plane.h |  4 ++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 64 +++++++++++-----------------
 4 files changed, 83 insertions(+), 63 deletions(-)

-- 
Regards,

Laurent Pinchart
