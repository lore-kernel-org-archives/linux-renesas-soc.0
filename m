Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:37113 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750940AbeDMRBx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 13:01:53 -0400
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: wsa@the-dreams.de, geert@linux-m68k.org, linux-spi@vger.kernel.org,
        magnus.damm@gmail.com, Gaku Inami <gaku.inami.xw@bp.renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH] spi: sh-msiof: Add spi_master_suspend/spi_master_resume
Date: Fri, 13 Apr 2018 19:01:48 +0200
Message-Id: <1523638908-21924-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Gaku Inami <gaku.inami.xw@bp.renesas.com>

Add spi_master_suspend(), spi_master_resume() in PM callback since it needs
to start/stop the queue during suspend/resume.

Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
[uli: simplified code, added pm field to platform driver]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
Slightly brushed up port from the BSP; tested to execute on suspend/resume
without breaking anything.

CU
Uli

 drivers/spi/spi-sh-msiof.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index ae086aa..db30aad 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -1415,12 +1415,35 @@ static const struct platform_device_id spi_driver_ids[] = {
 };
 MODULE_DEVICE_TABLE(platform, spi_driver_ids);
 
+#ifdef CONFIG_PM_SLEEP
+static int sh_msiof_spi_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct sh_msiof_spi_priv *p = platform_get_drvdata(pdev);
+
+	return spi_master_suspend(p->master);
+}
+
+static int sh_msiof_spi_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct sh_msiof_spi_priv *p = platform_get_drvdata(pdev);
+
+	return spi_master_resume(p->master);
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static SIMPLE_DEV_PM_OPS(sh_msiof_spi_pm_ops,
+			 sh_msiof_spi_suspend,
+			 sh_msiof_spi_resume);
+
 static struct platform_driver sh_msiof_spi_drv = {
 	.probe		= sh_msiof_spi_probe,
 	.remove		= sh_msiof_spi_remove,
 	.id_table	= spi_driver_ids,
 	.driver		= {
 		.name		= "spi_sh_msiof",
+		.pm		= &sh_msiof_spi_pm_ops,
 		.of_match_table = of_match_ptr(sh_msiof_match),
 	},
 };
-- 
2.7.4
