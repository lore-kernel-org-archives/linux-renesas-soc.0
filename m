Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6948AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 11:07:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3EFF820851
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 11:07:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbfCALHA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 06:07:00 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:60565 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725978AbfCALHA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 06:07:00 -0500
X-IronPort-AV: E=Sophos;i="5.58,427,1544454000"; 
   d="scan'208";a="9011090"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Mar 2019 20:06:59 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.184])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 687BA4377B77;
        Fri,  1 Mar 2019 20:06:57 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/4] phy: renesas: rcar-gen3-usb2: No need to request IRQ for non-OTG
Date:   Fri,  1 Mar 2019 11:05:46 +0000
Message-Id: <1551438348-22119-3-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As stated in the comment found on top of rcar_gen3_phy_usb2_work,
we should not be registering the IRQ if !otg_channel || !uses_otg_pins.
On top of that, we should also make sure that extcon has been
allocated before requesting the irq as rcar_gen3_phy_usb2_work
uses it, hence the patch.

Fixes: 2b38543c8db1 ("phy: rcar-gen3-usb2: add extcon support")
Fixes: 73801b90a38f ("phy: renesas: rcar-gen3-usb2: change a condition "dr_mode"")
Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 0a34782..be1a392 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -447,20 +447,8 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(channel->base))
 		return PTR_ERR(channel->base);
 
-	/* call request_irq for OTG */
-	irq = platform_get_irq(pdev, 0);
-	if (irq >= 0) {
-		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
-		irq = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
-				       IRQF_SHARED, dev_name(dev), channel);
-		if (irq < 0)
-			dev_err(dev, "No irq handler (%d)\n", irq);
-	}
-
 	channel->dr_mode = of_usb_get_dr_mode_by_phy(dev->of_node, 0);
-	if (channel->dr_mode != USB_DR_MODE_UNKNOWN) {
-		int ret;
-
+	if (channel->dr_mode == USB_DR_MODE_OTG) {
 		channel->is_otg_channel = true;
 		channel->uses_otg_pins = !of_property_read_bool(dev->of_node,
 							"renesas,no-otg-pins");
@@ -476,6 +464,18 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (channel->is_otg_channel && channel->uses_otg_pins) {
+		/* call request_irq for OTG */
+		irq = platform_get_irq(pdev, 0);
+		if (irq >= 0) {
+			INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
+			irq = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
+					       IRQF_SHARED, dev_name(dev), channel);
+			if (irq < 0)
+				dev_err(dev, "No irq handler (%d)\n", irq);
+		}
+	}
+
 	/*
 	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
 	 * And then, phy-core will manage runtime pm for this device.
-- 
2.7.4

