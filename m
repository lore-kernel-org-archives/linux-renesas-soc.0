Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE516C43612
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C9142171F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzoJCW+F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730124AbeLOO0b (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 09:26:31 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39371 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbeLOO0a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 09:26:30 -0500
Received: by mail-wr1-f66.google.com with SMTP id t27so8074056wra.6;
        Sat, 15 Dec 2018 06:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RcnYYgaTXUb+Yx65IZ1kylrIPvlDEkFf8jCg2D/yNWg=;
        b=NzoJCW+F5+H7JcLbJB5ijrhlj5t1JOQSwXq4TPqZgWKfWuPDTf2/8JuxX+SHXnqe20
         QSblCjgymn8dWiSycuYY9WVL8Zd+PRzHeVFXMpyAWqgoNtCSM4SMh4LXAwPj4gKcJiZ8
         V7+6gh4LqmhZ1SWBVx4FHFFwqEDjsaFHIVqYmVP1VfT3/AHOVBSO4qotZaEeD+vbZUkM
         YjZ4A6cDa+Cx7GY6JQ7gEODORJBfucdnJ2UYm7YZ2jK5IO2g4pKzj5AUOg3NzBsxLdo4
         UvU9k+wzmgSwRBUg8Of2gG3Ik82+Y1VobZsroUyyEpECadihHsSb29ReGf9Pa+L2ouYp
         KPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RcnYYgaTXUb+Yx65IZ1kylrIPvlDEkFf8jCg2D/yNWg=;
        b=Pmz0WE/K80RoNfZqcCt9NuzV6dj7lDX+n+GvutOfQqwEjxJ17PKP7DWh4txsvIAU9A
         H8r6cq5rZGU+Jj51ZzYCFqEFz3QrnYaJzOPbPpfamgh/Ke+F9to+39+/C+L4R9tocnUP
         8t8qFpLcWjFIAS/flgPCrz5vSApnW2RX6rLD/oAKyzOD37dAiAogqyGZl5aaknlRk5G1
         h8mbZKd9/zdWeF814DqQR2902w4f2OUJE9L9bLMlK36H2eGtdzMHbUMHYoP7EQjXdnDs
         tSEL/L4GqAneaQFu7K/EWBDHHuwHAQJdn1kkTDjnUN25Akl2KvaBNQB364tFWW92X1ua
         3GrQ==
X-Gm-Message-State: AA+aEWYFcNslciGj8Wirv98Sqg9CVMJ5Z4yHrBEBgNrSVgLnG9eMOMJP
        cgd7oT3sotyF/+mywO96m6ph8v/s
X-Google-Smtp-Source: AFSGD/UyHkpdqVfZLTN7CmA5itY4lPM+Nc9wqCOV1tBIpX6GY3NeESFhmC4X6hovvGUbxI2pNdqXeA==
X-Received: by 2002:adf:f903:: with SMTP id b3mr5932325wrr.82.1544883988456;
        Sat, 15 Dec 2018 06:26:28 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c7sm15401225wre.64.2018.12.15.06.26.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 06:26:27 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V3 02/14] gpio: pca953x: Fix AI overflow on PCAL6524
Date:   Sat, 15 Dec 2018 15:25:53 +0100
Message-Id: <20181215142605.15397-3-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
References: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
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
V3: No change
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

