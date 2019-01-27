Return-Path: <SRS0=Rjom=QD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2ACCC282CA
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 782BF20989
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:39:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="EEH5gCCt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfA0Rj3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 27 Jan 2019 12:39:29 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34595 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbfA0Rj2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Jan 2019 12:39:28 -0500
Received: by mail-lf1-f67.google.com with SMTP id p6so10232392lfc.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Jan 2019 09:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z+qVVsyJBLplm6bGaJBQWS/1LQRYqWLc8ZoZXm/b/XU=;
        b=EEH5gCCt2TcI2CQgEUDUw2ErI3aKFzT9XdfWk5bSCzbVA4oe5H7maEIl2NL+44t2CV
         yRj5pgXEGMPWJP3ciFRSprsNum4QjhpawSoef4rGoWhFsK0WdrcePDzm9DyJJlouB0rG
         UvoOcLmS8oYqlq+ZRvEJIWQdBPx9fJ0hoSTFAoL8CioU2+5Rce0fFrPA+/BvhFt70/qf
         biUBnvrkrZ3Al4g8k0p9rCV0Iby3SdVd3YSl0NgLHHy86dcWb10qsxwIRTOtbTu0/n2w
         Acf0gVgzP6xMPgXoa/k7kKp2YeF4EbeJTwguS2lQRTeuPSdCJjLktpyZ/MkAWGDA0sq2
         SI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Z+qVVsyJBLplm6bGaJBQWS/1LQRYqWLc8ZoZXm/b/XU=;
        b=APztuASqw4E+K4SpZh553l5pTBLuXD4ElRjmFkZnLgIAuBQ4QFkRYFullSEoAee3o2
         xygDyLAuNTDK7dBjsgUBwmLs0O7TafH2BpOLxMpSdUwIeeb4HJ6Ql+dOdmCGL5F0+TGK
         0MyOHyr2ph+9pBV70bZmkH3QYnh10qc6s2NM3wAYXpzD2CFOaiI9Lx5GyCheEFmfQHYM
         P3KR+sixQw7ac4TlmfwoiIdNq9UUXkbnVKO4kFflr0DXtFb2n1Cg+LJhsZfVGHj+9VSO
         ZsDpQO7dDXhJVXVIzu8XA+HxTRqSfpxrio04c3MOs1YToH3zenklPgqj8YyUaPB7ibB4
         xgwQ==
X-Gm-Message-State: AJcUukfDHOOqM638kNNeJ9ju/44rzlVaYG8lvBvhXSnVCQlNKw33j8rw
        hbCdfksKfrkS+EaO7yds9ZcdGQ==
X-Google-Smtp-Source: ALg8bN6IJz/2MCmb/nKHXnOrtHpbukN+QpG5KO0yRRPqIIuXRLlYsrwfShvVBjuUfUS8yxfYa9E2OA==
X-Received: by 2002:a19:a9d2:: with SMTP id s201mr8866754lfe.154.1548610767030;
        Sun, 27 Jan 2019 09:39:27 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.150])
        by smtp.gmail.com with ESMTPSA id z2-v6sm2670667ljk.50.2019.01.27.09.39.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Jan 2019 09:39:26 -0800 (PST)
Subject: [PATCH 4/7] sh_eth: offload RX checksum on R8A7740
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <e43f07fd-1407-a87a-7fe5-67a522da9e19@cogentembedded.com>
Date:   Sun, 27 Jan 2019 20:39:25 +0300
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

The R-Mobile A1 (R8A7740) SoC manual describes the Ether MAC's RX checksum
offload the same way as it's implemented in the EtherAVB MAC...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    1 +
 1 file changed, 1 insertion(+)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -670,6 +670,7 @@ static struct sh_eth_cpu_data r8a7740_da
 	.no_ade		= 1,
 	.xdfar_rw	= 1,
 	.csmr		= 1,
+	.rx_csum	= 1,
 	.tsu		= 1,
 	.select_mii	= 1,
 	.magic		= 1,
