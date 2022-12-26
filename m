Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C601C4332F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 26 Dec 2022 07:13:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbiLZHNf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 26 Dec 2022 02:13:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiLZHNe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 02:13:34 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79AB32BEE;
        Sun, 25 Dec 2022 23:13:33 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,274,1665414000"; 
   d="scan'208";a="147425154"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Dec 2022 16:13:32 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BA0D941BAEC3;
        Mon, 26 Dec 2022 16:13:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net 0/2] net: ethernet: renesas: rswitch: Fix minor issues
Date:   Mon, 26 Dec 2022 16:13:26 +0900
Message-Id: <20221226071328.3895854-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on v6.2-rc2.

Yoshihiro Shimoda (2):
  net: ethernet: renesas: rswitch: Fix error path in
    renesas_eth_sw_probe()
  net: ethernet: renesas: rswitch: Fix getting mac address from device
    tree

 drivers/net/ethernet/renesas/rswitch.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.25.1

