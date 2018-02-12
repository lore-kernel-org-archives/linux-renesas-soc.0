Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33174 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932247AbeBLPof (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 10:44:35 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/5] soc: renesas: Add symbols for R-Car Gen3 register offsets
Date: Mon, 12 Feb 2018 16:44:18 +0100
Message-Id: <20180212154422.13900-2-horms+renesas@verge.net.au>
In-Reply-To: <20180212154422.13900-1-horms+renesas@verge.net.au>
References: <20180212154422.13900-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add symbols for Gen3 register offsets.
These may be used to improve readability of users of these offsets.

This does not introduce any functional change.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/rcar-sysc.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index 9d9daf9eb91b..c6041e29fbcb 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -24,6 +24,25 @@
 #define PD_CPU_NOCR	PD_CPU | PD_NO_CR /* CPU area lacks CR (R-Car Gen2/3) */
 #define PD_ALWAYS_ON	PD_NO_CR	  /* Always-on area */
 
+/*
+ * R-Car Gen3 register offsets
+ */
+
+#define RCAR_GEN3_SYSCSR  0
+#define RCAR_GEN3_PWRSR0  0x80
+#define RCAR_GEN3_PWRSR2  0x100
+#define RCAR_GEN3_PWRSR3  0x140
+#define RCAR_GEN3_PWRSR4  0x180
+#define RCAR_GEN3_PWRSR5  0x1c0
+#define RCAR_GEN3_PWRSR6  0x200
+#define RCAR_GEN3_PWRSR7  0x240
+#define RCAR_GEN3_PWRSR8  0x340
+#define RCAR_GEN3_PWRSR9  0x380
+#define RCAR_GEN3_PWRSR10 0x3c0
+#define RCAR_GEN3_PWRSR11 0x400
+#define RCAR_GEN3_PWRSR12 0x2c0
+#define RCAR_GEN3_PWRSR13 0x300
+#define RCAR_GEN3_PWRSR14 0x280
 
 /*
  * Description of a Power Area
-- 
2.11.0
