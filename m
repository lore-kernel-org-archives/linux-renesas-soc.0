Return-Path: <SRS0=hHdZ=SZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C70C10F14
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 13:03:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FCBA206A3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 13:03:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfDWNDi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:03:38 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:50726 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbfDWNDh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Apr 2019 09:03:37 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0715425AEC8;
        Tue, 23 Apr 2019 23:03:36 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0769A9403E4; Tue, 23 Apr 2019 15:03:33 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     David Miller <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH net-next v3] ravb: Avoid unsupported internal delay mode for R-Car E3/D3
Date:   Tue, 23 Apr 2019 15:01:53 +0200
Message-Id: <20190423130153.17295-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to the R-Car Gen3 Hardware Manual Rev 1.50 of Nov 30, 2018, the
TX clock internal delay mode isn't supported on R-Car E3 (r8a77990) or D3
(r8a77995). And by extension it is also not supported by RZ/G2E (r9a774c0).

This matches all ES versions of the affected SoCs as it is
not clear if this problem will be resolved in newer chips.
This can be revisited, as necessary.

This patch does not error-out if PHY_INTERFACE_MODE_RGMII_ID or
PHY_INTERFACE_MODE_RGMII_TXID are used on SoCs where TX clock delay
mode is not supported as there is a risk of introducing a regression
when used in conjunction with older DT blobs present in the field.
Rather, a warning is logged in such cases.

Based on work by Kazuya Mizuguchi.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v3
* Log warning if unsupported phy-mode is used

v2
* Dropped RFC designation
* Also correct RZ/G2E (r8a774c0)
* Remove revision (ES version) portion of soc match
  as it is not clear this problem will be resolved in newer chips.
* Refer to user manual v1.50 rather than errata for v1.00 in changelog
* Note absence of error handling in Changelog
---
 drivers/net/ethernet/renesas/ravb_main.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 4f648394e645..9618c4881c83 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1969,6 +1969,13 @@ static void ravb_set_config_mode(struct net_device *ndev)
 	}
 }
 
+static const struct soc_device_attribute ravb_delay_mode_quirk_match[] = {
+	{ .soc_id = "r8a774c0" },
+	{ .soc_id = "r8a77990" },
+	{ .soc_id = "r8a77995" },
+	{ /* sentinel */ }
+};
+
 /* Set tx and rx clock internal delay modes */
 static void ravb_set_delay_mode(struct net_device *ndev)
 {
@@ -1980,8 +1987,12 @@ static void ravb_set_delay_mode(struct net_device *ndev)
 		set |= APSR_DM_RDM;
 
 	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
-	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID)
-		set |= APSR_DM_TDM;
+	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) {
+		if (!WARN(soc_device_match(ravb_delay_mode_quirk_match),
+			  "phy-mode %s requires TX clock internal delay mode which is not supported by this hardware revision. Please update device tree",
+			  phy_modes(priv->phy_interface)))
+			set |= APSR_DM_TDM;
+	}
 
 	ravb_modify(ndev, APSR, APSR_DM, set);
 }
-- 
2.11.0

