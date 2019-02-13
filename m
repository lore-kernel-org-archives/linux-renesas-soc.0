Return-Path: <SRS0=YTPq=QU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF5DC282CA
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 13:14:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7CE72070C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 13:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389183AbfBMNOS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Feb 2019 08:14:18 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:55580 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388548AbfBMNOS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Feb 2019 08:14:18 -0500
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id cDEF1z00K3XaVaC01DEFiU; Wed, 13 Feb 2019 14:14:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gtuMh-0003xv-DI; Wed, 13 Feb 2019 14:14:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gtuMh-0006w8-B7; Wed, 13 Feb 2019 14:14:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: pcf857x: Simpify wake-up handling
Date:   Wed, 13 Feb 2019 14:14:09 +0100
Message-Id: <20190213131409.26607-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Unlike gpio_rcar_irq_set_wake(), where this solution was based on,
pcf857x_irq_set_wake() does not need to do anything else than calling
irq_set_irq_wake() for the upstream interrupt controller.  Hence there
is no reason for making this call conditional, and no longer a need for
keeping a copy of the interrupt number that also serves as a flag.

Just propagate irq_set_irq_wake() to the upstream interrupt controller,
using the original interrupt number.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I can no longer reproduce the issue fixed by commit ffb8e44bd7617ede
("gpio: pcf857x: Check for irq_set_irq_wake() failures") on current
kernels: if .irq_set_wake() fails, system suspend is aborted, and the
imbalance on resume never happens.

Looking at old logs, the system used to continue suspending, leading to
the imbalance.  Presumably I could run git bisect to find out when that
was changed, but that would require downgrading my cross-compiler (Linux
v4.1-rc3 didn't support building using gcc-7)...
---
 drivers/gpio/gpio-pcf857x.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 68a35b65925aca76..c9b650f617fa687c 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -89,7 +89,6 @@ struct pcf857x {
 	struct mutex		lock;		/* protect 'out' */
 	unsigned		out;		/* software latch */
 	unsigned		status;		/* current status */
-	unsigned int		irq_parent;
 	unsigned		irq_enabled;	/* enabled irqs */
 
 	int (*write)(struct i2c_client *client, unsigned data);
@@ -211,18 +210,7 @@ static int pcf857x_irq_set_wake(struct irq_data *data, unsigned int on)
 {
 	struct pcf857x *gpio = irq_data_get_irq_chip_data(data);
 
-	int error = 0;
-
-	if (gpio->irq_parent) {
-		error = irq_set_irq_wake(gpio->irq_parent, on);
-		if (error) {
-			dev_dbg(&gpio->client->dev,
-				"irq %u doesn't support irq_set_wake\n",
-				gpio->irq_parent);
-			gpio->irq_parent = 0;
-		}
-	}
-	return error;
+	return irq_set_irq_wake(gpio->client->irq, on);
 }
 
 static void pcf857x_irq_enable(struct irq_data *data)
@@ -392,7 +380,6 @@ static int pcf857x_probe(struct i2c_client *client,
 
 		gpiochip_set_nested_irqchip(&gpio->chip, &gpio->irqchip,
 					    client->irq);
-		gpio->irq_parent = client->irq;
 	}
 
 	/* Let platform code set up the GPIOs and their users.
-- 
2.17.1

