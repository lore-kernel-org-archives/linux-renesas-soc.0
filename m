Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:34143 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1162253AbcFHVHX (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 8 Jun 2016 17:07:23 -0400
Received: by mail-lf0-f53.google.com with SMTP id s186so13884865lfs.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jun 2016 14:07:22 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 02/12] ARM: shmobile: r8a7792: add power domain index macros
Date: Thu, 09 Jun 2016 00:07:18 +0300
Message-ID: <1587622.DYglMsba7M@wasted.cogentembedded.com>
In-Reply-To: <12536856.AsKMEpuejQ@wasted.cogentembedded.com>
References: <12536856.AsKMEpuejQ@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add macros usable by the device tree sources to reference R8A7792 SYSC power
domains by index.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 2:
- added Geert's tag.

 include/dt-bindings/power/r8a7792-sysc.h |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

Index: renesas/include/dt-bindings/power/r8a7792-sysc.h
===================================================================
--- /dev/null
+++ renesas/include/dt-bindings/power/r8a7792-sysc.h
@@ -0,0 +1,26 @@
+/*
+ * Copyright (C) 2016 Cogent Embedded Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A7792_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A7792_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A7792_PD_CA15_CPU0		0
+#define R8A7792_PD_CA15_CPU1		1
+#define R8A7792_PD_CA15_SCU		12
+#define R8A7792_PD_SGX			20
+#define R8A7792_PD_IMP			24
+
+/* Always-on power area */
+#define R8A7792_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A7792_SYSC_H__ */
