Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:54243 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751222AbcJGRiB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 13:38:01 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [RFC] irqchip/renesas-irqc: Postpone driver initialization
Date: Fri,  7 Oct 2016 19:37:56 +0200
Message-Id: <1475861876-1187-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Currently the renesas-irqc driver uses postcore_initcall().

However, the new CPG/MSSR driver uses subsys_initcall(). Hence the
IRQC's probe will be deferred, which causes the Micrel phy to not find
its interrupt on R-Car Gen2, as the of_mdio subsystem doesn't support
deferred probe yet.

Replace postcore_initcall() by device_initcall() to work around this.

This does cause a few extra probe deferrals on R-Mobile APE6, where the
PFC/GPIO combo uses the IRQC as its parent interrupt controller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Sergei: Does this fix the regression with the sh_eth driver?

I've been running with this applied for almost one year.

 drivers/irqchip/irq-renesas-irqc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
index 52304b139aa46a60..992849e54d00ea77 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -295,7 +295,7 @@ static int __init irqc_init(void)
 {
 	return platform_driver_register(&irqc_device_driver);
 }
-postcore_initcall(irqc_init);
+device_initcall(irqc_init);
 
 static void __exit irqc_exit(void)
 {
-- 
1.9.1
