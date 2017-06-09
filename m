Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] arm64: dts: renesas: Add common Salvator-XS board support
Date: Fri,  9 Jun 2017 13:43:48 +0200
Message-Id: <1497008629-3974-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1497008629-3974-1-git-send-email-geert+renesas@glider.be>
References: <1497008629-3974-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Renesas Salvator-XS (Salvator-X 2nd version) development board can
be equipped with either an R-Car H3 ES2.0 or M3-W ES1.x SiP, which are
pin-compatible.

Add initial support for the common parts of the Salvator-XS board into
its own .dtsi file, to be included by the DTSes for the H3/M3-W
versions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-xs.dtsi

diff --git a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
new file mode 100644
index 0000000000000000..81227e3c2c6f1e2d
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
@@ -0,0 +1,20 @@
+/*
+ * Device Tree Source for the Salvator-X 2nd version board
+ *
+ * Copyright (C) 2015-2017 Renesas Electronics Corp.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+#include "salvator-common.dtsi"
+
+/ {
+	model = "Renesas Salvator-X 2nd version board";
+	compatible = "renesas,salvator-xs";
+};
+
+&extal_clk {
+	clock-frequency = <16640000>;
+};
-- 
2.7.4
