Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44156 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbeJDDhh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Oct 2018 23:37:37 -0400
Received: by mail-lf1-f65.google.com with SMTP id m18-v6so5158165lfl.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Oct 2018 13:47:37 -0700 (PDT)
To: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-pm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] thermal: rcar_thermal: fix duplicate IRQ request
Message-ID: <34a21e56-22b0-3603-1aba-0800aa02eff7@cogentembedded.com>
Date: Wed, 3 Oct 2018 23:47:34 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The driver on R8A77995 requests the same IRQ twice since
platform_get_resource() is always called for the 1st IRQ resource. 

Fixes: 1969d9dc2079 ("thermal: rcar_thermal: add r8a77995 support")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'master' branch of Zhang Rui's linux.git' repo.

 drivers/thermal/rcar_thermal.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/thermal/rcar_thermal.c
===================================================================
--- linux.orig/drivers/thermal/rcar_thermal.c
+++ linux/drivers/thermal/rcar_thermal.c
@@ -504,7 +504,7 @@ static int rcar_thermal_probe(struct pla
 	pm_runtime_get_sync(dev);
 
 	for (i = 0; i < chip->nirqs; i++) {
-		irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+		irq = platform_get_resource(pdev, IORESOURCE_IRQ, i);
 		if (!irq)
 			continue;
 		if (!common->base) {
