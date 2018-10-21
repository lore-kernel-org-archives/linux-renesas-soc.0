Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45890 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727226AbeJVEQP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 00:16:15 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org
Subject: [PATCH 1/1] slimbus: qcom-ctrl: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:44 +0200
Message-Id: <20181021200045.2053-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181021200045.2053-1-wsa+renesas@sang-engineering.com>
References: <20181021200045.2053-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/slimbus/qcom-ctrl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index db1f5135846a..ad3e2e23f56e 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -654,8 +654,7 @@ static int qcom_slim_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM
 static int qcom_slim_runtime_suspend(struct device *device)
 {
-	struct platform_device *pdev = to_platform_device(device);
-	struct qcom_slim_ctrl *ctrl = platform_get_drvdata(pdev);
+	struct qcom_slim_ctrl *ctrl = dev_get_drvdata(device);
 	int ret;
 
 	dev_dbg(device, "pm_runtime: suspending...\n");
@@ -672,8 +671,7 @@ static int qcom_slim_runtime_suspend(struct device *device)
 
 static int qcom_slim_runtime_resume(struct device *device)
 {
-	struct platform_device *pdev = to_platform_device(device);
-	struct qcom_slim_ctrl *ctrl = platform_get_drvdata(pdev);
+	struct qcom_slim_ctrl *ctrl = dev_get_drvdata(device);
 	int ret = 0;
 
 	dev_dbg(device, "pm_runtime: resuming...\n");
-- 
2.19.0
