Return-Path: <SRS0=rwvk=T3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22463C04AB3
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 27 May 2019 12:04:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB8D721721
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 27 May 2019 12:04:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfE0MEP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 27 May 2019 08:04:15 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:56752 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfE0MEP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 May 2019 08:04:15 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id HQ4D2000L3XaVaC01Q4Dgd; Mon, 27 May 2019 14:04:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEMP-0001Pc-I1; Mon, 27 May 2019 14:04:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEMP-00015Y-GB; Mon, 27 May 2019 14:04:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/5] irqchip/renesas-irqc: Remove error messages on out-of-memory conditions
Date:   Mon, 27 May 2019 14:04:09 +0200
Message-Id: <20190527120412.4071-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190527120412.4071-1-geert+renesas@glider.be>
References: <20190527120412.4071-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no need to print error messages if kzalloc() or
ioremap_nocache() fail, as the memory allocation core already takes care
of that.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v2:
  - Add Reviewed-by,
  - s/devm_kzalloc/kzalloc/ in patch description, reword.
---
 drivers/irqchip/irq-renesas-irqc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
index 438a063c76156d98..0955ffe12b32eb36 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -133,7 +133,6 @@ static int irqc_probe(struct platform_device *pdev)
 
 	p = kzalloc(sizeof(*p), GFP_KERNEL);
 	if (!p) {
-		dev_err(&pdev->dev, "failed to allocate driver data\n");
 		ret = -ENOMEM;
 		goto err0;
 	}
@@ -173,7 +172,6 @@ static int irqc_probe(struct platform_device *pdev)
 	/* ioremap IOMEM and setup read/write callbacks */
 	p->iomem = ioremap_nocache(io->start, resource_size(io));
 	if (!p->iomem) {
-		dev_err(&pdev->dev, "failed to remap IOMEM\n");
 		ret = -ENXIO;
 		goto err2;
 	}
-- 
2.17.1

