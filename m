Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/5] dt-bindings: mfd: bd9571mwv: Document rohm,ddr-backup-power
Date: Tue, 10 Oct 2017 17:26:14 +0200
Message-Id: <1507649178-31473-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1507649178-31473-1-git-send-email-geert+renesas@glider.be>
References: <1507649178-31473-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the new optional "rohm,ddr-backup-power" property.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/mfd/bd9571mwv.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/bd9571mwv.txt b/Documentation/devicetree/bindings/mfd/bd9571mwv.txt
index 9ab216a851d5619b..7ea3f2db41d4e501 100644
--- a/Documentation/devicetree/bindings/mfd/bd9571mwv.txt
+++ b/Documentation/devicetree/bindings/mfd/bd9571mwv.txt
@@ -25,6 +25,12 @@ Required properties:
 			    Each child node is defined using the standard
 			    binding for regulators.
 
+Optional properties:
+  - rohm,ddr-backup-power : Value to use for DDR-Backup Power.  This controls
+			    which DDR rails need to be kept powered when backup
+			    mode is enabled, cfr. the KEEPON_DDR* bits in the
+			    documentation for the "BKUP Mode Cnt" register.
+
 Example:
 
 	pmic: pmic@30 {
@@ -36,6 +42,7 @@ Example:
 		#interrupt-cells = <2>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		rohm,ddr-backup-power = <15>;
 
 		regulators {
 			dvfs: dvfs {
-- 
2.7.4

