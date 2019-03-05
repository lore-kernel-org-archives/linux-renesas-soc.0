Return-Path: <SRS0=F/Q8=RI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCC4C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 12:38:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0761D2084F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 12:38:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETrybv2A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbfCEMi2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Mar 2019 07:38:28 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55543 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728089AbfCEMi2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Mar 2019 07:38:28 -0500
Received: by mail-wm1-f66.google.com with SMTP id q187so2406643wme.5;
        Tue, 05 Mar 2019 04:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ai2zzdBSHoIfjMAF1bDaEJ1Dm1JDnQP1t5RdE32s68c=;
        b=ETrybv2AWJa099CkmM0caEjXki7lO2lJh1KHrq4/7YSvNlRnseF9o/QVOzcEOnuBeR
         cXXZMJxU0SRmikJ0rFJPFsQfoqPMdZrwERtCInQcgMwWmfhZIvw1PMogQnb3y0rTI/fd
         tePoVxADZC5jsOx4cJZ/w8+9wf1x/p43rLcxmBwchqAzGHOt00eXbQSw91lzJAqhRvbw
         XebmAqUCdncWAgsdEjaSBpQ1tqF/8VJhNSg6QAwJRvJpfKuCwm2M1wgF5jE4eXe/kt5T
         YlZhMPz+zsP7Zw4sYJ6Xqnvspr652EyimvCPe2x6m0SXYuijwYtwQOCaJNtg/tjF8Jnu
         RAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ai2zzdBSHoIfjMAF1bDaEJ1Dm1JDnQP1t5RdE32s68c=;
        b=NniVlgkdkJOemG9xPDPBMmuja4kGOyxmIR5RYJo/pHy7uaoQVkJydNmQaAWaDGdYLS
         XSW6rUlNZt8kT7CJQbDHxT84J4Pr2kGPYzgRFTBjVZtCyTUJKAPdvyvYzQerEnc1LfC4
         r4IstjFSBgkBTe64VwSVDmUhEJhThubqDaTqvmh2DP6c7e8eIVIr1fXhp42G8KfMm00m
         IkTmYiZyXGU7ErnvXM55hklXGChslwLL+emzkBE6bB8b36tRJQ1FxG4kfYaCzFonJyAC
         9ooFvy7BsbTpHbKSfZH96W4WCf7/uYHYMF187XGjq439MSGKEV7v4HAsK9RiPANSkDaL
         XdZQ==
X-Gm-Message-State: APjAAAXGm9WKVkx0sZ/Ao0DMujWl0dhjekjRAK4m2zSr1VuLF/148yIj
        iXPU1Tiu68rLCs+TWsl9Jcoo9Ee1
X-Google-Smtp-Source: APXvYqyEIeoZKI++WEreKu94C6IekPQ3D8J9N8ch16wB4uPbydL6mFLRmnnUuOvpBBA+sfPUf8ZHvw==
X-Received: by 2002:a1c:4009:: with SMTP id n9mr2560013wma.132.1551789504736;
        Tue, 05 Mar 2019 04:38:24 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id i74sm11795539wmg.48.2019.03.05.04.38.23
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Mar 2019 04:38:23 -0800 (PST)
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
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <834f8576-73a4-be0f-e322-91601bed5388@gmail.com>
Date:   Tue, 5 Mar 2019 11:59:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <E1h16yh-0000OM-5J@stardust.g4.wien.funkfeuer.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/5/19 11:07 AM, Harald Geyer wrote:
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
>> V2: - Make "gpios" a mandatory property
>>     - Reword "gpio-states" property description
>>     - Change "enable-gpio" to "enable-gpios" to match modern DT rules
>> Note: The recent gpio-regulator rework caused breakage. While the
>>       changes in the gpio-regulator code were according to the DT
>>       binding document, they stopped working with older DTs. Make
>>       the binding document clearer to prevent such breakage in the
>>       future.
> 
> Thanks for the update. I think it addresses all my concerns except for
> one:
> 
>> +- gpios-states	: State of GPIO pins in "gpios" array that is set until
>> +			  changed by the first consumer. 0: LOW, 1: HIGH.
>> +			  Default is LOW if nothing else is specified.
> 
> I still believe this not true: There is no guarantee that the regulator
> core won't change the state of GPIO pins before the first consumer comes
> up.

Why would it do that ? That would completely invalidate any remaining
useful-ness of this property.

> I still think my proposal describes the property more acurately:
> gpios-states : On operating systems, that don't support reading back gpio
>                values in output mode (most notably linux), this array
>                provides the state of GPIO pins set when requesting them
>                from the gpio controller. Systems, that are capable of
>                preserving state when requesting the lines, are free to
>                ignore this property. 0: LOW, 1: HIGH. Default is LOW if
>                nothing else is specified.
> 
> Since we had this discussion already in the V1 thread and you clearly don't
> agree with me, the maintainers will need to decide. You can add 
> Reviewed-by: Harald Geyer <harald@ccbib.org>
> once Rob and/or Mark have addressed this issue.

I think we're just looking at this from two different perspectives and
for whatever reason can't reconcile them.

> Thanks for your work!
> Harald
> 


-- 
Best regards,
Marek Vasut
