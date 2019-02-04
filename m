Return-Path: <SRS0=XP2S=QL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33C5C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:13:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7B632082E
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:13:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="YJr2Th3K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728408AbfBDSM7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Feb 2019 13:12:59 -0500
Received: from mail-lj1-f182.google.com ([209.85.208.182]:41120 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728356AbfBDSM6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Feb 2019 13:12:58 -0500
Received: by mail-lj1-f182.google.com with SMTP id k15-v6so669763ljc.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Feb 2019 10:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iQ0EU+A67yBKqvtr/KKNnjcfu3fMAHJQV/90tv/pTqo=;
        b=YJr2Th3KYA2xyayTUzysDu12AB1EC/S4TOsyt6bjfzOHdDD8VgbdA0yPCYkALVhnx2
         sNnjPtM8vOwwpYtGXc1EGq5zxxJNJXWji57IQWclrNEvfYaG8mJkl9uiV+kh0rRSaT1k
         OV4P3qnVUDWIMur1T8prkngIQcmWabJqFuvGvpUIIdrojC9DPLM+FvZqcPsv9MO/CTV7
         AjZxGHdyFV8TBxmYOr/OodVqKlQbsjwEevdPoj5V9pKreAlwaJANMjSm79NvTBkmJ+IU
         2K30WaDVr3uNCJMHeUvIgm7nMwRUI5iKDmW5pAr3U1nSIFhixQ3eg61MLx+laCIzoQkG
         218w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=iQ0EU+A67yBKqvtr/KKNnjcfu3fMAHJQV/90tv/pTqo=;
        b=mbrPKCUxAedgcqb3uGZ+Oq6YLQZCr/cODMqW0XWJzZ+yexW+dVr03JiwqGBXUytZc4
         xO6NmmusvsPx7gsq7Dx2pMpk1gZS9KkfzeuI0MVIS5wEnh4312IM4R2HqW9aSJ4jjkYH
         Jc9l21eZHEEG09uLPTqVf3dapseNLcb/rOuR2WL4Vy6GLs/87jQYP11WPh2fuRv6N8lF
         xWDYqGfvgC0huR/jWNwr5W3QCdLfH3qFpm/sSrg2aUGWCEviptq0IUsh6SgTyVnh5cD/
         Fy0EHXMcoJ+os7j2usBEB9hoy7bzH61thUukk+ekRkkrffpeUofsFPqU0gBpNXmmQr1Z
         gAAA==
X-Gm-Message-State: AHQUAubdVAv6Ta48/lH/722N1MEpqDTu8pUYJN0Xhy78W/yzoFQf52+O
        d15I2g3440R5PN1BlhU0PU7FQw==
X-Google-Smtp-Source: AHgI3IaiPYcrqlc+FB4Gh7UOl+mwJfcpTUteIrZn2oZjIvsWp/GZLuDLJx4BJt33Ig4t5QkWMc/TvA==
X-Received: by 2002:a2e:4a19:: with SMTP id x25-v6mr352737lja.19.1549303976422;
        Mon, 04 Feb 2019 10:12:56 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.140])
        by smtp.gmail.com with ESMTPSA id z9sm3195545lfj.79.2019.02.04.10.12.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Feb 2019 10:12:46 -0800 (PST)
Subject: [PATCH v2 7/7] sh_eth: offload RX checksum on SH7763
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <a21deed1-35dc-f1be-6c7e-7061ebe4b56c@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <2d6569b3-b83a-b815-30b1-56fde1a7a0e6@cogentembedded.com>
Date:   Mon, 4 Feb 2019 21:12:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a21deed1-35dc-f1be-6c7e-7061ebe4b56c@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SH7763 SoC manual describes the Ether MAC's RX checksum offload
the same way as it's implemented in the EtherAVB MACs...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    1 +
 1 file changed, 1 insertion(+)

Index: renesas/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- renesas.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ renesas/drivers/net/ethernet/renesas/sh_eth.c
@@ -1092,6 +1092,7 @@ static struct sh_eth_cpu_data sh7763_dat
 	.irq_flags	= IRQF_SHARED,
 	.magic		= 1,
 	.cexcr		= 1,
+	.rx_csum	= 1,
 	.dual_port	= 1,
 };
 
