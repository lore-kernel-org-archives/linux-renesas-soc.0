Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:12992 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751315AbcEKFb1 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 01:31:27 -0400
Received: from vsmta12.fe.internet.bosch.com (unknown [10.4.98.52])
	by imta23.fe.bosch.de (Postfix) with ESMTP id 4837D15801D4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:26 +0200 (CEST)
Received: from SI-HUB1000.de.bosch.com (vsgw23.fe.internet.bosch.com [10.4.98.23])
	by vsmta12.fe.internet.bosch.com (Postfix) with ESMTP id D687B1B80420
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:25 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH v2 10/10] boot-mode-reg: Convert to device tree
Date: Wed, 11 May 2016 07:29:38 +0200
Message-ID: <1462944578-1220-11-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Dirk Behme <dirk.behme@gmail.com>

Instead of using a hard coded address in the driver for the boot mode
register, optain it from the device tree.

Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---
 drivers/misc/boot-mode-reg/rcar.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/boot-mode-reg/rcar.c b/drivers/misc/boot-mode-reg/rcar.c
index e994980..0b23352 100644
--- a/drivers/misc/boot-mode-reg/rcar.c
+++ b/drivers/misc/boot-mode-reg/rcar.c
@@ -16,24 +16,37 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 
 #include <misc/boot-mode-reg.h>
 
-#define MODEMR 0xe6160060
+#define RCAR_RST_BASE 0xe6160000
+#define RCAR_RST_SIZE 0x200
+#define MODEMR 0x60
 
 static int __init rcar_read_mode_pins(void)
 {
-	void __iomem *modemr;
+	void __iomem *reset;
+	struct device_node *np;
 	int err = -ENOMEM;
 	static u32 mode;
 
-	modemr = ioremap_nocache(MODEMR, 4);
-	if (!modemr) {
-		pr_err("failed to map boot mode register");
+	np = of_find_compatible_node(NULL, NULL, "renesas,rcar-rst");
+	if (np)
+		reset = of_iomap(np, 0);
+	else {
+		pr_warn("can't find renesas rcar-rst device node");
+		reset = ioremap_nocache(RCAR_RST_BASE, RCAR_RST_SIZE);
+	}
+
+	if (!reset) {
+		pr_err("failed to map reset registers");
+		of_node_put(np);
 		goto err;
 	}
-	mode = ioread32(modemr);
-	iounmap(modemr);
+	mode = ioread32(reset + MODEMR);
+	iounmap(reset);
+	of_node_put(np);
 
 	err = boot_mode_reg_set(mode);
 err:
-- 
2.8.0
