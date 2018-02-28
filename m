Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:45154 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751707AbeB1JNH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Feb 2018 04:13:07 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: rcar-gen2: Fix error check in regulator quirk
Date: Wed, 28 Feb 2018 10:13:00 +0100
Message-Id: <1519809180-6522-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On systems with two regulators, a bogus error message is printed on
success:

    i2c 6-0058: i2c error 2

While adding support for Stout, the number of messages to send was
made variable, but the corresponding return value check of
i2c_transfer() wasn't updated.

Fixes: ff938cd14d67a704 ("ARM: shmobile: stout: enable R-Car Gen2 regulator quirk")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index 27fb3a5ec73e6dda..93f628acfd944fd5 100644
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
2.7.4
