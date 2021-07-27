Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAC0C4338F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 27 Jul 2021 08:22:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8564861051
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 27 Jul 2021 08:22:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235920AbhG0IWA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 27 Jul 2021 04:22:00 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:5647 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235740AbhG0IWA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 04:22:00 -0400
X-IronPort-AV: E=Sophos;i="5.84,272,1620658800"; 
   d="scan'208";a="88892215"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Jul 2021 17:21:59 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2B307400D4FF;
        Tue, 27 Jul 2021 17:21:59 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     sergei.shtylyov@gmail.com, davem@davemloft.net, kuba@kernel.org
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] ravb and sh_eth: Fix descriptor counters' conditions
Date:   Tue, 27 Jul 2021 17:21:45 +0900
Message-Id: <20210727082147.270734-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When we change the type of {cur,dirty}_tx from u32 to u8, we can
reproduce this issue easily.

Yoshihiro Shimoda (2):
  ravb: Fix descriptor counters' conditions
  sh_eth: Fix descriptor counters' conditions

 drivers/net/ethernet/renesas/ravb_main.c | 22 +++++++++++++++-------
 drivers/net/ethernet/renesas/sh_eth.c    | 16 ++++++++++++----
 2 files changed, 27 insertions(+), 11 deletions(-)

-- 
2.25.1

