Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202C4C07E9A
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 14 Jul 2021 14:54:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE50F613B2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 14 Jul 2021 14:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbhGNO5H (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 14 Jul 2021 10:57:07 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:52464 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231797AbhGNO5H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 10:57:07 -0400
X-IronPort-AV: E=Sophos;i="5.84,239,1620658800"; 
   d="scan'208";a="87579712"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Jul 2021 23:54:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E077E40121CA;
        Wed, 14 Jul 2021 23:54:10 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        Adam Ford <aford173@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Yuusuke Ashizuka <ashiduka@fujitsu.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH/RFC 0/2] Add Gigabit Ethernet driver support
Date:   Wed, 14 Jul 2021 15:54:06 +0100
Message-Id: <20210714145408.4382-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DMAC and EMAC blocks of Gigabit Ethernet IP is almost
similar to Ethernet AVB.

The Gigabit Etherner IP consists of Ethernet controller (E-MAC),
Internal TCP/IP Offload Engine (TOE) and Dedicated Direct memory
access controller (DMAC).

With few canges in driver, we can support Gigabit ethernet driver as well.
I have prototyped the driver and tested with renesas-drivers master branch.

Please share your valuable comments.

Thanks.

Biju Das (2):
  ravb: Preparation for supporting Gigabit Ethernet driver
  ravb: Add GbEthernet driver support

 drivers/net/ethernet/renesas/ravb.h      |  94 ++-
 drivers/net/ethernet/renesas/ravb_main.c | 830 +++++++++++++++++++----
 2 files changed, 774 insertions(+), 150 deletions(-)

-- 
2.17.1

