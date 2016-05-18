Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:28556 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752407AbcERLVK (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 18 May 2016 07:21:10 -0400
Received: from vsmta14.fe.internet.bosch.com (unknown [10.4.98.54])
	by imta23.fe.bosch.de (Postfix) with ESMTP id E6D2D1580159
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2016 13:21:08 +0200 (CEST)
Received: from SI-HUB1000.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta14.fe.internet.bosch.com (Postfix) with ESMTP id 8FB8FA40829
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2016 13:21:08 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH v2 5/6] arm64: dts: renesas: Link CPG to RST using "renesas,modemr"
Date: Wed, 18 May 2016 13:19:07 +0200
Message-ID: <1463570348-32349-6-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1463570348-32349-1-git-send-email-dirk.behme@de.bosch.com>
References: <1463570348-32349-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add a link from the Clock Pulse Generator node to the Reset Controller
node, so the CPG can read the Mode Monitoring Register (MODEMR) to
obtain the mode pin values.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 7be6ae0..4e05fcc 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -307,6 +307,7 @@
 			clock-names = "extal", "extalr";
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
+			renesas,modemr = <&rst 0x60>;
 		};
 
 		sysc: system-controller@e6180000 {
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 75ac18d..13d714d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -107,6 +107,7 @@
 			clock-names = "extal", "extalr";
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
+			renesas,modemr = <&rst 0x60>;
 		};
 
 		sysc: system-controller@e6180000 {
-- 
2.8.0
