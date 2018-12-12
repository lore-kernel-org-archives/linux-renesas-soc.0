Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EACC67839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 20E942081B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crl1M4gB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20E942081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbeLLBkb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:40:31 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46530 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbeLLBkb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:40:31 -0500
Received: by mail-wr1-f67.google.com with SMTP id l9so15970526wrt.13;
        Tue, 11 Dec 2018 17:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OgIpEdc0NDVKGcQHMl3maDPaoBVLT3/5ZZoqfVJ5oSY=;
        b=crl1M4gBgYxyefUD1hKpS314r7kp/nq7jYJZtXOVK392lHZXKG+8mq/5/A+FMWh3Pf
         MrBi5r4KwWkrlSVlx3bKwjOe9tMJmQfTrni0hve6iDfVBdwC6L6LWPDQOW3DNmlza8bJ
         o+jBKUzWuVaeCxoXYR8UrZj9V+Qc12ojKzCGNhWHJs0/xDv2CSu6oYlwaF/YQvlyIVkC
         6vjG0xsz6HQatjkly27jOQH8vtBM2CckRbBA4MGy48Wx06T3YMQL6BMb/X0o+uqiSRJ3
         opVLVaKHdZHWuzORYP+KyFCGHED524LAoka3qQIcPngvWVgPqvsGtzVurk850ymu5P7M
         PfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OgIpEdc0NDVKGcQHMl3maDPaoBVLT3/5ZZoqfVJ5oSY=;
        b=GlXjz55/TwJaVyT96ZOPh1a1ExXJqpiOL+QdjCwRsGTjvWH5x9B/SRCQXd60Q/m8cG
         U4hofREa8luc2a+Z4AJwcBcUu0IektBA1TtgUMxG2eZ71kQHVZQNpbDyG6xULnlAsUVS
         C1LDmLY6az0efaM1a/WCqmHv+ZxxpmWG1zihyltqIrphum8c9eSGu/aizmBLiUUWrm7/
         FxROPKuePBhYhTvXaFGvC9HgSRE94a5ajjU3Hj1kjDZS4LEONzv5n6xNdBMQpA1tgdHV
         7eLpXFon2YtRTqCbvJU/Jl0vFlcFuNDya8plmoBren58hWOPEnvKc8mhSGjnRKOYfLkv
         xyjg==
X-Gm-Message-State: AA+aEWYXesZMNW61QXzGO6/x2p5YXiSWMLFyaCSrIc1uxgk7KcbSZXd0
        z+9NY9RoC+A/fJM9F0s1zkUht5NM
X-Google-Smtp-Source: AFSGD/V8Jwe0w7gmrnOjkAbMcivFmL+YQnzjYR/UllGCsk+zFduNDkDBcxL559zMvMUmxqr80Mnikg==
X-Received: by 2002:adf:8342:: with SMTP id 60mr14604756wrd.212.1544578828765;
        Tue, 11 Dec 2018 17:40:28 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c12sm12719214wrs.82.2018.12.11.17.40.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:40:27 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V2 02/14] gpio: pca953x: Fix AI overflow on PCAL6524
Date:   Wed, 12 Dec 2018 02:39:50 +0100
Message-Id: <20181212014002.4753-2-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The PCAL_PINCTRL_MASK is too large. The extended register block on
PCAL6524, which is the largest chip with this block, has the block
limited to address range 0x40..0x7f. This is because the bit 7 in
the command register is used for the Address Increment functionality.

Trim the mask to 0x60 to match the datasheet and to prevent accidental
overwrite of the AI bit.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
V2: Add RB from Bart
---
 drivers/gpio/gpio-pca953x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index afe6de4c48c4..ec9fd11cd21c 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -58,7 +58,7 @@
 #define PCA_GPIO_MASK		0x00FF
 
 #define PCAL_GPIO_MASK		0x1f
-#define PCAL_PINCTRL_MASK	0xe0
+#define PCAL_PINCTRL_MASK	0x60
 
 #define PCA_INT			0x0100
 #define PCA_PCAL		0x0200
-- 
2.18.0

