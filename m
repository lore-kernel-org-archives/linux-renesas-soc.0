Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F13AC433FE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 17 May 2022 08:18:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236386AbiEQISJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 17 May 2022 04:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242906AbiEQISC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 04:18:02 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EF166496AB;
        Tue, 17 May 2022 01:17:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,232,1647270000"; 
   d="scan'208";a="121232061"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 May 2022 17:17:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.244])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D6B5C4004BD4;
        Tue, 17 May 2022 17:17:23 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 2/2] arm64: dts: renesas: rzv2m evk: Enable ethernet
Date:   Tue, 17 May 2022 09:16:45 +0100
Message-Id: <20220517081645.3764-3-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220517081645.3764-1-phil.edworthy@renesas.com>
References: <20220517081645.3764-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable Ethernet interface on RZ/V2M EVK.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 - No change
---
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
index 41cba82c2252..ec7099211cab 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
@@ -14,6 +14,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &avb;
 	};
 
 	chosen {
@@ -42,3 +43,16 @@ &extal_clk {
 &uart0 {
 	status = "okay";
 };
+
+&avb {
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+	phy-mode = "gmii";
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0022.1622",
+			     "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
-- 
2.34.1

