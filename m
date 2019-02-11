Return-Path: <SRS0=nlYi=QS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963E2C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 15:22:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A63421B1A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 15:22:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="e8UTKMtB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391280AbfBKPWf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Feb 2019 10:22:35 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35839 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390191AbfBKPWf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Feb 2019 10:22:35 -0500
Received: by mail-lf1-f68.google.com with SMTP id v7so3757260lfd.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Feb 2019 07:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JYZe8UsjdbicNo7lIS7eLTWv5HGzBtMgiGRg4tZbbyM=;
        b=e8UTKMtBPnauymi/hDOuSJeMUpP9kpDnHS7YGHjupTOcNMqh6moRYXYvadUJh7bsq2
         EJXTU3kIhDQT2OP7rBNxeHC0YTh1yJdvT6GqW9yVayR7p/+wkE1K8CHkpTxVh/Z+tm6H
         5kLranZ6ksRrgFYo/tRrXCnbONNIjEQdOJVqic7iIAd5nJVRWxmExmpDrMU7m/UhTrbR
         IY1dn4CMXTY/DdGVrfyMFlThV8GvF9DTrMnR+R7V0OK8EVl/Cfe8INNRhq9LKfmwDeia
         uMH+gb7kVw6qlLZMb39qTgd29cAbRqSU1UmxM+SzsmtUy9JjuATMUbESQN6MR+aslPn0
         8tSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=JYZe8UsjdbicNo7lIS7eLTWv5HGzBtMgiGRg4tZbbyM=;
        b=t+G7gj3WQwQXuYEFLgCvkPWUNPmez86EgJRkVF9JmtU6Zb1bArfEcF/zHxSJBgGbgU
         uMoc21vikeBNcxPzqPzLcO6fy/IBJ13nEm0JdkvglZyi6STnpZT+sqNiZtfpxBA4eGW8
         27fAI4vwV82q/ylWzqdadlKBgbj+qJswx5fgGN4YisdlnAxY6GsKhPNi6zw4vkZG4cB3
         Bceqd8idlWa+8gBbpmPONVtGR5gD/Tro74T0KgkbDMnxWWhCpzdB+LJQC21n79klXOQS
         SAp8gwQupryuEyCRMvecTmT2BJtpL5iyEp4enSaDeLIVrilA3EDYiUL3WSEy5sbBMxsE
         AyeA==
X-Gm-Message-State: AHQUAuZoR2GmzvSjh7iTFj/2VzufngV28VMkAWHQCq2XU66nTIrMB+EK
        vynZPNob23EWH4LBWYZiNsD0gw==
X-Google-Smtp-Source: AHgI3IZJlQsiv9HI5I1ICQT9NXRVXsToZmFXoKf+G2oKdnEzYuknwQufx6jycYQDhrtcucC3ohrGcw==
X-Received: by 2002:ac2:54b4:: with SMTP id w20mr9023292lfk.24.1549898553203;
        Mon, 11 Feb 2019 07:22:33 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.174])
        by smtp.gmail.com with ESMTPSA id q2sm2540552lfa.63.2019.02.11.07.22.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Feb 2019 07:22:32 -0800 (PST)
Subject: Re: [PATCH v5 3/6] math64: New DIV64_U64_ROUND_CLOSEST helper
To:     Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org
References: <20190211135858.23635-1-horms+renesas@verge.net.au>
 <20190211135858.23635-4-horms+renesas@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <0b9e3ba7-2b84-7621-78f9-9b22cb4f2bd6@cogentembedded.com>
Date:   Mon, 11 Feb 2019 18:22:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190211135858.23635-4-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/11/2019 04:58 PM, Simon Horman wrote:

> Provide DIV64_U64_ROUND_CLOSEST helper which performs division rounded to
> the closes integer using an unsigned 64bit dividend and divisor.

   Closest?

> This will be used in a follow-up patch to allow calculation of clock
> divisors with high frequency parents in the R-Car Gen3 CPG MSSR driver
> where ovefolow occurs if either the dividend or divisor is 32bit.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

MBR, Sergei
