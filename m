Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D9CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:50:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 524D6206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:50:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBMA5phg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733194AbeLQOux (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:50:53 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38046 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733001AbeLQOuw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:50:52 -0500
Received: by mail-pl1-f195.google.com with SMTP id e5so6254582plb.5;
        Mon, 17 Dec 2018 06:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VDpm9XAXf6PrjUNDyRnZQ552e2GsFAQOEWJeKcN8wPw=;
        b=nBMA5phgavUe1Z/pS3KPGg6312d0ptrxWA/NoxoXKILNcWmq9J1bwN0gqVIUzrEU6K
         7cWq6NmSYDB7ydlBRKfR9s8ovTpOSokZZhPp5kNzsBBSj6NJB85p4gotluxtwJ/JvbAS
         1LC62EFzfII6Q/4AdyvXnqab7wHDCNm1ANdeW1iRKzI32NnF7r+QhyhJM+UZaq+M9tG8
         xVEkBriUTGZRHr3NkclN0/MjhnsLxBgiLzXHIIH2Dz0SlFWdcjRqNJBjo+LEGekw4gwT
         KEJDSZ4B1SJ4vviruACM4upaP73DvJzB0hsD5KQ7tEIjkxvFZM9xfD/amRK4rssANMqA
         hk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VDpm9XAXf6PrjUNDyRnZQ552e2GsFAQOEWJeKcN8wPw=;
        b=pJJ99mrxQ/4rJlU0xdlVlbxP3f4NF0hvDaD54uxr2lpPFwO/ZUr4MofGc6mNzk0wZS
         SLLaC1W6tC4Q4j4+Hh/xzEA0xcVokgsT9Rm29L3s5f0kaCpjw82G6uBYh8yDctTa+m9B
         xsW+Yl8Y/bPWzNj8xxzcUjTkFH24ND2ng9qn0CKajfZ6HPuwV3A9HBhjqG4yHFjdSGxB
         908ORod59DvbThP5qc4A7ZGMbxZ7NmezxK8TTBFyZ4UkrAH6Sp8NyazYrk1O6J5QK8NK
         VQTDXNt5Ao/82mRSWylR5fxbqmfomjfL1xkrzoUM1vGuPsCVkRKWu60WHokeh0XTZ+EP
         pAqA==
X-Gm-Message-State: AA+aEWZSmQSCZnF6WE+22U41xgkT5jqGzCqxIKHKoNkWscfy2qZ2HFVk
        DMQt9d1ZLiXF4mhhi7Y51Te+v7gb
X-Google-Smtp-Source: AFSGD/UYUEtwlMqnw75dEqVgommBxqpFFTv4Nk9eWK51fI4PM739JD2xJsQ7qVXH207RM5+oPHgw1g==
X-Received: by 2002:a17:902:8d8e:: with SMTP id v14mr12857424plo.133.1545058252143;
        Mon, 17 Dec 2018 06:50:52 -0800 (PST)
Received: from macc.flets-east.jp (p7732116-ipngn36501marunouchi.tokyo.ocn.ne.jp. [114.158.79.116])
        by smtp.gmail.com with ESMTPSA id v191sm33312081pgb.77.2018.12.17.06.50.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 06:50:51 -0800 (PST)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFT v2 2/2] thermal: rcar_thermal: add R8A77990 support
Date:   Mon, 17 Dec 2018 23:50:21 +0900
Message-Id: <1545058221-22529-3-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1545058221-22529-1-git-send-email-ykaneko0929@gmail.com>
References: <1545058221-22529-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for R-Car E3 (R8A77990) thermal support.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/thermal/rcar_thermal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
index 8014a20..30a12b8 100644
--- a/drivers/thermal/rcar_thermal.c
+++ b/drivers/thermal/rcar_thermal.c
@@ -117,6 +117,10 @@ struct rcar_thermal_priv {
 		.data = &rcar_gen3_thermal,
 	},
 	{
+		.compatible = "renesas,thermal-r8a77990",
+		.data = &rcar_gen3_thermal,
+	},
+	{
 		.compatible = "renesas,thermal-r8a77995",
 		.data = &rcar_gen3_thermal,
 	},
-- 
1.9.1

