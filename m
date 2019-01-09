Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E42C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 19:04:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 53D3A20859
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 19:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="q0ERcMLW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbfAITEH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 14:04:07 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42565 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbfAITEH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 14:04:07 -0500
Received: by mail-lj1-f195.google.com with SMTP id l15-v6so7422077lja.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Jan 2019 11:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ekFMyMNSDLZzVhwsxH7qHcNGQadaZ1UydAko1QplgQ0=;
        b=q0ERcMLWwvsdl0NKR6MGYlFZMMjviI3Wv0nlwflAbLfp/gOvofRHIG8cYpxHY6MkCG
         pJLMgp4L5XKj0ZgHaprs+Rk3NGvfE2yoJ6y+DWM6INT6off7ASiHtWu0Ztu5mHFIrEQZ
         3rz2k/qMjhNPkdaFTwkRw3S1gqjhkg0V1t2/1k/cJYHHgjAKopbxZy0qxx1zuZFAxoym
         mDJMTVWOWIiY65ETj/Mx8vsxUi+XVOGB2LsT7pqqh9GYsHwsARIBA86Zq4mI2lzvoqVO
         VUlsJSCTrXV0DWb76Ih8fMs054EsjNxCoERY+zDijJSZM47giNzlQwWv93pWmC+ovYKH
         bHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ekFMyMNSDLZzVhwsxH7qHcNGQadaZ1UydAko1QplgQ0=;
        b=a7oH7SE0VNUfRcECZ3rfuwRfU7NBibGZWQAsYyD4oBdmdInGUgakLwpYXyRLsdeV65
         4binCupNlWu5xPmSKS/QpXZI8KF8xmfCpSMN/zbaEQVPrB4meR9rgPiAoKiJVkhUn/BW
         QGR/Pge2Z5bo+bsVLVNRPrq7EI450mGVNiOuJzDsRniNs/ToQd5VwTK6N0jrPVMNq2qP
         5nSA6zeUijyzxSO8DRj4VZPyI9yhkUL8GhN5K61AI340mwvD7s+IEC8Il32LO3p77VqM
         Xh3l01AfhsgAeTI1WQhx4XDegisWKf1cXN6GrAbCPr3hXTFOFxWXOcVAzM+k36Zz3NQ0
         Z+mw==
X-Gm-Message-State: AJcUukeJQS1n/QWn9xpQ5YVrJOZ3oSRnjOVITXvieXnABkk0m94ZKozC
        R/aQHW/HYM2kzSaRIvns7HcSqQ==
X-Google-Smtp-Source: ALg8bN7/w9ZF0CZLSO/7LpIjZZ+D9vXPXNiR+/EbV0ALZoKgjVjIYQJPkkviuWZcax07Lyv8PBMAxA==
X-Received: by 2002:a2e:8596:: with SMTP id b22-v6mr4189972lji.122.1547060644884;
        Wed, 09 Jan 2019 11:04:04 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.211])
        by smtp.gmail.com with ESMTPSA id t22sm14457573lfb.0.2019.01.09.11.04.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jan 2019 11:04:04 -0800 (PST)
Subject: Re: [PATCH v5 1/2] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller
 driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Mason Yang <masonccyang@mxic.com.tw>,
        Mark Brown <broonie@kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        zhengxunli@mxic.com.tw
References: <1546921020-20436-1-git-send-email-masonccyang@mxic.com.tw>
 <1546921020-20436-2-git-send-email-masonccyang@mxic.com.tw>
 <74a5fba6-a77e-f71b-ce49-405fee8e0fda@cogentembedded.com>
 <CAMuHMdUPsN-VMhbttVK19gL_nPdaCTHHC7Dn3ajPoVhMqDJf_w@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <a4373a7f-07c4-baff-30a3-d1f5a294e1bb@cogentembedded.com>
Date:   Wed, 9 Jan 2019 22:04:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUPsN-VMhbttVK19gL_nPdaCTHHC7Dn3ajPoVhMqDJf_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/09/2019 09:49 PM, Geert Uytterhoeven wrote:

>>> Add a driver for Renesas R-Car Gen3 RPC-IF SPI controller.
>>>
>>> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
>>
>>    You now need to add:
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
>>> --- a/drivers/spi/Kconfig
>>> +++ b/drivers/spi/Kconfig
>>> @@ -544,6 +544,12 @@ config SPI_RSPI
>>>       help
>>>         SPI driver for Renesas RSPI and QSPI blocks.
>>>
>>> +config SPI_RENESAS_RPC_IF
>>
>>    Since the driver is called without -IF suffix, I wouldn't use it in the
>> Kconfig name either, the following is enough:
>>
>>> +     tristate "Renesas R-Car Gen3 RPC-IF SPI controller"
>>> +     depends on ARCH_RENESAS || COMPILE_TEST
>>
>>    Judging on the compilation error reported by the 0-day bot about readq(),
>> we now need to depend on 64BIT or something...
> 
> IIRC, this hardware block is also used on RZ/A, which is 32-bit.

  I'm not seeing it in the "RZ/A1H Group, RZ/A1M Group User’s Manual: Hardware"
Rev 3.00. What SoC did you have in mind?

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
