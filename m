Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE69C4338F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 25 Aug 2021 07:02:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 400F8610FB
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 25 Aug 2021 07:02:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238342AbhHYHCr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 25 Aug 2021 03:02:47 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:13589 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S239005AbhHYHCr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Aug 2021 03:02:47 -0400
X-IronPort-AV: E=Sophos;i="5.84,349,1620658800"; 
   d="scan'208";a="91716404"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 25 Aug 2021 16:02:00 +0900
Received: from localhost.localdomain (unknown [10.226.92.232])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5749B42016B7;
        Wed, 25 Aug 2021 16:01:57 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Adam Ford <aford173@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH net-next 00/13] Add Factorisation code to support Gigabit Ethernet driver
Date:   Wed, 25 Aug 2021 08:01:41 +0100
Message-Id: <20210825070154.14336-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DMAC and EMAC blocks of Gigabit Ethernet IP found on RZ/G2L SoC are
similar to the R-Car Ethernet AVB IP.

The Gigabit Ethernet IP consists of Ethernet controller (E-MAC), Internal
TCP/IP Offload Engine (TOE)  and Dedicated Direct memory access controller
(DMAC).

With a few changes in the driver we can support both IPs.

This patch series aims to add factorisation code to support RZ/G2L SoC,
hardware feature bits for gPTP feature, Multiple irq feature and 
optional reset support.

Ref:-
 * https://lore.kernel.org/linux-renesas-soc/TYCPR01MB59334319695607A2683C1A5E86E59@TYCPR01MB5933.jpnprd01.prod.outlook.com/T/#t

Biju Das (13):
  ravb: Remove the macros NUM_TX_DESC_GEN[23]
  ravb: Add multi_irq to struct ravb_hw_info
  ravb: Add no_ptp_cfg_active to struct ravb_hw_info
  ravb: Add ptp_cfg_active to struct ravb_hw_info
  ravb: Factorise ravb_ring_free function
  ravb: Factorise ravb_ring_format function
  ravb: Factorise ravb_ring_init function
  ravb: Factorise ravb_rx function
  ravb: Factorise ravb_adjust_link function
  ravb: Factorise ravb_set_features
  ravb: Factorise ravb_dmac_init function
  ravb: Factorise ravb_emac_init function
  ravb: Add reset support

 drivers/net/ethernet/renesas/ravb.h      |  23 +-
 drivers/net/ethernet/renesas/ravb_main.c | 272 ++++++++++++++++-------
 drivers/net/ethernet/renesas/ravb_ptp.c  |   8 +-
 3 files changed, 204 insertions(+), 99 deletions(-)

-- 
2.17.1

