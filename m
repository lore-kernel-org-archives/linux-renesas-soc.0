Return-Path: <SRS0=Rjom=QD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248D3C282CA
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:42:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3EEE20855
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:42:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="DpNPCNWF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfA0RmQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 27 Jan 2019 12:42:16 -0500
Received: from mail-lj1-f176.google.com ([209.85.208.176]:35837 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbfA0RmQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Jan 2019 12:42:16 -0500
Received: by mail-lj1-f176.google.com with SMTP id x85-v6so12278337ljb.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Jan 2019 09:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BYbSDIH705JTQdZk8auJnmv7JIjM4wJP9hknZKvmNxQ=;
        b=DpNPCNWFp91Qx1x5CtrC0h2qKndmZsMEUQvG5dl4cDXSed9vnQLM0IvwiEbmGFbVbc
         NviCv7+uxPiXtZEDx4witWflks6u8vTlw3HAiqLuQ9aI0e66d8L5slwCUzMuEgYjdq2X
         qhbk4k8LX+y18dGJFgz14ROTvfXYdp/LCLQJ0X6CCb07o3lQKSZO8f5PCQvTTihzLnTA
         rwzWXWRYh0EyhMyWWaYfV66i84aNPbIv52YBiSzUa8crTYBGlmARxIiD5nGluRXsBPs0
         VJY5pxpWuUYpVf6FGlFcgyfKZ3Yh+segdyocCZby8QinryvTn59X+P3frBdBg8sU5aG3
         rnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BYbSDIH705JTQdZk8auJnmv7JIjM4wJP9hknZKvmNxQ=;
        b=HnNXgUQjJ/TpdMbuYmPpCiFBYS3BXG0JiXoOTN2l9bK2rQ/2KiHnGek00zi6RaSMkv
         8+Q1XakYkFKOLllIEXOaAifub2P5OOMwlKadKu6xjduEp9Db4vv1m6ZRsJKLdvwqOL+l
         BY7uOGSObjeEE8Fr9otkWNoJmEhvqZrG+PM90lNAm1ut8h3b3T20q+0G26U1Ke7N6nGH
         Xi164+bkQZCwJeFEFKKH4OlGf9XMgj9V+BWLK6kXZD/iFt5sfj+JI4tW7119oneqyoyH
         rVIM8Hese912ZjhwFtequI3i1siW3pl8Wgy+k2VksuUi57d3GZN2CeVUC3MRenE76Y4v
         pW3A==
X-Gm-Message-State: AJcUukdgyclyROG/wNZXdItdVOH0A0lZGmx3bTUsUEq4zxiRF1zetMDu
        iWmtYYtTnwkamfiwnjuMzuHmZQ==
X-Google-Smtp-Source: ALg8bN6elgr9PuZFYkjNP37T8EtrQfeF9EsxjQEpHQYhKClnQV+1SnPLUdWraYIRdgzwwRUUljdItw==
X-Received: by 2002:a2e:20c3:: with SMTP id g64-v6mr15099809lji.101.1548610934326;
        Sun, 27 Jan 2019 09:42:14 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.150])
        by smtp.gmail.com with ESMTPSA id b17sm2523107lfc.21.2019.01.27.09.42.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Jan 2019 09:42:13 -0800 (PST)
Subject: [PATCH 7/7] sh_eth: offload RX checksum on SH7763
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <e8ce7a88-b689-6114-66e4-c45a95087a1f@cogentembedded.com>
Date:   Sun, 27 Jan 2019 20:42:12 +0300
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

The SH7763 SoC manual describes the Ether MAC's RX checksum offload
the same way as it's implemented in the EtherAVB MACs...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    1 +
 1 file changed, 1 insertion(+)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -1092,6 +1092,7 @@ static struct sh_eth_cpu_data sh7763_dat
 	.irq_flags	= IRQF_SHARED,
 	.magic		= 1,
 	.cexcr		= 1,
+	.rx_csum	= 1,
 	.dual_port	= 1,
 };
 
