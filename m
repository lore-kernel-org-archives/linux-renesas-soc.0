Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:42516 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726969AbeHFMuc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 08:50:32 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-ide@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Tejun Heo <tj@kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] ata: sata_rcar: exclude setting of PHY registers in Gen3
Date: Mon,  6 Aug 2018 12:42:00 +0200
Message-Id: <20180806104200.29102-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

According to documentation, setting of PHY registers is unnecessary with
R-Car Gen3. The registers are not even described. So, don't initialize
them.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
[wsa: updated commit message]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested with a Renesas R-Car M3N Salvator-XS board. I did a platform suspend to
check if the controller and PHY work properly after resume.

 drivers/ata/sata_rcar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
index 1ad168f76ef3..10ecb232245d 100644
--- a/drivers/ata/sata_rcar.c
+++ b/drivers/ata/sata_rcar.c
@@ -830,10 +830,11 @@ static void sata_rcar_init_controller(struct ata_host *host)
 		sata_rcar_gen1_phy_init(priv);
 		break;
 	case RCAR_GEN2_SATA:
-	case RCAR_GEN3_SATA:
 	case RCAR_R8A7790_ES1_SATA:
 		sata_rcar_gen2_phy_init(priv);
 		break;
+	case RCAR_GEN3_SATA:
+		break;
 	default:
 		dev_warn(host->dev, "SATA phy is not initialized\n");
 		break;
@@ -995,7 +996,6 @@ static int sata_rcar_resume(struct device *dev)
 		return ret;
 
 	if (priv->type == RCAR_GEN3_SATA) {
-		sata_rcar_gen2_phy_init(priv);
 		sata_rcar_init_module(priv);
 	} else {
 		/* ack and mask */
-- 
2.11.0
