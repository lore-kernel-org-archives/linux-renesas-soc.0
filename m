Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:19241 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbeHQQXL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 12:23:11 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: linux-renesas-soc@vger.kernel.org
Cc: horms@verge.net.au, geert@linux-m68k.org,
        khiem.nguyen.xt@rvc.renesas.com, dien.pham.ry@renesas.com,
        takeshi.kihara.df@renesas.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 5/5] arm64: dts: r8a7796-m3ulcb: Disable cpuidle support for CA53 cores
Date: Fri, 17 Aug 2018 15:19:28 +0200
Message-Id: <1534511968-19634-6-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1534511968-19634-1-git-send-email-uli+renesas@fpond.eu>
References: <1534511968-19634-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

The revision of the R8A7796 SoC on the M3ULCB board is ES1.0. This revision
can not use cpuidle for CA53 cores.

Therefore, this patch disables cpuidle support for CA53 cores.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
index 9e4594c..cf96675 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -14,6 +14,12 @@
 	model = "Renesas M3ULCB board based on r8a7796";
 	compatible = "renesas,m3ulcb", "renesas,r8a7796";
 
+	cpus {
+		idle-states {
+			/delete-node/ cpu-sleep-1;
+		};
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
@@ -26,6 +32,22 @@
 	};
 };
 
+&a53_0 {
+	/delete-property/ cpu-idle-states;
+};
+
+&a53_1 {
+	/delete-property/ cpu-idle-states;
+};
+
+&a53_2 {
+	/delete-property/ cpu-idle-states;
+};
+
+&a53_3 {
+	/delete-property/ cpu-idle-states;
+};
+
 &du {
 	clocks = <&cpg CPG_MOD 724>,
 		 <&cpg CPG_MOD 723>,
-- 
2.7.4
