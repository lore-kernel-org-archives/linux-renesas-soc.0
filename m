Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33906 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752519AbeESVCk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 May 2018 17:02:40 -0400
Received: by mail-lf0-f68.google.com with SMTP id x145-v6so6732262lff.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 May 2018 14:02:39 -0700 (PDT)
Subject: [PATCH 1/3] sh_eth: fix typo in EESR.TRO bit name
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <d47afee4-6fd5-af6d-885c-5b07996749fc@cogentembedded.com>
Message-ID: <0de7581f-dea5-7773-32f6-5bd6256358d5@cogentembedded.com>
Date: Sun, 20 May 2018 00:02:36 +0300
MIME-Version: 1.0
In-Reply-To: <d47afee4-6fd5-af6d-885c-5b07996749fc@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The  correct name of the EESR bit 8 is TRO (transmit retry over), not RTO.
Note that EESIPR bit 8, TROIP remained correct...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   10 +++++-----
 drivers/net/ethernet/renesas/sh_eth.h |    4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -706,7 +706,7 @@ static struct sh_eth_cpu_data rcar_gen1_
 			  EESIPR_RTLFIP | EESIPR_RTSFIP |
 			  EESIPR_PREIP | EESIPR_CERFIP,
 
-	.tx_check	= EESR_FTC | EESR_CND | EESR_DLC | EESR_CD | EESR_RTO,
+	.tx_check	= EESR_FTC | EESR_CND | EESR_DLC | EESR_CD | EESR_TRO,
 	.eesr_err_check	= EESR_TWB | EESR_TABT | EESR_RABT | EESR_RFE |
 			  EESR_RDE | EESR_RFRMER | EESR_TFE | EESR_TDE,
 	.fdr_value	= 0x00000f0f,
@@ -738,7 +738,7 @@ static struct sh_eth_cpu_data rcar_gen2_
 			  EESIPR_RTLFIP | EESIPR_RTSFIP |
 			  EESIPR_PREIP | EESIPR_CERFIP,
 
-	.tx_check	= EESR_FTC | EESR_CND | EESR_DLC | EESR_CD | EESR_RTO,
+	.tx_check	= EESR_FTC | EESR_CND | EESR_DLC | EESR_CD | EESR_TRO,
 	.eesr_err_check	= EESR_TWB | EESR_TABT | EESR_RABT | EESR_RFE |
 			  EESR_RDE | EESR_RFRMER | EESR_TFE | EESR_TDE,
 	.fdr_value	= 0x00000f0f,
@@ -774,7 +774,7 @@ static struct sh_eth_cpu_data r8a77980_d
 			  EESIPR_RTLFIP | EESIPR_RTSFIP |
 			  EESIPR_PREIP | EESIPR_CERFIP,
 
-	.tx_check       = EESR_FTC | EESR_CD | EESR_RTO,
+	.tx_check       = EESR_FTC | EESR_CD | EESR_TRO,
 	.eesr_err_check = EESR_TWB1 | EESR_TWB | EESR_TABT | EESR_RABT |
 			  EESR_RFE | EESR_RDE | EESR_RFRMER |
 			  EESR_TFE | EESR_TDE | EESR_ECI,
@@ -831,7 +831,7 @@ static struct sh_eth_cpu_data sh7724_dat
 			  EESIPR_RTLFIP | EESIPR_RTSFIP |
 			  EESIPR_PREIP | EESIPR_CERFIP,
 
-	.tx_check	= EESR_FTC | EESR_CND | EESR_DLC | EESR_CD | EESR_RTO,
+	.tx_check	= EESR_FTC | EESR_CND | EESR_DLC | EESR_CD | EESR_TRO,
 	.eesr_err_check	= EESR_TWB | EESR_TABT | EESR_RABT | EESR_RFE |
 			  EESR_RDE | EESR_RFRMER | EESR_TFE | EESR_TDE,
 
@@ -876,7 +876,7 @@ static struct sh_eth_cpu_data sh7757_dat
 			  EESIPR_RRFIP | EESIPR_RTLFIP | EESIPR_RTSFIP |
 			  EESIPR_PREIP | EESIPR_CERFIP,
 
-	.tx_check	= EESR_FTC | EESR_CND | EESR_DLC | EESR_CD | EESR_RTO,
+	.tx_check	= EESR_FTC | EESR_CND | EESR_DLC | EESR_CD | EESR_TRO,
 	.eesr_err_check	= EESR_TWB | EESR_TABT | EESR_RABT | EESR_RFE |
 			  EESR_RDE | EESR_RFRMER | EESR_TFE | EESR_TDE,
 
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -243,7 +243,7 @@ enum EESR_BIT {
 	EESR_CND	= 0x00000800,
 	EESR_DLC	= 0x00000400,
 	EESR_CD		= 0x00000200,
-	EESR_RTO	= 0x00000100,
+	EESR_TRO	= 0x00000100,
 	EESR_RMAF	= 0x00000080,
 	EESR_CEEF	= 0x00000040,
 	EESR_CELF	= 0x00000020,
@@ -263,7 +263,7 @@ enum EESR_BIT {
 				 EESR_CERF)  /* Recv frame CRC error */
 
 #define DEFAULT_TX_CHECK	(EESR_FTC | EESR_CND | EESR_DLC | EESR_CD | \
-				 EESR_RTO)
+				 EESR_TRO)
 #define DEFAULT_EESR_ERR_CHECK	(EESR_TWB | EESR_TABT | EESR_RABT | EESR_RFE | \
 				 EESR_RDE | EESR_RFRMER | EESR_ADE | \
 				 EESR_TFE | EESR_TDE)
