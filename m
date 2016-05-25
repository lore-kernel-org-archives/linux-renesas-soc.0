Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:10019 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754002AbcEYI6f (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 25 May 2016 04:58:35 -0400
Received: from vsmta11.fe.internet.bosch.com (unknown [10.4.98.51])
	by imta23.fe.bosch.de (Postfix) with ESMTP id 1C9361580207
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 May 2016 10:58:34 +0200 (CEST)
Received: from SI-HUB1001.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta11.fe.internet.bosch.com (Postfix) with ESMTP id 72F7C23803E9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 May 2016 10:58:33 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH 3/4] ARM: Renesas: R-Car3: Add cpu and revision handlers
Date: Wed, 25 May 2016 10:58:27 +0200
Message-ID: <1464166708-18320-4-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
References: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Renesas R-Car3 product register (PRR) helps us to identify the
SoC and revision we are running on. Add helper functions to check
for this easily in code where it's needed.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 include/linux/soc/renesas/rcar3-prr.h | 51 +++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 include/linux/soc/renesas/rcar3-prr.h

diff --git a/include/linux/soc/renesas/rcar3-prr.h b/include/linux/soc/renesas/rcar3-prr.h
new file mode 100644
index 0000000..9bbe369
--- /dev/null
+++ b/include/linux/soc/renesas/rcar3-prr.h
@@ -0,0 +1,51 @@
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
+#ifndef __SOC_RENESAS_RCAR3_PRR_H__
+#define __SOC_RENESAS_RCAR3_PRR_H__
+
+#define PRODUCT_MASK	(0x7f << 8)
+#define PRODUCT_H3	(0x4f << 8)
+#define PRODUCT_M3W	(0x52 << 8)
+
+#define CUT_MASK	(0x000000ff)
+#define CUT_ES1		(0x0 << 0)
+#define CUT_ES2		(0x1 << 4)
+#define CUT_ES3		(0x1 << 5)
+
+extern unsigned int __rcar3_prr;
+
+static inline bool cpu_is_rcar3_h3(void)
+{
+	return (__rcar3_prr & PRODUCT_MASK) == PRODUCT_H3;
+}
+
+static inline bool cpu_is_rcar3_m3w(void)
+{
+	return (__rcar3_prr & PRODUCT_MASK) == PRODUCT_M3W;
+}
+
+static inline bool revision_is_rcar3_es1(void)
+{
+	return (__rcar3_prr & CUT_MASK) == CUT_ES1;
+}
+
+static inline bool revision_is_rcar3_es2(void)
+{
+	return (__rcar3_prr & CUT_MASK) == CUT_ES2;
+}
+
+static inline bool revision_is_rcar3_es3(void)
+{
+	return (__rcar3_prr & CUT_MASK) == CUT_ES3;
+}
+
+#endif /* __SOC_RENESAS_RCAR3_PRR_H__ */
-- 
2.8.0
