Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED68C282E1
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4D4E222AF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbfDSSWn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:22:43 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727736AbfDSSWm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:22:42 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id DE62425BEFC;
        Sat, 20 Apr 2019 00:35:11 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id D0908E21AF8; Fri, 19 Apr 2019 16:35:09 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] ARM: shmobile: porter: enable R-Car Gen2 regulator quirk
Date:   Fri, 19 Apr 2019 16:35:07 +0200
Message-Id: <d5aa84087eadd6f2619628bc9f3d028eeabded0f.1555683298.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1555683298.git.horms+renesas@verge.net.au>
References: <cover.1555683298.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

Porter needs the regulator quirk, just like the other boards.
But unlike the other boards, the Porter uses DA9063L, which
is at 0x5a. Otherwise, DA9063L and DA9210 IRQ line is still
connected to CPU IRQ2 .

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index dc526ef2e9b3..ee949255ced3 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * R-Car Generation 2 da9063/da9210 regulator quirk
+ * R-Car Generation 2 da9063(L)/da9210 regulator quirk
  *
  * Certain Gen2 development boards have an da9063 and one or more da9210
  * regulators. All of these regulators have their interrupt request lines
@@ -65,6 +65,7 @@ static struct i2c_msg da9210_msg = {
 
 static const struct of_device_id rcar_gen2_quirk_match[] = {
 	{ .compatible = "dlg,da9063", .data = &da9063_msg },
+	{ .compatible = "dlg,da9063l", .data = &da9063_msg },
 	{ .compatible = "dlg,da9210", .data = &da9210_msg },
 	{},
 };
@@ -147,6 +148,7 @@ static int __init rcar_gen2_regulator_quirk(void)
 
 	if (!of_machine_is_compatible("renesas,koelsch") &&
 	    !of_machine_is_compatible("renesas,lager") &&
+	    !of_machine_is_compatible("renesas,porter") &&
 	    !of_machine_is_compatible("renesas,stout") &&
 	    !of_machine_is_compatible("renesas,gose"))
 		return -ENODEV;
@@ -210,7 +212,7 @@ static int __init rcar_gen2_regulator_quirk(void)
 		goto err_free;
 	}
 
-	pr_info("IRQ2 is asserted, installing da9063/da9210 regulator quirk\n");
+	pr_info("IRQ2 is asserted, installing regulator quirk\n");
 
 	bus_register_notifier(&i2c_bus_type, &regulator_quirk_nb);
 	return 0;
-- 
2.11.0

