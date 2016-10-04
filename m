Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:48761 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753103AbcJDMbr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 08:31:47 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 0/6] R-Car DU fixes and cleanups
Date: Tue,  4 Oct 2016 15:31:33 +0300
Message-Id: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series contains five simple cleanups and fixes for the rcar-du-drm
driver, as well as an argument constification patch for video/of.

The patches themselves are straightforward, see individual commit messages for
details. Patch 2/6 (normally merged through the DRM tree) depends on patch 1/6
(normally merged through the fbdev tree). As they don't conflict with patches
3/6 to 6/6, we can either merge the whole series through the DRM tree, or
merge patches 1/6 and 2/6 through the fbdev tree and the rest through the DRM
tree.

My preference would go for merging the whole series through the DRM tree to
avoid potential conflicts with the other patches I'm working on for v4.10.
There is no foreseen conflict at the moment, but I might rework encoder
handling in the driver that could possibly result in a conflict. Dave, Tomi,
any preference ? If you're fine with patches not going through your tree,
could you please ack them ?

Cc: David Airlie <airlied@linux.ie>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>

Laurent Pinchart (6):
  video: of: Constify node argument to display timing functions
  drm: rcar-du: Constify node argument to rcar_du_lvds_connector_init()
  drm: rcar-du: Bring HDMI encoder comments in line with the driver
  drm: rcar-du: Remove test for impossible error condition
  drm: rcar-du: Remove memory allocation error message
  drm: rcar-du: Fix crash in encoder failure error path

 drivers/gpu/drm/rcar-du/rcar_du_drv.c     |  6 ------
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c |  4 ++--
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 10 +++++-----
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c |  4 +---
 drivers/video/of_display_timing.c         |  6 +++---
 include/video/of_display_timing.h         | 15 ++++++++-------
 8 files changed, 21 insertions(+), 28 deletions(-)

-- 
Regards,

Laurent Pinchart
