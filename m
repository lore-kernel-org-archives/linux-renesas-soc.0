Return-Path: <SRS0+ku8b=NS=gmail.com=magnus.damm@vergenet.net>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au,Magnus Damm <magnus.damm@gmail.com>,laurent.pinchart+renesas@ideasonboard.com,geert+renesas@glider.be
Date: Mon, 18 Jan 2016 14:48:34 +0900
Message-Id: <20160118054834.22156.56150.sendpatchset@little-apple>
In-Reply-To: <20160118054817.22156.6531.sendpatchset@little-apple>
References: <20160118054817.22156.6531.sendpatchset@little-apple>
Subject: [PATCH/RFC 02/02] arm64: dts: Salvator-X: Enable 4 GiB of RAM
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Enable all the on-board memory for the r8a7795 Salvator-X board.

Not for upstream merge. Needs to be ordered with firmware update
to avoid overly complex dependencies.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

--- 0002/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ work/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts	2016-01-08 14:49:50.440513000 +0900
@@ -57,6 +57,21 @@
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
 
+	memory@500000000 {
+		device_type = "memory";
+		reg = <5 0x00000000 0 0x40000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <6 0x00000000 0 0x40000000>;
+	};
+
+	memory@700000000 {
+		device_type = "memory";
+		reg = <7 0x00000000 0 0x40000000>;
+	};
+
 	x12_clk: x12_clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
