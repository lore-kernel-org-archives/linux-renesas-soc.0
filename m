Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED83C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 13:52:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50DA320661
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 13:52:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G42gnWT6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbfCHNw4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 08:52:56 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39324 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbfCHNw4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 08:52:56 -0500
Received: by mail-wm1-f68.google.com with SMTP id z84so12480985wmg.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Mar 2019 05:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8eIDpUA2jL7ZBl9rC2phGMZomYnggMWdsKZe3v9bOM4=;
        b=G42gnWT6laMAXVHlga/c/1JGMcgK5Nzxl+cznuIlnsZ585R31pknM35gstLutCINKs
         yImMIuwubB6mFWklcjhhelXSA0UZqFpZ4+c+D3wixC39vG3X3lRVTV8gxxNuFzXuAUf4
         5IwoBjfxhx/Fjo7pOzXoYGSzUBiew2c+zCTxYqtq5p6DvUb527ejm71nvMQcsBAQ/r6E
         wz3iiM0OgzOsF50n8LjUR1PK/2UgZhlNrxLXCgq7rm84L37G20fzQEy0Ve50SqWsYOUY
         BgglFD4aBlWodItN/6XHHEoEnTzFwoakFAWUnNvFT+Rya0iZEdfHEJiC/9GGCSMcDDvt
         pc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8eIDpUA2jL7ZBl9rC2phGMZomYnggMWdsKZe3v9bOM4=;
        b=mGtUMDGVq25jtq5b63077gUIQdTnpPBu4hTzgreazA6nomehXsisBRjhI0wdGwvF58
         +S1C9+LMvr4ImGKFYDAGKU+nsHPCYLzE5AwpYdB5KwLCqz0hk7lXefVT6g4lepJ4pPIg
         eceZxsKVQhugoExCeBW7k3l6qYMyi2W0iZr8EV8YcWz3Q8GM4T1o+6HSJFAy5rzvbRp0
         WwEYa4cfelQ3WYRkqrtLHIxW/RaYAbsXTVVoYnTgHoiyhxeDioJtc4UycrvQD3PGFXxa
         D+tgJCVPVQsH5YzqKEmHLMMwLKvQbqp09FCR0hQm7NZYgcswL8bU3v1nzjn2Ai/bqKym
         N2KQ==
X-Gm-Message-State: APjAAAVN5g+icAjJX4GdV6o1V68f3qO2cfCFiZ1C22z4jByemf2MHlr4
        Fybn8arRN+7u6C8am5EBdJI=
X-Google-Smtp-Source: APXvYqxZZbK5Bl7FfIH4yda2ioDWo7MVBynYvvvLUFIMl6O4ScPV7cEbFJjW5L6ecfs6ikTlakd4Gg==
X-Received: by 2002:a1c:6555:: with SMTP id z82mr8894589wmb.125.1552053174017;
        Fri, 08 Mar 2019 05:52:54 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id 12sm17306318wme.25.2019.03.08.05.52.52
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Mar 2019 05:52:53 -0800 (PST)
Subject: Re: [PATCH] ARM: dts: alt: Add DA9063 PMIC node
To:     Simon Horman <horms@verge.net.au>, Wolfram Sang <wsa@the-dreams.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20190303190059.31155-1-marek.vasut@gmail.com>
 <CAMuHMdWStD+on70-e1p0SXbe2igNJxDM1RzeYsdXW+80SA9+sw@mail.gmail.com>
 <20190304105705.GA1000@kunai>
 <e5be6861-70d1-e60e-4838-a89b219bee05@gmail.com>
 <20190304111349.GB1000@kunai> <20190308134043.alpxgnujj6ppmczc@verge.net.au>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <5a7b34bf-8ae7-a8a0-c1fc-911a9941dae9@gmail.com>
Date:   Fri, 8 Mar 2019 14:52:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190308134043.alpxgnujj6ppmczc@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/8/19 2:40 PM, Simon Horman wrote:
> On Mon, Mar 04, 2019 at 12:13:49PM +0100, Wolfram Sang wrote:
>> On Mon, Mar 04, 2019 at 11:59:48AM +0100, Marek Vasut wrote:
>>> On 3/4/19 11:57 AM, Wolfram Sang wrote:
>>>>
>>>>>> Add DA9063 PMIC node to the I2C bus.
>>>>>>
>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>>
>>>>> Thanks for your patch!
>>>>>
>>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>
>>>> Thanks for CCing me, I didn't get and missed the original patch.
>>>>
>>>>>> +++ b/arch/arm/boot/dts/r8a7794-alt.dts
>>>>>> @@ -377,6 +377,27 @@
>>>>>>         pinctrl-names = "i2c-exio4";
>>>>>>  };
>>>>>>
>>>>>> +&i2c7 {
>>>>>> +       status = "okay";
>>>>>> +       clock-frequency = <100000>;
>>>>>
>>>>> According to the DA9063 datasheet, the PMIC supports up to 400 kHz.
>>>>> It looks like there are no other devices on the bus.
>>>>>
>>>>> Wolfram, what's your stance on this?
>>>>
>>>> Yes, please. I thought this was standard on Gen2 IIC_DVFS busses, but
>>>> seems not. Probably it slipped through the cracks.
>>>
>>> Do we want to update all of the other boards too ?
>>>
>>> I'd be cautious about the DVFS I2C, running faster while talking to the
>>> PMIC and reading/writing a few registers brings little benefit, while
>>> the signal integrity might be impacted.
>>
>> Can be argued. I think if we would apply some testing on top of this
>> change, we will find that it will work. But we would in deed need this
>> testing as verification, and this is not our top priority project. But
>> if someone feels like running some i2c dumping over night, well,
>> why not..
> 
> Thanks,
> 
> I've applied this patch for v5.2.
> We can do a sweep of frequency updates as a follow-up if we decide
> that is the right way to go.

Do we really want to speed up the PMIC I2C bus ? What are the pros
(none?) and cons (might be unstable) ?

-- 
Best regards,
Marek Vasut
