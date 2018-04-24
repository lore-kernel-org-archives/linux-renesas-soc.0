Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:39758 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750868AbeDXPj4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 11:39:56 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: of: Include header to define prototypes
Date: Tue, 24 Apr 2018 16:39:42 +0100
Message-Id: <20180424153942.2526-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The symbol 'rcar_du_of_init' is defined by the rcar_du_of module header,
but it is not included by the C implementation.

Include the header to correctly define the function prototypes.

Fixes the following warning:

linux/drivers/gpu/drm/rcar-du/rcar_du_of.c:319:13:
   warning: symbol 'rcar_du_of_init' was not declared. Should it be static?
    CC      drivers/gpu/drm/rcar-du/rcar_du_of.o

Fixes: 81c0e3dd8292 ("drm: rcar-du: Fix legacy DT to create LVDS encoder nodes")
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c b/drivers/gpu/drm/rcar-du/rcar_du_of.c
index 68a0b82cb17e..afef69669bb4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_of.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
@@ -18,6 +18,7 @@
 
 #include "rcar_du_crtc.h"
 #include "rcar_du_drv.h"
+#include "rcar_du_of.h"
 
 /* -----------------------------------------------------------------------------
  * Generic Overlay Handling
-- 
2.17.0
