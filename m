Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830F4C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:55:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5277D2147C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:55:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdcg8ZGg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfBTOzJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 09:55:09 -0500
Received: from mail-pl1-f170.google.com ([209.85.214.170]:37258 "EHLO
        mail-pl1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfBTOzI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 09:55:08 -0500
Received: by mail-pl1-f170.google.com with SMTP id q3so4967096pll.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Feb 2019 06:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=bDz00A4kqnwJ1sLst2nXQeQ9xSoLpKNRpO8ojzjRFtk=;
        b=sdcg8ZGgcQWNHjxiA1acch2sQTuC8Rzzu3A/nZ5qK3Hxj6UxcooGEuHCvWTr3Xl/i/
         0+6ZfQ/u7cSyX8Hjtpw9sBc8IDSmQpiEr21Evuv/YKg6fk+eygcciuUXZwSM1O1n+7pd
         VJ8F49FEHOK4yyWPfeE4Fv/wpeUVFWsdlx/cL9JwdH6oA4yxJ5aDdbLDRVNFPmMB5Off
         q5sxmg2KF1S7CzJ0haZdCjEa6AlaR1F86V0IMLmvLMQ2sS5U+ff3cHlNMv1kkJ069nez
         tyaObRNi0YhOJOF4glByxqtnk35NDaDPhuTt7hXzpzvrCjv+cGDXARswH3QX9uSIxlql
         q2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=bDz00A4kqnwJ1sLst2nXQeQ9xSoLpKNRpO8ojzjRFtk=;
        b=WJ7+a2jfaSONF8AZ1Ql634FGB3fkNTiLAS9quyU3kkCsGmghFO2Ckrf22uSs8USYCS
         tyy17mXQELaGEq+MJjjqSRUxuWVz49NpSjcqMeT2D+DK2igqefGJoZ90xMp1YAKXK67f
         kBcyCS6PgwwtP5F523Vs54SW4j80yHCMBwJpghlwe2U2lLdxF6HRPD6zE70IfFnaSUGx
         qUP14Ipd9mRghN/60YNaYnHfBVFcaWPprMZwBY6LDaCJ3E1CL7fRXlvHD0Vp7JVsh5hh
         bLWs+RniYSrva2yA43MOJE2JpBFMwdh4kik5g6OQkvKHSQc8SxpgnMuDKdDc0rAiK6t5
         nLKw==
X-Gm-Message-State: AHQUAuZoStMw0pRPjl+TLtR69XLxqU3h1c3pPGPLLk5mDOoU/68Xi9pd
        iEomooOVXTFiWc9N2Gfyn0iUj749
X-Google-Smtp-Source: AHgI3IYcpR3PlrerHgadF4eK4FXHIY/JLVNriFja/kC/Ps7iw3AycGw9mTafPbE6LNW1x+GBYDplJw==
X-Received: by 2002:a17:902:b598:: with SMTP id a24mr19884442pls.27.1550674507970;
        Wed, 20 Feb 2019 06:55:07 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id d85sm3999126pfe.159.2019.02.20.06.55.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Feb 2019 06:55:06 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 20 Feb 2019 23:55:58 +0900
Message-Id: <155067455863.15971.400236990712480655.sendpatchset@octo>
In-Reply-To: <155067454871.15971.12157033067057246708.sendpatchset@octo>
References: <155067454871.15971.12157033067057246708.sendpatchset@octo>
Subject: [PATCH/RFC 01/09] iommu/ipmmu-vmsa: Disable IPMMU when address expansion is not needed
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add a memory bank location check to the whitelist handling.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |    7 +++++++
 1 file changed, 7 insertions(+)

--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2019-02-20 22:59:28.589893396 +0900
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/io-pgtable.h>
 #include <linux/iommu.h>
+#include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_iommu.h>
@@ -797,6 +798,12 @@ static bool ipmmu_slave_whitelist(struct
 	if (!soc_device_match(soc_rcar_gen3_whitelist))
 		return false;
 
+	/* In case all system memory fits within 32 bits of physical space
+	 * then assume the IPMMU will not be needed for address expansion.
+	 */
+	if (memblock_end_of_DRAM() <= SZ_4G)
+		return false;
+	
 	/* Check whether this slave device can work with the IPMMU */
 	for (i = 0; i < ARRAY_SIZE(rcar_gen3_slave_whitelist); i++) {
 		if (!strcmp(dev_name(dev), rcar_gen3_slave_whitelist[i]))
