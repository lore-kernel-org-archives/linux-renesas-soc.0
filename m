Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB98C433FE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Nov 2022 23:55:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbiKOXz2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 15 Nov 2022 18:55:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbiKOXz1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 18:55:27 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0306718393;
        Tue, 15 Nov 2022 15:55:25 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,167,1665414000"; 
   d="scan'208";a="140159700"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Nov 2022 08:55:25 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4613F4113D85;
        Wed, 16 Nov 2022 08:55:25 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Dan Carpenter <error27@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] net: ethernet: renesas: rswitch: Fix MAC address info
Date:   Wed, 16 Nov 2022 08:55:19 +0900
Message-Id: <20221115235519.679115-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Smatch detected the following warning.

    drivers/net/ethernet/renesas/rswitch.c:1717 rswitch_init() warn:
    '%pM' cannot be followed by 'n'

The 'n' should be '\n'.

Reported-by: Dan Carpenter <error27@gmail.com>
Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index f3d27aef1286..51ce5c26631b 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1714,7 +1714,7 @@ static int rswitch_init(struct rswitch_private *priv)
 	}
 
 	for (i = 0; i < RSWITCH_NUM_PORTS; i++)
-		netdev_info(priv->rdev[i]->ndev, "MAC address %pMn",
+		netdev_info(priv->rdev[i]->ndev, "MAC address %pM\n",
 			    priv->rdev[i]->ndev->dev_addr);
 
 	return 0;
-- 
2.25.1

