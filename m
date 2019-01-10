Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CA7C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 09:10:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A001B214C6
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 09:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="vTwp/9VS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbfAJJKx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 04:10:53 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37079 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbfAJJKx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 04:10:53 -0500
Received: by mail-lf1-f65.google.com with SMTP id y11so7762179lfj.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jan 2019 01:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sTWD9rH1HwSSh5ZkwSbYu89BJxg1hvnP9f7lS+Ml/z8=;
        b=vTwp/9VSjkDbfuBlidl1kdGCFEgSn2YmTwDAXDclv/Gk2mu70UQo8NPfd2iZC4sdPs
         39qtd9C1qnrReQ1dXN3FfQocT//txIfxGhtsxcavqazWc3ptxrQq8lY30PUi1hMCOI1A
         ruPoKiettbpuLQ2wFLcnPa2f3Q3B1tl4sI1C/58q4qqXxvfkyLR21s3CA8zTTpFuA/M5
         1AdVnKQemcmVMCWoGgWkssRUnL67DIeqJ9B6Ygy59xhxPtx938Bf4GFJrYBwobnIjvwg
         hkXnKUIk0wcTsmIFn5FPgsRYOU4418aDWVXZRrQ7ZngPFL2qiUoHK0cvbiqnR5C3SfCO
         9fyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sTWD9rH1HwSSh5ZkwSbYu89BJxg1hvnP9f7lS+Ml/z8=;
        b=bxX+AkDxC5DBi1m7e1M2OcJ3Y7qKAhq1N6pjE5RWj2s/HqQeVE886RGFKhaEPTF9r9
         ODnV/CG/0L5upFgGJls5jwbF4080XsGbtfz9qtvFpQGKF1g1lHMzjVglQn7veUPIhOGP
         QU+ZSDwwvn+QAQa7GW4fUGKScA2eaiOv/ZAtii7RQ/0tHxPSq3k/Jcy1VSkMgzaBOSfo
         jMsPWDFyUl+TIVu0mp2XitLUJlZ9qNj0wZS7PBxDIOA3OnFCKrf+PtBKkRy1ecjV4k+b
         wTNARdAw7X44xOEQ66fqYCIttsXs/u/9qiJehUm3tcoS/OPJgIs5HcChVIjFRAJylwnd
         +niA==
X-Gm-Message-State: AJcUukdjZv3eTDkpenORKcSURiZRDrjK77s0n5eerx9rVDrm1pHHNZ8P
        G9u0EKk86ta8wKBdsOyFUbI8vZ2CQ4A=
X-Google-Smtp-Source: ALg8bN65WwxpzyAeNcLEn7KPDtW1eYeRUTpSp86Pokg5rtpDUbG3fP7qbNP7dh6dVnMQe7xfilAlPA==
X-Received: by 2002:a19:22c2:: with SMTP id i185mr5759698lfi.2.1547111450553;
        Thu, 10 Jan 2019 01:10:50 -0800 (PST)
Received: from [192.168.0.199] ([31.173.84.254])
        by smtp.gmail.com with ESMTPSA id a127sm14136818lfe.73.2019.01.10.01.10.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jan 2019 01:10:49 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH RFT v2] net: sh_eth: add support for SH7786
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cbc7976d-2376-15d4-0fc1-febdf142887b@cogentembedded.com>
 <20190108101615.165c5a4b@windsurf>
Message-ID: <f60a213c-755f-c95d-3931-2f9564b7717d@cogentembedded.com>
Date:   Thu, 10 Jan 2019 12:10:26 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190108101615.165c5a4b@windsurf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 08.01.2019 12:16, Thomas Petazzoni wrote:

> On Fri, 4 Jan 2019 15:53:24 +0300, Sergei Shtylyov wrote:
>> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>
>> This commit adds the sh_eth_cpu_data structure that describes the
>> SH7786 variant of the IP.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> I tried to test this patch today, and it doesn't work for the moment.

    What are the symptoms?

> However, I've rebased my whole SH7786 patch stack on top of 4.20, and
> with my original sh_eth patch, network is also not working, so I can't

    Hm... same symptoms?

> say whether it's really this patch that has an issue, or some other
> aspects.
> 
> (And yes, I remember to adjust the base address of the sh_eth
> platform_device:
> 
> diff --git a/arch/sh/boards/board-wdc-cont4.c b/arch/sh/boards/board-wdc-cont4.c
> index c72209822899..7ca1bfcc20ae 100644
> --- a/arch/sh/boards/board-wdc-cont4.c
> +++ b/arch/sh/boards/board-wdc-cont4.c
> @@ -80,7 +80,7 @@ static int wdc_cont4_clk_init(void)
>   
>   static struct resource sh_eth_resources[] = {
>           {
> -                .start  = 0xFEE00200,
> +                .start  = 0xFEE00000,
>                   .end    = 0xFEE00400 - 1,
>                   .flags  = IORESOURCE_MEM,
>           }, {

    Yes, seems correct.

> Best regards,
> 
> Thomas

MBR, Sergei
