Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:56070 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbeHTB0Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 19 Aug 2018 21:26:25 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update tree location for the Renesas DRM drivers
Date: Mon, 20 Aug 2018 01:14:13 +0300
Message-Id: <20180819221413.1031-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The fbdev git tree referenced in the MAINTAINERS file doesn't exist
anymore. Update the location to point to the new git tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b2bf134964e..6a418ce09853 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4782,7 +4782,7 @@ DRM DRIVERS FOR RENESAS
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-renesas-soc@vger.kernel.org
-T:	git git://linuxtv.org/pinchartl/fbdev
+T:	git git://linuxtv.org/pinchartl/media drm/du/next
 S:	Supported
 F:	drivers/gpu/drm/rcar-du/
 F:	drivers/gpu/drm/shmobile/
-- 
Regards,

Laurent Pinchart
