Return-Path: <SRS0=rp0x=R6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA622C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 10:21:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA6C320700
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 10:21:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="OXNlR3GI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732572AbfC0KVB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Mar 2019 06:21:01 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34041 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbfC0KVB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Mar 2019 06:21:01 -0400
Received: by mail-lf1-f67.google.com with SMTP id y18so11016833lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2019 03:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xLh+19KBNGfhJu0+puppWHkeDcNPIdA5C5X9WsudEg8=;
        b=OXNlR3GIFIrB1LOwG1JxYIiV77mYD2Vz+wSvVpCR+iKw2dlJcOQ/9FUuDtQt6e8V21
         QOVZiQ4HIB6uXCSTrHwEidMG2VT5SO/c09NSGNdtS9X2FRc8gkrTK/892/GEO2Ymvmqg
         btY6oeJ9aeqPWPI1xvHaj3+dwnavdTuASmUhW7injYDXYhU8t+fuqt9vDlpONP5a8UaF
         OmV6qILU25jzMmnjgBEiC4ztcdP41VRqR1Ir0XmVXMUZHhoF6qydi4p6EAQohnMVRHSv
         p0lBgSZT92If/c/KnD1rEcj0xs0CqLYWo4APtoXtfnEfJZGZOeWPxRj7c2NQ1aXxSZzt
         D6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xLh+19KBNGfhJu0+puppWHkeDcNPIdA5C5X9WsudEg8=;
        b=p5ZTt587qfmIv8SPMTJt10dD59SJhsXLvaP2eHS3upg0VOI9JKJICOj2q9ykhr2etM
         3iVOt85CQvkUsOVPYXPJKkSVjl4cE4o1re9yAARLsMesrWN/kjlQQCibJFFSidgpsih5
         274I2eanFpvG6wKQYD07AA//6tFCUzkpjP80oiyqxzk4PCmTY/DXlm0P3wk3mOB/ue+0
         H/gmV9dQbOWpD0YSvezTJMLqVtH/uLAbE6s1D9yFS7y1ffyxupl5vnKYS8YSryKO+Wcp
         OR4PBIGkkY4Ri8bepWg9YYu/jDZzyRUhKMxebpBkUiWqQaZG3av9DsT9G7PBEh1exZi8
         QLnQ==
X-Gm-Message-State: APjAAAWg7aR3wdhUayt44pLCUCIePqjfHKH4XFcjnq7RPjCQ5pDwMP3d
        nJsEazTuQ9rLhKV1BsJjbCRe6g==
X-Google-Smtp-Source: APXvYqzPUWBy26IY0PFEGpCNDsVenaCSbTaa9xCZhlcXwP7IT4cflGXElDMKqUoHwVwsV13O8FNULg==
X-Received: by 2002:ac2:44d0:: with SMTP id d16mr17926974lfm.164.1553682059232;
        Wed, 27 Mar 2019 03:20:59 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.80.202])
        by smtp.gmail.com with ESMTPSA id g18sm4567436ljk.26.2019.03.27.03.20.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Mar 2019 03:20:58 -0700 (PDT)
Subject: Re: [PATCH v8 1/2] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller
 driver
To:     masonccyang@mxic.com.tw
Cc:     bbrezillon@kernel.org, broonie@kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org, marek.vasut@gmail.com,
        zhengxunli@mxic.com.tw
References: <1548658158-5460-1-git-send-email-masonccyang@mxic.com.tw>
 <1548658158-5460-2-git-send-email-masonccyang@mxic.com.tw>
 <75c4642b-536e-f596-158d-387a63a5f6c5@cogentembedded.com>
 <OF7C1EB3FC.1ABCD2C2-ON482583C8.002D7A69-482583C8.002E899C@mxic.com.tw>
 <2fa6af66-de08-be37-7cdf-ccbf1e50ceb0@cogentembedded.com>
 <86e65614-814a-e8b8-fdbe-4b7b033e4938@cogentembedded.com>
 <OF5BDFBDAB.B66A1ADE-ON482583CA.0006C5C2-482583CA.0008788E@mxic.com.tw>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <07bee590-9334-f17f-19dd-f5fd35f44e11@cogentembedded.com>
Date:   Wed, 27 Mar 2019 13:20:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <OF5BDFBDAB.B66A1ADE-ON482583CA.0006C5C2-482583CA.0008788E@mxic.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 03/27/2019 04:32 AM, masonccyang@mxic.com.tw wrote:

>> >>>> +static void rpc_spi_mem_set_prep_op_cfg(struct spi_device *spi,
>> >>>> +               const struct spi_mem_op *op,
>> >>>> +               u64 *offs, size_t *len)
>> >>>> +{
>> >>>> +   struct rpc_spi *rpc = spi_controller_get_devdata(spi->controller);
>> >>>
>> >>>> +   if (op->dummy.nbytes) {
>> >>>> +      rpc->smenr |= RPC_SMENR_DME;
>> >>>> +      rpc->dummy = RPC_SMDMCR_DMCYC(op->dummy.nbytes);
>> >>>
>> >>>    SMDMCR.DMCYC is in bits -- you forgot to multiply by 8.
>> >>
>> >> ?
>> >>
>> >> It's dummy cycles setting, i.e,. 0 is 1 cycle dummy and
>> >
>> >    Yeah, I should've written "cycles", sorry about that.
>>
>>    I also should've mentioned that w/o this change the "read SFDP" command
>> returns garbage and the flash doesn't work.
>>
> 
> Have you checked the dummy cycles setting with logical analysis ?

   I don't have a logic analyzer (if you meant it). However, I dumped all the registers
in your driver and Cogent's own driver, and SMDMCR was set to 0 in your driver and to
7 in our driver -- and only our driver then worked correctly.

> As datasheet mentioned it's dummy cycles depends on the transfer bit size setting = 1, 4 or 8.
> Setting RPC_SMDMCR_DMCYC(0x13) in 8 bits data width I got a 20 dummy cycles.
> Also confirmed these 20 dummy cycles by logical analysis equipment.

[...]

> best regards,
> Mason

MBR, Sergei
