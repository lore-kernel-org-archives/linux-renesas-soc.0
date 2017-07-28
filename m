Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:48854 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751889AbdG1MUP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2017 08:20:15 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] usb: gadget: udc: renesas_usb3: add support for R-Car H3 ES2.0
Date: Fri, 28 Jul 2017 21:16:58 +0900
Message-Id: <1501244219-11840-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1501244219-11840-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1501244219-11840-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds support for R-Car H3 ES2.0. Since this SoC revision
doesn't need workaround for vbus detection and number of ramif is
increased. So, this driver uses soc_device_match() to detect it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 3415d32..aa2b185 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -21,6 +21,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/sys_soc.h>
 #include <linux/uaccess.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
@@ -2487,22 +2488,36 @@ static void renesas_usb3_init_ram(struct renesas_usb3 *usb3, struct device *dev,
 	}
 }
 
-static const struct renesas_usb3_priv renesas_usb3_priv_r8a7795 = {
+static const struct renesas_usb3_priv renesas_usb3_priv_r8a7795_es1 = {
 	.ramsize_per_ramif = SZ_16K,
 	.num_ramif = 2,
 	.ramsize_per_pipe = SZ_4K,
 	.workaround_for_vbus = true,
 };
 
+static const struct renesas_usb3_priv renesas_usb3_priv_gen3 = {
+	.ramsize_per_ramif = SZ_16K,
+	.num_ramif = 4,
+	.ramsize_per_pipe = SZ_4K,
+};
+
 static const struct of_device_id usb3_of_match[] = {
 	{
 		.compatible = "renesas,r8a7795-usb3-peri",
-		.data = &renesas_usb3_priv_r8a7795,
+		.data = &renesas_usb3_priv_gen3,
 	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, usb3_of_match);
 
+static const struct soc_device_attribute renesas_usb3_quirks_match[] = {
+	{
+		.soc_id = "r8a7795", .revision = "ES1.*",
+		.data = &renesas_usb3_priv_r8a7795_es1,
+	},
+	{ /* sentinel */ },
+};
+
 static const unsigned int renesas_usb3_cable[] = {
 	EXTCON_USB,
 	EXTCON_USB_HOST,
@@ -2516,11 +2531,17 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	const struct of_device_id *match;
 	int irq, ret;
 	const struct renesas_usb3_priv *priv;
+	const struct soc_device_attribute *attr;
 
 	match = of_match_node(usb3_of_match, pdev->dev.of_node);
 	if (!match)
 		return -ENODEV;
-	priv = match->data;
+
+	attr = soc_device_match(renesas_usb3_quirks_match);
+	if (attr)
+		priv = attr->data;
+	else
+		priv = match->data;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-- 
1.9.1
