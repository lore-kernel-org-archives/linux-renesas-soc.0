Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7005C433F5
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Apr 2022 06:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245401AbiDZGnW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 26 Apr 2022 02:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239221AbiDZGnR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 02:43:17 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CEA532ADC;
        Mon, 25 Apr 2022 23:40:09 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,290,1643641200"; 
   d="scan'208";a="119179046"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Apr 2022 15:40:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.117])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B00374006CCF;
        Tue, 26 Apr 2022 15:40:04 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/2] arm64: dts: renesas: r9a07g044: Fix external clk node names
Date:   Tue, 26 Apr 2022 07:40:01 +0100
Message-Id: <20220426064002.9411-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add suffix '-clk' for can and extal clk node names and replace the
clk node names audio_clk{1,2} with clk-{1,2} as per the device
tree specification.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Sorted clk node-names alphabetically
v1->v2:
 * Replaced clk node names audio_clk{1,2} with clk-{1,2}.
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 19287cccb1f0..03fbb77a9814 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -13,29 +13,29 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	audio_clk1: audio_clk1 {
+	/* External CAN clock - to be overridden by boards that provide it */
+	can_clk: can-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		/* This value must be overridden by boards that provide it */
 		clock-frequency = <0>;
 	};
 
-	audio_clk2: audio_clk2 {
+	audio_clk1: clk-1 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		/* This value must be overridden by boards that provide it */
 		clock-frequency = <0>;
 	};
 
-	/* External CAN clock - to be overridden by boards that provide it */
-	can_clk: can {
+	audio_clk2: clk-2 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
+		/* This value must be overridden by boards that provide it */
 		clock-frequency = <0>;
 	};
 
 	/* clock can be either from exclk or crystal oscillator (XIN/XOUT) */
-	extal_clk: extal {
+	extal_clk: extal-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
-- 
2.25.1

