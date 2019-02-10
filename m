Return-Path: <SRS0=jiO1=QR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D019C282D7
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 10 Feb 2019 16:39:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF236213F2
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 10 Feb 2019 16:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5xKQkV2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726941AbfBJQji (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 10 Feb 2019 11:39:38 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50759 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbfBJQji (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 10 Feb 2019 11:39:38 -0500
Received: by mail-wm1-f67.google.com with SMTP id z5so12779908wmf.0;
        Sun, 10 Feb 2019 08:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O528Raw0nttsTMThgE1Iyk9sW0pXyXOsuJJwLaQoCgU=;
        b=S5xKQkV29v0/1tpl8egATAQKhgQxkpKC6LjmoiLxaC7wYHGi8fdliYLTSFIVJeMGat
         SNOkoUxAunxvNwv8l5qpKAYehKDyxafQ8iVdr684iAm069Qi1zeRNaKvCWsDKBN21EFn
         LLMxmpojP/wTg2CWkYH6WCg2yJLOENwXUsD1waxuhZVLl37CGR5t0qXjbAekNZwe9iIp
         4atGq7K5qW2lqt8FTAwcI2crLzynzWMf6sLtZ6hZkirL9qUhOMqsKnHXXHJkw1z1pP+Y
         4aXrCSnAOUgQC4QVSZcwkKD5VhiedUaHXnGIFdcEJrGxdV62OkralOPNi3JWy66MWpYR
         Serg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O528Raw0nttsTMThgE1Iyk9sW0pXyXOsuJJwLaQoCgU=;
        b=Mgqm7iPPFLSsMwLRdt8acTg6mSF+1/S+pSxCzK3YtmVZ/cOibCpP5BsaritqwzuvBh
         FhXWsm7dmlTPWukq17LoEePyrdyrh9TKMBPp/KQS3rTb+nz5zyX/Se7H+OdC3VVfudC6
         CSqy3RfotJjcDqcf+b3/QFfv71GkPA+kNI8EyFTV/x8AYkAvsljnRQ8j6x21kt7VU2u5
         UOdR9Yv/aTKcb0iXvjWEo9Yev0n1WxV3mIqh/JJIrzDXvvibgWCTEVG5znTPJ4H5YWLf
         mjvrp/I2dYDDjeqCu0CfDvDNublfDgO724TbFdFgtKGhKFBxXbSiczcZYwSZ0FbsCD+m
         oodw==
X-Gm-Message-State: AHQUAuYTfdDBmp1zT9CdCPw2u7HNY1nJoMfr5JCna0yCJJwnhiayE3Po
        HFYwRccPDny6/DWbm9rHsDfLrW8Y
X-Google-Smtp-Source: AHgI3IY93azprNsAd3BB5psqzqPFjfi5ng9zukjmSNz/ucrs5uxxoPGIocrFo5MCjus23gHYR8ZAYA==
X-Received: by 2002:a1c:ed17:: with SMTP id l23mr6449591wmh.51.1549816776448;
        Sun, 10 Feb 2019 08:39:36 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c65sm9260648wma.24.2019.02.10.08.39.35
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Feb 2019 08:39:35 -0800 (PST)
Subject: Re: [PATCH] mmc: renesas_sdhi: Change HW adjustment register
 according to speed mode
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
References: <20190208193002.16915-1-wsa+renesas@sang-engineering.com>
 <20190210133926.GD31044@bigcity.dyn.berto.se>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <d6d064f2-fa58-d31e-83b8-1cc3ffbc7dee@gmail.com>
Date:   Sun, 10 Feb 2019 17:39:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190210133926.GD31044@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/10/19 2:39 PM, Niklas Söderlund wrote:
> Hi Wolfram,

Hi,

> Thanks for your patch.
> 
> On 2019-02-08 20:30:02 +0100, Wolfram Sang wrote:
>> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>>
>> SCC is used for SDR104/HS200/HS400. We need to change SCC_DT2FF
>> according to the mode. If it is inappropriate, CRC error tends to occur.
>>
>> This adds variable "tap_hs400" for HS400 mode and configures SCC_DT2FF
>> as needed.
>>
>> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
>> [wsa: rebased to upstream and updated commit message]
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> I think this looks good.
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Can you test this on E3 Ebisu (do you have a board) ?

-- 
Best regards,
Marek Vasut
