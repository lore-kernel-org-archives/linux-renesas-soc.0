Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32906 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbeLGU3F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 15:29:05 -0500
Received: by mail-wr1-f67.google.com with SMTP id c14so5001484wrr.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Dec 2018 12:29:04 -0800 (PST)
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: shmobile: Fix R-Car Gen2 regulator quirk
Date: Fri,  7 Dec 2018 21:28:58 +0100
Message-Id: <20181207202858.17129-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The quirk code currently detects all compatible I2C chips with a shared
IRQ line on all I2C busses, adds them into a list, and registers a bus
notifier. For every chip for which the bus notifier triggers, the quirk
code performs I2C transfer on that I2C bus for all addresses in the list.
The problem is that this may generate transfers to non-existing chips on
systems with multiple I2C busses.

This patch adds a check to verify that the I2C bus to which the chip with
shared IRQ is attached to matches the I2C bus of the chip which triggered
the bus notifier and only starts the I2C transfer if they match.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index d4774d8ff997..f78e5348bd4c 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -40,6 +40,7 @@
 struct regulator_quirk {
 	struct list_head		list;
 	const struct of_device_id	*id;
+	struct device_node		*np;
 	struct of_phandle_args		irq_args;
 	struct i2c_msg			i2c_msg;
 	bool				shared;	/* IRQ line is shared */
@@ -102,6 +103,9 @@ static int regulator_quirk_notify(struct notifier_block *nb,
 		if (!pos->shared)
 			continue;
 
+		if (pos->np->parent != client->dev.parent->of_node)
+			continue;
+
 		dev_info(&client->dev, "clearing %s@0x%02x interrupts\n",
 			 pos->id->compatible, pos->i2c_msg.addr);
 
@@ -167,6 +171,7 @@ static int __init rcar_gen2_regulator_quirk(void)
 		memcpy(&quirk->i2c_msg, id->data, sizeof(quirk->i2c_msg));
 
 		quirk->id = id;
+		quirk->np = np;
 		quirk->i2c_msg.addr = addr;
 
 		ret = of_irq_parse_one(np, 0, argsa);
-- 
2.18.0
