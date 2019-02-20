Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD6FC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:56:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8617F2147C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:56:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KH4XJF9M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfBTO4V (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 09:56:21 -0500
Received: from mail-pl1-f171.google.com ([209.85.214.171]:35839 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbfBTO4V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 09:56:21 -0500
Received: by mail-pl1-f171.google.com with SMTP id p19so1125861plo.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Feb 2019 06:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=XI6pmkU6wmqNmluf2xV7mfkKSbtSaPLtG1BopRfRA7Q=;
        b=KH4XJF9MCSse9ncKjeJx8zOQKvnahV4jWmpUdPcNn3y95BpjmDwaejgHQsdXoClqtx
         1h37xuZrVulqnKops13mSOHcv1J3RkTFW+fak8ZjY0C+3EMwCHuzbRoreJ3OIy4LlMiC
         IA4IwYPE7VE4GvHR2f2JzZ1M8WypfYBvTKDBfBlRf3JcwnVvl4syU8AmEKr3Yn4rVFgj
         oFlFKRw8sfFF2xaUBqhHAoO5PMnz2f2wo/ndDYZQexa2aQx0KUvX/3NBGHu3mwELMo4O
         NQ6NE7sK4QvYQ9nuzo/oZPrwGQ7/r2TmaAr4sLyVO9CicPEEhhyTuFSakx35VCeJLtGs
         RSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=XI6pmkU6wmqNmluf2xV7mfkKSbtSaPLtG1BopRfRA7Q=;
        b=D48KoAjRVqY+EBeUHSw/a08LDQkaLCHX9XYQiGs1h4014Hj9ZoevGjX0cYWgiZ5Nsg
         4sjDAgWHX/cK3+WD+lO9eTrzHf+ITZQaE3cEbmo2l1jg9A6ZX1pc6N4dGuPjvevfVxy8
         8uW5LWnKPwLkEmquq5jTlCMUPoydWz8ZdcgsbedOpmra+WvBUuMpAryPGVDG+mHTZDyr
         E1+xiCB2BJW2gbdOvotWjOQtTM5UjgTV8eDwbZhhSN7VGzEz7WSzJHWFA6twpIsYMazR
         A3yDzxsULPK++tu1ZN8y9Gfr6fKPFciBC11YRxJRj50k3F1jBl7+RkAxwtE+kmWwb1jf
         kcLw==
X-Gm-Message-State: AHQUAuZv3MDg2yBug9YvbKfi9RNRUKgMrLfHYqw5KQ493yCqnQRSJ8UJ
        kZQBl60Q3+DCcsuEFYBDtdZojoME
X-Google-Smtp-Source: AHgI3Ibqm1IuPyX6aIkCedt6qmtI1J85mGv9GWCx2bvwa0+TGFFJOeUEaOCVSczkmTm5c6uw0lzyFQ==
X-Received: by 2002:a17:902:b7c7:: with SMTP id v7mr26188352plz.148.1550674580318;
        Wed, 20 Feb 2019 06:56:20 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id e2sm31589459pga.92.2019.02.20.06.56.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Feb 2019 06:56:19 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 20 Feb 2019 23:57:11 +0900
Message-Id: <155067463133.15971.3265174926450089778.sendpatchset@octo>
In-Reply-To: <155067454871.15971.12157033067057246708.sendpatchset@octo>
References: <155067454871.15971.12157033067057246708.sendpatchset@octo>
Subject: [PATCH/RFC 09/09] arm64: dts: renesas: cat874: Introduce keepipmmu boot parameter
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Introduce a keepipmmu boot paramenter to let the user override.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ work/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts	2019-02-20 23:30:12.806582698 +0900
@@ -18,7 +18,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "keepipmmu ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial0:115200n8";
 	};
 
