Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4A2C433DB
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Mar 2021 20:45:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A12564F33
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Mar 2021 20:45:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234758AbhCLUpQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Mar 2021 15:45:16 -0500
Received: from mxout01.lancloud.ru ([45.84.86.81]:35200 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234991AbhCLUpB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 15:45:01 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru E85A3209D4DE
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH net-next 2/4] sh_eth: rename PSR bits
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
CC:     <linux-renesas-soc@vger.kernel.org>
References: <41a26045-c70e-32d7-b13e-8a8bd0834fcc@omprussia.ru>
Organization: Open Mobile Platform, LLC
Message-ID: <4c35d94e-27e1-5d2b-4564-3613fb5e3bd6@omprussia.ru>
Date:   Fri, 12 Mar 2021 23:44:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <41a26045-c70e-32d7-b13e-8a8bd0834fcc@omprussia.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In all the SoC manuals (except R-Car gen2) the PHY status register's name
is abbreviated to  PSR with the only valid bit 0 named LMON.  Follow the
suit and rename the corresponding *enum* tag/entry.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

---
 drivers/net/ethernet/renesas/sh_eth.c |    2 +-
 drivers/net/ethernet/renesas/sh_eth.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -1749,7 +1749,7 @@ static void sh_eth_emac_interrupt(struct
 		link_stat = sh_eth_read(ndev, PSR);
 		if (mdp->ether_link_active_low)
 			link_stat = ~link_stat;
-		if (!(link_stat & PHY_ST_LINK)) {
+		if (!(link_stat & PSR_LMON)) {
 			sh_eth_rcv_snd_disable(ndev);
 		} else {
 			/* Link Up */
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -208,7 +208,7 @@ enum PIR_BIT {
 };
 
 /* PSR */
-enum PHY_STATUS_BIT { PHY_ST_LINK = 0x01, };
+enum PSR_BIT { PSR_LMON = 0x01, };
 
 /* EESR */
 enum EESR_BIT {

