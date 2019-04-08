Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBB4C282DD
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 08:29:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83F4220880
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 08:29:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="BDz6yfpb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfDHI3v (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 04:29:51 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:48445 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbfDHI3v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 04:29:51 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1939E25B830;
        Mon,  8 Apr 2019 18:29:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554712189; bh=0X1NUljAti1m/7Y5gXIPXvB61JvRrB6qaUXrQheX3m8=;
        h=From:To:Cc:Subject:Date:From;
        b=BDz6yfpb+heCRJUzdQ4fz5/FoQxokqBv7IOy+zv/7gsCMv/0tDxepcBYG6oTDd3tx
         PQ7p28/XcVciegz6HP5JPBHubQbAl6OPBp4RsxqXq7Bm+i/u/NVqo4lS78BSdkuTIp
         UNY4mNojZ+uymUrhwI7TWcd80VZZhehfy4Rx27OI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 02CFC94069B; Mon,  8 Apr 2019 10:29:46 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RFC net-next] ravb: Avoid unsupported internal delay mode for R-Car E3/D3
Date:   Mon,  8 Apr 2019 10:29:28 +0200
Message-Id: <20190408082928.22840-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
August 24, 2018, the TX clock internal delay mode isn't supported
on R-Car E3 (r8a77990) and D3 (r8a77995).

Based on work by Kazuya Mizuguchi.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/net/ethernet/renesas/ravb_main.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 4f648394e645..be8af4a382cf 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1969,6 +1969,12 @@ static void ravb_set_config_mode(struct net_device *ndev)
 	}
 }
 
+static const struct soc_device_attribute ravb_delay_mode_quirk_match[] = {
+	{ .soc_id = "r8a77990", .revision = "ES1.*" },
+	{ .soc_id = "r8a77995", .revision = "ES1.*" },
+	{ /* sentinel */ }
+};
+
 /* Set tx and rx clock internal delay modes */
 static void ravb_set_delay_mode(struct net_device *ndev)
 {
@@ -1979,8 +1985,9 @@ static void ravb_set_delay_mode(struct net_device *ndev)
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

