Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:23048 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752343AbdBMS0I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 13:26:08 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/3] dt-bindings: power: reset: add document for renesas-reset driver
Date: Mon, 13 Feb 2017 13:25:31 -0500
Message-Id: <20170213182532.4042-3-chris.brandt@renesas.com>
In-Reply-To: <20170213182532.4042-1-chris.brandt@renesas.com>
References: <20170213182532.4042-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add device tree bindings document for renesas-reset driver.
This driver uses the WDT hardware to issue an immediate reset.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 .../devicetree/bindings/power/reset/renesas-reset.txt     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/renesas-reset.txt

diff --git a/Documentation/devicetree/bindings/power/reset/renesas-reset.txt b/Documentation/devicetree/bindings/power/reset/renesas-reset.txt
new file mode 100644
index 0000000..241722d
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/renesas-reset.txt
@@ -0,0 +1,15 @@
+Device-Tree bindings for Renesas WDT reset functionality
+
+Required properties:
+  - compatible: must be one or more of the following:
+    - "renesas,r7s72100-reset" for the r7s72100 SoC
+    - "renesas,wdt-reset"
+                This is a fallback for the above renesas,*-reset entries
+
+  - reg: base address and length of the WDT register block
+
+Example node:
+	wdt: timer@fcfe0000 {
+		compatible = "renesas,r7s72100-reset", "renesas,wdt-reset";
+		reg = <0xfcfe0000 0x6>;
+	};
-- 
2.10.1
