Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:38084 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751702AbeFBTkU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Jun 2018 15:40:20 -0400
Received: by mail-lf0-f67.google.com with SMTP id i83-v6so7339137lfh.5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 02 Jun 2018 12:40:19 -0700 (PDT)
Subject: [PATCH 3/3] sh_eth: use DIV_ROUND_UP() in sh_eth_soft_swap()
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <9027499a-0e19-7721-a17f-26e86885da3f@cogentembedded.com>
Message-ID: <995798f8-69e0-6471-8eca-eefc420dbe21@cogentembedded.com>
Date: Sat, 2 Jun 2018 22:40:16 +0300
MIME-Version: 1.0
In-Reply-To: <9027499a-0e19-7721-a17f-26e86885da3f@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When initializing 'maxp' in sh_eth_soft_swap(), the buffer length needs
to be rounded  up -- that's just asking for DIV_ROUND_UP()!

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -464,7 +464,7 @@ static void sh_eth_soft_swap(char *src,
 {
 #ifdef __LITTLE_ENDIAN
 	u32 *p = (u32 *)src;
-	u32 *maxp = p + ((len + sizeof(u32) - 1) / sizeof(u32));
+	u32 *maxp = p + DIV_ROUND_UP(len, sizeof(u32));
 
 	for (; p < maxp; p++)
 		*p = swab32(*p);
