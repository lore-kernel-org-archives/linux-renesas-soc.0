Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753802AbeCPOxK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:53:10 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 67/69] arm64: dts: renesas: r8a7795: Add IPMMU-PV1 device node
Date: Fri, 16 Mar 2018 15:51:37 +0100
Message-Id: <9dd660eb1c201304b5d79012695fc6bca57f99a0.1521206129.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521206129.git.horms+renesas@verge.net.au>
References: <cover.1521206129.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add r8a7795 IPMMU-PV1 and keep it disabled by default.

This device is not present in r8a7795 ES1.x and
is removed from the DT of those SoCs.

This corrects an omission in
3b7e7848f0e8 ("arm64: dts: renesas: r8a7795: Add IPMMU device nodes")

This does not have any runtime effect.

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index f1d5e90503d5..f9acd125d687 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -23,6 +23,7 @@
 
 	/delete-node/ mmu@febe0000;
 	/delete-node/ mmu@fe980000;
+	/delete-node/ mmu@fd950000;
 	/delete-node/ mmu@fd960000;
 	/delete-node/ mmu@fd970000;
 
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 09953cda3a55..0648fe451d09 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -545,6 +545,15 @@
 			status = "disabled";
 		};
 
+		ipmmu_pv1: mmu@fd950000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xfd950000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 7>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
 		ipmmu_pv2: mmu@fd960000 {
 			compatible = "renesas,ipmmu-r8a7795";
 			reg = <0 0xfd960000 0 0x1000>;
-- 
2.11.0
