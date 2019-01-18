Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D62C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 08:54:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E8DC20855
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 08:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfARIyD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 03:54:03 -0500
Received: from relay1.mentorg.com ([192.94.38.131]:39985 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbfARIyC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 03:54:02 -0500
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=SVR-IES-MBX-04.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1gkPuX-0004Y2-HW from Vladimir_Zapolskiy@mentor.com ; Fri, 18 Jan 2019 00:53:57 -0800
Received: from eyas.local (137.202.0.90) by SVR-IES-MBX-04.mgc.mentorg.com
 (139.181.222.4) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Fri, 18 Jan
 2019 08:53:53 +0000
From:   Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     <linux-gpio@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2] gpio: rcar: select General Output Register to set output states
Date:   Fri, 18 Jan 2019 10:53:43 +0200
Message-ID: <20190118085343.32553-1-vladimir_zapolskiy@mentor.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car GPIO controller provides two interfaces to set GPIO line output
signal state, and for a particular GPIO line the selected interface is
determined by OUTDTSEL bit value.

At the moment the driver supports only one of two interfaces, namely
OUTDT General Output Register is used to control the output signal.

While this selection is the default one on reset, it is not explicitly
configured on probe, thus it might be possible that kernel and userspace
consumers of a GPIO won't be able to set the wanted GPIO output signal.

Below is a simple test case to reproduce the described problem and
verify this fix in the kernel on H3 ULCB by setting non-default OUTDTSEL
configuration from a bootloader:

  u-boot    > mw.l 0xe6055440 0x3000 1
  ...
  userspace > echo default-on > /sys/devices/platform/leds/leds/led5/trigger
  userspace > echo default-on > /sys/devices/platform/leds/leds/led6/trigger

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
Link to v1: https://www.spinics.net/lists/linux-gpio/msg35018.html

Changes from v1 to v2:
* OUTDTSEL and companion OUTDTH/OUTDTL registers are found on R-Car Gen2
  and R-Car Gen3 SoCs, to avoid a possible regression don't modify
  OUTDTSEL register value at R-Car Gen1 GPIO controller,
* removed Fixes tag as too weak one.

As a note .has_outdtsel field has been selected to precede the existing
.has_both_edge_trigger struct field, because OUTDTSEL register precedes
BOTHEDGE register on the controller.

 drivers/gpio/gpio-rcar.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 068ce25ffd28..500a3596aaf4 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -40,6 +40,7 @@ struct gpio_rcar_priv {
 	struct irq_chip irq_chip;
 	unsigned int irq_parent;
 	atomic_t wakeup_path;
+	bool has_outdtsel;
 	bool has_both_edge_trigger;
 	struct gpio_rcar_bank_info bank_info;
 };
@@ -55,6 +56,7 @@ struct gpio_rcar_priv {
 #define POSNEG 0x20	/* Positive/Negative Logic Select Register */
 #define EDGLEVEL 0x24	/* Edge/level Select Register */
 #define FILONOFF 0x28	/* Chattering Prevention On/Off Register */
+#define OUTDTSEL 0x40	/* Output Data Select Register */
 #define BOTHEDGE 0x4c	/* One Edge/Both Edge Select Register */
 
 #define RCAR_MAX_GPIO_PER_BANK		32
@@ -235,6 +237,10 @@ static void gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
 	/* Select Input Mode or Output Mode in INOUTSEL */
 	gpio_rcar_modify_bit(p, INOUTSEL, gpio, output);
 
+	/* Select General Output Register to output data in OUTDTSEL */
+	if (p->has_outdtsel && output)
+		gpio_rcar_modify_bit(p, OUTDTSEL, gpio, false);
+
 	spin_unlock_irqrestore(&p->lock, flags);
 }
 
@@ -336,14 +342,17 @@ static int gpio_rcar_direction_output(struct gpio_chip *chip, unsigned offset,
 }
 
 struct gpio_rcar_info {
+	bool has_outdtsel;
 	bool has_both_edge_trigger;
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen1 = {
+	.has_outdtsel = false,
 	.has_both_edge_trigger = false,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
+	.has_outdtsel = true,
 	.has_both_edge_trigger = true,
 };
 
@@ -403,10 +412,11 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
 	int ret;
 
 	info = of_device_get_match_data(p->dev);
+	p->has_outdtsel = info->has_outdtsel;
+	p->has_both_edge_trigger = info->has_both_edge_trigger;
 
 	ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &args);
 	*npins = ret == 0 ? args.args[2] : RCAR_MAX_GPIO_PER_BANK;
-	p->has_both_edge_trigger = info->has_both_edge_trigger;
 
 	if (*npins == 0 || *npins > RCAR_MAX_GPIO_PER_BANK) {
 		dev_warn(p->dev, "Invalid number of gpio lines %u, using %u\n",
-- 
2.19.0

