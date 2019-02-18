Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A1CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 19:05:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B032217D7
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 19:05:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ydg0xA9D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbfBRTFB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 14:05:01 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39952 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728159AbfBRTFB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 14:05:01 -0500
Received: by mail-wm1-f65.google.com with SMTP id t15so152324wmi.5;
        Mon, 18 Feb 2019 11:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9ovq5VHOJQWFIutylGuHB9TiHK49ySeOxuHffu+cTyM=;
        b=Ydg0xA9DRWCQ0f3AI4qZaktr4hu+hEsu5AFgdVwYNEL5JfRBwHTCvCqCVWuRGmBSDq
         LOvDx+VGzdRvQLdWOphBHlOICsqGjRoXl8PmDHdFzY9e1gBAztfqnMs6fcmsMCjQKeQE
         peyG5DdIVJPCuVZW4jx7bgui7pHtgU1bBLkTxYRZ54Z3mxcKlafP0Tw1TYSVEoeNB9t1
         BSBqdeAgzRXSnRAaF4Rhj9xpLERV+5HhWohO239lbRErD5ng/W5UbFjRfIGbbAgctYu5
         0VN7ktkPXMVsiMhhirZFPp6cU+K7nzlnkwq/5RSof1oa0Jh0AqZAzWWd26SQb7atku7C
         daSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9ovq5VHOJQWFIutylGuHB9TiHK49ySeOxuHffu+cTyM=;
        b=UsgcExltwFE+5f/YBMemkB2ffYgdIbrLcLbTCXP1OfFXs1Tn1R4a3zi0lwx0OblvHf
         nycrYN67AaJzSNQOFJIvdeRvwtxRJ+WAWmAXZWXjbrhWRlDEsmAxHTrXW/zKUitgVCnD
         9k+k93o6zCrCsXP9T1g2Z+zf9eurcxL7l57+38NoCDqV7IEL1anNdx/GuSVPTKAhzV6O
         EC6GER+E6QLmWY8R9Lnm6nLLzAkyyu2Y1ZcbeUiRileTGYahxHuKK5aKdm8BR8tyR+9q
         wizFy0piZuX62OiY9Xz6LfEpKC99MMtGd1UAu6chBr90b3Lw+JX3xilpflFpGeSJwkEF
         WXzA==
X-Gm-Message-State: AHQUAuarcmNbTuggrHc4BO5QMvlam14NWP6ZN6F0gY1RpXwd9FUx3cdF
        NWdH+iOo1b/5yAll0DsXvqNmYlcB
X-Google-Smtp-Source: AHgI3IbpZfCNJLU84lJNSRYMeintNGOBXYSmUxaRmsjyVyrbAXdyZu6R+In4ZUe9d1EgAUwOoMs44A==
X-Received: by 2002:a7b:c7c2:: with SMTP id z2mr173374wmk.47.1550516697742;
        Mon, 18 Feb 2019 11:04:57 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id q9sm197006wmc.10.2019.02.18.11.04.56
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 11:04:56 -0800 (PST)
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Harald Geyer <harald@ccbib.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20190216174859.15738-1-marek.vasut@gmail.com>
 <CAMuHMdXeuaqLEFfV6_7cPdiq_+vuo97brx1Xa1N6c_GFSKmM0A@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <8374074b-9ef0-1286-71b4-756934e7d405@gmail.com>
Date:   Mon, 18 Feb 2019 19:36:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXeuaqLEFfV6_7cPdiq_+vuo97brx1Xa1N6c_GFSKmM0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/18/19 10:30 AM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Sun, Feb 17, 2019 at 8:00 AM <marek.vasut@gmail.com> wrote:
>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Reword the binding document to make it clear how the propeties work
>> and which properties affect which other properties.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Harald Geyer <harald@ccbib.org>
>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: linux-renesas-soc@vger.kernel.org
>> To: devicetree@vger.kernel.org
>> ---
>> Note: The recent gpio-regulator rework caused breakage. While the
>>       changes in the gpio-regulator code were according to the DT
>>       binding document, they stopped working with older DTs. Make
>>       the binding document clearer to prevent such breakage in the
>>       future.
> 
> Thanks, adding more worms to the can, below...
> 
>> --- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
>> +++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
>> @@ -4,16 +4,25 @@ Required properties:
>>  - compatible           : Must be "regulator-gpio".
>>  - regulator-name       : Defined in regulator.txt as optional, but required
>>                           here.
>> -- states               : Selection of available voltages and GPIO configs.
>> -                          if there are no states, then use a fixed regulator
>> +- states               : Selection of available voltages/currents provided by
>> +                         this regulator and matching GPIO configurations to
>> +                         achieve them. If there are no states in the "states"
>> +                         array, use a fixed regulator instead.
>>
>>  Optional properties:
>> -- enable-gpio          : GPIO to use to enable/disable the regulator.
>> -- gpios                        : GPIO group used to control voltage.
>> -- gpios-states         : gpios pin's initial states array. 0: LOW, 1: HIGH.
>> -                         defualt is LOW if nothing is specified.
>> +- enable-gpio          : GPIO used to enable/disable the regulator.
> 
> According to modern GPIO rules, that should be "enable-gpios" (plural) ...

Isn't that changing the ABI spec then ?

>> +                         Warning, the GPIO phandle flags are ignored and the
>> +                         GPIO polarity is controlled solely by the presence
>> +                         of "enable-active-high" DT property. This is due to
>> +                         compatibility with old DTs.
> 
> Wasn't the purpose of the various *active-* flags to accommodate GPIOs
> lacking a flags cell (i.e. typically #gpio-cells = <1>)?

Yes

> When the flags cell is present, there's indeed opportunity for confusion
> (and breakage), combined with the presence/lack of *active-* below...

The code is rather clear that the flags cell is ignored.

drivers/gpio/gpiolib-of.c:
 91 /*
 92  * The regulator GPIO handles are specified such that the
 93  * presence or absence of "enable-active-high" solely controls
 94  * the polarity of the GPIO line. Any phandle flags must
 95  * be actively ignored.
 96  */

>> +- enable-active-high   : Polarity of "enable-gpio" GPIO is active HIGH.
>> +                         Default is active LOW.
>> +- gpios                        : Array of one or more GPIO pins used to select the
>> +                         regulator voltage/current listed in "states".
>> +- gpios-states         : Initial state of GPIO pins in "gpios" array.
>> +                         0: LOW, 1: HIGH.
>> +                         Default is LOW if nothing else is specified.
>>  - startup-delay-us     : Startup time in microseconds.
>> -- enable-active-high   : Polarity of GPIO is active high (default is low).
>>  - regulator-type       : Specifies what is being regulated, must be either
>>                           "voltage" or "current", defaults to voltage.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


-- 
Best regards,
Marek Vasut
