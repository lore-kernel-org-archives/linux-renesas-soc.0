Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33591 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750948AbeBQCGs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 21:06:48 -0500
Received: by mail-wm0-f65.google.com with SMTP id x4so7724075wmc.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2018 18:06:47 -0800 (PST)
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] ARM: shmobile: Factor out complex condition
Date: Sat, 17 Feb 2018 03:06:41 +0100
Message-Id: <20180217020642.21375-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Pull the complex condition in regulator_quirk_notify() into
regulator_quirk_check(). Moreover, do not hard-code the I2C
address, but rather use the one in da9xxx_msgs[].

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index 27fb3a5ec73e..862f7757ef5d 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -66,6 +66,13 @@ static struct i2c_msg da9xxx_msgs[3] = {
 	},
 };
 
+static int regulator_quirk_check(struct i2c_client *client, u8 i2c_id,
+				 char *compat_string)
+{
+	return client->addr == da9xxx_msgs[i2c_id].addr &&
+	       !strcmp(client->name, compat_string);
+}
+
 static int regulator_quirk_notify(struct notifier_block *nb,
 				  unsigned long action, void *data)
 {
@@ -88,9 +95,9 @@ static int regulator_quirk_notify(struct notifier_block *nb,
 	client = to_i2c_client(dev);
 	dev_dbg(dev, "Detected %s\n", client->name);
 
-	if ((client->addr == 0x58 && !strcmp(client->name, "da9063")) ||
-	    (client->addr == 0x68 && !strcmp(client->name, "da9210")) ||
-	    (client->addr == 0x70 && !strcmp(client->name, "da9210"))) {
+	if (regulator_quirk_check(client, 0, "da9063") ||
+	    regulator_quirk_check(client, 1, "da9210") ||
+	    regulator_quirk_check(client, 2, "da9210")) {
 		int ret, len;
 
 		/* There are two DA9210 on Stout, one on the other boards. */
-- 
2.15.1
