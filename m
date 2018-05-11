Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:16108 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752468AbeEKEbz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 00:31:55 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/4] arm64: dts: renesas: r8a77990: Add PFC device node
Date: Fri, 11 May 2018 13:31:18 +0900
Message-Id: <1526013081-28005-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1526013081-28005-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526013081-28005-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds PFC device node for r8a77990 (R-Car E3).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 4658029..efc3c0b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -60,6 +60,11 @@
 		#size-cells = <2>;
 		ranges;
 
+		pfc: pin-controller@e6060000 {
+			compatible = "renesas,pfc-r8a77990";
+			reg = <0 0xe6060000 0 0x508>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a77990-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
-- 
1.9.1
