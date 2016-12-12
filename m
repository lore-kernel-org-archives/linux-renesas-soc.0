Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:54217 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753245AbcLLQK1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2016 11:10:27 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 4/5] sh_eth: enable wake-on-lan for sh7743
Date: Mon, 12 Dec 2016 17:09:30 +0100
Message-Id: <20161212160931.6478-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20161212160931.6478-1-niklas.soderlund+renesas@ragnatech.se>
References: <20161212160931.6478-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is based on public datasheet for sh7743 which shows it have the
same behavior and registers for WoL as other versions of sh_eth.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/sh_eth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index fafde6f..927de77 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -822,6 +822,7 @@ static struct sh_eth_cpu_data sh7734_data = {
 	.tsu		= 1,
 	.hw_crc		= 1,
 	.select_mii	= 1,
+	.magic		= 1,
 };
 
 /* SH7763 */
-- 
2.10.2
