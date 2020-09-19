Return-Path: <SRS0=mNk5=C4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67C2C43463
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 19 Sep 2020 11:00:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A663D208C3
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 19 Sep 2020 11:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgISLAX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 19 Sep 2020 07:00:23 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:34822 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726129AbgISLAW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Sep 2020 07:00:22 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id BDB878E444167DD1CF8D;
        Sat, 19 Sep 2020 19:00:18 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Sat, 19 Sep 2020
 19:00:11 +0800
From:   Liu Jian <liujian56@huawei.com>
To:     <sergei.shtylyov@gmail.com>, <davem@davemloft.net>,
        <kuba@kernel.org>, <liujian56@huawei.com>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH net-netx] net: renesas: sh_eth: suppress initialized field overwritten warning
Date:   Sat, 19 Sep 2020 18:59:45 +0800
Message-ID: <20200919105945.251532-1-liujian56@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Suppress a bunch of warnings of the form:

drivers/net/ethernet/renesas/sh_eth.c:100:13: warning: initialized field overwritten [-Woverride-init]

This is because after the sh_eth_offset_xxx array is initialized to SH_ETH_OFFSET_INVALID,
some specific register_offsets are re-initialized. It wasn't a mistake.

Signed-off-by: Liu Jian <liujian56@huawei.com>
---
 drivers/net/ethernet/renesas/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/Makefile b/drivers/net/ethernet/renesas/Makefile
index f21ab8c02af0..ccb8521d190b 100644
--- a/drivers/net/ethernet/renesas/Makefile
+++ b/drivers/net/ethernet/renesas/Makefile
@@ -3,6 +3,7 @@
 # Makefile for the Renesas device drivers.
 #
 
+CFLAGS_sh_eth.o += -Wno-override-init
 obj-$(CONFIG_SH_ETH) += sh_eth.o
 
 ravb-objs := ravb_main.o ravb_ptp.o
-- 
2.17.1

