Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:10018 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754005AbcEYI6f (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 25 May 2016 04:58:35 -0400
Received: from vsmta12.fe.internet.bosch.com (unknown [10.4.98.52])
	by imta24.fe.bosch.de (Postfix) with ESMTP id 9EDB7D80219
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 May 2016 10:58:33 +0200 (CEST)
Received: from FE-HUB1001.de.bosch.com (vsgw23.fe.internet.bosch.com [10.4.98.23])
	by vsmta12.fe.internet.bosch.com (Postfix) with ESMTP id 4F4111B803D9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 May 2016 10:58:33 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH 1/4] ARM: Renesas: R-Car3: Add product register support
Date: Wed, 25 May 2016 10:58:25 +0200
Message-ID: <1464166708-18320-2-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
References: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The product register of the Renesas R-Car3 isn't part of any SoC
module, but "just" a register at address 0xFFF00044.

It provides some configuration information about the SoC itself, like
the number of the CA57, CA53 and CR7 cores, the product description
(R-Car H3, R-Car M3-W etc) and the sample revision.

This information is needed by some drivers to enable or disable
specific features which are present or not in the SoC.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 drivers/soc/renesas/Makefile    |  4 ++--
 drivers/soc/renesas/rcar3-prr.c | 49 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 drivers/soc/renesas/rcar3-prr.c

diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index cd85cd5..d39990a 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -4,5 +4,5 @@ obj-$(CONFIG_ARCH_R8A7791)	+= rcar-sysc.o r8a7791-sysc.o
 # R-Car M2-N is identical to R-Car M2-W w.r.t. power domains.
 obj-$(CONFIG_ARCH_R8A7793)	+= rcar-sysc.o r8a7791-sysc.o
 obj-$(CONFIG_ARCH_R8A7794)	+= rcar-sysc.o r8a7794-sysc.o
-obj-$(CONFIG_ARCH_R8A7795)	+= rcar-sysc.o r8a7795-sysc.o
-obj-$(CONFIG_ARCH_R8A7796)	+= rcar-sysc.o r8a7796-sysc.o
+obj-$(CONFIG_ARCH_R8A7795)	+= rcar-sysc.o r8a7795-sysc.o rcar3-prr.o
+obj-$(CONFIG_ARCH_R8A7796)	+= rcar-sysc.o r8a7796-sysc.o rcar3-prr.o
diff --git a/drivers/soc/renesas/rcar3-prr.c b/drivers/soc/renesas/rcar3-prr.c
new file mode 100644
index 0000000..8fda1c2
--- /dev/null
+++ b/drivers/soc/renesas/rcar3-prr.c
@@ -0,0 +1,49 @@
+/*
+ * R-Car3 Product Register (PRR) support
+ *
+ * Copyright (C) 2016 Robert Bosch Car Multimedia GmbH
+ *               Dirk Behme <dirk.behme@de.bosch.com>
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ */
+
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+
+unsigned int __rcar3_prr;
+EXPORT_SYMBOL(__rcar3_prr);
+
+static const struct of_device_id rcar3_prr_ids[] __initconst = {
+	{ .compatible = "renesas,rcar-gen3-prr" },
+	{}
+};
+
+static int __init rcar3_read_prr(void)
+{
+	struct device_node *np;
+	void __iomem *prr;
+
+	np = of_find_matching_node(NULL, rcar3_prr_ids);
+	if (!np) {
+		pr_err("can't find renesas,rcar-gen3-prr device node");
+		return -ENOENT;
+	}
+
+	prr = of_iomap(np, 0);
+	if (!prr) {
+		pr_err("failed to map product register");
+		of_node_put(np);
+		return -ENOMEM;
+	}
+
+	__rcar3_prr = ioread32(prr);
+
+	iounmap(prr);
+	of_node_put(np);
+
+	return 0;
+}
+early_initcall(rcar3_read_prr);
-- 
2.8.0
