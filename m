Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:42858 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750836AbdLKIyO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Dec 2017 03:54:14 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] Revert "ravb: add workaround for clock when resuming with WoL enabled"
Date: Mon, 11 Dec 2017 09:54:09 +0100
Message-Id: <1512982449-11051-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This reverts commit fbf3d034f2ff6264183cfa6845770e8cc2a986c8.

As of commit 560869100b99a3da ("clk: renesas: cpg-mssr: Restore module
clocks during resume"), the workaround is no longer needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/ethernet/renesas/ravb_main.c | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 2b962d349f5f415b..009780df664b4a09 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2308,32 +2308,9 @@ static int __maybe_unused ravb_resume(struct device *dev)
 	struct ravb_private *priv = netdev_priv(ndev);
 	int ret = 0;
 
-	if (priv->wol_enabled) {
-		/* Reduce the usecount of the clock to zero and then
-		 * restore it to its original value. This is done to force
-		 * the clock to be re-enabled which is a workaround
-		 * for renesas-cpg-mssr driver which do not enable clocks
-		 * when resuming from PSCI suspend/resume.
-		 *
-		 * Without this workaround the driver fails to communicate
-		 * with the hardware if WoL was enabled when the system
-		 * entered PSCI suspend. This is due to that if WoL is enabled
-		 * we explicitly keep the clock from being turned off when
-		 * suspending, but in PSCI sleep power is cut so the clock
-		 * is disabled anyhow, the clock driver is not aware of this
-		 * so the clock is not turned back on when resuming.
-		 *
-		 * TODO: once the renesas-cpg-mssr suspend/resume is working
-		 *       this clock dance should be removed.
-		 */
-		clk_disable(priv->clk);
-		clk_disable(priv->clk);
-		clk_enable(priv->clk);
-		clk_enable(priv->clk);
-
-		/* Set reset mode to rearm the WoL logic */
+	/* If WoL is enabled set reset mode to rearm the WoL logic */
+	if (priv->wol_enabled)
 		ravb_write(ndev, CCC_OPC_RESET, CCC);
-	}
 
 	/* All register have been reset to default values.
 	 * Restore all registers which where setup at probe time and
-- 
2.7.4
