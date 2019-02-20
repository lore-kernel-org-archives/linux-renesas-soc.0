Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D487C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:55:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12CC42147C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:55:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9u1TYH5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfBTOzx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 09:55:53 -0500
Received: from mail-pf1-f182.google.com ([209.85.210.182]:39221 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbfBTOzx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 09:55:53 -0500
Received: by mail-pf1-f182.google.com with SMTP id i20so1608318pfo.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Feb 2019 06:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=4uohOXhH1CtEXIXCP88vnN5fwCgT5X1MQCpkryukF6g=;
        b=c9u1TYH5L0KHA4vQn0X5TIjsvU3vJZNzkTzD1TTs7fcWmK/jY+JhVBum6IZQxjc0xr
         FfZEi74L4bthnBj1wZN+AeM489kHAura3U1bOEsdSVDJzVW/FmlTJIfTm+r+SB133r7U
         mxF/esfaVW9N2tdb3QgMlZI74A0ZOxp+a4HcQNYIkMTn7VCclfvFJKUE9Ro6QNMIXUhV
         rHJ/IJZM7oafZ2Ym6uErbm16oSVbUCsFChV62eXrCnbacb+CKRBArxb20XtgPdMWNofI
         ckoAh1yHkqO5eHMFuMqvf/1DpQJVWvM0mQ24nN38PrG6+Evdu+qXNdkYkIL7qvxAkZ5G
         ePAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=4uohOXhH1CtEXIXCP88vnN5fwCgT5X1MQCpkryukF6g=;
        b=CGqRpFI451mbtv+D0tSNGmsombZJ3kew+fnq74OQKlVDnHHP/dt9LoUgfMI6Pc2D0G
         W6rByRDISKH5gA4iA4iPg8BE+HW4rwySnPOdBeVBbZWwwRF4IYqisRqGp1hgCA86sESc
         2NuJ43LQqrSyLp65GRbu6mBxwjYa+p1jgfa9qwV3DxBSZh611sKBd2BoPqSuQOkH1g+6
         H9CMJg83oYHToLawduhqtJEe8AQK+uoJD9kczkD8yfkHr0mPUvvQGWX9G6EEYU0N0jW/
         ZOFqs3aOq8kutOLL5ZGwOFPUAvCwW5Tn4LgnvfBULWfW1PXV7SSnyqOLtsxkKU3Xswim
         uCeA==
X-Gm-Message-State: AHQUAuYU1FVva7JJZJyBoz5l4JGGGHpXRRra4o8JGxBxDBpZLnnlYApc
        6BUgRrDNPIvMrsnNV+d82tLSZxum
X-Google-Smtp-Source: AHgI3IaDk2JAHEZPLHV1RCwiggXvX0XFlTIfm5QWPpwijsC/znyXNzn8cDCkJxlZCaY2TzkfKFm+UQ==
X-Received: by 2002:a62:221a:: with SMTP id i26mr34768385pfi.174.1550674552756;
        Wed, 20 Feb 2019 06:55:52 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id s73sm58213754pfi.124.2019.02.20.06.55.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Feb 2019 06:55:51 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 20 Feb 2019 23:56:44 +0900
Message-Id: <155067460432.15971.7291753262072375505.sendpatchset@octo>
In-Reply-To: <155067454871.15971.12157033067057246708.sendpatchset@octo>
References: <155067454871.15971.12157033067057246708.sendpatchset@octo>
Subject: [PATCH/RFC 06/09] arm64: dts: renesas: draak: Introduce keepipmmu boot parameter
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Introduce a keepipmmu boot paramenter to let the user override.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77995-draak.dts	2019-02-20 23:26:18.708309313 +0900
@@ -20,7 +20,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel";
+		bootargs = "keepipmmu ignore_loglevel";
 		stdout-path = "serial0:115200n8";
 	};
 
