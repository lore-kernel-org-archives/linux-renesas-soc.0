Return-Path: <SRS0=vwki=QX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BFFC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 21:53:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DBCAC21A4A
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 21:53:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzWRbf/J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbfBPVxb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 16:53:31 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40208 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbfBPVxb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 16:53:31 -0500
Received: by mail-wm1-f68.google.com with SMTP id t15so5069041wmi.5;
        Sat, 16 Feb 2019 13:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/9+gJLmti0wG4ZwgF61mVNyQvFEI44pUCAEA26AR5vY=;
        b=NzWRbf/JuhgDrOXGjbLjMjUdf6FkkJcngWWpGMjw1luXbnAgGsNHI9JEMxBFI3EqXd
         zMI3tuqHt9u3bRzWDt8NM4332ATilihJH3TPzS7dF7R52I4AkcOTtiWePar14sVUdoXq
         W8j0N/VAXrv8cjOYXvvYIh6pgGaqiO3gFf3G87EKsKN+zjjUvxOFH2KxgZLPwDdSP7bL
         +3+Gm8SORw9VE0528SauEYZ7F33h+ThQr02X8UOKwET8FgnFEA+lXE5kgvRX5Y8xus1h
         6KB2rHUspJhGlRxCeiEzCoylhsYq6GUvP5iBtnlQ4sxZjVdpNPrrY+DzedDVu6AZoxho
         pxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/9+gJLmti0wG4ZwgF61mVNyQvFEI44pUCAEA26AR5vY=;
        b=GyAL087bpYIbS5CzYez7lP2/06g+//2oZN7DHYhJIPMKR9xqZtK5DF9ZO9ywsdM/V5
         SHGoangWM6sxJHCW3U5C5dx6dvXLwg7iDrWoXi7MrAj8inT98d7PQYJHwix4X8qBEs6m
         jW26Ayr4yjJqueu1VdS15o7th8JjbpC9Vt1DrQsutyqEHTPZiRrkGJeKFxtGe9UKFsvW
         aUc4h+J17DGNZm4m8iL3EHv3tqkEEwcTfEJ7O3JQ1SDtpX4HMDDgRr4vYKL+Ks/4B75K
         CyCEmu83Qx+qpIFYZ845CQxkYLn3x+WEogNGQOPlh0sQzW7GjgSyyL0wRDfajrjaCwbp
         8c1A==
X-Gm-Message-State: AHQUAuaqjZwCLpr6ROFv8WnTxiEWGCC+xNTnbDlKD4T+h4uypAGLCVWp
        eAioGejORB1JDy+L3MfcwzymrWUs
X-Google-Smtp-Source: AHgI3Iaw/efgkhETyEXtD12aAFBds7B636DFaPuA1YnEcZrFk9gTPHX8o3g7r0CxvD3QH8bPdyVSRg==
X-Received: by 2002:a1c:2082:: with SMTP id g124mr10177647wmg.59.1550354007990;
        Sat, 16 Feb 2019 13:53:27 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id b3sm27330012wme.27.2019.02.16.13.53.26
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Feb 2019 13:53:27 -0800 (PST)
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
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
Date:   Sat, 16 Feb 2019 22:37:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/16/19 9:20 PM, Harald Geyer wrote:
> marek.vasut@gmail.com writes:
>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
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
>> ---
>>  .../bindings/regulator/gpio-regulator.txt     | 23 +++++++++++++------
>>  1 file changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
>> index 1f496159e2bb..acca13c1eaf3 100644
>> --- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
>> +++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
>> @@ -4,16 +4,25 @@ Required properties:
>>  - compatible		: Must be "regulator-gpio".
>>  - regulator-name	: Defined in regulator.txt as optional, but required
>>  			  here.
>> -- states		: Selection of available voltages and GPIO configs.
>> -                          if there are no states, then use a fixed regulator
>> +- states		: Selection of available voltages/currents provided by
>> +			  this regulator and matching GPIO configurations to
>> +			  achieve them. If there are no states in the "states"
>> +			  array, use a fixed regulator instead.
>>  
>>  Optional properties:
>> -- enable-gpio		: GPIO to use to enable/disable the regulator.
>> -- gpios			: GPIO group used to control voltage.
>> -- gpios-states		: gpios pin's initial states array. 0: LOW, 1: HIGH.
>> -			  defualt is LOW if nothing is specified.
>> +- enable-gpio		: GPIO used to enable/disable the regulator.
>> +			  Warning, the GPIO phandle flags are ignored and the
>> +			  GPIO polarity is controlled solely by the presence
>> +			  of "enable-active-high" DT property. This is due to
>> +			  compatibility with old DTs.
>> +- enable-active-high	: Polarity of "enable-gpio" GPIO is active HIGH.
>> +			  Default is active LOW.
>> +- gpios			: Array of one or more GPIO pins used to select the
> 
> I think this must be a required property.

I'd say I agree, unless there's some obscure ancient edge case, which I
didn't find.

>> +			  regulator voltage/current listed in "states".
>> +- gpios-states		: Initial state of GPIO pins in "gpios" array.
>> +			  0: LOW, 1: HIGH.
>> +			  Default is LOW if nothing else is specified.
> 
> This is not very clear. Maybe add an example below or explain it better.
> 
> I guess we can't change it now anymore anyway, but it's not clear to
> me, why we have this in the first place: A regulator should only be
> active when it has a consumer or is "always-on".

Be careful here, the regulator-gpio may be instantiated such that it
will select between two voltage states, neither of which is 0V/off.
Consider eMMC vccq supply, which alternates between 1V8 and 3V3, but
does not have a third, 0V/off state (unless you pull the plug).

> IIRC the regulator
> core automatically selects the lowest voltage/current compatible with
> all consumers. It seems the only usecase is to specify an initial
> state that is different from all states in the "states" property, before
> the regulator is turned on for the first time. However it also is not
> an off-state, because it won't be set again on turning the regulator off.

Correct, this is not an off state. If you have a better wording, I am
open to that.

>>  - startup-delay-us	: Startup time in microseconds.
> 
> Not relevant for your patch, but I wonder why this is not in the
> generic regulator binding.

Presumably because it's implemented only be the gpio regulator driver,
however it could be moved into the core (?)

>> -- enable-active-high	: Polarity of GPIO is active high (default is low).
>>  - regulator-type	: Specifies what is being regulated, must be either
>>  			  "voltage" or "current", defaults to voltage.
> 
> HTH,
> Harald
> 


-- 
Best regards,
Marek Vasut
