Return-Path: <SRS0=rwvk=T3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7229FC07542
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 27 May 2019 12:40:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4941820815
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 27 May 2019 12:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfE0Mky (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 27 May 2019 08:40:54 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:33090 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbfE0Mky (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 May 2019 08:40:54 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id HQgt2000F3XaVaC01Qgt3w; Mon, 27 May 2019 14:40:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEvt-0001Wt-GQ; Mon, 27 May 2019 14:40:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEvt-0001zd-Ev; Mon, 27 May 2019 14:40:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] gpio: em: Remove error messages on out-of-memory conditions
Date:   Mon, 27 May 2019 14:40:50 +0200
Message-Id: <20190527124051.7615-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190527124051.7615-1-geert+renesas@glider.be>
References: <20190527124051.7615-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no need to print error messages when memory allocations or
related operations fail, as the core will take care of that.

Change the returned error codes to -ENOMEM to match the failure cause
while at it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-em.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 982e699a5b816582..18937a9b1a14a72c 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -305,16 +305,14 @@ static int em_gio_probe(struct platform_device *pdev)
 	p->base0 = devm_ioremap_nocache(&pdev->dev, io[0]->start,
 					resource_size(io[0]));
 	if (!p->base0) {
-		dev_err(&pdev->dev, "failed to remap low I/O memory\n");
-		ret = -ENXIO;
+		ret = -ENOMEM;
 		goto err0;
 	}
 
 	p->base1 = devm_ioremap_nocache(&pdev->dev, io[1]->start,
 				   resource_size(io[1]));
 	if (!p->base1) {
-		dev_err(&pdev->dev, "failed to remap high I/O memory\n");
-		ret = -ENXIO;
+		ret = -ENOMEM;
 		goto err0;
 	}
 
-- 
2.17.1

