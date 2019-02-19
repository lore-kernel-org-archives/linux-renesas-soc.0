Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2B4C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 17:23:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36EEA21773
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 17:23:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjTX26Le"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfBSRXC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 12:23:02 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33839 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbfBSRXC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 12:23:02 -0500
Received: by mail-wr1-f67.google.com with SMTP id f14so22957967wrg.1;
        Tue, 19 Feb 2019 09:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JgZWnv/2abERn6AQHmcGmSUNk9wMSH8c060c9H3QGqM=;
        b=EjTX26LeKrx5LSft2SJ5QmQsAYijciMaakpiS1VZ+duxHGG5VJ8/HRdDKqaKOhNGbI
         V0RlIjjhzr5llMSIWZ4NL+mUUpWP1NaKAUoSzrlWBB+5fIpbzxGgIy2jhRvQFo5u5j5g
         8Ck1PCWJAwTveywS40D3u9NsY800Bpi7n3cM9EUkS16HA/nS533+vfS002q0FojSA4KZ
         W8lP1nEu7FO7Kr+i27owURul2R/BraSNuAJ6yywlgB4fTCt/x1gwKzDyc4qBY3sTi1Yt
         YnyUHL/81ZfABTTDhcKhfWkcWWlKR8ARDy7pOEUxQw7z3AAdr7S1sjQK1vkdPwbQda6B
         dmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JgZWnv/2abERn6AQHmcGmSUNk9wMSH8c060c9H3QGqM=;
        b=kpzC2mtwCMt1HrWlnN+iGP79Ulx7sCzDaKODt/cu8CCGG5KMi2TC5o3Vhnl9Qr9Up+
         2g45fmXC8Siv4Fv5XI6JJ5TbS2MRKlttVYBer1edkt+hUQVDmCpYhp0NUuGQ0Gp7fZ9z
         WCdQb7KFki2p5XnaS277uHZ6iqU5kA3vWkcn4yl1UPfSAS7/rAF0zfPNx8k/AztMtr53
         BRyWLay5yRl3t2po4gIOVARh068OgEkfm841gf9hRvRlQy6uEpmYlqtOMj4RF9Jpq+52
         KV41y+YcyEaIGrSc4Xkc0BA0TuwMAmF2HxCTiQCybtxr6W4Ow/Tc1msXUzLZeJXd8zme
         UWsQ==
X-Gm-Message-State: AHQUAuYZeHyDQwn8pzkWjxiDFM4y4EHPy969EyPw6gDaskRBDw/BdfBf
        sF/kAaPPYUBeQhBDusg8TlvIHkeK
X-Google-Smtp-Source: AHgI3IaYG9arEvqaml2ZCxBxzmnoPCnnUhd2xg9mLexr3EwGofeXy4fXSYxLItwaQgRmmd3nGx2IjQ==
X-Received: by 2002:adf:ecc7:: with SMTP id s7mr21082168wro.255.1550596979500;
        Tue, 19 Feb 2019 09:22:59 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id d16sm16133762wru.52.2019.02.19.09.22.58
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Feb 2019 09:22:58 -0800 (PST)
Subject: Re: [PATCH] gpio: of: Apply regulator-gpio quirk only to enable-gpios
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>, Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20190216134627.1601-1-marek.vasut@gmail.com>
 <20190219151811.GA13354@ulmo>
 <631beb2b-786e-e182-acea-561b0706b041@gmail.com>
 <20190219160800.GA30280@ulmo>
 <805f638e-2d55-803b-b09c-617d3a503408@gmail.com>
 <20190219170537.GA14351@ulmo>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <f08a4e16-e0f3-164c-4bf8-b61d65bf355b@gmail.com>
Date:   Tue, 19 Feb 2019 18:22:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190219170537.GA14351@ulmo>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/19/19 6:05 PM, Thierry Reding wrote:
> On Tue, Feb 19, 2019 at 05:30:35PM +0100, Marek Vasut wrote:
>> On 2/19/19 5:08 PM, Thierry Reding wrote:
>>> On Tue, Feb 19, 2019 at 04:25:59PM +0100, Marek Vasut wrote:
>>>> On 2/19/19 4:18 PM, Thierry Reding wrote:
>>>>> On Sat, Feb 16, 2019 at 02:46:27PM +0100, marek.vasut@gmail.com wrote:
>>>>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>>>
>>>>>> Since commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptors")
>>>>>> the GPIO regulator had inverted the polarity of the control GPIO. This
>>>>>> problem manifested itself on systems with DT containing the following
>>>>>> description (snippet from salvator-common.dtsi):
>>>>>>
>>>>>> 	gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
>>>>>> 	gpios-states = <1>;
>>>>>> 	states = <3300000 1
>>>>>> 		  1800000 0>;
>>>>>>
>>>>>> Prior to the aforementioned commit, the gpio-regulator code used
>>>>>> gpio_request_array() to claim the GPIO(s) specified in the "gpios"
>>>>>> DT node, while the commit changed that to devm_gpiod_get_index().
>>>>>>
>>>>>> The legacy gpio_request_array() calls gpio_request_one() and then
>>>>>> gpiod_request(), which parses the DT flags of the "gpios" node and
>>>>>> populates the GPIO descriptor flags field accordingly.
>>>>>>
>>>>>> The new devm_gpiod_get_index() calls gpiod_get_index(), then
>>>>>> of_find_gpio(), of_get_named_gpiod_flags() with flags != NULL,
>>>>>> and then of_gpio_flags_quirks(). Since commit a603a2b8d86e
>>>>>> ("gpio: of: Add special quirk to parse regulator flags"),
>>>>>> of_gpio_flags_quirks() contains a quirk for regulator-gpio
>>>>>> which was never triggered by the legacy gpio_request_array()
>>>>>> code path, but is triggered by devm_gpiod_get_index() code
>>>>>> path.
>>>>>>
>>>>>> This quirk checks whether a GPIO is associated with a fixed
>>>>>> or gpio-regulator and if so, checks two additional conditions.
>>>>>> First, whether such GPIO is active-low, and if so, ignores the
>>>>>> active-low flag. Second, whether the regulator DT node does
>>>>>> have an "enable-active-high" property and if the property is
>>>>>> NOT present, sets the GPIO flags as active-low.
>>>>>>
>>>>>> The second check triggers a problem, since it is applied to all
>>>>>> GPIOs associated with a gpio-regulator, rather than only on the
>>>>>> "enable" GPIOs, as the old code did. This changes the way the
>>>>>> gpio-regulator interprets the DT description of the control
>>>>>> GPIOs.
>>>>>>
>>>>>> The old code using gpio_request_array() explicitly parsed the
>>>>>> "enable-active-high" DT property and only applied it to the
>>>>>> GPIOs described in the "enable-gpios" DT node, and only if
>>>>>> those were present.
>>>>>>
>>>>>> This patch fixes the quirk code by only applying the quirk
>>>>>> to "enable-gpios", thus restoring the old behavior.
>>>>>>
>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>>> Cc: Jan Kotas <jank@cadence.com>
>>>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>>>> Cc: Mark Brown <broonie@kernel.org>
>>>>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>>>> To: linux-gpio@vger.kernel.org
>>>>>> ---
>>>>>>  drivers/gpio/gpiolib-of.c | 1 +
>>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> This causes a runtime regression on Jetson TX1. The symptoms are that
>>>>> HDMI monitors are no longer reliably detected as plugged in. The reason
>>>>> is because the GPIO polarity for the HDMI +5V regulator is now reversed
>>>>> and therefore the HPD signal, which is usually fed by the +5V signal,
>>>>> does not reflect the correct value.
>>>>>
>>>>> Now it's somewhat confusing to me why this wasn't broken before. We have
>>>>> this in device tree:
>>>>>
>>>>> 		vdd_hdmi: regulator@10 {
>>>>> 			compatible = "regulator-fixed";
>>>>> 			reg = <10>;
>>>>> 			regulator-name = "VDD_HDMI_5V0";
>>>>> 			regulator-min-microvolt = <5000000>;
>>>>> 			regulator-max-microvolt = <5000000>;
>>>>> 			gpio = <&exp1 12 GPIO_ACTIVE_LOW>;
>>>>> 			enable-active-high;
>>>>> 			vin-supply = <&vdd_5v0_sys>;
>>>>> 		};
>>>>>
>>>>> This is from arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi. The above
>>>>> is obviously wrong because it specifies GPIO_ACTIVE_LOW and I do see the
>>>>> warning from the GPIO library about how this is being ignored. However,
>>>>> the above works fine on today's linux-next with this commit reverted
>>>>> because the quirks will cause the GPIO_ACTIVE_LOW flag to be ignored.
>>>>>
>>>>> However, with this commit applied, the quirk will be skipped for the
>>>>> regulator and cause the GPIO_ACTIVE_LOW flag to be used to invert the
>>>>> GPIO during enable and disable operations.
>>>>>
>>>>> Now, this is clearly a bug in the DT and I'm going to send out a patch
>>>>> to fix that up, but I think we need to revert this patch for now because
>>>>> there may be other cases out there that are broken.
>>>>
>>>> This patch fixes a breakage on R-Car Gen3 platforms, so reverting this
>>>> patch will break those platforms. However, those platforms do not have a
>>>> buggy DT, unlike the Jetson.
>>>
>>> Erm... that's not how we do things. You can't break one platform just to
>>> make another work. By all means let's fix breakage on R-Car Gen3
>>> platforms, but let's do it in a way that keeps everyone else happy as
>>> well.
>>
>> Erm... that's not what I suggested. It's just that this regulator rework
>> ( d6cd33ad7102 ) changed the behavior of the gpio-regulator because
>> there are a lot of obscure, inobvious and undocumented edge-cases in the
>> gpio-regulator code.
> 
> Sorry if I misinterpreted what you were saying.

Sorry, my English just sucks ;-/

>> If we were to revert this patch, we'd have to revert the d6cd33ad7102
>> too to fix the Gen3. But since d6cd33ad7102 is a nice cleanup and it
>> makes sense, I'd rather if we fixed the situation, restored the DT
>> handling to the way it was before and moved forward.
> 
> Okay, sounds like we have the same goal, and from what you said earlier
> the proposed fixup on top of your patch should fix this for everyone.
> Let's hope there aren't any more nasty corner cases.

Sounds good!

>> Handling broken DTs only adds to the complexity, but I think this cannot
>> be helped, since those DTs can be stored in some ROM.
> 
> FWIW, the Jetson TX1 DT isn't technically broken because it used to work
> fine. It's just that it relied on the quirks for correctness. So we are
> in the lucky situation that the DT is not in a ROM and we can easily
> update it, but I agree, others may be in a different situation, so let's
> fix this so that things are back to normal for everyone. That doesn't
> mean that we shouldn't fix DTs when we can, so I'll still send out that
> DT patch for Jetson TX1.

Thanks!

>> btw if you can, also look at
>> [PATCH] regulator: gpio: Reword the binding document
>> the binding document could use a once-over.
> 
> Okay, I'll take a look.

:)

-- 
Best regards,
Marek Vasut
