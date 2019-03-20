Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC5FC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:30:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 773AA2184D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbfCTKaI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 06:30:08 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:40424 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfCTKaI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 06:30:08 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id qAW51z0053XaVaC06AW5uP; Wed, 20 Mar 2019 11:30:05 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YU1-0005IJ-1b; Wed, 20 Mar 2019 11:30:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YU0-0005F2-VX; Wed, 20 Mar 2019 11:30:04 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: riic: Add Runtime PM support
Date:   Wed, 20 Mar 2019 11:30:03 +0100
Message-Id: <20190320103003.20107-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  - Replace explicit clock handling by Runtime PM calls,
  - Streamline Runtime PM handling in error paths,
  - Enable Runtime PM in .probe(),
  - Disable Runtime PM in .remove(),
  - Make sure the device is runtime-resumed when disabling interrupts in
    .remove().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I don't think it's worth splitting off the last bug fix in a separate
(first) patch, using explicit clock handling, as that will be replaced
immediately by Runtime PM calls.
---
 drivers/i2c/busses/i2c-riic.c | 43 +++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index b75ff144b5704293..f31413fd9521ef9f 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -43,6 +43,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #define RIIC_ICCR1	0x00
 #define RIIC_ICCR2	0x04
@@ -112,12 +113,10 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 {
 	struct riic_dev *riic = i2c_get_adapdata(adap);
 	unsigned long time_left;
-	int i, ret;
+	int i;
 	u8 start_bit;
 
-	ret = clk_prepare_enable(riic->clk);
-	if (ret)
-		return ret;
+	pm_runtime_get_sync(adap->dev.parent);
 
 	if (readb(riic->base + RIIC_ICCR2) & ICCR2_BBSY) {
 		riic->err = -EBUSY;
@@ -150,7 +149,7 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	}
 
  out:
-	clk_disable_unprepare(riic->clk);
+	pm_runtime_put(adap->dev.parent);
 
 	return riic->err ?: num;
 }
@@ -281,20 +280,18 @@ static const struct i2c_algorithm riic_algo = {
 
 static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 {
-	int ret;
+	int ret = 0;
 	unsigned long rate;
 	int total_ticks, cks, brl, brh;
 
-	ret = clk_prepare_enable(riic->clk);
-	if (ret)
-		return ret;
+	pm_runtime_get_sync(riic->adapter.dev.parent);
 
 	if (t->bus_freq_hz > 400000) {
 		dev_err(&riic->adapter.dev,
 			"unsupported bus speed (%dHz). 400000 max\n",
 			t->bus_freq_hz);
-		clk_disable_unprepare(riic->clk);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
 	rate = clk_get_rate(riic->clk);
@@ -332,8 +329,8 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 	if (brl > (0x1F + 3)) {
 		dev_err(&riic->adapter.dev, "invalid speed (%lu). Too slow.\n",
 			(unsigned long)t->bus_freq_hz);
-		clk_disable_unprepare(riic->clk);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
 	brh = total_ticks - brl;
@@ -378,9 +375,9 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
-	clk_disable_unprepare(riic->clk);
-
-	return 0;
+out:
+	pm_runtime_put(riic->adapter.dev.parent);
+	return ret;
 }
 
 static struct riic_irq_desc riic_irqs[] = {
@@ -439,28 +436,36 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 	i2c_parse_fw_timings(&pdev->dev, &i2c_t, true);
 
+	pm_runtime_enable(&pdev->dev);
+
 	ret = riic_init_hw(riic, &i2c_t);
 	if (ret)
-		return ret;
-
+		goto out;
 
 	ret = i2c_add_adapter(adap);
 	if (ret)
-		return ret;
+		goto out;
 
 	platform_set_drvdata(pdev, riic);
 
 	dev_info(&pdev->dev, "registered with %dHz bus speed\n",
 		 i2c_t.bus_freq_hz);
 	return 0;
+
+out:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
 }
 
 static int riic_i2c_remove(struct platform_device *pdev)
 {
 	struct riic_dev *riic = platform_get_drvdata(pdev);
 
+	pm_runtime_get_sync(&pdev->dev);
 	writeb(0, riic->base + RIIC_ICIER);
+	pm_runtime_put(&pdev->dev);
 	i2c_del_adapter(&riic->adapter);
+	pm_runtime_disable(&pdev->dev);
 
 	return 0;
 }
-- 
2.17.1

