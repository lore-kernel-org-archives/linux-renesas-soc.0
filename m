Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: horms@verge.net.au, geert@linux-m68k.org, magnus.damm@gmail.com,
        robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm: dts: gr-peach: Reduce extal_clk resolution
Date: Wed,  4 Oct 2017 17:40:57 +0200
Message-Id: <1507131657-6414-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The system clock described by extal_clk is reported to have a frequency
of 13.333 Mhz and is correctly described by gr-peach device tree.

However, when enabling a RIIC device the following error is reported by
drivers/i2c/busses/i2c-riic.c

"invalid parent clk (33332500). Must be 33325000Hz"

As RIIC devices have a clock source obtained by dividing by 12 the
system clock, the resulting value is not accepted by the driver
(which clearly states not to support any frequency except the reported
33325000Hz one).

Hence, reduce the system clock accuracy to a value which makes
frequencies obtained through division accepted by RIIC driver.

Please note that other r7s72100 boards, such as Genmai, report the same
"reduced accuracy" frequency, even if their external clock sources are
effectively 13.333Mhz as gr-peach one.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-gr-peach.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
index a1c5e88..20309ac 100644
--- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts
@@ -71,7 +71,7 @@
 };

 &extal_clk {
-	clock-frequency = <13333000>;
+	clock-frequency = <13330000>;
 };

 &usb_x1_clk {
--
2.7.4
