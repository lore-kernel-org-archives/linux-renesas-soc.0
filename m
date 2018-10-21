Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45862 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728558AbeJVEQJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 00:16:09 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Richard Cochran <richardcochran@gmail.com>,
        netdev@vger.kernel.org
Subject: [PATCH 1/1] ptp: ptp_dte: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:39 +0200
Message-Id: <20181021200039.1933-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181021200039.1933-1-wsa+renesas@sang-engineering.com>
References: <20181021200039.1933-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/ptp/ptp_dte.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ptp/ptp_dte.c b/drivers/ptp/ptp_dte.c
index a7dc43368df4..5b6393e3ea27 100644
--- a/drivers/ptp/ptp_dte.c
+++ b/drivers/ptp/ptp_dte.c
@@ -288,8 +288,7 @@ static int ptp_dte_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int ptp_dte_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct ptp_dte *ptp_dte = platform_get_drvdata(pdev);
+	struct ptp_dte *ptp_dte = dev_get_drvdata(dev);
 	u8 i;
 
 	for (i = 0; i < DTE_NUM_REGS_TO_RESTORE; i++) {
@@ -305,8 +304,7 @@ static int ptp_dte_suspend(struct device *dev)
 
 static int ptp_dte_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct ptp_dte *ptp_dte = platform_get_drvdata(pdev);
+	struct ptp_dte *ptp_dte = dev_get_drvdata(dev);
 	u8 i;
 
 	for (i = 0; i < DTE_NUM_REGS_TO_RESTORE; i++) {
-- 
2.19.0
