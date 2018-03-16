Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753769AbeCPOwx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:52:53 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 53/69] arm64: dts: renesas: salvator-common: Override EtherAVB phy-mode
Date: Fri, 16 Mar 2018 15:51:23 +0100
Message-Id: <3438ff82ddbaa430ccfcc11fe877691a7e326ae0.1521206129.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521206129.git.horms+renesas@verge.net.au>
References: <cover.1521206129.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

As the PHY interface installed on the Salvator-X[S] board, provides TX
channel delay, make the "phy-mode" property a board-specific one, meant
to override the one specified in the SoC DTSI.

Follow up patches will reset the r8a7795/96/965 SoC DTSI to use "rgmii"
mode and let the board files override that.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 89cbb3b95acd..2a7f36abd2dd 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -256,6 +256,7 @@
 	pinctrl-0 = <&avb_pins>;
 	pinctrl-names = "default";
 	phy-handle = <&phy0>;
+	phy-mode = "rgmii-txid";
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-- 
2.11.0
