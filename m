Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB971C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:25:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9571421850
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:25:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GShw9VAY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727155AbeLSKZu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 05:25:50 -0500
Received: from mail-pg1-f173.google.com ([209.85.215.173]:37550 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbeLSKZu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 05:25:50 -0500
Received: by mail-pg1-f173.google.com with SMTP id c25so7752540pgb.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Dec 2018 02:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=m3WtkpzKxkBm7AQQAD02lowu9mCAqOUTFLjulX5q2LQ=;
        b=GShw9VAYowSDj2YIgyjL12dvK41BM9KrbrTjf0y+U2PA6UxT7/0D7vTOBx0LAp0olQ
         WNflqpp25b9G9qqoNY+4p+UfwUP1GjRpv/XeAYP3lG6egujMm/dYNjuImdXTWxAqVJe+
         DCHcbLBa7svCzI0uqkjKC5iMpmVksc4HpzSVP+CqUnO950JeKDZ3dZnxPO70t8eWzaDY
         FqMFdRkmICn5Y7VaLDtDcJHyUj4u4o/X+DVbLvOzsj0yiz8Q6+zIk/zRVtEE51M4n1PB
         ZT5uuStSxHaxzKkNnIN6xtP/SwfeRHK1dh4MB9nwdPa13tx2MgkXo6UXznlnVqYagd3V
         HdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=m3WtkpzKxkBm7AQQAD02lowu9mCAqOUTFLjulX5q2LQ=;
        b=eOJS/q+sCmSoknnJRS9geprdfUYN8Vii92+1XG7Bfx/31rMq3da1VUydyPBS+r6A0f
         jwoMaasIFLtBXjxVHAoWFMxqf0iuhtBEA7q9HinoIP4kN7zmy4MtIVnacgTZn95zRdgV
         rHB/et+KcTpLCtawY05X53I8ObYKJeZKTRRz2zbnXny0SxAZSbh7cC5qEsvB/7nv4lNC
         kTLkXXjdXOiEZLgJNoIUS7mR4wdjcWvKuq2/UxkBCIlCA1czeoLIkMi/6RPXkkALYcwq
         x3efgvgMkDfv5vZk6jbr3SWulqwp3FfggQkZdBOXEVDXSXe/9TWGpKFJtIUZ7oYBGm5v
         45gQ==
X-Gm-Message-State: AA+aEWY9fRZW0Sfc8FfzHJioBlBd/sy4fiS7TcId7MxR0N1cZb1JXswc
        sQ+ReJ6wMrJocb/v2oOA37a+skgZ
X-Google-Smtp-Source: AFSGD/U0YpBSQV/VNYMEtrByyoUfcUOfHX54wGoWfpTs+Uyw94nXnI1UsOAmiU4m/MyOqKaScnV9dg==
X-Received: by 2002:a63:e711:: with SMTP id b17mr18417602pgi.363.1545215148786;
        Wed, 19 Dec 2018 02:25:48 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id w136sm26032878pfd.169.2018.12.19.02.25.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Dec 2018 02:25:47 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 19 Dec 2018 19:26:16 +0900
Message-Id: <154521517624.7290.16869907830594641606.sendpatchset@octo>
In-Reply-To: <154521516632.7290.5245227863765109428.sendpatchset@octo>
References: <154521516632.7290.5245227863765109428.sendpatchset@octo>
Subject: [PATCH 01/09] Prototype code for basic IMR-LX4 test
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Introduce some basic test code for the IMR-LX4 device included in
R-Car Gen3 SoCs. At this point the code only controls clocks and
power domains using Runtime PM and resets the device. Obviously a
proper driver would be much more useful. This code is however useful
to test clocks and power domains and may in the future be extended
for IPMMU and further power management testing. Not for upstream merge.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/soc/renesas/Makefile               |    2 
 drivers/soc/renesas/renesas-test-imr-lx4.c |   71 ++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 1 deletion(-)

--- 0001/drivers/soc/renesas/Makefile
+++ work/drivers/soc/renesas/Makefile	2018-12-19 17:58:52.476078897 +0900
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Generic, must be first because of soc_device_register()
-obj-$(CONFIG_SOC_RENESAS)	+= renesas-soc.o
+obj-$(CONFIG_SOC_RENESAS)	+= renesas-soc.o renesas-test-imr-lx4.o
 
 # SoC
 obj-$(CONFIG_SYSC_R8A7743)	+= r8a7743-sysc.o
--- /dev/null
+++ work/drivers/soc/renesas/renesas-test-imr-lx4.c	2018-12-19 18:41:47.436079896 +0900
@@ -0,0 +1,71 @@
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mm.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define REG_CR 0x0008
+#define REG_ICR 0x0014
+#define REG_DLSAR 0x0030
+
+static const struct of_device_id imr_lx4_of_match[] = {
+	{ .compatible = "renesas,imr-lx4" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imr_lx4_of_match);
+
+static int imr_lx4_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *base;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base)) {
+		dev_warn(dev, "unable to map imr-lx4 registers\n");
+		return PTR_ERR(base);
+	}
+	
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+
+	printk("IMR-LX4 test: DLSAR, ICR registers should change when reset\n");
+	printk("configuring DLSAR and ICR registers\n");
+	iowrite32(0xdeadbee8, base + REG_DLSAR);
+	iowrite32(0x18, base + REG_ICR);
+
+	printk("DLSAR register 0x%08x\n", ioread32(base + REG_DLSAR));
+	printk("ICR register 0x%08x\n", ioread32(base + REG_ICR));
+	printk("CR register 0x%08x\n", ioread32(base + REG_CR));
+
+	printk("performing reset via CR register\n");
+	iowrite32(0x8000, base + REG_CR);
+
+	mdelay(1000);
+	
+	printk("DLSAR register 0x%08x\n", ioread32(base + REG_DLSAR));
+	printk("ICR register 0x%08x\n", ioread32(base + REG_ICR));
+	printk("CR register 0x%08x\n", ioread32(base + REG_CR));
+	
+	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
+
+	return -ENODEV;
+}
+
+static struct platform_driver imr_lx4_driver = {
+	.driver		= {
+		.name	= "renesas-imr-lx4",
+		.of_match_table = of_match_ptr(imr_lx4_of_match),
+	},
+	.probe		= imr_lx4_probe,
+};
+
+module_platform_driver(imr_lx4_driver);
+
+MODULE_DESCRIPTION("Renesas IMR-LX4 test driver");
+MODULE_LICENSE("GPL v2");
