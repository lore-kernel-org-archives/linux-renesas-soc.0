Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0DFC433E9
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 28 Feb 2021 20:33:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B415A64E27
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 28 Feb 2021 20:33:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbhB1UdT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 28 Feb 2021 15:33:19 -0500
Received: from mxout03.lancloud.ru ([45.84.86.113]:37546 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbhB1UdR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Feb 2021 15:33:17 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 127F9209AB92
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH net 2/3] sh_eth: fix TRSCER mask for R7S72100
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
CC:     <linux-renesas-soc@vger.kernel.org>
References: <7009ba70-4134-1acf-42b9-fa7e59b5d15d@omprussia.ru>
Organization: Open Mobile Platform, LLC
Message-ID: <8e901c23-65ad-d76d-5a05-11d9aa7c4fc3@omprussia.ru>
Date:   Sun, 28 Feb 2021 23:26:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7009ba70-4134-1acf-42b9-fa7e59b5d15d@omprussia.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According  to  the RZ/A1H Group, RZ/A1M Group User's Manual: Hardware,
Rev. 4.00, the TRSCER register has bit 9 reserved, hence we can't use
the driver's default TRSCER mask.  Add the explicit initializer for
sh_eth_cpu_data::trscer_err_mask for R7S72100.

Fixes: db893473d313 ("sh_eth: Add support for r7s72100")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

---
 drivers/net/ethernet/renesas/sh_eth.c |    2 ++
 1 file changed, 2 insertions(+)

Index: net/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net/drivers/net/ethernet/renesas/sh_eth.c
@@ -560,6 +560,8 @@ static struct sh_eth_cpu_data r7s72100_d
 			  EESR_TDE,
 	.fdr_value	= 0x0000070f,
 
+	.trscer_err_mask = DESC_I_RINT8 | DESC_I_RINT5,
+
 	.no_psr		= 1,
 	.apr		= 1,
 	.mpr		= 1,
