Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from stcim.de ([78.46.90.227]:49588 "EHLO stcim.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728075AbeJGWrz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Oct 2018 18:47:55 -0400
From: Stefan Lengfeld <contact@stefanchrist.eu>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        preid@electromag.com.au, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.or, j-keerthy@ti.com,
        t-kristo@ti.com, grygorii.strashko@ti.com,
        andriy.shevchenko@linux.intel.com
Subject: [RFC PATCH 3/3] ARM: dts: phyboard-mira-dl: rely on PMIC for reboot and watchdog
Date: Sun,  7 Oct 2018 17:39:37 +0200
Message-Id: <20181007153937.16787-4-contact@stefanchrist.eu>
In-Reply-To: <20181007153937.16787-1-contact@stefanchrist.eu>
References: <20180923202034.qugs4fxucj7h4vri@porty>
 <20181007153937.16787-1-contact@stefanchrist.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Stefan Christ <s.christ@phytec.de>

Rely on PMIC watchdog and reboot support. The i.MX6 internal watchdog
cannot be used, because it does not reset external PMIC voltages on
reset.

Signed-off-by: Stefan Christ <s.christ@phytec.de>
Signed-off-by: Christian Hemp <c.hemp@phytec.de>
---
 arch/arm/boot/dts/imx6dl-phytec-mira-rdk-nand.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-phytec-mira-rdk-nand.dts b/arch/arm/boot/dts/imx6dl-phytec-mira-rdk-nand.dts
index 9f7f9f98139d..04e2d5a1b998 100644
--- a/arch/arm/boot/dts/imx6dl-phytec-mira-rdk-nand.dts
+++ b/arch/arm/boot/dts/imx6dl-phytec-mira-rdk-nand.dts
@@ -62,3 +62,11 @@
 &usdhc1 {
 	status = "okay";
 };
+
+&wdog1 {
+	/*
+	 * Rely on PMIC reboot handler. Internal i.MX6 watchdog, that is also
+	 * used for reboot, does not reset all external PMIC voltages on reset.
+	 */
+	status = "disabled";
+};
-- 
2.16.4
