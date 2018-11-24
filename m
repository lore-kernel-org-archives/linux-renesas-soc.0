Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34992 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725744AbeKYFDR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Nov 2018 00:03:17 -0500
Received: by mail-lj1-f196.google.com with SMTP id x85-v6so13131876ljb.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Nov 2018 10:14:19 -0800 (PST)
To: Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] sata_rcar: fix deferred probing
Message-ID: <b28a6c60-1f20-e054-7f2a-c5a6cafde8a1@cogentembedded.com>
Date: Sat, 24 Nov 2018 21:14:16 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The driver overrides the error codes returned by platform_get_irq() to
-EINVAL, so if it returns -EPROBE_DEFER, the driver would fail the probe
permanently instead of the deferred probing. Switch to propagating the
error code upstream, still checking/overriding IRQ0 as libata regards it
as "no IRQ" (thus polling) anyway...

Fixes: 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'master' branch of Jens Axboe's 'linux-block.git'
repo.

 drivers/ata/sata_rcar.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: linux-block/drivers/ata/sata_rcar.c
===================================================================
--- linux-block.orig/drivers/ata/sata_rcar.c
+++ linux-block/drivers/ata/sata_rcar.c
@@ -891,7 +891,9 @@ static int sata_rcar_probe(struct platfo
 	int ret = 0;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0)
+	if (irq < 0)
+		return irq;
+	if (!irq)
 		return -EINVAL;
 
 	priv = devm_kzalloc(dev, sizeof(struct sata_rcar_priv), GFP_KERNEL);
