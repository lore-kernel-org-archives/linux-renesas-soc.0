Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:12977 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729682AbeK3EJW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 23:09:22 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/4] rtc: pcf85363: Add support for NXP pcf85263 rtc
Date: Thu, 29 Nov 2018 16:54:44 +0000
Message-Id: <1543510486-29532-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543510486-29532-1-git-send-email-biju.das@bp.renesas.com>
References: <1543510486-29532-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for NXP pcf85263 real-time clock. pcf85263 rtc is compatible
with pcf85363,except that pcf85363 has additional 64 bytes of RAM.

1 byte of nvmem is supported and exposed in sysfs (# is the instance
number,starting with 0): /sys/bus/nvmem/devices/pcf85x63-#/nvmem

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 V1-->V2 Incorporated Alexandre and Geert's review comment.
---
 drivers/rtc/rtc-pcf85363.c | 72 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 57 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index c04a1ed..9c567c8 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -311,7 +311,30 @@ static int pcf85363_nvram_write(void *priv, unsigned int offset, void *val,
 				 val, bytes);
 }
 
-static const struct regmap_config regmap_config = {
+static int pcf85x63_nvram_read(void *priv, unsigned int offset, void *val,
+			       size_t bytes)
+{
+	struct pcf85363 *pcf85363 = priv;
+
+	return regmap_read(pcf85363->regmap, CTRL_RAMBYTE, val);
+}
+
+static int pcf85x63_nvram_write(void *priv, unsigned int offset, void *val,
+				size_t bytes)
+{
+	struct pcf85363 *pcf85363 = priv;
+
+	return regmap_write(pcf85363->regmap, CTRL_RAMBYTE,
+				*((unsigned int *)val));
+}
+
+static const struct regmap_config pcf_85263_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x2f,
+};
+
+static const struct regmap_config pcf_85363_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 0x7f,
@@ -321,15 +344,25 @@ static int pcf85363_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
 	struct pcf85363 *pcf85363;
-	struct nvmem_config nvmem_cfg = {
-		.name = "pcf85363-",
-		.word_size = 1,
-		.stride = 1,
-		.size = NVRAM_SIZE,
-		.reg_read = pcf85363_nvram_read,
-		.reg_write = pcf85363_nvram_write,
+	const struct regmap_config *regmap_config = &pcf_85363_regmap_config;
+	struct nvmem_config nvmem_cfg[] = {
+		{
+			.name = "pcf85x63-",
+			.word_size = 1,
+			.stride = 1,
+			.size = 1,
+			.reg_read = pcf85x63_nvram_read,
+			.reg_write = pcf85x63_nvram_write,
+		}, {
+			.name = "pcf85363-",
+			.word_size = 1,
+			.stride = 1,
+			.size = NVRAM_SIZE,
+			.reg_read = pcf85363_nvram_read,
+			.reg_write = pcf85363_nvram_write,
+		},
 	};
-	int ret;
+	int ret, i, num_nvmem = 2;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
@@ -339,7 +372,13 @@ static int pcf85363_probe(struct i2c_client *client,
 	if (!pcf85363)
 		return -ENOMEM;
 
-	pcf85363->regmap = devm_regmap_init_i2c(client, &regmap_config);
+	if (of_device_get_match_data(&client->dev) ==
+					&pcf_85263_regmap_config) {
+		regmap_config = &pcf_85263_regmap_config;
+		num_nvmem = 1;
+	}
+
+	pcf85363->regmap = devm_regmap_init_i2c(client, regmap_config);
 	if (IS_ERR(pcf85363->regmap)) {
 		dev_err(&client->dev, "regmap allocation failed\n");
 		return PTR_ERR(pcf85363->regmap);
@@ -370,15 +409,18 @@ static int pcf85363_probe(struct i2c_client *client,
 
 	ret = rtc_register_device(pcf85363->rtc);
 
-	nvmem_cfg.priv = pcf85363;
-	rtc_nvmem_register(pcf85363->rtc, &nvmem_cfg);
+	for (i = 0; i < num_nvmem ; i++) {
+		nvmem_cfg[i].priv = pcf85363;
+		rtc_nvmem_register(pcf85363->rtc, &nvmem_cfg[i]);
+	}
 
 	return ret;
 }
 
 static const struct of_device_id dev_ids[] = {
-	{ .compatible = "nxp,pcf85363" },
-	{}
+	{ .compatible = "nxp,pcf85263", .data = &pcf_85263_regmap_config },
+	{ .compatible = "nxp,pcf85363", .data = &pcf_85363_regmap_config },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dev_ids);
 
@@ -393,5 +435,5 @@ static struct i2c_driver pcf85363_driver = {
 module_i2c_driver(pcf85363_driver);
 
 MODULE_AUTHOR("Eric Nelson");
-MODULE_DESCRIPTION("pcf85363 I2C RTC driver");
+MODULE_DESCRIPTION("pcf85263/pcf85363 I2C RTC driver");
 MODULE_LICENSE("GPL");
-- 
2.7.4
