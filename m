Return-Path: <devicetree-owner@vger.kernel.org>
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: horms@verge.net.au, geert@linux-m68k.org, magnus.damm@gmail.com,
        robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: gr-peach: Enable MTU2 timer pulse unit
Date: Thu,  5 Oct 2017 10:58:19 +0200
Message-Id: <1507193900-23801-3-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1507193900-23801-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1507193900-23801-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

MTU2 multi-function/multi-channel timer/counter is not enabled for
GR-Peach board. The timer is used as clock event source to schedule
wake-ups, and without this enabled all sleeps not performed through busy
waiting hang the board.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-gr-peach.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
index 20309ac..ad6a627 100644
--- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts
@@ -78,6 +78,10 @@
 	clock-frequency = <48000000>;
 };
 
+&mtu2 {
+	status = "okay";
+};
+
 &scif2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&scif2_pins>;
-- 
2.7.4

