Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:32901 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbeLDS11 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 13:27:27 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: vc5: Add suspend/resume support
Date: Tue,  4 Dec 2018 19:27:21 +0100
Message-Id: <20181204182721.28258-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add simple suspend/resume handlers to the driver to restore the chip
configuration after resume. It is possible that the chip was configured
with non-default values before suspend-resume cycle and that the chip
is powered down during this cycle, so the configuration could get lost.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Alexey Firago <alexey_firago@mentor.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/clk/clk-versaclock5.c | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index decffb3826ec..ac90fb36af1a 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -906,6 +906,39 @@ static int vc5_remove(struct i2c_client *client)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int vc5_suspend(struct device *dev)
+{
+	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regcache_sync(vc5->regmap);
+	if (ret != 0) {
+		dev_err(dev, "Failed to save register map: %d\n", ret);
+		return ret;
+	}
+	regcache_cache_only(vc5->regmap, true);
+	regcache_mark_dirty(vc5->regmap);
+
+	return 0;
+}
+
+static int vc5_resume(struct device *dev)
+{
+	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
+	int ret;
+
+	regcache_cache_only(vc5->regmap, false);
+	ret = regcache_sync(vc5->regmap);
+	if (ret != 0) {
+		dev_err(dev, "Failed to restore register map: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+#endif
+
 static const struct vc5_chip_info idt_5p49v5923_info = {
 	.model = IDT_VC5_5P49V5923,
 	.clk_fod_cnt = 2,
@@ -961,9 +994,12 @@ static const struct of_device_id clk_vc5_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
 
+static SIMPLE_DEV_PM_OPS(vc5_pm_ops, vc5_suspend, vc5_resume);
+
 static struct i2c_driver vc5_driver = {
 	.driver = {
 		.name = "vc5",
+		.pm	= &vc5_pm_ops,
 		.of_match_table = clk_vc5_of_match,
 	},
 	.probe		= vc5_probe,
-- 
2.18.0
