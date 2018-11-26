Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35272 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbeKZXtn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 18:49:43 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 15/40] arm64: dts: renesas: r8a77980: Connect R-Car V3H AVB to IPMMU
Date: Mon, 26 Nov 2018 13:54:41 +0100
Message-Id: <7ffbcb232c7b8f90dbb40338ce084b65c65fb9fc.1543229515.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1543229515.git.horms+renesas@verge.net.au>
References: <cover.1543229515.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Hook up the R-Car V3H AVB device to IPMMU-DS1 33 as described in
the data sheet.

Signed-off-by: Magnus Damm <damm@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 54acc494a43f..ce2c9955df75 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -602,6 +602,7 @@
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 812>;
 			phy-mode = "rgmii";
+			iommus = <&ipmmu_ds1 33>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-- 
2.11.0
