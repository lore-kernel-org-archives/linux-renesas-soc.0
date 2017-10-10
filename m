Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:44608 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932345AbdJJP0i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 11:26:38 -0400
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
Subject: [PATCH/RFC 5/5] arm64: dts: renesas: salvator-common: Configure PMIC for DDR Backup Power
Date: Tue, 10 Oct 2017 17:26:18 +0200
Message-Id: <1507649178-31473-6-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1507649178-31473-1-git-send-email-geert+renesas@glider.be>
References: <1507649178-31473-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Salvator-X(S), all of DDR0, DDR1, DDR0C, and DDR1C need to be kept
powered when backup mode is enabled.

Reflect this in the rohm,ddr-backup-power property for the BD9571MWV
PMIC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index c171718bac7f52a1..68245d87c305855c 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -366,6 +366,7 @@
 		#interrupt-cells = <2>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		rohm,ddr-backup-power = <15>;
 
 		regulators {
 			dvfs: dvfs {
-- 
2.7.4
