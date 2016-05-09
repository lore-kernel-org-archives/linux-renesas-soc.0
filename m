Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:57395 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750864AbcEIHPp (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 03:15:45 -0400
Received: from vsmta12.fe.internet.bosch.com (unknown [10.4.98.52])
	by imta24.fe.bosch.de (Postfix) with ESMTP id E4EE4D80079
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 May 2016 09:15:43 +0200 (CEST)
Received: from SI-HUB1000.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta12.fe.internet.bosch.com (Postfix) with ESMTP id 9D4911B80398
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 May 2016 09:15:43 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH 10/10] boot-mode-reg: Convert to device tree
Date: Mon, 9 May 2016 09:14:01 +0200
Message-ID: <1462778041-19595-11-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
References: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Dirk Behme <dirk.behme@gmail.com>

Instead of using a hard coded address in the driver for the boot mode
register, optain it from the device tree.

Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---
 drivers/misc/boot-mode-reg/rcar.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/boot-mode-reg/rcar.c b/drivers/misc/boot-mode-reg/rcar.c
index e994980..2cfbf9c 100644
--- a/drivers/misc/boot-mode-reg/rcar.c
+++ b/drivers/misc/boot-mode-reg/rcar.c
@@ -16,24 +16,32 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 
 #include <misc/boot-mode-reg.h>
 
-#define MODEMR 0xe6160060
-
 static int __init rcar_read_mode_pins(void)
 {
 	void __iomem *modemr;
+	struct device_node *np;
 	int err = -ENOMEM;
 	static u32 mode;
 
-	modemr = ioremap_nocache(MODEMR, 4);
+	np = of_find_compatible_node(NULL, NULL, "renesas,modemr");
+	if (!np) {
+		pr_err("can't find renesas,modemr device node");
+		goto err;
+	}
+
+	modemr = of_iomap(np, 0);
 	if (!modemr) {
 		pr_err("failed to map boot mode register");
+		of_node_put(np);
 		goto err;
 	}
 	mode = ioread32(modemr);
 	iounmap(modemr);
+	of_node_put(np);
 
 	err = boot_mode_reg_set(mode);
 err:
-- 
2.8.0
