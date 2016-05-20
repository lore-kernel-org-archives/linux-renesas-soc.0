Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:38076 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754463AbcETG7t (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 20 May 2016 02:59:49 -0400
Received: from vsmta12.fe.internet.bosch.com (unknown [10.4.98.52])
	by imta24.fe.bosch.de (Postfix) with ESMTP id 9001BD8009E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 May 2016 08:59:47 +0200 (CEST)
Received: from FE-HUB1001.de.bosch.com (vsgw23.fe.internet.bosch.com [10.4.98.23])
	by vsmta12.fe.internet.bosch.com (Postfix) with ESMTP id 33F141B8051D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 May 2016 08:59:47 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH v3 1/6] reset: Add renesas,rst DT bindings
Date: Fri, 20 May 2016 08:57:37 +0200
Message-ID: <1463727462-16260-2-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1463727462-16260-1-git-send-email-dirk.behme@de.bosch.com>
References: <1463727462-16260-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add DT bindings for the Renesas R-Car Reset Controller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 .../devicetree/bindings/reset/renesas,rst.txt      | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rst.txt

diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.txt b/Documentation/devicetree/bindings/reset/renesas,rst.txt
new file mode 100644
index 0000000..35f6c89
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
+  - compatible: Should be "renesas,<soctype>-rst", and "syscon".
+		Examples with soctypes are:
+		  - "renesas,r8a7790-rst" (R-Car H2)
+		  - "renesas,r8a7791-rst" (R-Car M2-W)
+		  - "renesas,r8a7792-rst" (R-Car V2H
+		  - "renesas,r8a7793-rst" (R-Car M2-N)
+		  - "renesas,r8a7794-rst" (R-Car E2)
+		  - "renesas,r8a7795-rst" (R-Car H3)
+		  - "renesas,r8a7796-rst" (R-Car M3-W)
+  - reg: Address start and address range for the device.
+
+
+Example:
+
+	rst: reset-controller@e6160000 {
+		compatible = "renesas,r8a7795-rst", "syscon";
+		reg = <0 0xe6160000 0 0x0200>;
+	};
-- 
2.8.0
