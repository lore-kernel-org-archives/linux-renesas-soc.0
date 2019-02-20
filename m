Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5F3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 11:24:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CEC42147C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 11:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpKnpqFU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfBTLYi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 06:24:38 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43703 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbfBTLYi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 06:24:38 -0500
Received: by mail-wr1-f66.google.com with SMTP id d17so11103099wre.10;
        Wed, 20 Feb 2019 03:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ojh0DhHIs4r7RkG51c8RPhYzg0OjId0rDJCH3KNtLEQ=;
        b=jpKnpqFUEvNSHNID2nYzFhoa0EBctsVwfou1BvcW7+IcHXvLZSyfake8/yHaJFNOL4
         FL26qMejLpjoqTy50dVPOnUjgSlkSeiA8nqFZ6GXUoag4KJtx1jhk9i5XkpYhdWL63bS
         0mIi5vOjElBn5DxrJGoNQUHQf5FNnSvJz8d4Xh0IgCetnmLO1XiMAQRs9NBlBGp34NKS
         +hEZlDLOB6Dmy4+PyEAcVTK3WngI3CUozC26bgL+SUYwMacZxiMS38hxyy7XP3F7tE+s
         n2Bc63xxXoTfR99ifAsITdeZGWt2kVLEkl7jXJnS2nisd2D6q7XZEd/1Z799nHXUrE91
         NNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ojh0DhHIs4r7RkG51c8RPhYzg0OjId0rDJCH3KNtLEQ=;
        b=NYEwGNfnPsH2OCIapv7YqiNEE6H1YRvVOtRdw9tRwWAyy7m/nBLirncsYtaCb9bPq0
         senC04f4d0K9Ide87jnRcZ4VBHoSJ14K6Jyk3yjnYj2nPjJsNvJxVydq+gBvd+Q9cOsF
         Zg/umzU9MG6cqev3W/CZRxktvNNddEQZytdl/azF4N6B6Sc660URONRAhNUhaR566kmV
         7hiVuKVEWOiK8Zi4aict773IPH+YpRIkllLDVKXwrz1kRlFAgkAUTO4QTQg6W+tZcVYN
         5/2hctjbDcgLbfwWLgdbEdxJfPspcDDJsyfVtlEzDhvixEUTopxzWRZKzXaISFLOw5HS
         NyVg==
X-Gm-Message-State: AHQUAuY3fh+2NU6MqHteYdw7VWP4Yl2U4pQcQO356QTuMQeq9p6NE1yr
        w1/8Q2ZhbGSRD7WRpk/mtQ+bVZhr
X-Google-Smtp-Source: AHgI3IYwhr9h+W10gAGNcRlcla7U6Jx1J9XxgWFaPffJNNKsnnpJuu9Uko4M6p8O92kquBLLddidCg==
X-Received: by 2002:adf:ec8f:: with SMTP id z15mr23586942wrn.290.1550661876465;
        Wed, 20 Feb 2019 03:24:36 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id t63sm4903775wmt.8.2019.02.20.03.24.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Feb 2019 03:24:35 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] gpio: of: Handle both enable-gpio{,s}
Date:   Wed, 20 Feb 2019 12:24:30 +0100
Message-Id: <20190220112430.13550-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

Handle both enable-gpio and enable-gpios properties of the GPIO
regulator in the quirk. The later is the preferred modern name
of the property.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jan Kotas <jank@cadence.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-gpio@vger.kernel.org
---
 drivers/gpio/gpiolib-of.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index bddfc6102a50..8b9c3ab70f6e 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -87,7 +87,8 @@ static void of_gpio_flags_quirks(struct device_node *np,
 	    (of_device_is_compatible(np, "regulator-fixed") ||
 	     of_device_is_compatible(np, "reg-fixed-voltage") ||
 	     (of_device_is_compatible(np, "regulator-gpio") &&
-	      strcmp(propname, "enable-gpio") == 0))) {
+	      !(strcmp(propname, "enable-gpio") &&
+	        strcmp(propname, "enable-gpios"))))) {
 		/*
 		 * The regulator GPIO handles are specified such that the
 		 * presence or absence of "enable-active-high" solely controls
-- 
2.19.2

