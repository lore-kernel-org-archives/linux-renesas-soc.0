Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8490C00528
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Aug 2023 00:32:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbjHGAco (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 6 Aug 2023 20:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjHGAcm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 6 Aug 2023 20:32:42 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 85CA11711;
        Sun,  6 Aug 2023 17:32:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,261,1684767600"; 
   d="scan'208";a="172107181"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Aug 2023 09:32:39 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5930E40E3C98;
        Mon,  7 Aug 2023 09:32:39 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 net-next 0/2]  net: renesas: rswitch: Add speed change support
Date:   Mon,  7 Aug 2023 09:32:29 +0900
Message-Id: <20230807003231.1552062-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add speed change support at runtime for the latest SoC version.
Also, add ethtool .[gs]et_link_ksettings.

Changes from v1:
https://lore.kernel.org/all/20230803120621.1471440-1-yoshihiro.shimoda.uh@renesas.com/
 - Rename rswitch_soc_match to rswitch_soc_no_speed_change.
 - Add Reviewed-by tag in the patch [12]/2 (Simon-san, thank you!).

Yoshihiro Shimoda (2):
  net: renesas: rswitch: Add runtime speed change support
  net: renesas: rswitch: Add .[gs]et_link_ksettings support

 drivers/net/ethernet/renesas/rswitch.c | 29 +++++++++++++++++++++++---
 drivers/net/ethernet/renesas/rswitch.h |  1 +
 2 files changed, 27 insertions(+), 3 deletions(-)

-- 
2.25.1

