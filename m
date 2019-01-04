Return-Path: <SRS0=AhbF=PM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435E4C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 13:01:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 113972070C
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 13:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="RzEvm/uN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbfADNBv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Jan 2019 08:01:51 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33341 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfADNBv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jan 2019 08:01:51 -0500
Received: by mail-lj1-f193.google.com with SMTP id v1-v6so32424734ljd.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jan 2019 05:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wlRib9UcS4i/1SPxcScvruzoEQbpILrU1bnIkhDuoZc=;
        b=RzEvm/uNIc/tVZOwHmnKh2qcVh+Xo1gKu9akrrucNdjxj7DgJMEgNbmdTO3p55wwUg
         wAF1ZEU3iq7NScnktKoJFqkXVbxz51o6q4C3JqoKapWHKDV/C4WUsUs4oLpT+Gekzs5Q
         OsMNRlN8VwbB+7AC6HayVkj50bRXg81GBt699wIrWMEbP03v3B5vf7yL3CyKBHmEO0Kf
         9Y+QsP/X4LMl97zSb/ajmCwJXDK0pq9Mp2ZfG1SegVj1TibT8qQOOHMl5F799Bkpjydk
         IO6OY7SOvoyl4fjF7qfhSMz/o1A7ycX4PcRkm3D3rFgLfTrARy3Jv0XptpJEnEmqWI15
         Ef0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wlRib9UcS4i/1SPxcScvruzoEQbpILrU1bnIkhDuoZc=;
        b=j0Sm/VWpCB+jZ4StkDRtCmanY06mobXmH2beAMDgT5wcbcuAc688FsjJ7qh0v+NYTy
         /tYLp6ecooKxExnlM1anvXF35GEfwo4F6Aj1Eottp+Q/HbaMpCXwYo/S6PqHj3BoQ3Xz
         8F3pOJmXPar5IwNXbZcODTF43550wrl2BYQ4WUO/y/pFG5J8uLZNNyUpjKacXFsgdZ7Q
         nKJ/lO4AwqaNCM4nC+y2ruKsK6BNKD39oiB5W/1KS+wwaZUIAB0HGipEtrB15UHsuyAs
         OFPeNQGAvyLFxCveaV1xEQBmM4IiW+EfkX371AgsmI3iumDPD/R8Trob6W1INxJJDznc
         88qg==
X-Gm-Message-State: AJcUukcpZLQccY76OoaubLNfDMvuIouPpcyeNfOh3NhyPS2wjxq3/YMB
        ZASDB5eWKj3dlgi3NgqK47y4jSAYza0=
X-Google-Smtp-Source: ALg8bN7otszZPR5dRhna0/1uMxE0FM+tDLZkGCwkgHPlYAfxadJ/1JK4TXht+4/WHE/9f3+E2ccjHA==
X-Received: by 2002:a2e:4601:: with SMTP id t1-v6mr31570922lja.111.1546606909147;
        Fri, 04 Jan 2019 05:01:49 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.86.82])
        by smtp.gmail.com with ESMTPSA id c22sm11159955lfd.88.2019.01.04.05.01.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Jan 2019 05:01:48 -0800 (PST)
Subject: Re: [PATCH RFT v2] net: sh_eth: add support for SH7786
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc:     linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cbc7976d-2376-15d4-0fc1-febdf142887b@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <dd747ba3-5150-6f99-06ee-2c2bb761de57@cogentembedded.com>
Date:   Fri, 4 Jan 2019 16:01:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <cbc7976d-2376-15d4-0fc1-febdf142887b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/04/2019 03:53 PM, Sergei Shtylyov wrote:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> This commit adds the sh_eth_cpu_data structure that describes the
> SH7786 variant of the IP.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
