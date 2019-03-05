Return-Path: <SRS0=F/Q8=RI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B74C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 22:26:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CDA2D20661
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 22:26:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D57qyiIC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbfCEW0L (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Mar 2019 17:26:11 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53061 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfCEW0L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Mar 2019 17:26:11 -0500
Received: by mail-wm1-f67.google.com with SMTP id f65so4061371wma.2;
        Tue, 05 Mar 2019 14:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L2VkHUD3HY+YnosTxPabeLmu3opcuXxbIOBMzW73AfA=;
        b=D57qyiICdojCMi0zACxxAYiBAnbYwAFT4E9DE090tZzy+dy6BwkuA+YI46jtoUWhMG
         loiQ28ApV5EwoG7wBzFIL1bNDC/eMiZZL7lJkrXi1Wos3hXSOZ4b1cCiqeyrTvm59WFz
         dCyjoUhyR4wn9Y18emHnb/qZ0J93hOCpaH0BmYOR4yP8kr94nfD8fvO5CBRnc+v9nzUJ
         uPegShcYuiHhxozq/+zrr7tz+9sxkrtBBOrLiEBvbWJokFePggmNtyZ9v0VlAqVidHj9
         iI08obU1g27jJ1FdKTXqbzjCqBHqdZ9um/3qXCEL5eL6CihJiYj0UphPDvqaXSQu5SBH
         bzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L2VkHUD3HY+YnosTxPabeLmu3opcuXxbIOBMzW73AfA=;
        b=PvKQ9BZHOwzDXdQtJ6aiEK/0GtY4V6XRdrRV/6I+u/KX9h9KJHItN4iY1oKWAtS3Vm
         wfJSgkhvVSfcJmAwEXXw8kGHcPM04ihyst8I4hZoa3rqOshg+v/6lZKym0jsahhFVEjn
         LZbah1zFwlWE5H6+s9CYpIkouu1mmOlP/hNevEkj97aDCOVj3+SXp9O3MlLJzRep7u8q
         f2fMFDKC8v7YS44qfFgY8C6HSU7bc2XCS9kS+URVb/uwy2J3jzXfMzEydlz9NDPSBb1F
         1SQOQuGpYSquY2otgLbJhS2KfCobWfKVgn8Suej7qJC6//Zxjwisp65dv7f+0bSOzLyr
         xiMw==
X-Gm-Message-State: APjAAAUUEbRUKyWXk+2lHBbTFvTOeyOF7g0A/QZXgz4SGyW2p8NMOxwE
        QvbvmYbCTCpv25g533j1Is9mdieP
X-Google-Smtp-Source: APXvYqxuCfXIwAOTSGJXVJjA+MQSgM2OpLHKc0yK6IEf58KRM3J7N+E6Lk19vZPgbY71h3Z01oZLuw==
X-Received: by 2002:a1c:670a:: with SMTP id b10mr447199wmc.82.1551824768105;
        Tue, 05 Mar 2019 14:26:08 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id y20sm42133wmi.34.2019.03.05.14.26.06
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Mar 2019 14:26:07 -0800 (PST)
Subject: Re: [PATCH V2] regulator: gpio: Reword the binding document
To:     Harald Geyer <harald@ccbib.org>
Cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
References: <20190304194023.10926-1-marek.vasut@gmail.com>
 <E1h16yh-0000OM-5J@stardust.g4.wien.funkfeuer.at>
 <834f8576-73a4-be0f-e322-91601bed5388@gmail.com>
 <E1h1Ce9-0000JA-Rs@stardust.g4.wien.funkfeuer.at>
 <4d1cd905-c322-78e5-cb9c-dadba01b0324@gmail.com>
 <E1h1Hjl-0000Nv-Ri@stardust.g4.wien.funkfeuer.at>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <89743562-bb2a-de3f-a57b-331f43bf8982@gmail.com>
Date:   Tue, 5 Mar 2019 23:23:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <E1h1Hjl-0000Nv-Ri@stardust.g4.wien.funkfeuer.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/5/19 10:36 PM, Harald Geyer wrote:
> Marek Vasut writes:
>> On 3/5/19 5:10 PM, Harald Geyer wrote:
>>> Marek Vasut writes:
>>>> On 3/5/19 11:07 AM, Harald Geyer wrote:
>>>>> marek.vasut@gmail.com writes:
>>>>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>>>
>>>>>> Reword the binding document to make it clear how the propeties work
>>>>>> and which properties affect which other properties.
>>>>>>
>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>>> Cc: Harald Geyer <harald@ccbib.org>
>>>>>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>>>> Cc: Mark Brown <broonie@kernel.org>
>>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>>>> To: devicetree@vger.kernel.org
>>>>>> ---
>>>>>> V2: - Make "gpios" a mandatory property
>>>>>>     - Reword "gpio-states" property description
>>>>>>     - Change "enable-gpio" to "enable-gpios" to match modern DT rules
>>>>>> Note: The recent gpio-regulator rework caused breakage. While the
>>>>>>       changes in the gpio-regulator code were according to the DT
>>>>>>       binding document, they stopped working with older DTs. Make
>>>>>>       the binding document clearer to prevent such breakage in the
>>>>>>       future.
>>>>>
>>>>> Thanks for the update. I think it addresses all my concerns except for
>>>>> one:
>>>>>
>>>>>> +- gpios-states	: State of GPIO pins in "gpios" array that is set until
>>>>>> +			  changed by the first consumer. 0: LOW, 1: HIGH.
>>>>>> +			  Default is LOW if nothing else is specified.
>>>>>
>>>>> I still believe this not true: There is no guarantee that the regulator
>>>>> core won't change the state of GPIO pins before the first consumer comes
>>>>> up.
>>>>
>>>> Why would it do that ?
>>>
>>> Because the regulator core doesn't know about this driver specific
>>> property at all. And without any constraints placed by consumers, the
>>> core is free to choose any state whatsoever at any point in time.
>>
>> But git grep seems to disagree, see drivers/regulator/gpio-regulator.c:
>>                     ret = of_property_read_u32_index(np, "gpios-states", i,
>>
>> The core sets the pins to such a value until the consumer takes over.
> 
> I think we have a misunderstanding of terminology. When I write "regulator
> core", I mean the driver independent regulator code. The line you quote
> above is part of the gpio-regulator driver and thus not part of what
> I call the "regulator core".
> 
> AFAICS the data from the property is only stored in a driver specific
> data structure (and not used at all outside of probe) but never passed
> to what I call the regulator core.
> 
> Why do you believe there is a guarantee that the value set during
> probeing is preserved until a consumer takes over?

It is the only sensible behavior and the behavior I see people expect
from this property. I presume it solidified in this sort of semi-defined
state, so we're stuck with assuming it behaves this way to maintain
compatibility.

-- 
Best regards,
Marek Vasut
