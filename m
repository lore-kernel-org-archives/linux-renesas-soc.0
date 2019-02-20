Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C3CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:55:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 383B22147C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:55:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRY4v97X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbfBTOzS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 09:55:18 -0500
Received: from mail-pf1-f182.google.com ([209.85.210.182]:38656 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbfBTOzR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 09:55:17 -0500
Received: by mail-pf1-f182.google.com with SMTP id n125so4754123pfn.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Feb 2019 06:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=o7p8tDFc9BRL+SH806IKYh5qM99s4DZc07sIieYCafY=;
        b=jRY4v97XxZuGf1TWgZjdjhrW5jkPgZkO4wzFa/a8Z5fdm+X5I2AVtsz/hFczONAkgh
         +w59XEuryJylMQFcVsoJA/QRrtfpELKMgHLYI745Bzwb0rPlXM4FLMiAE0f3xJQg7HJ6
         D1YBj88igPDUEtpqCt/7e7ksfvZPAijKcPyU6+pusNHeHtR7RNC1UDzRa8aysfZyAPep
         6UYEl2xf3J0UlKcArUnDKkksv/49eIAcLsd84juJCI7SmslaQR5x25Yh3aR6DD9bII6a
         C7XEYjsPHbeJ+t37OMcOE7KFz8Gl/lR9tBrP+wJ2mmnUIbe7YgPkxAQn/656/BQ2Ei3Q
         cN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=o7p8tDFc9BRL+SH806IKYh5qM99s4DZc07sIieYCafY=;
        b=iQXJQflvcdr/l043NktGMkoOPR9/kl83J7vN1ulZaOEc8FlL2xjJrrRSVf+XulR9DC
         QDUFf0X4UatL9+mFNDb0CDbwLjS3FgjRLw5mc+Yl1d12obJE9HKE0Xo/Jbv29qmYEpFO
         6x7ee1y3IxOT13HlgA4FrLZCQ2O6Hb9BTmov4RCkAI1iAiRCoAZpcXJldf63Uqa9v+dz
         WtPzzSNvDhze3wgReLh8meuBGwHQFH63WnpfLXHwOHH/S0sv1S1LS/zAMG4u/drxV2Z0
         mn1jNMF13yYJAzhd1yJcHwQGPEFJypg5oHJInjqTA/Ag7YbmFhbIY/v8I8mpW9Ntm/xm
         FOoQ==
X-Gm-Message-State: AHQUAub6YtzIav1VVNpYk37r2IXOjNi05I87kvrBMcqZ2IbJEowWAkl2
        cF2sDhonlrmfnD+XgJXI5Npmr2WN
X-Google-Smtp-Source: AHgI3IYw6T7yS21Wlk54Ev7nL3aFJHU+IaiBwEAtGd5za6mBzje1Dz3dZGFyFW66bP8H7JUt6N4KBQ==
X-Received: by 2002:a65:520a:: with SMTP id o10mr30281645pgp.276.1550674516768;
        Wed, 20 Feb 2019 06:55:16 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id z12sm20804929pgv.0.2019.02.20.06.55.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Feb 2019 06:55:15 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 20 Feb 2019 23:56:08 +0900
Message-Id: <155067456846.15971.8286792793335627019.sendpatchset@octo>
In-Reply-To: <155067454871.15971.12157033067057246708.sendpatchset@octo>
References: <155067454871.15971.12157033067057246708.sendpatchset@octo>
Subject: [PATCH/RFC 02/09] iommu/ipmmu-vmsa: Display system memory informationn during boot
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Clarify runtime memory bank detection in the IPMMU driver.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |    8 ++++++++
 1 file changed, 8 insertions(+)

--- 0002/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2019-02-20 23:09:46.212274343 +0900
@@ -1095,6 +1095,14 @@ static int ipmmu_probe(struct platform_d
 			dev_info(&pdev->dev, "IPMMU context 0 is reserved\n");
 			set_bit(0, mmu->ctx);
 		}
+
+		if (memblock_end_of_DRAM() <= SZ_4G) {
+			dev_info(&pdev->dev, "All system memory located within 32 bits of physical address space.\n");
+			dev_info(&pdev->dev, "IPMMU address translation not needed.\n");
+		} else {
+			dev_info(&pdev->dev, "System memory detected outside 32 bits of physical address space.\n");
+			dev_info(&pdev->dev, "IPMMU address translation may be required.\n");
+		}		
 	}
 
 	/*
