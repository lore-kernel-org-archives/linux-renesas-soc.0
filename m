Return-Path: <SRS0=Rjom=QD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D4FC282CA
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:40:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9C0B20989
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:40:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="oG+nKj0H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbfA0Rk1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 27 Jan 2019 12:40:27 -0500
Received: from mail-lj1-f173.google.com ([209.85.208.173]:33624 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbfA0Rk1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Jan 2019 12:40:27 -0500
Received: by mail-lj1-f173.google.com with SMTP id v1-v6so12297447ljd.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Jan 2019 09:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ao08bhATJPPJEJ2i7oY65jvyZ15tEsZMfg8UyfvAdIY=;
        b=oG+nKj0HsX0LBaT6NjwIXuTKcRa0lZZiAWsLkezwPdrkh/GhcA1iz/ynLP5jz7n2Kt
         VC/oq0dO76T3V6+zc7U1mibqTfVOX6rA9qsHCPqWkTfCRi4IDX+tg46AfHiftpXUsBHb
         Gce2rcjg4mhHBC0dwHTqy9Kmn4X+p3aQfggsulYfmMIB87FYk3o1CPV3nU5KrFmbO7Vu
         54WcfS25pRqlpCuj2NEARf32xgpHgUkkmVSg5PpLEx71oVRky1B6qaN53SBduPf/zrfu
         AjRNuGdaLHQovqv/1VRV0xDVKJsmlaxpDxI5tBpQI+zsgswiYXVlgJYm9Ua2Xg3oZK27
         kGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Ao08bhATJPPJEJ2i7oY65jvyZ15tEsZMfg8UyfvAdIY=;
        b=I2ZUO8ymGm6KsJ9xZTATgsih+CqY4je1u862350ZNV5Amh8gaREOqKnVgY5EEf3FEy
         ZnGYvaTHMRX0tlpp+cobPfV8XcoHC7uZYq55Y2t6WEU2ut/SnfnRdLLTiuxkVdTY9Oub
         2LaX2o27uNnmfRqzTDB1nbwsfhxrbL1L+NKahjFUYc7gtq+3JHG2ld/bY7FLpybJxTLU
         sKUuI5DlvRzs97k152LL1BedUG2YpRRNDcShEWSobQ2vv5H3CXXIRRkTYZP3uFTD4+om
         b4p5Gu9UcUBqAg4C9C6tLR2Vt3GxpnlesPTg7Rn+pIbPGhk6ZVy1Jc13KiTY7LPpxzhz
         K/8Q==
X-Gm-Message-State: AHQUAuYblhLdwsgBpIj2/4L7iwQDTzDtmUeGHA4xvKF5BAw/rFGhKHR1
        sXKOfdwbq0RfEidcFsVStEyPfg==
X-Google-Smtp-Source: AHgI3IYv0zscDvy1aCFtUh0oUE0KIWMXwWn1lL21OMQLdj+zinbt1Z/wvp31TySswr3UfJV9jGY5Kg==
X-Received: by 2002:a2e:7c13:: with SMTP id x19-v6mr5162800ljc.83.1548610824968;
        Sun, 27 Jan 2019 09:40:24 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.150])
        by smtp.gmail.com with ESMTPSA id s127sm2602874lfe.8.2019.01.27.09.40.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Jan 2019 09:40:24 -0800 (PST)
Subject: [PATCH 5/7] sh_eth: offload RX checksum on R8A77980
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <32f4bec9-35e6-6bbe-f9b6-a8996fc0793d@cogentembedded.com>
Date:   Sun, 27 Jan 2019 20:40:23 +0300
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

The R-Car V3H (R8A77980) SoC manual describes the Ether MAC's RX checksum
offload the same way as it's implemented in the EtherAVB MAC...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    1 +
 1 file changed, 1 insertion(+)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -796,6 +796,7 @@ static struct sh_eth_cpu_data r8a77980_d
 	.no_ade		= 1,
 	.xdfar_rw	= 1,
 	.csmr		= 1,
+	.rx_csum	= 1,
 	.select_mii	= 1,
 	.magic		= 1,
 	.cexcr		= 1,

