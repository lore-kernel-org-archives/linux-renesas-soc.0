Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38510 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751944AbdHOXDR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2017 19:03:17 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/3] R-Car DU: Clip planes to screen boundaries
Date: Wed, 16 Aug 2017 02:03:35 +0300
Message-Id: <20170815230338.14913-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series fixes support for planes that cross the screen boundaries.
The KMS API supports such a configuration, but the DU and VSP hardware
doesn't. This leads to different kind of dispay artifacts or hangs.

The series starts with a bit of refactoring to share existing code and make it
easier to share new code (1/3). Patch 2/3 then reject planes that are fully
off-screen as they don't work properly and we have currently no use case for
them. Finally, patch 3/3 clips planes to screen boundaries to fix the main
issue.

The patches are based on top of Dave's latest master branch.

Laurent Pinchart (3):
  drm: rcar-du: Share plane atomic check code between Gen2 and Gen3
  drm: rcar-du: Reject planes located fully off-screen
  drm: rcar-du: Clip planes to screen boundaries

 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 109 ++++++++++++++++++++++++--------
 drivers/gpu/drm/rcar-du/rcar_du_plane.h |   8 +++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   |  43 ++++---------
 3 files changed, 105 insertions(+), 55 deletions(-)

-- 
Regards,

Laurent Pinchart
