Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E306DCD80C8
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 10 Oct 2023 12:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbjJJMtH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 10 Oct 2023 08:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231966AbjJJMtH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 08:49:07 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CCD0AB0;
        Tue, 10 Oct 2023 05:49:05 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,212,1694703600"; 
   d="scan'208";a="182562196"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Oct 2023 21:49:02 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3698343EB67B;
        Tue, 10 Oct 2023 21:49:02 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net 2/2] rswitch: Fix imbalance phy_power_off() calling
Date:   Tue, 10 Oct 2023 21:48:58 +0900
Message-Id: <20231010124858.183891-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010124858.183891-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231010124858.183891-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The phy_power_off() should not be called if phy_power_on() failed.
So, add a condition .power_count before calls phy_power_off().

Fixes: 5cb630925b49 ("net: renesas: rswitch: Add phy_power_{on,off}() calling")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 4d7c48288047..0fc0b6bea753 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1254,7 +1254,7 @@ static void rswitch_adjust_link(struct net_device *ndev)
 		phy_print_status(phydev);
 		if (phydev->link)
 			phy_power_on(rdev->serdes);
-		else
+		else if (rdev->serdes->power_count)
 			phy_power_off(rdev->serdes);
 
 		rdev->etha->link = phydev->link;
-- 
2.25.1

