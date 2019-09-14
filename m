Return-Path: <SRS0=uqyC=XJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29997C4CEC9
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 14 Sep 2019 16:06:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6DCA20578
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 14 Sep 2019 16:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzH8HqJ/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfINQGR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 14 Sep 2019 12:06:17 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33967 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfINQGR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Sep 2019 12:06:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id a11so25047902wrx.1;
        Sat, 14 Sep 2019 09:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Fa2EFV1hZz9a/AiipPZCCuOSItuJO4FZtqKzsCDWwAQ=;
        b=jzH8HqJ/E4+gxm6fgz02cZicx/lDPDDUQ4eU27BU5edJUPPXBvmGDzfJjRBuSwpSX/
         +Jx7Zop2orm+OQPpEfQqU5bPAXYx2c/cGBxkaEg/DQHwu8FpTWDVgHRT9A6271B7rHRW
         sGtOxC13zJ2AEijregN5J4r5mkSjp6LU0k0cIeUP03XadT4pYfhhwxqwF++y3w6th3F+
         qpeOGx4qYK/6901DaevjcYnYDuptm/ZThb+F+s7WWJt9j5zjOeky3ITbWYQJgAeQmScK
         dyLdPO/1Dx7UuLwSXjjm1xOHoaxQH6IKl7gfNFIQm76PXeieqICg78XdgzlkgknIacdT
         tZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fa2EFV1hZz9a/AiipPZCCuOSItuJO4FZtqKzsCDWwAQ=;
        b=eyK+8Zd09Z6nUE3ja9Epx0dRuOunpsRtVBIUeCCaCWwDjbnXesCkQ+gcjE1Z7ObWOu
         73tke7hTVC3bbFRbRD3byzu4TYreh2NhLS2wPbr7prqy1s7N90i6JOhVgH6KVHXBudXT
         FMH2GQHQt5vP88umYy6dAJmHp8mnarhQNnu1Rt/avmrrbmYeqFyJd0t1qb/llPkhvgiS
         4WeHOWqvpHZNrYyRsR8bqUASa9MzFnOaHepMcb6Ibobtcr5qppE5gFyzgYG6V9iQluvX
         RvZytoLFfrVPshXk6EhJ5YaRFh3vum/5tl/sA/q+M7ISyYaDXNJjsjvL091JK7N2NUvH
         NVGQ==
X-Gm-Message-State: APjAAAXQ9rn5t79d1xfV4+EEb/m9hu0SOnAcCzLe/J4Pes/kYa7i9h/x
        2lzobMUrODe3aUBKJ3AWTaqc5eyM
X-Google-Smtp-Source: APXvYqyBvBIGv1pNOvSl/9WZIHPgLOXza16KuEBUZcTuNkK0+04fhWHxpEC7UaptojvnTjXS278EmQ==
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr45876970wrn.142.1568477174298;
        Sat, 14 Sep 2019 09:06:14 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-35-8.net.upcbroadband.cz. [86.49.35.8])
        by smtp.gmail.com with ESMTPSA id x5sm46294679wrg.69.2019.09.14.09.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2019 09:06:13 -0700 (PDT)
From:   Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190907161634.27378-1-marek.vasut@gmail.com>
 <CAMuHMdXVhtE5Jmpu8QYv+P8pGtegr4MGhNGRwy4Y1wRQYmL2_Q@mail.gmail.com>
Message-ID: <f1b11b42-99ee-0484-550e-8758ec6fa559@gmail.com>
Date:   Sat, 14 Sep 2019 17:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXVhtE5Jmpu8QYv+P8pGtegr4MGhNGRwy4Y1wRQYmL2_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/9/19 1:18 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Sat, Sep 7, 2019 at 6:16 PM Marek Vasut wrote:
>>
>> Add dma-ranges property into /soc node to describe the DMA capabilities
>> of the bus. This is currently needed to translate PCI DMA ranges, which
>> are limited to 32bit addresses.
> 
>> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> @@ -330,6 +330,7 @@
>>                 #address-cells = <2>;
>>                 #size-cells = <2>;
>>                 ranges;
>> +               dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;
> 
> Shouldn't the length be 0x80000000 (for all SoCs)?

Or should that match the amount of DRAM below 32bit boundary ?

> Or should we allow DMA to internal System RAM, too?

I think we should include SRAM, yes.

-- 
Best regards,
Marek Vasut
