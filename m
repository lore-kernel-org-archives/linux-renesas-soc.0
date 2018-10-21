Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:46008 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728780AbeJVEQd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 00:16:33 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/1] uio: uio_fsl_elbc_gpcm: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:01:02 +0200
Message-Id: <20181021200102.2354-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181021200102.2354-1-wsa+renesas@sang-engineering.com>
References: <20181021200102.2354-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/uio/uio_fsl_elbc_gpcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/uio/uio_fsl_elbc_gpcm.c b/drivers/uio/uio_fsl_elbc_gpcm.c
index 9cc37fe07d35..0ee3cd3c25ee 100644
--- a/drivers/uio/uio_fsl_elbc_gpcm.c
+++ b/drivers/uio/uio_fsl_elbc_gpcm.c
@@ -74,8 +74,7 @@ DEVICE_ATTR(reg_or, S_IRUGO|S_IWUSR|S_IWGRP, reg_show, reg_store);
 static ssize_t reg_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct uio_info *info = platform_get_drvdata(pdev);
+	struct uio_info *info = dev_get_drvdata(dev);
 	struct fsl_elbc_gpcm *priv = info->priv;
 	struct fsl_lbc_bank *bank = &priv->lbc->bank[priv->bank];
 
@@ -94,8 +93,7 @@ static ssize_t reg_show(struct device *dev, struct device_attribute *attr,
 static ssize_t reg_store(struct device *dev, struct device_attribute *attr,
 			 const char *buf, size_t count)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct uio_info *info = platform_get_drvdata(pdev);
+	struct uio_info *info = dev_get_drvdata(dev);
 	struct fsl_elbc_gpcm *priv = info->priv;
 	struct fsl_lbc_bank *bank = &priv->lbc->bank[priv->bank];
 	unsigned long val;
-- 
2.19.0
