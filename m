Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:35664 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751916AbdJDMXj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 08:23:39 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Felipe Balbi <balbi@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] usb: gadget: udc: renesas_usb3: Use of_device_get_match_data() helper
Date: Wed,  4 Oct 2017 14:23:31 +0200
Message-Id: <1507119811-13053-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use the of_device_get_match_data() helper instead of open coding,
postponing the matching until when it's really needed.
Note that the renesas_usb3 driver is used with DT only, so there's
always a valid match.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index df37c1e6e9d5cc3e..acbf0feb47c85942 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2549,20 +2549,15 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 {
 	struct renesas_usb3 *usb3;
 	struct resource *res;
-	const struct of_device_id *match;
 	int irq, ret;
 	const struct renesas_usb3_priv *priv;
 	const struct soc_device_attribute *attr;
 
-	match = of_match_node(usb3_of_match, pdev->dev.of_node);
-	if (!match)
-		return -ENODEV;
-
 	attr = soc_device_match(renesas_usb3_quirks_match);
 	if (attr)
 		priv = attr->data;
 	else
-		priv = match->data;
+		priv = of_device_get_match_data(&pdev->dev);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-- 
2.7.4
