Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751898AbeERLUA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:20:00 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 08/14] soc: renesas: Add r8a77990 SYSC PM Domain Binding Definitions
Date: Fri, 18 May 2018 13:18:06 +0200
Message-Id: <355f9e6482b2e5c34aa46cac199eff56de286514.1526639075.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526639075.git.horms+renesas@verge.net.au>
References: <cover.1526639075.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds power domain indices for R-Car E3.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[shimoda: add commit log and SPDX-License-Identifier]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 include/dt-bindings/power/r8a77990-sysc.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a77990-sysc.h

diff --git a/include/dt-bindings/power/r8a77990-sysc.h b/include/dt-bindings/power/r8a77990-sysc.h
new file mode 100644
index 000000000000..944d85beec15
--- /dev/null
+++ b/include/dt-bindings/power/r8a77990-sysc.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A77990_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A77990_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A77990_PD_CA53_CPU0		5
+#define R8A77990_PD_CA53_CPU1		6
+#define R8A77990_PD_CR7			13
+#define R8A77990_PD_A3VC		14
+#define R8A77990_PD_3DG_A		17
+#define R8A77990_PD_3DG_B		18
+#define R8A77990_PD_CA53_SCU		21
+#define R8A77990_PD_A2VC1		26
+
+/* Always-on power area */
+#define R8A77990_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A77990_SYSC_H__ */
-- 
2.11.0
