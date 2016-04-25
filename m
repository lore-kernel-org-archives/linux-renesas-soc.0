Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Airlie <airlied@linux.ie>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: rcar: remove unused variable
Date: Mon, 25 Apr 2016 15:11:08 +0200
Message-Id: <1461589881-1394495-1-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

A cleanup for the rcar-du driver left an unused variable behind:

drm/rcar-du/rcar_du_drv.c: In function 'rcar_du_probe':
drm/rcar-du/rcar_du_drv.c:300:24: error: unused variable 'connector' [-Werror=unused-variable]

This removes the variable.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: d63c25e4245a ("drm: rcar-du: Use generic drm_connector_register_all() helper")
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 0f251dc11082..fb9242d27883 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -297,7 +297,6 @@ static int rcar_du_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct rcar_du_device *rcdu;
-	struct drm_connector *connector;
 	struct drm_device *ddev;
 	struct resource *mem;
 	int ret;
-- 
2.7.0
