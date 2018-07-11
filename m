Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:32646 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726384AbeGKIwu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 04:52:50 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: Unify the labels for RWDT
Date: Wed, 11 Jul 2018 17:48:26 +0900
Message-Id: <1531298906-8363-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The labels for RWDT device node were named as 2 types now:

 - wdt0: r8a7795, r8a7796, r8a77965.
 - rwdt: r8a77970, r8a77990, r8a77995.

To be made consistent, this patch unifis the labels as the hardware
name "rwdt".

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi         | 2 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi         | 2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi        | 2 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index e07546f..fb9d08a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -288,7 +288,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		wdt0: watchdog@e6020000 {
+		rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
 			clocks = <&cpg CPG_MOD 402>;
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index af81962..cbd35c0 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -266,7 +266,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		wdt0: watchdog@e6020000 {
+		rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7796-wdt",
 				     "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index a37749c..59afc55 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -138,7 +138,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		wdt0: watchdog@e6020000 {
+		rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a77965-wdt",
 				     "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 9687166..7d3d866 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -850,7 +850,7 @@
 	status = "okay";
 };
 
-&wdt0 {
+&rwdt {
 	timeout-sec = <60>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 83c546c..0ead552 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -444,7 +444,7 @@
 	status = "okay";
 };
 
-&wdt0 {
+&rwdt {
 	timeout-sec = <60>;
 	status = "okay";
 };
-- 
1.9.1
