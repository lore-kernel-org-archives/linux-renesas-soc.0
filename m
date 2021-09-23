Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D3DC433EF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 23 Sep 2021 14:08:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7454B61090
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 23 Sep 2021 14:08:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241463AbhIWOJw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 23 Sep 2021 10:09:52 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:22177 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235976AbhIWOJv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 10:09:51 -0400
X-IronPort-AV: E=Sophos;i="5.85,316,1624287600"; 
   d="scan'208";a="94816060"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Sep 2021 23:08:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.2])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0B90B437F0AD;
        Thu, 23 Sep 2021 23:08:15 +0900 (JST)
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
Subject: [RFC/PATCH 00/18] Add Gigabit Ethernet driver support
Date:   Thu, 23 Sep 2021 15:07:55 +0100
Message-Id: <20210923140813.13541-1-biju.das.jz@bp.renesas.com>
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

This patch series aims to add Gigabit ethernet driver support to RZ/G2L SoC.

Please provide your valuable comments.

Ref:-
 * https://lore.kernel.org/linux-renesas-soc/TYCPR01MB59334319695607A2683C1A5E86E59@TYCPR01MB5933.jpnprd01.prod.outlook.com/T/#t


Biju Das (18):
  ravb: Rename "ravb_set_features_rx_csum" function to
    "ravb_set_features_rcar"
  ravb: Rename the variables "no_ptp_cfg_active" and "ptp_cfg_active"
  ravb: Initialize GbEthernet dmac
  ravb: Enable aligned_tx and tx_counters for RZ/G2L
  ravb: Exclude gPTP feature support for RZ/G2L
  ravb: Add multi_tsrq to struct ravb_hw_info
  ravb: Add magic_pkt to struct ravb_hw_info
  ravb: Add mii_rgmii_selection to struct ravb_hw_info
  ravb: Add half_duplex to struct ravb_hw_info
  ravb: Initialize GbEthernet E-MAC
  ravb: Add rx_2k_buffers to struct ravb_hw_info
  ravb: Add timestamp to struct ravb_hw_info
  ravb: Add rx_ring_free function support for GbEthernet
  ravb: Add rx_ring_format function for GbEthernet
  ravb: Add rx_alloc helper function for GbEthernet
  ravb: Add Packet receive function for Gigabit Ethernet
  ravb: Add carrier_counters to struct ravb_hw_info
  ravb: Add set_feature support for RZ/G2L

 drivers/net/ethernet/renesas/ravb.h      |  91 +++-
 drivers/net/ethernet/renesas/ravb_main.c | 631 ++++++++++++++++++++---
 2 files changed, 630 insertions(+), 92 deletions(-)

-- 
2.17.1

