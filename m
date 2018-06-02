Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:41771 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751895AbeFBTi7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Jun 2018 15:38:59 -0400
Received: by mail-lf0-f68.google.com with SMTP id d24-v6so19524126lfa.8
        for <linux-renesas-soc@vger.kernel.org>; Sat, 02 Jun 2018 12:38:59 -0700 (PDT)
Subject: [PATCH 2/3] sh_eth: uninline sh_eth_soft_swap()
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <9027499a-0e19-7721-a17f-26e86885da3f@cogentembedded.com>
Message-ID: <a1eb21c8-ab44-3022-b239-0b5c33691d3b@cogentembedded.com>
Date: Sat, 2 Jun 2018 22:38:56 +0300
MIME-Version: 1.0
In-Reply-To: <9027499a-0e19-7721-a17f-26e86885da3f@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

sh_eth_tsu_soft_swap() is called twice by the driver, remove *inline* and
move  that function  from the header to the driver itself to let gcc decide
whether to expand it inline or not...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   11 +++++++++++
 drivers/net/ethernet/renesas/sh_eth.h |   12 ------------
 2 files changed, 11 insertions(+), 12 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -460,6 +460,17 @@ static u32 sh_eth_tsu_read(struct sh_eth
 	return ioread32(mdp->tsu_addr + offset);
 }
 
+static void sh_eth_soft_swap(char *src, int len)
+{
+#ifdef __LITTLE_ENDIAN
+	u32 *p = (u32 *)src;
+	u32 *maxp = p + ((len + sizeof(u32) - 1) / sizeof(u32));
+
+	for (; p < maxp; p++)
+		*p = swab32(*p);
+#endif
+}
+
 static void sh_eth_select_mii(struct net_device *ndev)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -560,18 +560,6 @@ struct sh_eth_private {
 	unsigned wol_enabled:1;
 };
 
-static inline void sh_eth_soft_swap(char *src, int len)
-{
-#ifdef __LITTLE_ENDIAN
-	u32 *p = (u32 *)src;
-	u32 *maxp;
-	maxp = p + ((len + sizeof(u32) - 1) / sizeof(u32));
-
-	for (; p < maxp; p++)
-		*p = swab32(*p);
-#endif
-}
-
 static inline void *sh_eth_tsu_get_offset(struct sh_eth_private *mdp,
 					  int enum_index)
 {
