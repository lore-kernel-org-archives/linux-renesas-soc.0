Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:59362 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728161AbeLEPuc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 10:50:32 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC PATCH 1/7] soc: renesas: rcar-sysc: Prepare for fixing power request conflicts
Date: Wed,  5 Dec 2018 16:50:22 +0100
Message-Id: <20181205155028.14335-2-geert+renesas@glider.be>
In-Reply-To: <20181205155028.14335-1-geert+renesas@glider.be>
References: <20181205155028.14335-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Recent R-Car Gen3 SoCs added an External Request Mask Register to the
System Controller (SYSC).  This register allows to mask external power
requests for CPU or 3DG domains, to prevent conflicts when Linux changes
the state of a power domain through SYSC, which could lead to system
lock-ups.

Add support for making use of this register.  Take into account that the
register is optional, and that its location and contents are
SoC-specific.

Inspired by a patch in the BSP by Dien Pham <dien.pham.ry@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/rcar-sysc.c | 16 ++++++++++++++++
 drivers/soc/renesas/rcar-sysc.h |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 0c80fab4f8de6bc8..b28955e21a9868e0 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -63,6 +63,7 @@ struct rcar_sysc_ch {
 
 static void __iomem *rcar_sysc_base;
 static DEFINE_SPINLOCK(rcar_sysc_lock); /* SMP CPUs + I/O devices */
+static u32 rcar_sysc_extmask_offs, rcar_sysc_extmask_val;
 
 static int rcar_sysc_pwr_on_off(const struct rcar_sysc_ch *sysc_ch, bool on)
 {
@@ -105,6 +106,14 @@ static int rcar_sysc_power(const struct rcar_sysc_ch *sysc_ch, bool on)
 
 	spin_lock_irqsave(&rcar_sysc_lock, flags);
 
+	/*
+	 * Mask external power requests for CPU or 3DG domains
+	 */
+	if (rcar_sysc_extmask_val) {
+		iowrite32(rcar_sysc_extmask_val,
+			  rcar_sysc_base + rcar_sysc_extmask_offs);
+	}
+
 	/*
 	 * The interrupt source needs to be enabled, but masked, to prevent the
 	 * CPU from receiving it.
@@ -148,6 +157,9 @@ static int rcar_sysc_power(const struct rcar_sysc_ch *sysc_ch, bool on)
 	iowrite32(isr_mask, rcar_sysc_base + SYSCISCR);
 
  out:
+	if (rcar_sysc_extmask_val)
+		iowrite32(0, rcar_sysc_base + rcar_sysc_extmask_offs);
+
 	spin_unlock_irqrestore(&rcar_sysc_lock, flags);
 
 	pr_debug("sysc power %s domain %d: %08x -> %d\n", on ? "on" : "off",
@@ -361,6 +373,10 @@ static int __init rcar_sysc_pd_init(void)
 
 	rcar_sysc_base = base;
 
+	/* Optional External Request Mask Register */
+	rcar_sysc_extmask_offs = info->extmask_offs;
+	rcar_sysc_extmask_val = info->extmask_val;
+
 	domains = kzalloc(sizeof(*domains), GFP_KERNEL);
 	if (!domains) {
 		error = -ENOMEM;
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index 485520a5b295c13e..21ee3ff8620bbafe 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -44,6 +44,9 @@ struct rcar_sysc_info {
 	int (*init)(void);	/* Optional */
 	const struct rcar_sysc_area *areas;
 	unsigned int num_areas;
+	/* Optional External Request Mask Register */
+	u32 extmask_offs;	/* SYSCEXTMASK register offset */
+	u32 extmask_val;	/* SYSCEXTMASK register mask value */
 };
 
 extern const struct rcar_sysc_info r8a7743_sysc_info;
-- 
2.17.1
