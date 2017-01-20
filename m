Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:20677 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752287AbdATVVM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 16:21:12 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 1/2] dt-bindings: document renesas-ostm timer
Date: Fri, 20 Jan 2017 16:20:02 -0500
Message-Id: <20170120212003.4103-2-chris.brandt@renesas.com>
In-Reply-To: <20170120212003.4103-1-chris.brandt@renesas.com>
References: <20170120212003.4103-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

---
v2:
* remove sw implementation specific portions
---
 .../devicetree/bindings/timer/renesas,ostm.txt     | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,ostm.txt

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.txt b/Documentation/devicetree/bindings/timer/renesas,ostm.txt
new file mode 100644
index 0000000..06d7d71
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.txt
@@ -0,0 +1,29 @@
+* Renesas OS Timer (OSTM)
+
+The OSTM is a multi-channel 32-bit timer/counter with fixed clock
+source that can operate in either interval count down timer or free-running
+compare match mode.
+
+Channels are independent from each other.
+
+Required Properties:
+
+  - compatible: must be one or more of the following:
+    - "renesas,r7s72100-ostm" for the r7s72100 OSTM
+    - "renesas,ostm" for any OSTM
+		This is a fallback for the above renesas,*-ostm entries
+
+  - reg: base address and length of the register block for a timer channel.
+
+  - interrupts: interrupt specifier for the timer channel.
+
+  - clocks: clock specifier for the timer channel.
+
+Example: R7S72100 (RZ/A1H) OSTM node
+
+	ostm0: ostm@fcfec000 {
+		compatible = "renesas,r7s72100-ostm", "renesas,ostm";
+		reg = <0xfcfec000 0x30>;
+		interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
+	};
-- 
2.10.1
