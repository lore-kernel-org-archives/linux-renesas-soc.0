Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:47523 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751264AbdEPXUE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 May 2017 19:20:04 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/5] v4l: rcar-fcp: Don't get/put module reference
Date: Wed, 17 May 2017 02:20:03 +0300
Message-Id: <20170516232007.20980-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170516232007.20980-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170516232007.20980-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Direct callers of the FCP API hold a reference to the FCP module due to
module linkage, there's no need to take another one manually. Take a
reference to the device instead to ensure that it won't disappear behind
the caller's back.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar-fcp.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
index 7146fc5ef168..e9f609edf513 100644
--- a/drivers/media/platform/rcar-fcp.c
+++ b/drivers/media/platform/rcar-fcp.c
@@ -53,14 +53,7 @@ struct rcar_fcp_device *rcar_fcp_get(const struct device_node *np)
 		if (fcp->dev->of_node != np)
 			continue;
 
-		/*
-		 * Make sure the module won't be unloaded behind our back. This
-		 * is a poor man's safety net, the module should really not be
-		 * unloaded while FCP users can be active.
-		 */
-		if (!try_module_get(fcp->dev->driver->owner))
-			fcp = NULL;
-
+		get_device(fcp->dev);
 		goto done;
 	}
 
@@ -81,7 +74,7 @@ EXPORT_SYMBOL_GPL(rcar_fcp_get);
 void rcar_fcp_put(struct rcar_fcp_device *fcp)
 {
 	if (fcp)
-		module_put(fcp->dev->driver->owner);
+		put_device(fcp->dev);
 }
 EXPORT_SYMBOL_GPL(rcar_fcp_put);
 
-- 
Regards,

Laurent Pinchart
