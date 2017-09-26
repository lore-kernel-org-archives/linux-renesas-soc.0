Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54386 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965536AbdIZKGV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:21 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id D9F692021B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:06 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC 11/13] v4l: rcar-fcp: Support FCNL decompression
Date: Tue, 26 Sep 2017 13:06:03 +0300
Message-Id: <20170926100605.2313-14-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Create child devices associated with the lossy decompression reserved
memory areas and return them as decompression bus masters.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar-fcp.c | 165 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 161 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
index ca5e1dddba03..445094f6a25e 100644
--- a/drivers/media/platform/rcar-fcp.c
+++ b/drivers/media/platform/rcar-fcp.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
@@ -70,12 +71,21 @@ enum rcar_fcp_type {
 	RCAR_FCPVI,
 };
 
+/**
+ * struct rcar_fcp_device - FCP device private data
+ * @list: list entry in the fcp_devices list
+ * @dev: physical (platform) device for the FCP
+ * @type: FCP device type (FCPF, FCPV, FCPVI)
+ * @mmio: memory-mapped I/O registers base
+ * @bus_masters: devices used for lossy decompression memory allocation
+ */
 struct rcar_fcp_device {
 	struct list_head list;
 	struct device *dev;
 
 	enum rcar_fcp_type type;
 	void __iomem *mmio;
+	struct device *bus_masters[4];
 };
 
 static LIST_HEAD(fcp_devices);
@@ -113,6 +123,7 @@ static void rcar_fcp_write(struct rcar_fcp_device *fcp, unsigned int reg,
 struct rcar_fcp_device *rcar_fcp_get(const struct device_node *np)
 {
 	struct rcar_fcp_device *fcp;
+	unsigned int i;
 
 	mutex_lock(&fcp_lock);
 
@@ -120,7 +131,8 @@ struct rcar_fcp_device *rcar_fcp_get(const struct device_node *np)
 		if (fcp->dev->of_node != np)
 			continue;
 
-		get_device(fcp->dev);
+		for (i = 0; i < ARRAY_SIZE(fcp->bus_masters); ++i)
+			get_device(fcp->bus_masters[i]);
 		goto done;
 	}
 
@@ -140,8 +152,12 @@ EXPORT_SYMBOL_GPL(rcar_fcp_get);
  */
 void rcar_fcp_put(struct rcar_fcp_device *fcp)
 {
-	if (fcp)
-		put_device(fcp->dev);
+	unsigned int i;
+
+	if (fcp) {
+		for (i = 0; i < ARRAY_SIZE(fcp->bus_masters); ++i)
+			get_device(fcp->bus_masters[i]);
+	}
 }
 EXPORT_SYMBOL_GPL(rcar_fcp_put);
 
@@ -172,7 +188,10 @@ EXPORT_SYMBOL_GPL(rcar_fcp_put);
 struct device *rcar_fcp_get_bus_master(struct rcar_fcp_device *fcp,
 				       enum rcar_fcp_data_format format)
 {
-	return fcp->dev;
+	if (format < ARRAY_SIZE(fcp->bus_masters))
+		return fcp->bus_masters[format];
+	else
+		return NULL;
 }
 EXPORT_SYMBOL_GPL(rcar_fcp_get_bus_master);
 
@@ -221,6 +240,136 @@ EXPORT_SYMBOL_GPL(rcar_fcp_disable);
  * Platform Driver
  */
 
+static void rcar_fcp_fcnl_dev_release(struct device *dev)
+{
+	of_reserved_mem_device_release(dev);
+	kfree(dev);
+}
+
+static int rcar_fcp_fcnl_dev_alloc(struct rcar_fcp_device *fcp,
+				   enum rcar_fcp_data_format format,
+				   unsigned int index)
+{
+	struct device *dev;
+	int ret;
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	device_initialize(dev);
+	dev_set_name(dev, "%s:fcnl%u", dev_name(fcp->dev), format);
+	dev->parent = fcp->dev;
+	dev->coherent_dma_mask = fcp->dev->coherent_dma_mask;
+	dev->dma_mask = fcp->dev->dma_mask;
+	dev->release = rcar_fcp_fcnl_dev_release;
+
+	ret = device_add(dev);
+	if (ret < 0)
+		goto error_put;
+
+	ret = of_reserved_mem_device_init_by_idx(dev, fcp->dev->of_node, index);
+	if (ret < 0)
+		goto error_del;
+
+	fcp->bus_masters[format] = dev;
+	return 0;
+
+error_del:
+	device_del(dev);
+error_put:
+	put_device(dev);
+	return ret;
+}
+
+static int rcar_fcp_fcnl_setup(struct rcar_fcp_device *fcp)
+{
+	unsigned int i;
+	int n_ranges;
+	int ret;
+
+	/* The uncompressed bus master must always be available. */
+	fcp->bus_masters[RCAR_FCP_UNCOMPRESSED] = get_device(fcp->dev);
+
+	n_ranges = of_property_count_elems_of_size(fcp->dev->of_node,
+						   "memory-region", 4);
+	if (n_ranges == -EINVAL) {
+		/*
+		 * The "memory-region" property is optional, treat the -EINVAL
+		 * error code as a non-fatal error. FCNL decompression will not
+		 * be available.
+		 */
+		return 0;
+	}
+
+	if (n_ranges < 0) {
+		dev_dbg(fcp->dev, "Invalid memory-region property\n");
+		return n_ranges;
+	}
+
+	/*
+	 * For each memory range retrieve the compression format and create the
+	 * DMA memory allocation device.
+	 */
+	for (i = 0; i < n_ranges; ++i) {
+		struct device_node *node;
+		enum rcar_fcp_data_format format;
+		u32 value;
+
+		node = of_parse_phandle(fcp->dev->of_node, "memory-region", i);
+		if (!node) {
+			/*
+			 * The target memory region might have been deleted by
+			 * the boot loader if empty. Do not treat this as an
+			 * error.
+			 */
+			continue;
+		}
+
+		ret = of_property_read_u32(node, "renesas,format", &value);
+		if (ret < 0) {
+			dev_dbg(fcp->dev,
+				"Skipping %s with no valid format property\n",
+				of_node_full_name(node));
+			continue;
+		}
+
+		/*
+		 * The software formats is equal to the hardware format plus
+		 * one.
+		 */
+		format = value + 1;
+
+		if (format == 0 || format >= ARRAY_SIZE(fcp->bus_masters)) {
+			dev_dbg(fcp->dev,
+				"Skipping %s with invalid format %u\n",
+				of_node_full_name(node), format);
+			continue;
+		}
+
+		if (fcp->bus_masters[format]) {
+			dev_dbg(fcp->dev,
+				"Skipping %s with duplicate format %u\n",
+				of_node_full_name(node), format);
+			continue;
+		}
+
+		ret = rcar_fcp_fcnl_dev_alloc(fcp, format, i);
+		if (ret < 0) {
+			dev_dbg(fcp->dev,
+				"Failed to allocate bus master device (%s) for format %u\n",
+				of_node_full_name(node), format);
+			return ret;
+		}
+
+		dev_dbg(fcp->dev,
+			"Allocated bus master device (%s) for format %u\n",
+			of_node_full_name(node), format);
+	}
+
+	return 0;
+}
+
 static int rcar_fcp_setup(struct rcar_fcp_device *fcp)
 {
 	static const char * const models[] = {
@@ -317,6 +466,10 @@ static int rcar_fcp_probe(struct platform_device *pdev)
 
 	pm_runtime_put(&pdev->dev);
 
+	ret = rcar_fcp_fcnl_setup(fcp);
+	if (ret < 0)
+		goto error_pm_disable;
+
 	mutex_lock(&fcp_lock);
 	list_add_tail(&fcp->list, &fcp_devices);
 	mutex_unlock(&fcp_lock);
@@ -335,11 +488,15 @@ static int rcar_fcp_probe(struct platform_device *pdev)
 static int rcar_fcp_remove(struct platform_device *pdev)
 {
 	struct rcar_fcp_device *fcp = platform_get_drvdata(pdev);
+	unsigned int i;
 
 	mutex_lock(&fcp_lock);
 	list_del(&fcp->list);
 	mutex_unlock(&fcp_lock);
 
+	for (i = 0; i < ARRAY_SIZE(fcp->bus_masters); ++i)
+		put_device(fcp->bus_masters[i]);
+
 	pm_runtime_disable(&pdev->dev);
 
 	return 0;
-- 
Regards,

Laurent Pinchart
