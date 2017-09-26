Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54385 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965482AbdIZKGV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:21 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id A5EE92150A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:06 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC 10/13] v4l: rcar-fcp: Prepare driver API for FCNL support
Date: Tue, 26 Sep 2017 13:06:02 +0300
Message-Id: <20170926100605.2313-13-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

To support transparent FCNL decompression the FCP users will need to use
different bus master devices for compressed and uncompressed formats.
Rename the rcar_fcp_get_device() function to rcar_fcp_get_bus_master()
and add a new argument to select the bus master in order to prepare for
that change.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar-fcp.c      | 29 +++++++++++++++++++++++++++--
 drivers/media/platform/vsp1/vsp1_drv.c |  4 +++-
 include/media/rcar-fcp.h               | 14 ++++++++++++--
 3 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
index e93e9c4227d9..ca5e1dddba03 100644
--- a/drivers/media/platform/rcar-fcp.c
+++ b/drivers/media/platform/rcar-fcp.c
@@ -145,11 +145,36 @@ void rcar_fcp_put(struct rcar_fcp_device *fcp)
 }
 EXPORT_SYMBOL_GPL(rcar_fcp_put);
 
-struct device *rcar_fcp_get_device(struct rcar_fcp_device *fcp)
+/**
+ * rcar_fcp_get_bus_master - Get the FCP bus master device
+ * @fcp: the FCP device
+ * @format: the data format handled by the bus master
+ *
+ * The FCP performs read and write bus mastering operations for image data and
+ * display lists. This function returns a &struct device that the FCP user can
+ * use for DMA memory allocation.
+ *
+ * When @format is RCAR_FCP_UNCOMPRESSED, the returned bus master will perform
+ * normal read accesses. This bus master is guaranteed to always be available.
+ *
+ * Otherwise, the returned bus master will perform transparent FCNL
+ * decompression of data on read accesses for the specified @format. It must
+ * thus be used for FCNL-compressed image data only. Not all FCP instances
+ * support FCNL decompression, this function may return NULL in that case.
+ *
+ * The returned device borrows a reference from the FCP device. The borrowed
+ * reference doesn't need to be released, and shall not be accessed once the
+ * caller releases its reference to the FCP with rcar_fcp_put().
+ *
+ * Return the bus master &struct device for the given purpose, or NULL if no bus
+ * master is available.
+ */
+struct device *rcar_fcp_get_bus_master(struct rcar_fcp_device *fcp,
+				       enum rcar_fcp_data_format format)
 {
 	return fcp->dev;
 }
-EXPORT_SYMBOL_GPL(rcar_fcp_get_device);
+EXPORT_SYMBOL_GPL(rcar_fcp_get_bus_master);
 
 /**
  * rcar_fcp_enable - Enable an FCP
diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index 962e4c304076..4253a76cc484 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -809,7 +809,9 @@ static int vsp1_probe(struct platform_device *pdev)
 		 * for the VSP and must thus be used in place of the VSP device
 		 * to map DMA buffers.
 		 */
-		vsp1->bus_master = rcar_fcp_get_device(vsp1->fcp);
+		vsp1->bus_master =
+			rcar_fcp_get_bus_master(vsp1->fcp,
+						RCAR_FCP_UNCOMPRESSED);
 	} else {
 		vsp1->bus_master = vsp1->dev;
 	}
diff --git a/include/media/rcar-fcp.h b/include/media/rcar-fcp.h
index b60a7b176c37..dffffddf8ff3 100644
--- a/include/media/rcar-fcp.h
+++ b/include/media/rcar-fcp.h
@@ -16,10 +16,18 @@
 struct device_node;
 struct rcar_fcp_device;
 
+enum rcar_fcp_data_format {
+	RCAR_FCP_UNCOMPRESSED,
+	RCAR_FCP_FCNL_YUV_PLANAR,
+	RCAR_FCP_FCNL_YUV_PACKED,
+	RCAR_FCP_FCNL_RGB,
+};
+
 #if IS_ENABLED(CONFIG_VIDEO_RENESAS_FCP)
 struct rcar_fcp_device *rcar_fcp_get(const struct device_node *np);
 void rcar_fcp_put(struct rcar_fcp_device *fcp);
-struct device *rcar_fcp_get_device(struct rcar_fcp_device *fcp);
+struct device *rcar_fcp_get_bus_master(struct rcar_fcp_device *fcp,
+				       enum rcar_fcp_data_format format);
 int rcar_fcp_enable(struct rcar_fcp_device *fcp);
 void rcar_fcp_disable(struct rcar_fcp_device *fcp);
 #else
@@ -28,7 +36,9 @@ static inline struct rcar_fcp_device *rcar_fcp_get(const struct device_node *np)
 	return ERR_PTR(-ENOENT);
 }
 static inline void rcar_fcp_put(struct rcar_fcp_device *fcp) { }
-static inline struct device *rcar_fcp_get_device(struct rcar_fcp_device *fcp)
+static inline struct device *
+rcar_fcp_get_bus_master(struct rcar_fcp_device *fcp,
+			enum rcar_fcp_data_format format)
 {
 	return NULL;
 }
-- 
Regards,

Laurent Pinchart
