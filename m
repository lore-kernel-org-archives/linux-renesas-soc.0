Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:33527 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751089AbcGQNIr (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 17 Jul 2016 09:08:47 -0400
Received: by mail-lf0-f54.google.com with SMTP id b199so115561670lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jul 2016 06:08:46 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] ravb: fix DMA channel misreporting
Date: Sun, 17 Jul 2016 16:08:43 +0300
Message-ID: <1708843.0O4nJpZ8zM@wasted.cogentembedded.com>
In-Reply-To: <8592210.gMERdmUlCp@wasted.cogentembedded.com>
References: <8592210.gMERdmUlCp@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Currently 'ifconfig' for the Ethernet devices handled by this driver  shows
"DMA chan: ff" while the driver doesn't use any DMA channels. Not assigning
a value to 'net_device::dma' causes 'ifconfig'  to  correctly not report  a
DMA channel.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/ravb_main.c |    1 -
 1 file changed, 1 deletion(-)

Index: net/drivers/net/ethernet/renesas/ravb_main.c
===================================================================
--- net.orig/drivers/net/ethernet/renesas/ravb_main.c
+++ net/drivers/net/ethernet/renesas/ravb_main.c
@@ -1909,7 +1909,6 @@ static int ravb_probe(struct platform_de
 
 	/* The Ether-specific entries in the device structure. */
 	ndev->base_addr = res->start;
-	ndev->dma = -1;
 
 	chip_id = (enum ravb_chip_id)of_device_get_match_data(&pdev->dev);
 
