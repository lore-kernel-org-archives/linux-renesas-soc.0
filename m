Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36423 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751638AbdKMIrA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 03:47:00 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 0/2] R-Car DU: Clip planes to screen boundaries
Date: Mon, 13 Nov 2017 10:46:58 +0200
Message-Id: <20171113084700.12076-1-laurent.pinchart+renesas@ideasonboard.com>
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

Compared to v1, fully off-screen planes are now accepted (but obviously not
shown).

The patches are based on top of Dave's latest master branch.

Kieran, I have tested this on your Salvator-X ES1.1 board using the DU test
suite. All tests pass (the suspend/resume test requires additional patches,
but that's an unrelated issue), but I can't check the display output remotely.
Would you be able to run the plane boundaries test locally and check that
everything is normal ? Please note that I've pushed a new version of that test
to the test suite repository.

Laurent Pinchart (2):
  drm: rcar-du: Share plane atomic check code between Gen2 and Gen3
  drm: rcar-du: Clip planes to screen boundaries

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |  3 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 64 ++++++++++++++++++++++++---------
 drivers/gpu/drm/rcar-du/rcar_du_plane.h |  4 +++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 32 +++++------------
 4 files changed, 61 insertions(+), 42 deletions(-)

-- 
Regards,

Laurent Pinchart
