Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:34318 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S979940AbdDYDIP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 23:08:15 -0400
Received: by mail-pf0-f193.google.com with SMTP id g23so7386756pfj.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2017 20:08:14 -0700 (PDT)
From: Wei Yongjun <weiyj.lk@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>
Cc: Wei Yongjun <weiyongjun1@huawei.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH -next] drm/shmob: fix return value check in shmob_drm_probe()
Date: Tue, 25 Apr 2017 03:08:08 +0000
Message-Id: <20170425030808.7632-1-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 800d1d2..6bd777a 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -235,8 +235,8 @@ static int shmob_drm_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	sdev->mmio = devm_ioremap_resource(&pdev->dev, res);
-	if (sdev->mmio == NULL)
-		return -ENOMEM;
+	if (IS_ERR(sdev->mmio))
+		return PTR_ERR(sdev->mmio);
 
 	ret = shmob_drm_setup_clocks(sdev, pdata->clk_source);
 	if (ret < 0)
