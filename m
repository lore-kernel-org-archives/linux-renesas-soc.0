Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CAAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:55:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CEA1E2147C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:55:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sl+Ako0z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfBTOz0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 09:55:26 -0500
Received: from mail-pg1-f180.google.com ([209.85.215.180]:41144 "EHLO
        mail-pg1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbfBTOz0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 09:55:26 -0500
Received: by mail-pg1-f180.google.com with SMTP id m1so11975670pgq.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Feb 2019 06:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=71CbCkjnn64ElPdk5SEvwBY/3SSL7BTD9zmSLlhmP1M=;
        b=Sl+Ako0zNx7JEnPWpeBoIyye3gO7tDUjuF8kvpVcDu34KGFQwGzwh0/ewbZOAVmQoT
         XRzRuIUafcxXfnOArAcE/8VPnrF3RiZ5ahsrcEbX5tn+JZmDwEXK0JKRv6rUhg4pEZDM
         6FN09nT4PQFoI8HVCUC6yBoh/SQgrbRtRujUIlb+rYF1UVhMQk7k7+oOnFYxi7fRZokk
         izL3At7pozoAuAbdOJvIfwLTy8Gbk0Q6/MKrjzZOHRleuLmGCu0J0zlqC/k8/X9ZLAEX
         9d/6TEeiRKjudHA9MzHWombjonNHjMEfkUR/Qy7bwCKAfT5fTqgQaBwFRHfrHyHe/esx
         pQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=71CbCkjnn64ElPdk5SEvwBY/3SSL7BTD9zmSLlhmP1M=;
        b=EkAvjaA0AeYrDShuuZoPfIXtWt6vge9yHTjKRYzQiQAQd3N/LoRxzocGVHP/tNLv0v
         mlUM+41KdjJCcBs3PZnroECP2JMV5AMsH1tdDnxkVeSlgd7JfKgbXaOpXJH+lgFYrMMG
         rryiiYcQNxVqvasuq8Sg8wrDo0r0YoSlaycrXhsrdvd+hGJo+w/9Os/lUOhGD7e9tOXm
         8KdarkFwqTMcSa4EDrdZ8JeWsBg9dd0oL+vXLcWAqwCEnO09ogHmV01FpsH7PSb732or
         9Ffl2xVLoXQNxNuiDLeJsSUYlByT0wwlaHGSriR8rzcvAdocQWzQ+I1INF/i5DP5I2TE
         KXBg==
X-Gm-Message-State: AHQUAuYSTyEG9NdzzzKSgwmYDFYC9xJJwSc4fOhJHD1sEdAdHjY1TjC8
        JvJ/AEJxU6MpbGHk+zVcq2fZ4vyq
X-Google-Smtp-Source: AHgI3IZDrbSGg6117SqBYr9r+jpPjz+AgSCnq/CZxetTbVE12mtdDdgftxiw9igidwTBKGajRk7MYQ==
X-Received: by 2002:a65:5003:: with SMTP id f3mr29783442pgo.39.1550674525331;
        Wed, 20 Feb 2019 06:55:25 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id i74sm42849526pfi.33.2019.02.20.06.55.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Feb 2019 06:55:24 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 20 Feb 2019 23:56:17 +0900
Message-Id: <155067457726.15971.1787990365004385103.sendpatchset@octo>
In-Reply-To: <155067454871.15971.12157033067057246708.sendpatchset@octo>
References: <155067454871.15971.12157033067057246708.sendpatchset@octo>
Subject: [PATCH/RFC 03/09] iommu/ipmmu-vmsa: Introduce keepipmmu boot parameter
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Introduce a keepipmmu boot paramenter to let the user override.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |   14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

--- 0004/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2019-02-20 23:17:54.038850305 +0900
@@ -759,6 +759,17 @@ static int ipmmu_init_platform_device(st
 	return 0;
 }
 
+
+static int keep_ipmmu;
+
+static int __init keepipmmu_setup(char *__unused)
+{
+	keep_ipmmu = 1;
+	return 1;
+}
+
+__setup("keepipmmu", keepipmmu_setup);
+
 static const struct soc_device_attribute soc_rcar_gen3[] = {
 	{ .soc_id = "r8a774a1", },
 	{ .soc_id = "r8a774c0", },
@@ -802,7 +813,8 @@ static bool ipmmu_slave_whitelist(struct
 	 * then assume the IPMMU will not be needed for address expansion.
 	 */
 	if (memblock_end_of_DRAM() <= SZ_4G)
-		return false;
+		if (!keep_ipmmu)
+			return false;
 	
 	/* Check whether this slave device can work with the IPMMU */
 	for (i = 0; i < ARRAY_SIZE(rcar_gen3_slave_whitelist); i++) {
