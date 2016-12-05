Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 7.mo68.mail-out.ovh.net ([46.105.63.230]:33267 "EHLO
        7.mo68.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751570AbcLEJjf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2016 04:39:35 -0500
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
        by mo68.mail-out.ovh.net (Postfix) with ESMTP id F07A2165B9
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2016 10:20:16 +0100 (CET)
From: Jacopo Mondi <jacopo@jmondi.org>
To: magnus.damm@gmail.com, geert+renesas@glider.be
Cc: linux-renesas-soc@vger.kernel.org
Subject: [RFCv2 1/2] gpio-rz: Port to v3.18
Date: Mon,  5 Dec 2016 10:20:04 +0100
Message-Id: <1480929605-28564-2-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1480929605-28564-1-git-send-email-jacopo@jmondi.org>
References: <1480693434-9415-1-git-send-email-jacopo@jmondi.org>
 <1480929605-28564-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Fix invalid return value in gpio remove function

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/gpio/gpio-rz.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rz.c b/drivers/gpio/gpio-rz.c
index a933dab..cb8f785 100644
--- a/drivers/gpio/gpio-rz.c
+++ b/drivers/gpio/gpio-rz.c
@@ -175,7 +175,8 @@ static int rz_gpio_remove(struct platform_device *pdev)
 {
 	struct rz_gpio_priv *p = platform_get_drvdata(pdev);
 
-	return gpiochip_remove(&p->gpio_chip);
+	gpiochip_remove(&p->gpio_chip);
+	return 0;
 }
 
 static const struct of_device_id rz_gpio_dt_ids[] = {
-- 
2.7.4
