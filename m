Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE790C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 11:45:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94A022054F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 11:45:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbfDJLpI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 07:45:08 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:44898 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727153AbfDJLpI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 07:45:08 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2D04A25B7CA;
        Wed, 10 Apr 2019 21:45:06 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 243C0940356; Wed, 10 Apr 2019 13:45:04 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     David Miller <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 net-next] ravb: Avoid unsupported internal delay mode for R-Car E3/D3
Date:   Wed, 10 Apr 2019 13:45:02 +0200
Message-Id: <20190410114502.30362-1-horms+renesas@verge.net.au>
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

Based on work by Kazuya Mizuguchi.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v2
* Dropped RFC designation
* Also correct RZ/G2E (r8a774c0)
* Remove revision (ES version) portion of soc match
  as it is not clear this problem will be resolved in newer chips.
* Refer to user manual v1.50 rather than errata for v1.00 in changelog
* Note absence of error handling in Changelog
---
 drivers/net/ethernet/renesas/ravb_main.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 4f648394e645..99a12bf06d35 100644
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
@@ -1979,8 +1986,9 @@ static void ravb_set_delay_mode(struct net_device *ndev)
 	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_RXID)
 		set |= APSR_DM_RDM;
 
-	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
-	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID)
+	if ((priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
+	     priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) &&
+	    !soc_device_match(ravb_delay_mode_quirk_match))
 		set |= APSR_DM_TDM;
 
 	ravb_modify(ndev, APSR, APSR_DM, set);
-- 
2.11.0

