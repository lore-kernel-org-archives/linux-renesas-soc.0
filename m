Return-Path: <SRS0=hAs+=QY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03858C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 14:46:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAA6721929
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 14:46:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAMCvjxL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbfBQOq0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Feb 2019 09:46:26 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:41724 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbfBQOq0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Feb 2019 09:46:26 -0500
Received: by mail-wr1-f54.google.com with SMTP id n2so3267506wrw.8;
        Sun, 17 Feb 2019 06:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zorJJyxCaTLE6mnNQjSbrTuzC711xsQTQKnGPktJWA0=;
        b=CAMCvjxLr4Z+khAi1/y6zVKW5F27mPq5k932nW8srSHrC9efOeQ1nX9BDO3k2okGwh
         pG+EoQLyHt36k8CWs5OJ6n/5Daqize9y4RGBMbqGEuNsCyLV5LEJQ0ihx1n+Rp3LrZ4h
         LuA5BRhPgIcwsp29l/atWQUtrXWRfBmb1vrpBrey3/gPnl6xa9bOilWM0nPl7iRuI2ft
         iYXOOMWQF2oNZWnEej5oyxEIVfdiPhJVeGhgBsKpK8tsAxhK8hO9YKt22r9aTC4DQRCZ
         zFZlSV/jz8SFPwb5BPdkxaZqT4sF1YMF6NxrywDaPSEnW/MqbhSkPei5tYC2IBhRW1S7
         LlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zorJJyxCaTLE6mnNQjSbrTuzC711xsQTQKnGPktJWA0=;
        b=TBbDhQrOhyr/BAf3pQ8q5shDrK81n7NfFLuKBNOI2t4HRSxPOtu87/5aJ++h0yDtV1
         dv0VdSgykRiJNNRcNU4UCh8io9Xb7aig7hDStMqbxj2cY8FncFQVQRAK0n+APWBEJkrW
         Ibz8GSkax+zyn2KwlCTjuBmGOwXYVdikrNUjfkfizSAopA69w1YgMkUrisVdky65389q
         YaqbLCZEXy+nvMxcN7FA0yf2h7dVZwELdUT8H8MMwQAibVKoCQMsI2glntwSm7IiHwRs
         EObBmjER6TH5iXUKL28lBXKafYwayJ5XlA73tNPxcq6lqzVV1IMfJsNqHlPiKHYZiB2H
         8gWw==
X-Gm-Message-State: AHQUAuaU7FdmjY5FGVAU69xYVEk8UK9in/IU9cq09Z5v8PFWSH/hBgCF
        i/Gajw2tu4UsBYuJmYDH24M6MSw8
X-Google-Smtp-Source: AHgI3IYZsTG/sFcMPBUylcqGgLsKRZ5xXDRzeXbwY3wItM3bZwm+JqZ6JQ3+I+YRLLRV6aHT823k4Q==
X-Received: by 2002:adf:ba12:: with SMTP id o18mr14676386wrg.326.1550414782896;
        Sun, 17 Feb 2019 06:46:22 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id o12sm39640919wre.0.2019.02.17.06.46.21
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Feb 2019 06:46:22 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
To:     Harald Geyer <harald@ccbib.org>
Cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
References: <20190216174859.15738-1-marek.vasut@gmail.com>
 <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
 <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
 <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at>
Openpgp: preference=signencrypt
Message-ID: <75846117-242c-6861-ace5-dccf88711208@gmail.com>
Date:   Sun, 17 Feb 2019 15:45:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/17/19 3:26 PM, Harald Geyer wrote:
> Marek Vasut writes:
>> On 2/16/19 9:20 PM, Harald Geyer wrote:
>>> marek.vasut@gmail.com writes:
>>>> +			  regulator voltage/current listed in "states".
>>>> +- gpios-states		: Initial state of GPIO pins in "gpios" array.
>>>> +			  0: LOW, 1: HIGH.
>>>> +			  Default is LOW if nothing else is specified.
>>>
>>> This is not very clear. Maybe add an example below or explain it better.
>>>
>>> I guess we can't change it now anymore anyway, but it's not clear to
>>> me, why we have this in the first place: A regulator should only be
>>> active when it has a consumer or is "always-on".
>>
>> Be careful here, the regulator-gpio may be instantiated such that it
>> will select between two voltage states, neither of which is 0V/off.
>> Consider eMMC vccq supply, which alternates between 1V8 and 3V3, but
>> does not have a third, 0V/off state (unless you pull the plug).
> 
> Yes, if it is always on (or simply has no enable-gpio) then we might
> select a voltage while probing the device. My point is: At some point
> (probably when the first consumer probes, but I think there are no
> guarantees) the core will switch the regulator state. That usually
> happens a few milliseconds to seconds after probing the regulator
> itself. This seems to be nothing but a source of undefined behaviour.

Why would the core switch the regulator state when the first consumer
probes ? It is up to the consumer to reconfigure the regulator when/as
it sees fit . The core should only set the default state and that's it.

> If continuous operation of the regulator is important, I'd expect
> we don't touch whatever the firmware setup instead of by default
> setting all gpios to low.
> 
> However as we can't change this now, there isn't much point in
> discussin this further.

The firmware could've left the regulator in non-default state.

>>> IIRC the regulator
>>> core automatically selects the lowest voltage/current compatible with
>>> all consumers. It seems the only usecase is to specify an initial
>>> state that is different from all states in the "states" property, before
>>> the regulator is turned on for the first time. However it also is not
>>> an off-state, because it won't be set again on turning the regulator off.
>>
>> Correct, this is not an off state. If you have a better wording, I am
>> open to that.
> 
> I think it should be clearer that this is an array. (Looking at various
> users I doubt everybody was aware of that, but since we have only instances
> with one gpio, there is no functional difference between array and bit field.)
> Also it should be recommended to set this to match whatever the bootloader
> sets up. Maybe something like:
> 
> - gpios-states: Array of GPIOs values set during probing the regulator.
> 		0: LOW, 1: HIGH. If continous operation during boot is
> 		desired, this needs to match what the firmware or bootloader
> 		sets up. By default all GPIOs are set to low during probing.

gpio-states has nothing to do with continuous operation, that's what
enable-gpios is for, we should not confuse the readers with it. Also
note that "probing" is OS specific, so we should use "default" instead.
What about this:

gpios-states		: Array of initial states of GPIO pins in "gpios" array.
0: LOW, 1: HIGH. Default is LOW if nothing else is specified.


-- 
Best regards,
Marek Vasut
