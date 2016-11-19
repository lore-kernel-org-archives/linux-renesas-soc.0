Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55160 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752694AbcKSD2K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 22:28:10 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 05/13] drm: panels: Constify device node argument to of_drm_find_panel()
Date: Sat, 19 Nov 2016 05:28:05 +0200
Message-Id: <1479526093-7014-6-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The argument is never modified by the function, make it const.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_panel.c | 2 +-
 include/drm/drm_panel.h     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 3dfe3c886502..308d442a531b 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -137,7 +137,7 @@ EXPORT_SYMBOL(drm_panel_detach);
  * Return: A pointer to the panel registered for the specified device tree
  * node or NULL if no panel matching the device tree node can be found.
  */
-struct drm_panel *of_drm_find_panel(struct device_node *np)
+struct drm_panel *of_drm_find_panel(const struct device_node *np)
 {
 	struct drm_panel *panel;
 
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 220d1e2b3db1..4b76cf2d5a7b 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -193,9 +193,9 @@ int drm_panel_attach(struct drm_panel *panel, struct drm_connector *connector);
 int drm_panel_detach(struct drm_panel *panel);
 
 #ifdef CONFIG_OF
-struct drm_panel *of_drm_find_panel(struct device_node *np);
+struct drm_panel *of_drm_find_panel(const struct device_node *np);
 #else
-static inline struct drm_panel *of_drm_find_panel(struct device_node *np)
+static inline struct drm_panel *of_drm_find_panel(const struct device_node *np)
 {
 	return NULL;
 }
-- 
Regards,

Laurent Pinchart
