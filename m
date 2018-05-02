Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:41397 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750993AbeEBTzz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 15:55:55 -0400
Received: by mail-lf0-f65.google.com with SMTP id o123-v6so22614748lfe.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 May 2018 12:55:55 -0700 (PDT)
Subject: [PATCH 2/2] sh_eth: WARN_ON() access to unimplemented TSU register
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <4a17ab65-4d9c-897e-c340-7d86e0296f2f@cogentembedded.com>
Message-ID: <de0af198-d1fd-e1fb-2677-3089fa6500a9@cogentembedded.com>
Date: Wed, 2 May 2018 22:55:52 +0300
MIME-Version: 1.0
In-Reply-To: <4a17ab65-4d9c-897e-c340-7d86e0296f2f@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Commit 3365711df024 ("sh_eth: WARN on access to a register not implemented
in a particular chip") added  WARN_ON() to sh_eth_{read|write}() but not
to sh_eth_tsu_{read|write}(). Now that we've routed almost all TSU register
accesses  (except TSU_ADR{H|L}<n> -- which are special) thru the latter
pair of accessors, it makes sense to check for the unimplemented TSU
registers as well...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -442,12 +442,22 @@ static void sh_eth_modify(struct net_dev
 static void sh_eth_tsu_write(struct sh_eth_private *mdp, u32 data,
 			     int enum_index)
 {
-	iowrite32(data, mdp->tsu_addr + mdp->reg_offset[enum_index]);
+	u16 offset = mdp->reg_offset[enum_index];
+
+	if (WARN_ON(offset == SH_ETH_OFFSET_INVALID))
+		return;
+
+	iowrite32(data, mdp->tsu_addr + offset);
 }
 
 static u32 sh_eth_tsu_read(struct sh_eth_private *mdp, int enum_index)
 {
-	return ioread32(mdp->tsu_addr + mdp->reg_offset[enum_index]);
+	u16 offset = mdp->reg_offset[enum_index];
+
+	if (WARN_ON(offset == SH_ETH_OFFSET_INVALID))
+		return ~0U;
+
+	return ioread32(mdp->tsu_addr + offset);
 }
 
 static void sh_eth_select_mii(struct net_device *ndev)
