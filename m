Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:40040 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751793AbdKZAjg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Nov 2017 19:39:36 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] rcar-csi2: enable support for r8a77970
Date: Sun, 26 Nov 2017 01:39:18 +0100
Message-Id: <20171126003918.21976-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20171126003918.21976-1-niklas.soderlund+renesas@ragnatech.se>
References: <20171126003918.21976-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable support for Renesas r8a77970 (V3M) by adding the new SoC specific
setup procedure and device tree binding.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/media/renesas,rcar-csi2.txt           |   1 +
 drivers/media/platform/rcar-vin/rcar-csi2.c        | 100 ++++++++++++++++++++-
 2 files changed, 98 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
index 688afd83bf66f8cf..2dd0a20e59d4c294 100644
--- a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
+++ b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
@@ -10,6 +10,7 @@ Mandatory properties
  - compatible: Must be one or more of the following
    - "renesas,r8a7795-csi2" for the R8A7795 device.
    - "renesas,r8a7796-csi2" for the R8A7796 device.
+   - "renesas,r8a77970-csi2" for the R8A77970 device.
 
  - reg: the register base and size for the device registers
  - interrupts: the interrupt for the device
diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 9afbd03d2dedf4cb..5345f4b1e30226e9 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -118,6 +118,11 @@
 
 /* PHY Test Interface Write Register */
 #define PHTW_REG			0x50
+#define PHTW_DWEN			BIT(24)
+#define PHTW_TESTDIN_DATA(n)		(((n & 0xff)) << 16)
+#define PHTW_CWEN			BIT(8)
+#define PHTW_TESTDIN_CODE(n)		((n & 0xff))
+
 
 /* PHY Test Interface Clear */
 #define PHTC_REG			0x58
@@ -228,6 +233,55 @@ static const struct phypll_hsfreqrange hsfreqrange_m3w_h3es1[] = {
 	{ .mbps =   0,	.reg = 0x00 },
 };
 
+struct phtw_testdin_data {
+	u16 mbps;
+	u16 reg;
+};
+
+static const struct phtw_testdin_data testdin_data_v3m_e3[] = {
+	{ .mbps =   80, .reg = 0x00 },
+	{ .mbps =   90, .reg = 0x20 },
+	{ .mbps =  100, .reg = 0x40 },
+	{ .mbps =  110, .reg = 0x02 },
+	{ .mbps =  130, .reg = 0x22 },
+	{ .mbps =  140, .reg = 0x42 },
+	{ .mbps =  150, .reg = 0x04 },
+	{ .mbps =  170, .reg = 0x24 },
+	{ .mbps =  180, .reg = 0x44 },
+	{ .mbps =  200, .reg = 0x06 },
+	{ .mbps =  220, .reg = 0x26 },
+	{ .mbps =  240, .reg = 0x46 },
+	{ .mbps =  250, .reg = 0x08 },
+	{ .mbps =  270, .reg = 0x28 },
+	{ .mbps =  300, .reg = 0x0a },
+	{ .mbps =  330, .reg = 0x2a },
+	{ .mbps =  360, .reg = 0x4a },
+	{ .mbps =  400, .reg = 0x0c },
+	{ .mbps =  450, .reg = 0x2c },
+	{ .mbps =  500, .reg = 0x0e },
+	{ .mbps =  550, .reg = 0x2e },
+	{ .mbps =  600, .reg = 0x10 },
+	{ .mbps =  650, .reg = 0x30 },
+	{ .mbps =  700, .reg = 0x12 },
+	{ .mbps =  750, .reg = 0x32 },
+	{ .mbps =  800, .reg = 0x52 },
+	{ .mbps =  850, .reg = 0x72 },
+	{ .mbps =  900, .reg = 0x14 },
+	{ .mbps =  950, .reg = 0x34 },
+	{ .mbps = 1000, .reg = 0x54 },
+	{ .mbps = 1050, .reg = 0x74 },
+	{ .mbps = 1100, .reg = 0x16 },
+	{ .mbps = 1150, .reg = 0x36 },
+	{ .mbps = 1200, .reg = 0x56 },
+	{ .mbps = 1250, .reg = 0x76 },
+	{ .mbps = 1300, .reg = 0x18 },
+	{ .mbps = 1350, .reg = 0x38 },
+	{ .mbps = 1400, .reg = 0x58 },
+	{ .mbps = 1500, .reg = 0x78 },
+	/* guard */
+	{ .mbps =   0,	.reg = 0x00 },
+};
+
 /* PHY ESC Error Monitor */
 #define PHEERM_REG			0x74
 
@@ -276,6 +330,7 @@ enum rcar_csi2_pads {
 
 struct rcar_csi2_info {
 	const struct phypll_hsfreqrange *hsfreqrange;
+	const struct phtw_testdin_data *testdin_data;
 	unsigned int csi0clkfreqrange;
 	bool clear_ulps;
 	bool init_phtw;
@@ -403,6 +458,29 @@ static int rcar_csi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 	return 0;
 }
 
+static int rcar_csi2_set_phtw(struct rcar_csi2 *priv, unsigned int mbps)
+{
+	const struct phtw_testdin_data *testdin;
+
+	for (testdin = priv->info->testdin_data; testdin->mbps != 0; testdin++)
+		if (testdin->mbps >= mbps)
+			break;
+
+	if (!testdin->mbps) {
+		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
+		return -ERANGE;
+	}
+
+	dev_dbg(priv->dev, "PHY TESTDIN_DATA requested %u got %u Mbps\n", mbps,
+		testdin->mbps);
+
+	rcar_csi2_write(priv, PHTW_REG,
+			PHTW_DWEN | PHTW_TESTDIN_DATA(testdin->reg) |
+			PHTW_CWEN | PHTW_TESTDIN_CODE(0x44));
+
+	return 0;
+}
+
 static int rcar_csi2_start(struct rcar_csi2 *priv)
 {
 	const struct rcar_csi2_format *format;
@@ -494,9 +572,17 @@ static int rcar_csi2_start(struct rcar_csi2 *priv)
 	}
 
 	/* Start */
-	ret = rcar_csi2_set_phypll(priv, mbps);
-	if (ret)
-		return ret;
+	if (priv->info->hsfreqrange) {
+		ret = rcar_csi2_set_phypll(priv, mbps);
+		if (ret)
+			return ret;
+	}
+
+	if (priv->info->testdin_data) {
+		ret = rcar_csi2_set_phtw(priv, mbps);
+		if (ret)
+			return ret;
+	}
 
 	/* Set frequency range if we have it */
 	if (priv->info->csi0clkfreqrange)
@@ -782,6 +868,10 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7796 = {
 	.hsfreqrange = hsfreqrange_m3w_h3es1,
 };
 
+static const struct rcar_csi2_info rcar_csi2_info_r8a77970 = {
+	.testdin_data = testdin_data_v3m_e3,
+};
+
 static const struct of_device_id rcar_csi2_of_table[] = {
 	{
 		.compatible = "renesas,r8a7795-csi2",
@@ -791,6 +881,10 @@ static const struct of_device_id rcar_csi2_of_table[] = {
 		.compatible = "renesas,r8a7796-csi2",
 		.data = &rcar_csi2_info_r8a7796,
 	},
+	{
+		.compatible = "renesas,r8a77970-csi2",
+		.data = &rcar_csi2_info_r8a77970,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, rcar_csi2_of_table);
-- 
2.15.0
