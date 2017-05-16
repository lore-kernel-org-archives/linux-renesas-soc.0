Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:47526 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751394AbdEPXUG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 May 2017 19:20:06 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/5] v4l: rcar-fcp: Add an API to retrieve the FCP device
Date: Wed, 17 May 2017 02:20:04 +0300
Message-Id: <20170516232007.20980-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170516232007.20980-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170516232007.20980-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The new rcar_fcp_get_device() function retrieves the struct device
related to the FCP device. This is useful to handle DMA mapping through
the right device.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar-fcp.c | 6 ++++++
 include/media/rcar-fcp.h          | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
index e9f609edf513..2988031d285d 100644
--- a/drivers/media/platform/rcar-fcp.c
+++ b/drivers/media/platform/rcar-fcp.c
@@ -78,6 +78,12 @@ void rcar_fcp_put(struct rcar_fcp_device *fcp)
 }
 EXPORT_SYMBOL_GPL(rcar_fcp_put);
 
+struct device *rcar_fcp_get_device(struct rcar_fcp_device *fcp)
+{
+	return fcp->dev;
+}
+EXPORT_SYMBOL_GPL(rcar_fcp_get_device);
+
 /**
  * rcar_fcp_enable - Enable an FCP
  * @fcp: The FCP instance
diff --git a/include/media/rcar-fcp.h b/include/media/rcar-fcp.h
index 8723f05c6321..b60a7b176c37 100644
--- a/include/media/rcar-fcp.h
+++ b/include/media/rcar-fcp.h
@@ -19,6 +19,7 @@ struct rcar_fcp_device;
 #if IS_ENABLED(CONFIG_VIDEO_RENESAS_FCP)
 struct rcar_fcp_device *rcar_fcp_get(const struct device_node *np);
 void rcar_fcp_put(struct rcar_fcp_device *fcp);
+struct device *rcar_fcp_get_device(struct rcar_fcp_device *fcp);
 int rcar_fcp_enable(struct rcar_fcp_device *fcp);
 void rcar_fcp_disable(struct rcar_fcp_device *fcp);
 #else
@@ -27,6 +28,10 @@ static inline struct rcar_fcp_device *rcar_fcp_get(const struct device_node *np)
 	return ERR_PTR(-ENOENT);
 }
 static inline void rcar_fcp_put(struct rcar_fcp_device *fcp) { }
+static inline struct device *rcar_fcp_get_device(struct rcar_fcp_device *fcp)
+{
+	return NULL;
+}
 static inline int rcar_fcp_enable(struct rcar_fcp_device *fcp)
 {
 	return 0;
-- 
Regards,

Laurent Pinchart
