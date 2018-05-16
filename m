Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:52862 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751096AbeEPT4s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 15:56:48 -0400
Received: by mail-wm0-f68.google.com with SMTP id w194-v6so4271360wmf.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 May 2018 12:56:48 -0700 (PDT)
Subject: [PATCH 1/3] sh_eth: add RGMII support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <087c91a3-a451-6de7-5e0f-a835f8cc98f1@cogentembedded.com>
Message-ID: <38a56174-c05d-8864-adf0-d3099e426a60@cogentembedded.com>
Date: Wed, 16 May 2018 22:56:45 +0300
MIME-Version: 1.0
In-Reply-To: <087c91a3-a451-6de7-5e0f-a835f8cc98f1@cogentembedded.com>
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
 drivers/net/ethernet/renesas/sh_eth.c |    3 +++
 1 file changed, 3 insertions(+)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -466,6 +466,9 @@ static void sh_eth_select_mii(struct net
 	u32 value;
 
 	switch (mdp->phy_interface) {
+	case PHY_INTERFACE_MODE_RGMII:
+		value = 0x3;
+		break;
 	case PHY_INTERFACE_MODE_GMII:
 		value = 0x2;
 		break;
