Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:62251 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755034AbeCSM2j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 08:28:39 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 6/7] arm64: dts: renesas: r8a77965: add USB 3.0 host node
Date: Mon, 19 Mar 2018 21:28:26 +0900
Message-Id: <1521462507-23287-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1521462507-23287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1521462507-23287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds USB 3.0 host node for r8a77965.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index ac74413..a34b80a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -956,8 +956,14 @@
 		};
 
 		xhci0: usb@ee000000 {
+			compatible = "renesas,xhci-r8a77965",
+				     "renesas,rcar-gen3-xhci";
 			reg = <0 0xee000000 0 0xc00>;
-			/* placeholder */
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 328>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 328>;
+			status = "disabled";
 		};
 
 		wdt0: watchdog@e6020000 {
-- 
1.9.1
