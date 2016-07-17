Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:36674 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751104AbcGQNJX (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 17 Jul 2016 09:09:23 -0400
Received: by mail-lf0-f48.google.com with SMTP id g62so5489340lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jul 2016 06:09:23 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] sh_eth: fix DMA channel misreporting
Date: Sun, 17 Jul 2016 16:09:19 +0300
Message-ID: <3458874.GvGScMe9De@wasted.cogentembedded.com>
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
 drivers/net/ethernet/renesas/sh_eth.c |    1 -
 1 file changed, 1 deletion(-)

Index: net/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net/drivers/net/ethernet/renesas/sh_eth.c
@@ -2996,7 +2996,6 @@ static int sh_eth_drv_probe(struct platf
 	if (devno < 0)
 		devno = 0;
 
-	ndev->dma = -1;
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
 		goto out_release;
