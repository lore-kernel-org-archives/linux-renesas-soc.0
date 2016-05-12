Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:54504 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751833AbcELI3M (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 12 May 2016 04:29:12 -0400
Received: from vsmta11.fe.internet.bosch.com (unknown [10.4.98.51])
	by imta24.fe.bosch.de (Postfix) with ESMTP id CA128D80231
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 10:29:10 +0200 (CEST)
Received: from SI-HUB1000.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta11.fe.internet.bosch.com (Postfix) with ESMTP id 7262B23802C2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 10:29:10 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 1/6] reset: Add renesas,rst DT bindings.
Date: Thu, 12 May 2016 10:27:16 +0200
Message-ID: <1463041641-27485-2-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1463041641-27485-1-git-send-email-dirk.behme@de.bosch.com>
References: <1463041641-27485-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add DT bindings for the Renesas R-Car Reset Controller

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/reset/renesas,rst.txt      | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rst.txt

diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.txt b/Documentation/devicetree/bindings/reset/renesas,rst.txt
new file mode 100644
index 0000000..f84fd0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/renesas,rst.txt
@@ -0,0 +1,29 @@
+DT bindings for the Renesas R-Car Reset Controller
+
+The R-Car Reset Controller provides reset control, and implements the following
+functions:
+  - Register-based reset control for the various CPU cores,
+  - Latching of the levels on mode pins when PRESET# is negated,
+  - Mode monitoring register,
+  - Boot address registers for the various CPU cores.
+
+
+Required properties:
+  - compatible: Should be "renesas,rst-<soctype>", and "syscon".
+		Examples with soctypes are:
+		  - "renesas,rst-r8a7790" (R-Car H2)
+		  - "renesas,rst-r8a7791" (R-Car M2-W)
+		  - "renesas,rst-r8a7792" (R-Car V2H
+		  - "renesas,rst-r8a7793" (R-Car M2-N)
+		  - "renesas,rst-r8a7794" (R-Car E2)
+		  - "renesas,rst-r8a7795" (R-Car H3)
+		  - "renesas,rst-r8a7796" (R-Car M3)
+  - reg: Address start and address range for the device.
+
+
+Example:
+
+	rst: reset-controller@e6160000 {
+		compatible = "renesas,rst-r8a7795", "syscon";
+		reg = <0 0xe6160000 0 0x0200>;
+	};
-- 
2.8.0
