Return-Path: <SRS0+93W/=OP=gmail.com=magnus.damm@vergenet.net>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au,Magnus Damm <magnus.damm@gmail.com>,laurent.pinchart+renesas@ideasonboard.com,geert+renesas@glider.be
Date: Tue, 16 Feb 2016 11:46:08 +0900
Message-Id: <20160216024608.14281.20516.sendpatchset@little-apple>
Subject: [PATCH/RFC] arm64: dts: r8a7795: Salvator-X INTC-EX IRQ2 test prototype
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

This patch is a prototype hack that can be used to test INTC-EX
using the IRQ2 signal on r8a7795 Salvator-X with a loop back
adapter.

The external loop back adapter is connected to EXIO_D and
connects pin 9 (IRQ2/GP2_02) and pin 26 (ExA22/GP2_06).

To test enable CONFIG_GPIO_SYSFS and CONFIG_KEYBOARD_GPIO and
export GP2_06 via /sys/class/gpio/export and then change the
value of the pin and see how interrupt debug messages are
output on the console from the irq-renesas-irqc.c driver.

Not for upstream merge.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

Written on top of renesas-drivers-2016-02-09-v4.5-rc3 and

 [PATCH 00/02] arm64: r8a7795 INTC-EX support using RENESAS_IRQC
 [PATCH 01/02] arm64: dts: r8a7795: Add INTC-EX device node
 [PATCH 02/02] arm64: renesas: Enable RENESAS_IRQC
 [PATCH] pinctrl: sh-pfc: r8a7795: Add support for INTC-EX IRQ pins
 [PATCH] clk: shmobile: r8a7795: Add INTC-EX clock

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |   31 ++++++++++++++++++++
 drivers/irqchip/irq-renesas-irqc.c                 |    2 -
 2 files changed, 32 insertions(+), 1 deletion(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ work/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts	2016-02-16 11:32:50.420513000 +0900
@@ -33,6 +33,8 @@
 
 /dts-v1/;
 #include "r8a7795.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Renesas Salvator-X board based on r8a7795";
@@ -55,6 +57,30 @@
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
 
+	keyboard {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpiokey_pins>;
+		pinctrl-names = "default";
+
+		button@1 {
+			linux,code = <KEY_1>;
+			label = "SW21";
+			wakeup-source;
+			debounce-interval = <20>;
+			gpios = <&gpio6 12 GPIO_ACTIVE_LOW>;
+		};
+		button@2 {
+			linux,code = <KEY_2>;
+			label = "SW22";
+			wakeup-source;
+			debounce-interval = <20>;
+			gpios = <&gpio6 13 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&intc_ex>;
+			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+
 	x12_clk: x12_clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -96,6 +122,11 @@
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
 
+	gpiokey_pins: gpiokey1 {
+		renesas,groups = "intc_ex_irq2";
+		renesas,function = "intc_ex";
+	};
+
 	scif1_pins: scif1 {
 		renesas,groups = "scif1_data_a", "scif1_ctrl";
 		renesas,function = "scif1";
--- 0001/drivers/irqchip/irq-renesas-irqc.c
+++ work/drivers/irqchip/irq-renesas-irqc.c	2016-02-16 11:32:13.130513000 +0900
@@ -16,7 +16,7 @@
  * along with this program; if not, write to the Free Software
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
-
+#define DEBUG
 #include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
