Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:33805 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755709AbeFYUgZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jun 2018 16:36:25 -0400
Received: by mail-wr0-f193.google.com with SMTP id a12-v6so14983566wro.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jun 2018 13:36:24 -0700 (PDT)
Subject: [PATCH 1/2] sh_eth: fix *enum* RPADIR_BIT
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <2809eba8-4c9a-1d5f-a47d-8125777e365b@cogentembedded.com>
Message-ID: <8c72d27f-8b1a-23cf-3f41-781944cd1388@cogentembedded.com>
Date: Mon, 25 Jun 2018 23:36:21 +0300
MIME-Version: 1.0
In-Reply-To: <2809eba8-4c9a-1d5f-a47d-8125777e365b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The *enum*  RPADIR_BIT  was declared in the commit 86a74ff21a7a ("net:
sh_eth: add support for Renesas SuperH Ethernet") adding SH771x support,
however the SH771x manual doesn't have the RPADIR register described and,
moreover, tells why the padding insertion must not be used. The newer SoC
manuals do have RPADIR documented, though with somewhat different layout --
update the *enum* according to these manuals...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.h |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -403,8 +403,7 @@ enum DESC_I_BIT {
 
 /* RPADIR */
 enum RPADIR_BIT {
-	RPADIR_PADS1 = 0x20000, RPADIR_PADS0 = 0x10000,
-	RPADIR_PADR = 0x0003f,
+	RPADIR_PADS = 0x1f0000, RPADIR_PADR = 0xffff,
 };
 
 /* FDR */
