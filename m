Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54385 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965482AbdIZKGP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:15 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id B0BA42075A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:04 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC] [U-BOOT] board: salvator-x: Add reserved lossy decompression areas to DT
Date: Tue, 26 Sep 2017 13:05:52 +0300
Message-Id: <20170926100605.2313-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Lossy decompression memory areas can't be used as normal system memory
as reading from them will automatically perform lossy decompression.

The decompression areas are configured by the BL2 in registers that are
accessible from secure mode only, and thus can't be read by U-boot.
Fortunately BL2 stores a copy of these registers at a fixed address in
SRAM, where the values can be read.

Parse the SRAM registers copy to add all lossy decompression memory
areas to DT in reserved-memory nodes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 board/renesas/salvator-x/salvator-x.c | 192 ++++++++++++++++++++++++++++++++++
 include/configs/rcar-gen3-common.h    |   1 +
 2 files changed, 193 insertions(+)

diff --git a/board/renesas/salvator-x/salvator-x.c b/board/renesas/salvator-x/salvator-x.c
index 8af0e1080022..0d052ba5ed88 100644
--- a/board/renesas/salvator-x/salvator-x.c
+++ b/board/renesas/salvator-x/salvator-x.c
@@ -25,6 +25,7 @@
 #include <asm/arch/sh_sdhi.h>
 #include <i2c.h>
 #include <mmc.h>
+#include <fdt_support.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
@@ -475,3 +476,194 @@ int checkboard(void)
 	return 0;
 }
 #endif
+
+#if defined(CONFIG_OF_BOARD_SETUP)
+struct bl2_lossy_info {
+	u32 magic;
+	u32 a0;
+	u32 b0;
+};
+
+#define BL2_LOSSY_INFO_ADDRESS		0x47fd7000
+#define BL2_LOSSY_INFO_ENTRIES		16
+#define BL2_LOSSY_INFO_MAGIC		0x12345678
+
+#define DCMPAREACRA_EN			(1UL << 31)
+#define DCMPAREACRA_FMT_GET(reg)	(((reg) >> 29) & 3)
+#define DCMPAREACRA_SADDR_MASK		(0x3ffff << 0)
+#define DCMPAREACRB_EADDR_MASK		(0x3ffff << 0)
+
+#define LOSSY_DECOMPRESSION_COMPAT	"renesas,lossy-decompression\0shared-dma-pool"
+#define LOSSY_MAX_FORMATS		3
+
+static int ft_get_lossy_region(void *fdt, int parent, u64 unit_address,
+			       unsigned int format)
+{
+	char name[35];
+	int node;
+	int ret;
+
+	/*
+	 * Find the lossy-decompression reserved-memory node. The node name in
+	 * the DTB is "lossy-decompression-<format>" without a unit address to
+	 * allow referencing it through phandles in the DTS. We will rename it
+	 * with a unit address later.
+	 */
+	snprintf(name, sizeof(name), "lossy-decompression-%u", format);
+	node = fdt_subnode_offset(fdt, parent, name);
+	if (node >= 0)
+		return node;
+
+	/*
+	 * If the node can't be found, create it and set the required
+	 * properties. The DTB is expected to have those properties set if the
+	 * node exists.
+	 */
+	node = fdt_add_subnode(fdt, parent, name);
+	if (node < 0)
+		return node;
+
+	ret = fdt_setprop(fdt, node, "compatible", LOSSY_DECOMPRESSION_COMPAT,
+			  sizeof(LOSSY_DECOMPRESSION_COMPAT));
+	if (ret < 0)
+		return ret;
+
+	ret = fdt_setprop(fdt, node, "reg", NULL, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = fdt_setprop(fdt, node, "no-map", NULL, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = fdt_setprop_u32(fdt, node, "renesas,format", format);
+	if (ret < 0)
+		return ret;
+
+	return node;
+}
+
+int ft_board_setup(void *fdt, bd_t *bd)
+{
+	struct bl2_lossy_info *lossy_info =
+		(struct bl2_lossy_info *)BL2_LOSSY_INFO_ADDRESS;
+	u64 unit_addresses[LOSSY_MAX_FORMATS] = { 0, };
+	const void *prop;
+	unsigned int i;
+	int rsv_node;
+	int len;
+	int ret;
+
+	/* Return immediately if no enabled lossy info entry exists. */
+	for (i = 0; i < BL2_LOSSY_INFO_ENTRIES; ++i) {
+		if (lossy_info[i].magic == BL2_LOSSY_INFO_MAGIC &&
+		    lossy_info[i].a0 & DCMPAREACRA_EN)
+			break;
+	}
+
+	if (i == BL2_LOSSY_INFO_ENTRIES)
+		return 0;
+
+	/*
+	 * Find the /reserved-memory node, create it if needed. Add or validate
+	 * the #address-cells and #size-cells properties.
+	 */
+	rsv_node = fdt_find_or_add_subnode(fdt, 0, "reserved-memory");
+	if (rsv_node < 0)
+		return rsv_node;
+
+	prop = fdt_getprop(fdt, rsv_node, "#address-cells", &len);
+	if (!prop) {
+		ret = fdt_setprop_u32(fdt, rsv_node, "#address-cells", 2);
+		if (ret)
+			return ret;
+	} else {
+		if (len != 4 || fdt32_to_cpu(*(fdt32_t *)prop) != 2)
+			return -FDT_ERR_BADNCELLS;
+	}
+
+	prop = fdt_getprop(fdt, rsv_node, "#size-cells", &len);
+	if (!prop) {
+		ret = fdt_setprop_u32(fdt, rsv_node, "#size-cells", 2);
+		if (ret)
+			return ret;
+	} else {
+		if (len != 4 || fdt32_to_cpu(*(fdt32_t *)prop) != 2)
+			return -FDT_ERR_BADNCELLS;
+	}
+
+	prop = fdt_getprop(fdt, rsv_node, "ranges", &len);
+	if (!prop) {
+		ret = fdt_setprop(fdt, rsv_node, "ranges", NULL, 0);
+		if (ret)
+			return ret;
+	}
+
+	/* Add the reserved memory entries. */
+	for (i = 0; i < BL2_LOSSY_INFO_ENTRIES; ++i) {
+		struct fdt_reserve_entry rsv_mem;
+		int node;
+		u32 format;
+		u64 start;
+		u64 end;
+
+		/* Skip disabled entries and invalid formats. */
+		if (lossy_info[i].magic != BL2_LOSSY_INFO_MAGIC ||
+		    !(lossy_info[i].a0 & DCMPAREACRA_EN))
+			continue;
+
+		format = DCMPAREACRA_FMT_GET(lossy_info[i].a0);
+		if (format >= LOSSY_MAX_FORMATS)
+			continue;
+
+		/*
+		 * Get the lossy region node offset. We can't cache the value
+		 * as we're modifying properties, which could result in offset
+		 * changes.
+		 */
+		start = (u64)(lossy_info[i].a0 & DCMPAREACRA_SADDR_MASK) << 20;
+		end = (u64)(lossy_info[i].b0 & DCMPAREACRB_EADDR_MASK) << 20;
+		if (!unit_addresses[format])
+			unit_addresses[format] = start;
+
+		node = ft_get_lossy_region(fdt, rsv_node, start, format);
+		if (node < 0)
+			return node;
+
+		rsv_mem.address = cpu_to_fdt64(start);
+		rsv_mem.size = cpu_to_fdt64(end - start);
+		ret = fdt_appendprop(fdt, node, "reg", &rsv_mem,
+				     sizeof(rsv_mem));
+		if (ret < 0)
+			return ret;
+	}
+
+	/*
+	 * Now that we're done rename all the lossy decompression nodes with
+	 * a unit address or remove them if they are empty.
+	 */
+	for (i = 0; i < LOSSY_MAX_FORMATS; ++i) {
+		char name[35];
+		int node;
+
+		snprintf(name, sizeof(name), "lossy-decompression-%u", i);
+		node = fdt_subnode_offset(fdt, rsv_node, name);
+		if (node < 0)
+			continue;
+
+		if (unit_addresses[i]) {
+			snprintf(name, sizeof(name), "lossy-decompression@%llx",
+				 unit_addresses[i]);
+			ret = fdt_set_name(fdt, node, name);
+			if (ret < 0)
+				return ret;
+		} else {
+			ret = fdt_del_node(fdt, node);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+#endif
diff --git a/include/configs/rcar-gen3-common.h b/include/configs/rcar-gen3-common.h
index 7217a66def70..c0ad2c8b21d5 100644
--- a/include/configs/rcar-gen3-common.h
+++ b/include/configs/rcar-gen3-common.h
@@ -52,6 +52,7 @@
 #define CONFIG_INITRD_TAG
 #define CONFIG_CMDLINE_EDITING
 #define CONFIG_OF_LIBFDT
+#define CONFIG_OF_BOARD_SETUP
 
 #define CONFIG_BAUDRATE		115200
 #define CONFIG_BOOTDELAY	3
-- 
Regards,

Laurent Pinchart
