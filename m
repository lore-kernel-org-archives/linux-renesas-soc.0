Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA6BC7113B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:16:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFE3220879
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:16:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPTYt0JY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbfAUMQT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 07:16:19 -0500
Received: from mail-pg1-f173.google.com ([209.85.215.173]:39831 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728216AbfAUMQT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 07:16:19 -0500
Received: by mail-pg1-f173.google.com with SMTP id w6so9420242pgl.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jan 2019 04:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=gbGVJCSfWeOWmhjUsBz/qmJHeQFWPlFKmdPVIDFcYlA=;
        b=EPTYt0JYU+PHzpClwyOtoWGTOL/jbC67NR4bXmryi6W+nkDFPlX8r4BaOzryGYzL0V
         7SXUAWhSkgVrwymUDqm7g+1zsj3BEycRk+xNP3hIb2INOD91Xu5mQe2OUq0ykERez3+M
         u9QyINWu90av79pGrd3eQ/N5UJJxJMX9wElshLn4VXTJSRkY+D6WcVKuMv8s/navYQ8k
         HAQr1bj/bex9wuNmXO5knPMCKEgVYrSObQcoxh8Nk1y0yzrFMFe/4ejaoqElqJFf83jk
         tFql8rL23sO5d1GiwyniOj0evwItd2Ofkq8Ynv0hs3kb21ylg3l9Dcs774EliatlNnt9
         biuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=gbGVJCSfWeOWmhjUsBz/qmJHeQFWPlFKmdPVIDFcYlA=;
        b=oN8Q5D6pH8lJjRv4NUoD7j/qUhbLVIik2CVrn/6QGJOF/hLc7gB/2JsCXWkB8Ct1Xg
         ihHhfUrvhtZQfPTA5g5cHgBDKyms4/WMcszCdLKMVGkwo8ccSEQW/9lC/lE5Kqw/2IM5
         3RzQZJ2e1DgPnI6usnn9LziZDaP9Ukccl5ygYt2ZPtSIRoxxg5PTv9Jdfh+0fxL2PMUJ
         /hfr/KRFnEOlbEKxK/RJ/PmOxMiOS4VTYfenzgEbZT/z2oYFl0MSVbUc8yG9qEfYCAbh
         d1pLi74a366TgyjqlT/DFkxKuih7rXb+/CCycgkPXEoT/2oAOsiKZqQczFUqZrZX1NFx
         N3Kg==
X-Gm-Message-State: AJcUukcMl5M6nYPUAWoOvTcrpiz6Ha0ROqLLNGa3AWKCcHjGUsTB+Mhy
        oipxVVd0JPTmggeTZyuc/sWqeuhs
X-Google-Smtp-Source: ALg8bN6P47WPyzm1UKwKqEsynIZ6yq44GQEfdlEp8XBuXUf9S/g7O231oUIAwDOgzYsf8xFMoOVseA==
X-Received: by 2002:a63:955a:: with SMTP id t26mr28273625pgn.449.1548072973275;
        Mon, 21 Jan 2019 04:16:13 -0800 (PST)
Received: from [127.0.0.1] (30.net042126252.t-com.ne.jp. [42.126.252.30])
        by smtp.gmail.com with ESMTPSA id r4sm26528312pgn.54.2019.01.21.04.16.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Jan 2019 04:16:12 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 21 Jan 2019 21:16:52 +0900
Message-Id: <154807301237.2406.6258610622802083286.sendpatchset@octo>
In-Reply-To: <154807300302.2406.14245640502137089757.sendpatchset@octo>
References: <154807300302.2406.14245640502137089757.sendpatchset@octo>
Subject: [PATCH/RFC 01/06] Prototype code for IMP-X5
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Prototype code to read out the IMP-X5 register settings at probe() time.

Not for upstream merge.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/soc/renesas/Makefile              |    2 
 drivers/soc/renesas/renesas-test-imp-x5.c |   77 +++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 1 deletion(-)

--- 0001/drivers/soc/renesas/Makefile
+++ work/drivers/soc/renesas/Makefile	2019-01-21 19:52:18.929754637 +0900
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Generic, must be first because of soc_device_register()
-obj-$(CONFIG_SOC_RENESAS)	+= renesas-soc.o
+obj-$(CONFIG_SOC_RENESAS)	+= renesas-soc.o renesas-test-imp-x5.o
 
 # SoC
 obj-$(CONFIG_SYSC_R8A7743)	+= r8a7743-sysc.o
--- /dev/null
+++ work/drivers/soc/renesas/renesas-test-imp-x5.c	2019-01-21 20:21:30.895607391 +0900
@@ -0,0 +1,77 @@
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mm.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+static const struct of_device_id imp_x5_of_match[] = {
+	{ .compatible = "renesas,imp-x5" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imp_x5_of_match);
+
+static void imp_x5_dump_line(unsigned long addr, void __iomem *base, int offs)
+{
+	unsigned int buf[4];
+	char pfx[16];
+	int i;
+
+	for (i = 0; i < 4; i++)
+		buf[i] = ioread32(base + offs + i);
+
+	snprintf(pfx, sizeof(pfx), "0x%08lx: ", addr + offs);
+	
+	print_hex_dump(KERN_DEBUG, pfx, 0, 16, 1, &buf[0], 16, true);
+}
+
+static void imp_x5_dump(unsigned long addr, void __iomem *base, int length)
+{
+	int i;
+	
+	for (i = 0; i < length; i += 16)
+		imp_x5_dump_line(addr, base, i);
+}
+
+static int imp_x5_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *base;
+	int i;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base)) {
+		dev_warn(dev, "unable to map imp-x5 registers\n");
+		return PTR_ERR(base);
+	}
+	
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+
+	printk("IMP-X5 test: dumping registers\n");
+
+	for (i = 0; i < resource_size(res) && i < 0x300000; i += 0x100000)
+		imp_x5_dump(res->start + i, base + i, 64);
+	
+	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
+
+	return -ENODEV;
+}
+
+static struct platform_driver imp_x5_driver = {
+	.driver		= {
+		.name	= "renesas-imp-x5",
+		.of_match_table = of_match_ptr(imp_x5_of_match),
+	},
+	.probe		= imp_x5_probe,
+};
+
+module_platform_driver(imp_x5_driver);
+
+MODULE_DESCRIPTION("Renesas IMP-X5 test driver");
+MODULE_LICENSE("GPL v2");
