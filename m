Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685B3C10F14
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 08:15:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4220E204FD
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 08:15:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbfDJIPX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 04:15:23 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58693 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727281AbfDJIPW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 04:15:22 -0400
X-IronPort-AV: E=Sophos;i="5.60,332,1549897200"; 
   d="scan'208";a="12628470"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Apr 2019 17:15:21 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2A538426FF85;
        Wed, 10 Apr 2019 17:15:18 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V4 04/13] phy: rcar-gen3-usb2: Add support for r8a77470
Date:   Wed, 10 Apr 2019 09:08:26 +0100
Message-Id: <1554883715-41725-5-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
References: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds support for r8a77470 (RZ/G1C). We can reuse this driver for
initializing timing/interrupt generation registers.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V3-->V4
 * Incorporated Kishan and Shimoda-san's review comment
  https://patchwork.kernel.org/patch/10883265/
V2-->V3
 * Incorporated shimoda-san's review comment
 Ref: https://patchwork.kernel.org/patch/10655855/
---
 drivers/phy/renesas/Kconfig              |  2 +-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 38 +++++++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
index e340a92..111bdca 100644
--- a/drivers/phy/renesas/Kconfig
+++ b/drivers/phy/renesas/Kconfig
@@ -19,7 +19,7 @@ config PHY_RCAR_GEN3_PCIE
 config PHY_RCAR_GEN3_USB2
 	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
 	depends on ARCH_RENESAS
-	depends on EXTCON
+	depends on EXTCON || !EXTCON # if EXTCON=m, this cannot be built-in
 	depends on USB_SUPPORT
 	select GENERIC_PHY
 	select USB_COMMON
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 0a34782..5a8e673 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -22,6 +22,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/usb/of.h>
 #include <linux/workqueue.h>
+#include <linux/sys_soc.h>
 
 /******* USB2.0 Host registers (original offset is +0x200) *******/
 #define USB2_INT_ENABLE		0x000
@@ -393,6 +394,12 @@ static const struct phy_ops rcar_gen3_phy_usb2_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct phy_ops rz_g1c_phy_usb2_ops = {
+	.init		= rcar_gen3_phy_usb2_init,
+	.exit		= rcar_gen3_phy_usb2_exit,
+	.owner		= THIS_MODULE,
+};
+
 static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 {
 	struct rcar_gen3_chan *ch = _ch;
@@ -411,11 +418,27 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 }
 
 static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
-	{ .compatible = "renesas,usb2-phy-r8a7795" },
-	{ .compatible = "renesas,usb2-phy-r8a7796" },
-	{ .compatible = "renesas,usb2-phy-r8a77965" },
-	{ .compatible = "renesas,rcar-gen3-usb2-phy" },
-	{ }
+	{
+		.compatible = "renesas,usb2-phy-r8a77470",
+		.data = &rz_g1c_phy_usb2_ops,
+	},
+	{
+		.compatible = "renesas,usb2-phy-r8a7795",
+		.data = &rcar_gen3_phy_usb2_ops,
+	},
+	{
+		.compatible = "renesas,usb2-phy-r8a7796",
+		.data = &rcar_gen3_phy_usb2_ops,
+	},
+	{
+		.compatible = "renesas,usb2-phy-r8a77965",
+		.data = &rcar_gen3_phy_usb2_ops,
+	},
+	{
+		.compatible = "renesas,rcar-gen3-usb2-phy",
+		.data = &rcar_gen3_phy_usb2_ops,
+	},
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, rcar_gen3_phy_usb2_match_table);
 
@@ -431,6 +454,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	struct rcar_gen3_chan *channel;
 	struct phy_provider *provider;
 	struct resource *res;
+	const struct phy_ops *phy_usb2_ops;
 	int irq, ret = 0;
 
 	if (!dev->of_node) {
@@ -481,7 +505,9 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	 * And then, phy-core will manage runtime pm for this device.
 	 */
 	pm_runtime_enable(dev);
-	channel->phy = devm_phy_create(dev, NULL, &rcar_gen3_phy_usb2_ops);
+	phy_usb2_ops = (const struct phy_ops *) of_device_get_match_data(dev);
+
+	channel->phy = devm_phy_create(dev, NULL, phy_usb2_ops);
 	if (IS_ERR(channel->phy)) {
 		dev_err(dev, "Failed to create USB2 PHY\n");
 		ret = PTR_ERR(channel->phy);
-- 
2.7.4

