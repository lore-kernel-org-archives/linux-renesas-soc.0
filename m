Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:32903 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762401AbdADV3g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 16:29:36 -0500
Received: by mail-lf0-f44.google.com with SMTP id k86so23444659lfi.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Jan 2017 13:29:35 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] sh_eth: R8A7740 supports packet shecksumming
Date: Thu, 05 Jan 2017 00:29:32 +0300
Message-ID: <1871204.P0zXJRoIfd@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The R8A7740 GEther controller supports the packet checksum offloading
but the 'hw_crc' (bad name, I'll fix it) flag isn't set in the R8A7740
data,  thus CSMR isn't cleared...

Fixes: 73a0d907301e ("net: sh_eth: add support R8A7740")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against DaveM's 'net.git' repo plus the fixes sent recently...

 drivers/net/ethernet/renesas/sh_eth.c |    1 +
 1 file changed, 1 insertion(+)

Index: net/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net/drivers/net/ethernet/renesas/sh_eth.c
@@ -574,6 +574,7 @@ static struct sh_eth_cpu_data r8a7740_da
 	.rpadir_value   = 2 << 16,
 	.no_trimd	= 1,
 	.no_ade		= 1,
+	.hw_crc		= 1,
 	.tsu		= 1,
 	.select_mii	= 1,
 	.shift_rd0	= 1,
