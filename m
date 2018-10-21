Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:46022 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728780AbeJVEQf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 00:16:35 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Subject: [PATCH 1/1] net: dsa: legacy: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:01:05 +0200
Message-Id: <20181021200105.2414-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181021200105.2414-1-wsa+renesas@sang-engineering.com>
References: <20181021200105.2414-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 net/dsa/legacy.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/dsa/legacy.c b/net/dsa/legacy.c
index 8aa92b09db76..cb42939db776 100644
--- a/net/dsa/legacy.c
+++ b/net/dsa/legacy.c
@@ -686,8 +686,7 @@ static void dsa_shutdown(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int dsa_suspend(struct device *d)
 {
-	struct platform_device *pdev = to_platform_device(d);
-	struct dsa_switch_tree *dst = platform_get_drvdata(pdev);
+	struct dsa_switch_tree *dst = dev_get_drvdata(d);
 	int i, ret = 0;
 
 	for (i = 0; i < dst->pd->nr_chips; i++) {
@@ -702,8 +701,7 @@ static int dsa_suspend(struct device *d)
 
 static int dsa_resume(struct device *d)
 {
-	struct platform_device *pdev = to_platform_device(d);
-	struct dsa_switch_tree *dst = platform_get_drvdata(pdev);
+	struct dsa_switch_tree *dst = dev_get_drvdata(d);
 	int i, ret = 0;
 
 	for (i = 0; i < dst->pd->nr_chips; i++) {
-- 
2.19.0
