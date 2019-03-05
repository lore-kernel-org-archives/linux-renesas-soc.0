Return-Path: <SRS0=F/Q8=RI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BC7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 19:21:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAC612075B
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 19:21:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjcG2Ati"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfCETVP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Mar 2019 14:21:15 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37404 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbfCETVP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Mar 2019 14:21:15 -0500
Received: by mail-wr1-f68.google.com with SMTP id w6so10738546wrs.4;
        Tue, 05 Mar 2019 11:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nyxn1CnnpAr1vU3wni/jPlvids6kiTUWWBJdfDsVk5E=;
        b=GjcG2AtiQBfddWDh4wqhV94jtDOt65KjQ8zZvfwxHQNcJ3n+H9aN7Qw3y2/2BynKxp
         6IjlWi8mjZd2e3+Bt4bERxaunPAoyLoQSu71gz259JIbc6omEpaIu0rczuxyCYN4PDkS
         EHtCnFxC981CHnVWzjjkWDxxK/oJaZOymrew4qHuYcaPXaQ3wJHfdElJzX/p2Uc4e7Nt
         zS6wNxibxXFJ3H6+JRc0MgJsL4hal1Ob24anK7ayskED6x4WN7zJdsh8yYwdGoKLENv+
         NlKDu0/DT/oFVz5W9iw16g8jokuOAfU/sK58R9C4fJN6p34i2wEq8c9q8Wax20vr6WtN
         HJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nyxn1CnnpAr1vU3wni/jPlvids6kiTUWWBJdfDsVk5E=;
        b=geaJdhGeOjoOKrFIsVO63w32kV9pU5upX+yoy/ejNY1kcHR/uCLHGyi1liRt9vr8Ps
         P/lZdJfimMVmvvULW42+XKS1HDmulAQ5j6UYjzP9ugWOezd2Z/xhS5TuqJnBnxWW6SAn
         3cIJR/y8hrg2SUFtflkE/DP3fzNuun4JZZ+GW/DYRw8obU87fA2FxXGl6x1A72EExxt9
         6Kxo8NxUypaxYi0HnuzvdpTp+sJtDcRUQPJLZEEA69gZCIIxAqad44EtY7MYsCYpvn0y
         vZAESQqrOT98rvMEyio5szzUjIDfYJ1ZqppxjLKvE/wKrpzj6fEsvVkCTBWGQYC4yPZB
         QMug==
X-Gm-Message-State: APjAAAUf2fpVpkH+Q3F03zPobjf5XmOY0xaLjttTO2IfOFgGcCL3CrCJ
        4HW+hHjAjj99aw61Xwf+jbVi8Gj5
X-Google-Smtp-Source: APXvYqxa3fPFiC6Gsn7Lj/2BNq5RbHzCfACXLy0geYQNVYnJrr3LI9dUO/UNUKNya+HWZCeYWAenDA==
X-Received: by 2002:adf:b601:: with SMTP id f1mr339662wre.158.1551813671816;
        Tue, 05 Mar 2019 11:21:11 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id y140sm804856wmd.18.2019.03.05.11.21.10
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Mar 2019 11:21:11 -0800 (PST)
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
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <4d1cd905-c322-78e5-cb9c-dadba01b0324@gmail.com>
Date:   Tue, 5 Mar 2019 20:01:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <E1h1Ce9-0000JA-Rs@stardust.g4.wien.funkfeuer.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/5/19 5:10 PM, Harald Geyer wrote:
> Marek Vasut writes:
>> On 3/5/19 11:07 AM, Harald Geyer wrote:
>>> marek.vasut@gmail.com writes:
>>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>
>>>> Reword the binding document to make it clear how the propeties work
>>>> and which properties affect which other properties.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>> Cc: Harald Geyer <harald@ccbib.org>
>>>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>> Cc: Mark Brown <broonie@kernel.org>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> To: devicetree@vger.kernel.org
>>>> ---
>>>> V2: - Make "gpios" a mandatory property
>>>>     - Reword "gpio-states" property description
>>>>     - Change "enable-gpio" to "enable-gpios" to match modern DT rules
>>>> Note: The recent gpio-regulator rework caused breakage. While the
>>>>       changes in the gpio-regulator code were according to the DT
>>>>       binding document, they stopped working with older DTs. Make
>>>>       the binding document clearer to prevent such breakage in the
>>>>       future.
>>>
>>> Thanks for the update. I think it addresses all my concerns except for
>>> one:
>>>
>>>> +- gpios-states	: State of GPIO pins in "gpios" array that is set until
>>>> +			  changed by the first consumer. 0: LOW, 1: HIGH.
>>>> +			  Default is LOW if nothing else is specified.
>>>
>>> I still believe this not true: There is no guarantee that the regulator
>>> core won't change the state of GPIO pins before the first consumer comes
>>> up.
>>
>> Why would it do that ?
> 
> Because the regulator core doesn't know about this driver specific
> property at all. And without any constraints placed by consumers, the
> core is free to choose any state whatsoever at any point in time.

But git grep seems to disagree, see drivers/regulator/gpio-regulator.c:
                    ret = of_property_read_u32_index(np, "gpios-states", i,

The core sets the pins to such a value until the consumer takes over.

>> That would completely invalidate any remaining
>> useful-ness of this property.
> 
> Yes, I believe this property is mostly useless. That's what I want to
> get across with my wording proposal. The remaining usecase, that I can see,
> is when the GPIOs have been setup by the bootloader and we don't want
> to reset them to low during probing (which some OSes might be capable
> of, but linux currently doesn't). Also a state of all GPIOs low might
> be invalid (not in the "states" property), so we shouldn't set all GPIOs
> to low during probing in that case.

I presume the bootloader might even add this property to DT based on the
state in which it leaves the GPIOs in.

> HTH,
> Harald
> 
>>> I still think my proposal describes the property more acurately:
>>> gpios-states : On operating systems, that don't support reading back gpio
>>>                values in output mode (most notably linux), this array
>>>                provides the state of GPIO pins set when requesting them
>>>                from the gpio controller. Systems, that are capable of
>>>                preserving state when requesting the lines, are free to
>>>                ignore this property. 0: LOW, 1: HIGH. Default is LOW if
>>>                nothing else is specified.
>>>
>>> Since we had this discussion already in the V1 thread and you clearly don't
>>> agree with me, the maintainers will need to decide. You can add 
>>> Reviewed-by: Harald Geyer <harald@ccbib.org>
>>> once Rob and/or Mark have addressed this issue.
>>
>> I think we're just looking at this from two different perspectives and
>> for whatever reason can't reconcile them.
>>
>>> Thanks for your work!
>>> Harald
>>>
>>
>>
>> -- 
>> Best regards,
>> Marek Vasut
> 


-- 
Best regards,
Marek Vasut
