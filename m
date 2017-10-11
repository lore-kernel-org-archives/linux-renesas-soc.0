Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from szxga05-in.huawei.com ([45.249.212.191]:8000 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750831AbdJKLeQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 07:34:16 -0400
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>
CC: Wei Yongjun <weiyongjun1@huawei.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH] drm/shmob: Fix return value check in shmob_drm_probe()
Date: Wed, 11 Oct 2017 11:38:37 +0000
Message-ID: <1507721917-146379-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 5925725..58d8a98 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -233,8 +233,8 @@ static int shmob_drm_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	sdev->mmio = devm_ioremap_resource(&pdev->dev, res);
-	if (sdev->mmio == NULL)
-		return -ENOMEM;
+	if (IS_ERR(sdev->mmio))
+		return PTR_ERR(sdev->mmio);
 
 	ret = shmob_drm_setup_clocks(sdev, pdata->clk_source);
 	if (ret < 0)
