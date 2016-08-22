Return-Path: <devicetree-owner@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: blanche: add support for general purpose LEDs
Date: Mon, 22 Aug 2016 23:39:30 +0300
Message-ID: <1529754.UBcqZ7GKj7@wasted.cogentembedded.com>
In-Reply-To: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
References: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for the general purpose LEDs on the Blanche board.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20160822-v4.8-rc3' of Simon Horman's
'renesas.git' repo plus the SDHI0/DU patches posted earlier.

 arch/arm/boot/dts/r8a7792-blanche.dts |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792-blanche.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
+++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -159,6 +159,27 @@
 		};
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led17 {
+			gpios = <&gpio10 10 GPIO_ACTIVE_HIGH>;
+			label = "LED17";
+		};
+		led18 {
+			gpios = <&gpio10 11 GPIO_ACTIVE_HIGH>;
+			label = "LED18";
+		};
+		led19 {
+			gpios = <&gpio10 12 GPIO_ACTIVE_HIGH>;
+			label = "LED19";
+		};
+		led20 {
+			gpios = <&gpio10 23 GPIO_ACTIVE_HIGH>;
+			label = "LED20";
+		};
+	};
+
 	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 

