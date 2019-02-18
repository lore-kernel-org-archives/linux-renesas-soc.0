Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63FEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 18:58:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B89D217F5
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 18:58:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg0lHyTY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbfBRS6O (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 13:58:14 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34745 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728023AbfBRS6N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 13:58:13 -0500
Received: by mail-wr1-f67.google.com with SMTP id f14so19617738wrg.1;
        Mon, 18 Feb 2019 10:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kOXyUB1hkKYAVLorgepPBwfjTWjomS7ZBZd8R0N9qHc=;
        b=Yg0lHyTYXuzVyFxS7qfFPPEDcCqzolI7jlq1Fn7WqA4RJlDDR+Y2RDHBAGATY3G4OV
         XP7DPdHI1Snql9n9xtNcl7iTbdjMO3upmGZyHthRKGP+Qj+RcAvnnqwZHrYVWgIdg88r
         DhbFAf3cLq9o6fE6/6hG8WlVi/CJGjIk1BWAJUUbAIKGbv0fNp4LzKR4DLuYtbV2uMfe
         UOaeZaeO9KaV14PQ2QUQbtCc5vtDpqY8NhbwmI64TQtCkPnfNXgpuaV2OuCM0uBS59md
         FFPKaEkU3crERCVBTpc9V49BmV0RdY/UX6Xg8Rt0DaHHC7lP6hw0BHAeWoVS48FW9Wnj
         aooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kOXyUB1hkKYAVLorgepPBwfjTWjomS7ZBZd8R0N9qHc=;
        b=P6kY2Ggyy/FdRvrYftNYLBX6twbpbeu58NdwP1x88kYWojmt5eR0yJ1x4Xdfpc6zW0
         nB6S85/Pu9yCeKIs5i1pYRrYSWhmauPqLwZFzvzhAuqyrRNIBmmPeqs/zD5pXwFkcBVC
         LMXRYhLVlPp7cgfXoASZ9oF7s91BWicAKB2/5PNT1rBDZ8wDxnGIER2b7G/SIUGabz3R
         TT5/cqTmYQ3RgvtHChARetL2mYCMCopuW+wNqoAXM73Mgp0HQ0YLpL2X5UsiqAdFxFMJ
         kuMRyiEeoYpLDjGDrNbPXkZcuhWZwsiScRFvQq7BdThNo4QJylCRF8Ao/UGaovcXAqVY
         1pZw==
X-Gm-Message-State: AHQUAubVNZOuwwCMDFL1GyVXhSV5pJ0Ffa6Lw2EGl1to/2A+8jS8FyWS
        YnhkTz9q9GcnOKOc8JPw56osvuIG
X-Google-Smtp-Source: AHgI3IajqXQcS9WdMeoK3JwtqPLVyFiMqq69bn0ZypDCl3VGvYIrjngwPBPTPNL4yg9eVwxqcLNR4w==
X-Received: by 2002:adf:eec6:: with SMTP id a6mr907127wrp.296.1550516290892;
        Mon, 18 Feb 2019 10:58:10 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id y145sm107594wmd.30.2019.02.18.10.58.09
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 10:58:10 -0800 (PST)
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
 <75846117-242c-6861-ace5-dccf88711208@gmail.com>
 <E1gvSbw-0000K8-Hj@stardust.g4.wien.funkfeuer.at>
 <7a993282-9137-caf4-ca0b-b2c01ea9959c@gmail.com>
 <E1gvfnE-0000Il-Jo@stardust.g4.wien.funkfeuer.at>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <e2e9e577-b110-fc9b-c129-26f61e862fb4@gmail.com>
Date:   Mon, 18 Feb 2019 19:58:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <E1gvfnE-0000Il-Jo@stardust.g4.wien.funkfeuer.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/18/19 11:04 AM, Harald Geyer wrote:

[...]

>>>>>>> IIRC the regulator
>>>>>>> core automatically selects the lowest voltage/current compatible with
>>>>>>> all consumers. It seems the only usecase is to specify an initial
>>>>>>> state that is different from all states in the "states" property, before
>>>>>>> the regulator is turned on for the first time. However it also is not
>>>>>>> an off-state, because it won't be set again on turning the regulator off.
>>>>>>
>>>>>> Correct, this is not an off state. If you have a better wording, I am
>>>>>> open to that.
>>>>>
>>>>> I think it should be clearer that this is an array. (Looking at various
>>>>> users I doubt everybody was aware of that, but since we have only instances
>>>>> with one gpio, there is no functional difference between array and bit field.)
>>>>> Also it should be recommended to set this to match whatever the bootloader
>>>>> sets up. Maybe something like:
>>>>>
>>>>> - gpios-states: Array of GPIOs values set during probing the regulator.
>>>>> 		0: LOW, 1: HIGH. If continuous operation during boot is
>>>>> 		desired, this needs to match what the firmware or bootloader
>>>>> 		sets up. By default all GPIOs are set to low during probing.
>>>>
>>>> gpios-states has nothing to do with continuous operation, that's what
>>>> enable-gpios is for, we should not confuse the readers with it.
>>>
>>> I think we have some misunderstanding here, because I don't see how
>>> enable-gpios is relevant. Also maybe I still haven't understood the
>>> usecase, but IMO that indicates, that it should be cleared up in
>>> the document.
>>
>> The enable-gpios property is what turns the regulator ON/OFF , the
>> gpio-states is what selects the output voltage/current . Thus, I think
>> we should not mention "continuous operation" in the description.
> 
> Okay, I see where you are coming from. Yes, gpios-states is only part
> of what is required for continuous operation during boot. Still it seems
> to be the only realistic usecase, we have come up so far. (Also in
> existing DTs it seems to be used mostly with "boot-on" regulators.)

Consider eMMC bus voltage switch, which only selects between 3V3 and 1V8
. It has nothing to do with continuous operation, it just selects one
voltage level or the other.

So what about

gpios-states : Initial state of GPIO pins in "gpios" array, set on
system start and retained until consumer changes the state. 0: LOW, 1:
HIGH. Default is LOW if nothing else is specified.

> Maybe we can word it better then I did above, but I think mentioning
> this helps a lot to make it clearer how an implementation must behave
> if this property is present.
> 
>>>> Also
>>>> note that "probing" is OS specific, so we should use "default" instead.
>>>> What about this:
>>>
>>>> gpios-states		: Array of initial states of GPIO pins in "gpios" array.
>>>> 0: LOW, 1: HIGH. Default is LOW if nothing else is specified.
>>>
>>> "initial" is a bit too unspecific IMO.
>>
>> Well, got any better idea ? It's not "default" either.
> 
> Yes, it's difficult - which is why I cheated above and described what the
> linux implementation does instead of describing it in general terms.
> If the semantics of this property are too unclear to unambiguously
> describe in an implementation indepenent way, then that's a point in
> favor of marking this property deprecated and let whoever actually
> needs it come up with something better.

We still need to support it though, due to older DTs, so we should make
it clear what it does.

>>> I believe this description doesn't define behaviour sufficiently and a
>>> future rewrite (or reimplementation for a different OS) is likely to
>>> interpret it in an incompatible way. I think one could even argue that
>>> completely ignoring this property and just setting up a valid state from
>>> "states" is allowed behaviour. This would likely break existing DTs, where
>>> among other things this regulator is used to set the CPU's voltage.
>>
>> I suspect ignoring this property, when it's present, wouldn't be a good
>> idea. After all, it adds additional information about the behavior of
>> the system upon start up.
> 
> Yes, it wouldn't be good, because it likely causes breakage. No, I don't
> think it adds much additional information, because it is too unclear.
> 
>> btw I am rewording it exactly because there was a recent breakage in the
>> regulator code.
> 
> Yeah, thanks for that. Your patch is an improvement and shouldn't be
> held back because it doesn't address the other problems discussed above.

I am hoping maybe someone who's actually native english speaker can help
out with the fine wording.

-- 
Best regards,
Marek Vasut
