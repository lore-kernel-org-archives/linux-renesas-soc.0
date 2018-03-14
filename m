Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/3] arm64: dts: renesas: salvator-common: Configure PMIC for DDR Backup Power
Date: Wed, 14 Mar 2018 13:09:45 +0100
Message-Id: <1521029386-29975-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1521029386-29975-1-git-send-email-geert+renesas@glider.be>
References: <1521029386-29975-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Salvator-X(S), all of the DDR0, DDR1, DDR0C, and DDR1C power rails
need to be kept powered when backup mode is enabled.  Reflect this in
the "rohm,ddr-backup-power" property for the BD9571MWV PMIC node.

The accessory power switch (SW23) is a toggle switch, hense specify
"rohm,rstbmode-level".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Add rohm,rstbmode-level.
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 2a7f36abd2dd85c6..80794c38c2669d75 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -376,6 +376,8 @@
 		#interrupt-cells = <2>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		rohm,ddr-backup-power = <15>;
+		rohm,rstbmode-level;
 
 		regulators {
 			dvfs: dvfs {
-- 
2.7.4

