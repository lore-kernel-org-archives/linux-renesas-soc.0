Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:43362 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751271AbeCaVXy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 31 Mar 2018 17:23:54 -0400
Received: by mail-lf0-f66.google.com with SMTP id v207-v6so16343181lfa.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Mar 2018 14:23:54 -0700 (PDT)
Subject: [PATCH net-next 2/2] sh_eth: kill useless check in
 __sh_eth_get_regs()
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <998029b4-9400-ebc3-51c1-623c3f72b6cc@cogentembedded.com>
Message-ID: <47af0c2c-bba9-a346-1925-06c99142cbb2@cogentembedded.com>
Date: Sun, 1 Apr 2018 00:23:51 +0300
MIME-Version: 1.0
In-Reply-To: <998029b4-9400-ebc3-51c1-623c3f72b6cc@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Iff TSU registers exist on a given [G]Ether controller, they always include
the CAM entry table registers (TSU_ADR{H|L}<n>), thus the check for invalid
TSU_ADRH0 offset in __sh_eth_get_regs() is useless...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -2153,22 +2153,17 @@ static size_t __sh_eth_get_regs(struct n
 		add_tsu_reg(TSU_POST2);
 		add_tsu_reg(TSU_POST3);
 		add_tsu_reg(TSU_POST4);
-		if (mdp->reg_offset[TSU_ADRH0] != SH_ETH_OFFSET_INVALID) {
-			/* This is the start of a table, not just a single
-			 * register.
-			 */
-			if (buf) {
-				unsigned int i;
+		/* This is the start of a table, not just a single register. */
+		if (buf) {
+			unsigned int i;
 
-				mark_reg_valid(TSU_ADRH0);
-				for (i = 0; i < SH_ETH_TSU_CAM_ENTRIES * 2; i++)
-					*buf++ = ioread32(
-						mdp->tsu_addr +
-						mdp->reg_offset[TSU_ADRH0] +
-						i * 4);
-			}
-			len += SH_ETH_TSU_CAM_ENTRIES * 2;
+			mark_reg_valid(TSU_ADRH0);
+			for (i = 0; i < SH_ETH_TSU_CAM_ENTRIES * 2; i++)
+				*buf++ = ioread32(mdp->tsu_addr +
+						  mdp->reg_offset[TSU_ADRH0] +
+						  i * 4);
 		}
+		len += SH_ETH_TSU_CAM_ENTRIES * 2;
 	}
 
 #undef mark_reg_valid
