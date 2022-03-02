Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF35C433EF
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Mar 2022 10:33:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240915AbiCBKeD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Mar 2022 05:34:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241022AbiCBKeC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Mar 2022 05:34:02 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2C926BECC6;
        Wed,  2 Mar 2022 02:33:16 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,148,1643641200"; 
   d="scan'208";a="112094560"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Mar 2022 19:33:15 +0900
Received: from localhost.localdomain (unknown [10.226.93.124])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7571F4235F95;
        Wed,  2 Mar 2022 19:33:13 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] arm64: dts: renesas: rzg2lc-smarc: Enable Audio
Date:   Wed,  2 Mar 2022 10:33:01 +0000
Message-Id: <20220302103301.23852-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220302103301.23852-1-biju.das.jz@bp.renesas.com>
References: <20220302103301.23852-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable Audio on RZ/G2LC SMARC EVK by deleting ssi0 entries from
board DT and adding pincontrol entries to the soc-pinctrl dtsi,
so that entries from common dtsi kick in and make audio functionality
operational.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts         | 6 ------
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi | 7 +++++++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
index 52b834205126..74a2f2bade10 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
@@ -19,9 +19,3 @@
 	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
-
-&ssi0 {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-names;
-	status = "disabled";
-};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
index 1322e5bcd456..d275a55333e3 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
@@ -106,6 +106,13 @@
 		input-enable;
 	};
 
+	ssi0_pins: ssi0 {
+		pinmux = <RZG2L_PORT_PINMUX(45, 0, 1)>, /* BCK */
+			 <RZG2L_PORT_PINMUX(45, 1, 1)>, /* RCK */
+			 <RZG2L_PORT_PINMUX(45, 2, 1)>, /* TXD */
+			 <RZG2L_PORT_PINMUX(45, 3, 1)>; /* RXD */
+	};
+
 	usb0_pins: usb0 {
 		pinmux = <RZG2L_PORT_PINMUX(4, 0, 1)>, /* VBUS */
 			 <RZG2L_PORT_PINMUX(5, 0, 1)>, /* OVC */
-- 
2.17.1

