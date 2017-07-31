Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60352 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750977AbdGaLNB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 07:13:01 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] ARM: shmobile: rcar-gen2: Fix deadlock in regulator quirk
Date: Mon, 31 Jul 2017 13:12:40 +0200
Message-Id: <fce8dc5e50e44d8f644e0f7854e6d7d518fedb68.1501499175.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501499175.git.horms+renesas@verge.net.au>
References: <cover.1501499175.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Simon Horman reported that Koelsch and Lager hang during boot, and
bisected this to commit 1c3c5eab171590f8 ("sched/core: Enable
might_sleep() and smp_processor_id() checks early").

The da9063/da9210 regulator quirk for R-Car Gen2 boards uses a bus
notifier, and unregisters the notifier when it is no longer needed.
However, a notifier must not be unregistered from within the call chain.

This bug went unnoticed, as blocking_notifier_chain_unregister() didn't
take the semaphore during early boot.  The aforementioned commit changed
that behavior, leading to a deadlock.

Fix this by removing the call to bus_unregister_notifier(), and keeping
local completion state instead.

Reported-by: Simon Horman <horms+renesas@verge.net.au>
Fixes: 663fbb52159cca6f ("ARM: shmobile: R-Car Gen2: Add da9063/da9210 regulator quirk")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index 73e3adbc1330..44438f344dc8 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -67,8 +67,12 @@ static int regulator_quirk_notify(struct notifier_block *nb,
 {
 	struct device *dev = data;
 	struct i2c_client *client;
+	static bool done;
 	u32 mon;
 
+	if (done)
+		return 0;
+
 	mon = ioread32(irqc + IRQC_MONITOR);
 	dev_dbg(dev, "%s: %ld, IRQC_MONITOR = 0x%x\n", __func__, action, mon);
 	if (mon & REGULATOR_IRQ_MASK)
@@ -99,7 +103,7 @@ static int regulator_quirk_notify(struct notifier_block *nb,
 remove:
 	dev_info(dev, "IRQ2 is not asserted, removing quirk\n");
 
-	bus_unregister_notifier(&i2c_bus_type, nb);
+	done = true;
 	iounmap(irqc);
 	return 0;
 }
-- 
2.1.4
