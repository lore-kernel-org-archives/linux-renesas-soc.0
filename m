Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:59698 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932747AbeBLNkD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 08:40:03 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: "David S . Miller" <davem@davemloft.net>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] ravb: Remove obsolete explicit clock handling for WoL
Date: Mon, 12 Feb 2018 14:40:00 +0100
Message-Id: <1518442800-31913-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Currently, if Wake-on-LAN is enabled, the EtherAVB device's module clock
is manually kept running during system suspend, to make sure the device
stays active.

Since commit 91c719f5ec6671f7 ("soc: renesas: rcar-sysc: Keep wakeup
sources active during system suspend") , this workaround is no longer
needed.  Hence remove all explicit clock handling to keep the device
active.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
---
v2:
  - Add Reviewed-by,
  - Rebased,
  - Drop RFC state, now the dependency is upstream.
---
 drivers/net/ethernet/renesas/ravb_main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index c87f57ca44371586..a95fbd5510d92e7b 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2255,9 +2255,6 @@ static int ravb_wol_setup(struct net_device *ndev)
 	/* Enable MagicPacket */
 	ravb_modify(ndev, ECMR, ECMR_MPDE, ECMR_MPDE);
 
-	/* Increased clock usage so device won't be suspended */
-	clk_enable(priv->clk);
-
 	return enable_irq_wake(priv->emac_irq);
 }
 
@@ -2276,9 +2273,6 @@ static int ravb_wol_restore(struct net_device *ndev)
 	if (ret < 0)
 		return ret;
 
-	/* Restore clock usage count */
-	clk_disable(priv->clk);
-
 	return disable_irq_wake(priv->emac_irq);
 }
 
-- 
2.7.4
