Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:33764 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754061AbdADULZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 15:11:25 -0500
Received: by mail-lf0-f47.google.com with SMTP id k86so22233739lfi.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Jan 2017 12:10:31 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] sh_eth: enable RX descriptor word 0 shift on SH7734
Date: Wed, 04 Jan 2017 23:10:23 +0300
Message-ID: <1893574.OD9Leu8Ck8@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The RX descriptor word 0 on SH7734 has the RFS[9:0] field in bits 16-25
(bits  0-15 usually used for that are occupied by the packet checksum).
Thus  we need to set the 'shift_rd0'  field in the SH7734 SoC data...

Fixes: f0e81fecd4f8 ("net: sh_eth: Add support SH7734")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against DaveM's 'net.git' repo.

 drivers/net/ethernet/renesas/sh_eth.c |    1 +
 1 file changed, 1 insertion(+)

Index: net/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net/drivers/net/ethernet/renesas/sh_eth.c
@@ -819,6 +819,7 @@ static struct sh_eth_cpu_data sh7734_dat
 	.tsu		= 1,
 	.hw_crc		= 1,
 	.select_mii	= 1,
+	.shift_rd0	= 1,
 };
 
 /* SH7763 */
