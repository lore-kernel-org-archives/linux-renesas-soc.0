Return-Path: <SRS0=Rjom=QD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3283C282CC
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:41:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A369320989
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:41:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="mmznrsRr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbfA0Rl2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 27 Jan 2019 12:41:28 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39767 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbfA0Rl2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Jan 2019 12:41:28 -0500
Received: by mail-lf1-f68.google.com with SMTP id n18so10190217lfh.6
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Jan 2019 09:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=liwjm9ze8qxoGKXwexudNjirVwtaRClbT1XeBLQwbv8=;
        b=mmznrsRr8CY+RKYrzcfzIlkwsO8c+ADsv0+imGOyrCMQz1/LCiCHQKcopzT8hI9RaD
         Gq1yENHlsg0yE15AX/fOO4c6uQulsJYfciDFSaXw8I5SDJyUjNmPA1F6X8PNW09gJqvH
         4rdlX5SNhceKTb6vryW68LEN9Ryci7wdUbRxqpi0iDlRskd1NWXuPAldutUZhHu2aHv0
         w+pUsXkHN99AcgsnClzGtJbPfCmxQbjXbGEIXmG5UWpyGBcbFEHPX27k7oUC/gU3XzDL
         vOAHml2HDI7XQwNNz6OgGptYOhlx8eGLbT/8B0tD5kqZwPIqwyehKRoQPePbaqBFaeKN
         5luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=liwjm9ze8qxoGKXwexudNjirVwtaRClbT1XeBLQwbv8=;
        b=CwZSdL6aU1bL2EawPARQLKLmIoQ97QJgQG40TJZdm5I8nMFjhMhzpSUXy1c9fnGp9j
         l/+xcObpAyKi2Bvn+9T6h+wvG3hoUsfKWOBrOSnoJ54b+KYOeqp84J0GQsdjyViykzGY
         rPUt2oJXmLd9iRs0NISeQavNtzAWAqboTEzrTYxxCPpjEUx6EYDpM9EnfFyExNBes8gV
         UvqkdQ+GEBBQ4q0FlrD/djZfEc8r8BDmRAiRcKxdGX0uGeT3jt/+dT2+f1/iUcHDr6Ea
         suF/PeQq/h1C2cGQDI5yMCzRLOH9IYSBe5YFkLLJe0oMcTqKkr64GfN02/XzwgofdW53
         rdVg==
X-Gm-Message-State: AJcUukftOEcSnF2g5e/rdKF/9L9jttygTRSq9/Y5P+2ha/S+Auwt2IwH
        lDXM+fb46XWJFORtRWYtAe6Icw==
X-Google-Smtp-Source: ALg8bN6vuKKAzehf73W2AHTxZP850Lrjs6GOw/In9ngClJDX87BoWL7KWCN4phAPe87bfHk95M9tGA==
X-Received: by 2002:a19:750a:: with SMTP id y10mr3771742lfe.43.1548610885827;
        Sun, 27 Jan 2019 09:41:25 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.150])
        by smtp.gmail.com with ESMTPSA id j12-v6sm2619597ljh.66.2019.01.27.09.41.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Jan 2019 09:41:25 -0800 (PST)
Subject: [PATCH 6/7] sh_eth: offload RX checksum on SH7734
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <d69fa679-5ff0-7e1a-1035-be0f0f6a133c@cogentembedded.com>
Date:   Sun, 27 Jan 2019 20:41:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SH7734 SoC manual describes the Ether MAC's RX checksum offload
the same way as it's implemented in the EtherAVB MACs...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    1 +
 1 file changed, 1 insertion(+)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -1049,6 +1049,7 @@ static struct sh_eth_cpu_data sh7734_dat
 	.xdfar_rw	= 1,
 	.tsu		= 1,
 	.csmr		= 1,
+	.rx_csum	= 1,
 	.select_mii	= 1,
 	.magic		= 1,
 	.cexcr		= 1,



