Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:43958 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751156AbeERSaV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 14:30:21 -0400
Received: by mail-lf0-f67.google.com with SMTP id n18-v6so15280389lfh.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 May 2018 11:30:21 -0700 (PDT)
Subject: [PATCH v2 1/1] sh_eth: add RGMII support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <f30c98ff-f6da-9e7f-c637-49076a428885@cogentembedded.com>
Message-ID: <727139b8-d482-5a55-9149-f763eae75bca@cogentembedded.com>
Date: Fri, 18 May 2018 21:30:18 +0300
MIME-Version: 1.0
In-Reply-To: <f30c98ff-f6da-9e7f-c637-49076a428885@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The R-Car V3H (AKA R8A77980) GEther controller  adds support for the RGMII
PHY interface mode as a new  value  for the RMII_MII register.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- included PHY_INTERFACE_MODE_RGMII_{|RX|TX}ID in the RGMII *case*.

 drivers/net/ethernet/renesas/sh_eth.c |    3 +++
 1 file changed, 3 insertions(+)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -466,6 +466,9 @@ static void sh_eth_select_mii(struct net
 	u32 value;
 
 	switch (mdp->phy_interface) {
+	case PHY_INTERFACE_MODE_RGMII ... PHY_INTERFACE_MODE_RGMII_TXID:
+		value = 0x3;
+		break;
 	case PHY_INTERFACE_MODE_GMII:
 		value = 0x2;
 		break;
