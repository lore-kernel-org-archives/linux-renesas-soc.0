Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AEFC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 17:39:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C55E52082F
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 17:39:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rni6YmD6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730496AbeLPRjE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 12:39:04 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:32845 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730449AbeLPRjD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 12:39:03 -0500
Received: by mail-wm1-f68.google.com with SMTP id r24so3005667wmh.0;
        Sun, 16 Dec 2018 09:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=H+4nJGjoZaTBxwZXOXQ8EjAMM9p8SWWUPyI7yq6AWRQ=;
        b=Rni6YmD6jwaZpRH9dLO9iJ4pel6dJGmjPDW8fo8576ir8eE4tkKCP+VNsCm+Cmeu02
         Y1GmUJ0VGkL3hPbfS3EqhtNWl7+xP6QcIDWSKR33ciTByk9DZ9QK/lBv6ozkCtYZZ1Z+
         KoAbIciB6CjpjvTUH1xGtvmKmB9EvrEMfk/jqsT2kv0dXsx+VcSrmdvTggCm0WwV3GGz
         79qrKpEXQDBAsdBp6bs8bT1U2MA1AmBmMK8bbQIcFT5J8Mmd1IlYUPnSi+jAyyXxuOLh
         F82T4GL12PV4BoNv94Up9mrPviWiCfSOMUpeTaa1OrTU1sGEiXoBR3z93stJpXG9s/cK
         QbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=H+4nJGjoZaTBxwZXOXQ8EjAMM9p8SWWUPyI7yq6AWRQ=;
        b=bhtqBjfo2Q/02oWYgG/ro34zPmah/5PXpZDhNNngFiqk0k1r6tifli43MuX3h61WKL
         Rr49OvJ/cI7K/9fzjA0YrAqxsPsNkeY5t/99SPdzXxhqqydu6KDvBfrHP4Tytt0aSV9k
         ZOJprBemQZtVjOANUm8tIY2i83UhDhcWWKDZ3vNfVSe2d5XyPzmGwid9la939D1HXZUv
         fqCMVGCHmaIvH9Wwr5mqcKGvWUo0UmoolvoZfxJJ7AaDXY4Ut84wrmo8P9jSh017061U
         yr6GO4um1FtNeORw2epBWF+YzqXlEF8KxQx5P3ymKo0ZdT779ndrCiGnl1XHa/HiPSwD
         mxvQ==
X-Gm-Message-State: AA+aEWZg+EWgyg3FFjMrPr2s36/qhUd6sq8bz/LzOwZt9xSkUNoPy84F
        DDSx5vgnmfWLxBT5V0323JcsO4nO
X-Google-Smtp-Source: AFSGD/XUmsFoMb8uHDFjNl7kDoqAv4F7ewNF6Rn+w2WIgqL4FW46phU5RzNyxCLpIDZvw5YWMHDJ+w==
X-Received: by 2002:a1c:ef11:: with SMTP id n17mr8912051wmh.112.1544981940507;
        Sun, 16 Dec 2018 09:39:00 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id s1sm18553363wro.9.2018.12.16.09.38.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Dec 2018 09:38:59 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpio: pca953x: Add regmap dependency for PCA953x driver
Date:   Sun, 16 Dec 2018 18:38:58 +0100
Message-Id: <20181216173858.4125-1-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Select REGMAP_I2C in Kconfig, since the driver now depends on regmap
and this was missing, thus breaking build on various systems.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 833a1b51c948..be637d77c7f8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -849,6 +849,7 @@ config GPIO_MC9S08DZ60
 
 config GPIO_PCA953X
 	tristate "PCA95[357]x, PCA9698, TCA64xx, and MAX7310 I/O ports"
+	select REGMAP_I2C
 	help
 	  Say yes here to provide access to several register-oriented
 	  SMBus I/O expanders, made mostly by NXP or TI.  Compatible
-- 
2.18.0

