Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56217 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752697AbdKJN0P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Nov 2017 08:26:15 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 2/2] arm64: dts: renesas: r8a77995: Connect Ethernet-AVB to IPMMU-RT
Date: Fri, 10 Nov 2017 14:26:05 +0100
Message-Id: <20171110132605.1537-3-horms+renesas@verge.net.au>
In-Reply-To: <20171110132605.1537-1-horms+renesas@verge.net.au>
References: <20171110132605.1537-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add IPMMU-RT to the Ethernet-AVB device node.

Based on work by Magnus Damm for the r8a7795.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2
* Added reviewed by tag from Geert Uytterhoeven
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index cbcd982542a3..7f269fbe44d1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -389,6 +389,7 @@
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			resets = <&cpg 812>;
 			phy-mode = "rgmii-txid";
+			iommus = <&ipmmu_ds0 16>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-- 
2.11.0
