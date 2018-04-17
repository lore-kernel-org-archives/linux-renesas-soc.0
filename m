Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46723 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752166AbeDQIux (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 04:50:53 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RFC net-next 2/5] ravb: correct ptp does failure after suspend and resume
Date: Tue, 17 Apr 2018 10:50:27 +0200
Message-Id: <20180417085030.32650-3-horms+renesas@verge.net.au>
In-Reply-To: <20180417085030.32650-1-horms+renesas@verge.net.au>
References: <20180417085030.32650-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

This patch fixes the problem that ptp4l command does not work after
suspend and resume.
Add the initial setting in ravb_suspend() and ravb_resume(),
because ptp does not work.

Fixes: a0d2f20650e8 ("Renesas Ethernet AVB PTP clock driver")
Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/net/ethernet/renesas/ravb_main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index b311b1ac1286..dbde3d11458b 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2295,6 +2295,9 @@ static int __maybe_unused ravb_suspend(struct device *dev)
 	else
 		ret = ravb_close(ndev);
 
+	if (priv->chip_id != RCAR_GEN2)
+		ravb_ptp_stop(ndev);
+
 	return ret;
 }
 
@@ -2302,6 +2305,7 @@ static int __maybe_unused ravb_resume(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct ravb_private *priv = netdev_priv(ndev);
+	struct platform_device *pdev = priv->pdev;
 	int ret = 0;
 
 	/* If WoL is enabled set reset mode to rearm the WoL logic */
@@ -2330,6 +2334,9 @@ static int __maybe_unused ravb_resume(struct device *dev)
 	/* Restore descriptor base address table */
 	ravb_write(ndev, priv->desc_bat_dma, DBAT);
 
+	if (priv->chip_id != RCAR_GEN2)
+		ravb_ptp_init(ndev, pdev);
+
 	if (netif_running(ndev)) {
 		if (priv->wol_enabled) {
 			ret = ravb_wol_restore(ndev);
-- 
2.11.0
