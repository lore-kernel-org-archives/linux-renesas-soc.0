Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753622AbeCPOzR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:55:17 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 12/14] ARM: shmobile: rcar-gen2: Fix error check in regulator quirk
Date: Fri, 16 Mar 2018 15:53:34 +0100
Message-Id: <60fc75bdf5b1b8ed3e0a372b7b35f27726ff542b.1521211738.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521211738.git.horms+renesas@verge.net.au>
References: <cover.1521211738.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

On systems with two regulators, a bogus error message is printed on
success:

    i2c 6-0058: i2c error 2

While adding support for Stout, the number of messages to send was
made variable, but the corresponding return value check of
i2c_transfer() wasn't updated.

Fixes: ff938cd14d67a704 ("ARM: shmobile: stout: enable R-Car Gen2 regulator quirk")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index 27fb3a5ec73e..93f628acfd94 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -98,7 +98,7 @@ static int regulator_quirk_notify(struct notifier_block *nb,
 
 		dev_info(&client->dev, "clearing da9063/da9210 interrupts\n");
 		ret = i2c_transfer(client->adapter, da9xxx_msgs, len);
-		if (ret != ARRAY_SIZE(da9xxx_msgs))
+		if (ret != len)
 			dev_err(&client->dev, "i2c error %d\n", ret);
 	}
 
-- 
2.11.0
