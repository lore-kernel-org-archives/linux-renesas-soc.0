Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45133 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbeLDTts (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 14:49:48 -0500
Received: by mail-lj1-f193.google.com with SMTP id s5-v6so16057104ljd.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Dec 2018 11:49:46 -0800 (PST)
Subject: [PATCH v2 2/4] clk: renesas: rcar-gen3-cpg: add spinlock
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
Message-ID: <eef5ee23-311a-4367-43b5-b793357f06ef@cogentembedded.com>
Date: Tue, 4 Dec 2018 22:49:44 +0300
MIME-Version: 1.0
In-Reply-To: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Protect the CPG register read-modify-write sequence with a spinlock.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- new patch.

 drivers/clk/renesas/rcar-gen3-cpg.c |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -30,14 +30,19 @@
 
 #define CPG_RCKCR_CKSEL	BIT(15)	/* RCLK Clock Source Select */
 
+static spinlock_t cpg_lock;
+
 static void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set)
 {
+	unsigned long flags;
 	u32 val;
 
+	spin_lock_irqsave(&cpg_lock, flags);
 	val = readl(reg);
 	val &= ~clear;
 	val |= set;
 	writel(val, reg);
+	spin_unlock_irqrestore(&cpg_lock, flags);
 };
 
 struct cpg_simple_notifier {
@@ -604,5 +609,8 @@ int __init rcar_gen3_cpg_init(const stru
 	if (attr)
 		cpg_quirks = (uintptr_t)attr->data;
 	pr_debug("%s: mode = 0x%x quirks = 0x%x\n", __func__, mode, cpg_quirks);
+
+	spin_lock_init(&cpg_lock);
+
 	return 0;
 }
