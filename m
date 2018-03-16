Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753477AbeCPOw5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:52:57 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 57/69] arm64: dts: renesas: v3msk: Override EtherAVB phy-mode
Date: Fri, 16 Mar 2018 15:51:27 +0100
Message-Id: <9dcd1f26b9914864e0218712a666b23cf7e589c8.1521206129.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521206129.git.horms+renesas@verge.net.au>
References: <cover.1521206129.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

As the PHY interface installed on the V3MSK board provides TX and RX
channels delays, make the "phy-mode" property a board-specific one,
meant to override the one specified in the SoC DTSI.

Follow up patches will reset the r8a77970 SoC DTSI to use "rgmii"
mode and let the board file override that.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 8624ca87d6b2..bb554eec57c8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -34,6 +34,7 @@
 &avb {
 	renesas,no-ether-link;
 	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-- 
2.11.0
