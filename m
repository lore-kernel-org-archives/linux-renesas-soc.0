Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:39380 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751948AbdJKMb5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 08:31:57 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Chris Brandt <chris.brandt@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] clocksource/drivers/ostm: Use unique device name instead of ostm
Date: Wed, 11 Oct 2017 14:31:53 +0200
Message-Id: <1507725113-18070-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Currently all OSTM devices are called "ostm", also in kernel messages.

As there can be multiple instances in an SoC, this can confuse the user.
Hence construct a unique name from the DT node name, like is done for
platform devices.

On GR-Peach, the boot log changes like:

    -clocksource: ostm: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
    +clocksource: ostm timer@fcfec000: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
     sched_clock: 32 bits at 33MHz, resolution 30ns, wraps every 64440619504ns
    -ostm: used for clocksource
    -ostm: used for clock events
    +ostm timer@fcfec000: used for clocksource
    +ostm timer@fcfec400: used for clock events

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested due to lack of hardware (I even made up the boot log ;-), hence
sent to a limited audience.
---
 drivers/clocksource/renesas-ostm.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 6cffd7c6001a6961..f9080de0a63c5f60 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -37,6 +37,7 @@ struct ostm_device {
 	void __iomem *base;
 	unsigned long ticks_per_jiffy;
 	struct clock_event_device ced;
+	char name[0];
 };
 
 static void __iomem *system_clock;	/* For sched_clock() */
@@ -88,9 +89,8 @@ static int __init ostm_init_clksrc(struct ostm_device *ostm, unsigned long rate)
 	writeb(CTL_FREERUN, ostm->base + OSTM_CTL);
 	writeb(TS, ostm->base + OSTM_TS);
 
-	return clocksource_mmio_init(ostm->base + OSTM_CNT,
-			"ostm", rate,
-			300, 32, clocksource_mmio_readl_up);
+	return clocksource_mmio_init(ostm->base + OSTM_CNT, ostm->name, rate,
+				     300, 32, clocksource_mmio_readl_up);
 }
 
 static u64 notrace ostm_read_sched_clock(void)
@@ -170,15 +170,14 @@ static int __init ostm_init_clkevt(struct ostm_device *ostm, int irq,
 	struct clock_event_device *ced = &ostm->ced;
 	int ret = -ENXIO;
 
-	ret = request_irq(irq, ostm_timer_interrupt,
-			  IRQF_TIMER | IRQF_IRQPOLL,
-			  "ostm", ostm);
+	ret = request_irq(irq, ostm_timer_interrupt, IRQF_TIMER | IRQF_IRQPOLL,
+			  ostm->name, ostm);
 	if (ret) {
-		pr_err("ostm: failed to request irq\n");
+		pr_err("%s: failed to request irq\n", ostm->name);
 		return ret;
 	}
 
-	ced->name = "ostm";
+	ced->name = ostm->name;
 	ced->features = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_PERIODIC;
 	ced->set_state_shutdown = ostm_shutdown;
 	ced->set_state_periodic = ostm_set_periodic;
@@ -194,38 +193,41 @@ static int __init ostm_init_clkevt(struct ostm_device *ostm, int irq,
 
 static int __init ostm_init(struct device_node *np)
 {
+	unsigned int n = sizeof("ostm ") + strlen(np->name);
 	struct ostm_device *ostm;
 	int ret = -EFAULT;
 	struct clk *ostm_clk = NULL;
 	int irq;
 	unsigned long rate;
 
-	ostm = kzalloc(sizeof(*ostm), GFP_KERNEL);
+	ostm = kzalloc(sizeof(*ostm) + n, GFP_KERNEL);
 	if (!ostm)
 		return -ENOMEM;
 
+	snprintf(ostm->name, n, "ostm %s", np->name);
+
 	ostm->base = of_iomap(np, 0);
 	if (!ostm->base) {
-		pr_err("ostm: failed to remap I/O memory\n");
+		pr_err("%s: failed to remap I/O memory\n", ostm->name);
 		goto err;
 	}
 
 	irq = irq_of_parse_and_map(np, 0);
 	if (irq < 0) {
-		pr_err("ostm: Failed to get irq\n");
+		pr_err("%s: Failed to get irq\n", ostm->name);
 		goto err;
 	}
 
 	ostm_clk = of_clk_get(np, 0);
 	if (IS_ERR(ostm_clk)) {
-		pr_err("ostm: Failed to get clock\n");
+		pr_err("%s: Failed to get clock\n", ostm->name);
 		ostm_clk = NULL;
 		goto err;
 	}
 
 	ret = clk_prepare_enable(ostm_clk);
 	if (ret) {
-		pr_err("ostm: Failed to enable clock\n");
+		pr_err("%s: Failed to enable clock\n", ostm->name);
 		goto err;
 	}
 
@@ -241,14 +243,14 @@ static int __init ostm_init(struct device_node *np)
 
 		if (!ret) {
 			ostm_init_sched_clock(ostm, rate);
-			pr_info("ostm: used for clocksource\n");
+			pr_info("%s: used for clocksource\n", ostm->name);
 		}
 
 	} else {
 		ret = ostm_init_clkevt(ostm, irq, rate);
 
 		if (!ret)
-			pr_info("ostm: used for clock events\n");
+			pr_info("%s: used for clock events\n", ostm->name);
 	}
 
 err:
-- 
2.7.4
