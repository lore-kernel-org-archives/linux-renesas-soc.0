Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45874 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728560AbeJVEQM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 00:16:12 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Joshua Kinard <kumba@gentoo.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: [PATCH 1/1] rtc: ds1685: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:41 +0200
Message-Id: <20181021200042.1993-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181021200042.1993-1-wsa+renesas@sang-engineering.com>
References: <20181021200042.1993-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/rtc/rtc-ds1685.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index b0723025ac31..2710f2594c42 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -778,8 +778,7 @@ static const char *ds1685_rtc_sqw_freq[16] = {
 static int
 ds1685_rtc_proc(struct device *dev, struct seq_file *seq)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct ds1685_priv *rtc = platform_get_drvdata(pdev);
+	struct ds1685_priv *rtc = dev_get_drvdata(dev);
 	u8 ctrla, ctrlb, ctrlc, ctrld, ctrl4a, ctrl4b, ssn[8];
 	char *model;
 
-- 
2.19.0
