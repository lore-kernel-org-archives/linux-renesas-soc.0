Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:54778 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752836AbdLDOSR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 09:18:17 -0500
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 1/2] net: sh_eth: add support for SH7786
Date: Mon,  4 Dec 2017 15:17:43 +0100
Message-Id: <20171204141744.18599-2-thomas.petazzoni@free-electrons.com>
In-Reply-To: <20171204141744.18599-1-thomas.petazzoni@free-electrons.com>
References: <20171204141744.18599-1-thomas.petazzoni@free-electrons.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This commit adds the sh_eth_cpu_data structure that describes the
SH7786 variant of the IP.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/net/ethernet/renesas/sh_eth.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 0074c5998481..a3c48b2a713c 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -710,6 +710,30 @@ static struct sh_eth_cpu_data sh7724_data = {
 	.rpadir_value	= 0x00020000, /* NET_IP_ALIGN assumed to be 2 */
 };
 
+static struct sh_eth_cpu_data sh7786_data = {
+	.set_duplex	= sh_eth_set_duplex,
+
+	.register_type	= SH_ETH_REG_FAST_SH4,
+
+	.ecsr_value	= ECSR_PSRTO | ECSR_LCHNG | ECSR_ICD,
+	.ecsipr_value	= ECSIPR_PSRTOIP | ECSIPR_LCHNGIP | ECSIPR_ICDIP,
+	.eesipr_value	= EESIPR_RFCOFIP | EESIPR_ADEIP | EESIPR_ECIIP |
+			  EESIPR_FTCIP | EESIPR_TDEIP | EESIPR_TFUFIP |
+			  EESIPR_FRIP | EESIPR_RDEIP | EESIPR_RFOFIP |
+			  EESIPR_RMAFIP | EESIPR_RRFIP |
+			  EESIPR_RTLFIP | EESIPR_RTSFIP |
+			  EESIPR_PREIP | EESIPR_CERFIP,
+
+	.tx_check	= EESR_FTC | EESR_CND | EESR_DLC | EESR_CD | EESR_RTO,
+	.eesr_err_check	= EESR_TWB | EESR_TABT | EESR_RABT | EESR_RFE |
+			  EESR_RDE | EESR_RFRMER | EESR_TFE | EESR_TDE,
+
+	.apr		= 1,
+	.mpr		= 1,
+	.tpauser	= 1,
+	.hw_swap	= 1,
+};
+
 static void sh_eth_set_rate_sh7757(struct net_device *ndev)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
@@ -3418,6 +3442,7 @@ static const struct platform_device_id sh_eth_id_table[] = {
 	{ "sh7757-ether", (kernel_ulong_t)&sh7757_data },
 	{ "sh7757-gether", (kernel_ulong_t)&sh7757_data_giga },
 	{ "sh7763-gether", (kernel_ulong_t)&sh7763_data },
+	{ "sh7786-ether", (kernel_ulong_t)&sh7786_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, sh_eth_id_table);
-- 
2.13.6
