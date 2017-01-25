Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:38400 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751574AbdAYNTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 08:19:33 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: r8a7796: Mark EthernetAVB device node disabled
Date: Wed, 25 Jan 2017 14:19:31 +0100
Message-Id: <1485350371-16091-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1485350371-16091-1-git-send-email-geert+renesas@glider.be>
References: <1485350371-16091-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Device nodes representing I/O devices should be marked disabled in the
SoC-specific DTS, and overridden by board-specific DTSes where needed.

Fixes: 8e8b9eaef8fb05d9 ("arm64: dts: renesas: r8a7796: Add EthernetAVB instance")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
r8a7796-salvator-x.dts already has the override.

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 82c5ef1b60659944..f7120cdedd0d67b2 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -472,6 +472,7 @@
 			phy-mode = "rgmii-id";
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		scif2: serial@e6e88000 {
-- 
1.9.1
