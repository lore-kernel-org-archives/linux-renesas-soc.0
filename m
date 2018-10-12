Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37859 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbeJMDWa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Oct 2018 23:22:30 -0400
Received: by mail-lj1-f196.google.com with SMTP id 63-v6so12359786ljs.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Oct 2018 12:48:25 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] spi: sh-msiof: fix deferred probing
To: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Message-ID: <c705888d-128a-bf3a-7828-ce105b3665d4@cogentembedded.com>
Date: Fri, 12 Oct 2018 22:48:22 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since commit 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
platform_get_irq() can return -EPROBE_DEFER. However, the driver overrides
an error returned by that function with -ENOENT which breaks the deferred
probing. Propagate upstream an error code returned by platform_get_irq()
and remove the bogus "platform" from the error message, while at it...

Fixes: 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'for-linus' branch of Mark Brown's 'spi.git' repo.

 drivers/spi/spi-sh-msiof.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: spi/drivers/spi/spi-sh-msiof.c
===================================================================
--- spi.orig/drivers/spi/spi-sh-msiof.c
+++ spi/drivers/spi/spi-sh-msiof.c
@@ -1343,8 +1343,8 @@ static int sh_msiof_spi_probe(struct pla
 
 	i = platform_get_irq(pdev, 0);
 	if (i < 0) {
-		dev_err(&pdev->dev, "cannot get platform IRQ\n");
-		ret = -ENOENT;
+		dev_err(&pdev->dev, "cannot get IRQ\n");
+		ret = i;
 		goto err1;
 	}
 
