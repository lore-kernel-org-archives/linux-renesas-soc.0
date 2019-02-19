Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0049C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 15:26:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B13DA2146E
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 15:26:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGttzoJO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbfBSP0F (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 10:26:05 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42554 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbfBSP0E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 10:26:04 -0500
Received: by mail-wr1-f66.google.com with SMTP id r5so9071452wrg.9;
        Tue, 19 Feb 2019 07:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wCYqUzbvdjO1/VVIHm0a/+gfkA+1LkYSd+YlZbRg/fg=;
        b=SGttzoJOOJsTA3iWYR7CMJzMRm983LvosDEKRprV5FnfOarFYQYer/NVy+2wQZX/+A
         vtBzOqgFCgmGwKBeyHCe34joZG1F/zmIkSQO8wAobt/8gTbbBMaWfJ5qx4ZXKhFxZ2V6
         CFU1kq7N7gY0PLrgxMdd62qhzerGDFbc2+3DqkHxotLF1BmnDD6JHsgQbjD9G5jFkNhP
         t1IvA4ZTaxi2Dbyd8RlweljwD4jRy935CEGHgZIZlQBh9AmpfB3BdChflptNmC1f63x2
         YM2JPOIpfmdrbwe+VQ+FA/KUW54AxxjU3i1+zWq8yiWn47SKzMvcBln3/T6yju5+MfmW
         CJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wCYqUzbvdjO1/VVIHm0a/+gfkA+1LkYSd+YlZbRg/fg=;
        b=Xp++dbJDe8zJ+xv1OWVvRojkq1wVzg0w1oUVjZEmFLo1Bv9ToehqR6llXkscYYg/JP
         iaeLXJ1grNJ7MNpQoSsv9wv5mPsqkUNDGwZznquBBVEoAoSlbsLiV/FIaDesyAbXEtGQ
         RBdfYah7+fHP+X8RWcE9m2to0vlAJ4f5V0fPaG1PkvxHw1CRT03Od+QsYgcKlfrX3UWB
         TZuZVSIKUHca75U8nniwt1EfQd9JbUd9I6MY0lYWaa7RtFhvutw9J+8ZoEHOGFJwGJTw
         X6blkELz+9h3u8T02CifmA1F0mRWFv92Pe2AFV8efWndBW1LZgNe7eZcQnBpUVjUAQeq
         vfVg==
X-Gm-Message-State: AHQUAub4M9prJrT5MhVIt/Up5DsZvtaKRz8PhH3UU7HFyGn47CS8z7Pr
        v6+jLDLEqTbddfwI9pCCNoqd+quP
X-Google-Smtp-Source: AHgI3IbWEGtzjXQU04iMKf/Sy/hH1G4gYymyFWnQp61HbhuOOlIoNysy32QS00xqTNUOrRebNMDMVQ==
X-Received: by 2002:adf:8143:: with SMTP id 61mr20338799wrm.47.1550589961223;
        Tue, 19 Feb 2019 07:26:01 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c1sm3926586wmb.14.2019.02.19.07.25.59
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Feb 2019 07:26:00 -0800 (PST)
Subject: Re: [PATCH] gpio: of: Apply regulator-gpio quirk only to enable-gpios
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20190216134627.1601-1-marek.vasut@gmail.com>
 <20190219151811.GA13354@ulmo>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <631beb2b-786e-e182-acea-561b0706b041@gmail.com>
Date:   Tue, 19 Feb 2019 16:25:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190219151811.GA13354@ulmo>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/19/19 4:18 PM, Thierry Reding wrote:
> On Sat, Feb 16, 2019 at 02:46:27PM +0100, marek.vasut@gmail.com wrote:
>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
>> Since commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptors")
>> the GPIO regulator had inverted the polarity of the control GPIO. This
>> problem manifested itself on systems with DT containing the following
>> description (snippet from salvator-common.dtsi):
>>
>> 	gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
>> 	gpios-states = <1>;
>> 	states = <3300000 1
>> 		  1800000 0>;
>>
>> Prior to the aforementioned commit, the gpio-regulator code used
>> gpio_request_array() to claim the GPIO(s) specified in the "gpios"
>> DT node, while the commit changed that to devm_gpiod_get_index().
>>
>> The legacy gpio_request_array() calls gpio_request_one() and then
>> gpiod_request(), which parses the DT flags of the "gpios" node and
>> populates the GPIO descriptor flags field accordingly.
>>
>> The new devm_gpiod_get_index() calls gpiod_get_index(), then
>> of_find_gpio(), of_get_named_gpiod_flags() with flags != NULL,
>> and then of_gpio_flags_quirks(). Since commit a603a2b8d86e
>> ("gpio: of: Add special quirk to parse regulator flags"),
>> of_gpio_flags_quirks() contains a quirk for regulator-gpio
>> which was never triggered by the legacy gpio_request_array()
>> code path, but is triggered by devm_gpiod_get_index() code
>> path.
>>
>> This quirk checks whether a GPIO is associated with a fixed
>> or gpio-regulator and if so, checks two additional conditions.
>> First, whether such GPIO is active-low, and if so, ignores the
>> active-low flag. Second, whether the regulator DT node does
>> have an "enable-active-high" property and if the property is
>> NOT present, sets the GPIO flags as active-low.
>>
>> The second check triggers a problem, since it is applied to all
>> GPIOs associated with a gpio-regulator, rather than only on the
>> "enable" GPIOs, as the old code did. This changes the way the
>> gpio-regulator interprets the DT description of the control
>> GPIOs.
>>
>> The old code using gpio_request_array() explicitly parsed the
>> "enable-active-high" DT property and only applied it to the
>> GPIOs described in the "enable-gpios" DT node, and only if
>> those were present.
>>
>> This patch fixes the quirk code by only applying the quirk
>> to "enable-gpios", thus restoring the old behavior.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Jan Kotas <jank@cadence.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> To: linux-gpio@vger.kernel.org
>> ---
>>  drivers/gpio/gpiolib-of.c | 1 +
>>  1 file changed, 1 insertion(+)
> 
> This causes a runtime regression on Jetson TX1. The symptoms are that
> HDMI monitors are no longer reliably detected as plugged in. The reason
> is because the GPIO polarity for the HDMI +5V regulator is now reversed
> and therefore the HPD signal, which is usually fed by the +5V signal,
> does not reflect the correct value.
> 
> Now it's somewhat confusing to me why this wasn't broken before. We have
> this in device tree:
> 
> 		vdd_hdmi: regulator@10 {
> 			compatible = "regulator-fixed";
> 			reg = <10>;
> 			regulator-name = "VDD_HDMI_5V0";
> 			regulator-min-microvolt = <5000000>;
> 			regulator-max-microvolt = <5000000>;
> 			gpio = <&exp1 12 GPIO_ACTIVE_LOW>;
> 			enable-active-high;
> 			vin-supply = <&vdd_5v0_sys>;
> 		};
> 
> This is from arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi. The above
> is obviously wrong because it specifies GPIO_ACTIVE_LOW and I do see the
> warning from the GPIO library about how this is being ignored. However,
> the above works fine on today's linux-next with this commit reverted
> because the quirks will cause the GPIO_ACTIVE_LOW flag to be ignored.
> 
> However, with this commit applied, the quirk will be skipped for the
> regulator and cause the GPIO_ACTIVE_LOW flag to be used to invert the
> GPIO during enable and disable operations.
> 
> Now, this is clearly a bug in the DT and I'm going to send out a patch
> to fix that up, but I think we need to revert this patch for now because
> there may be other cases out there that are broken.

This patch fixes a breakage on R-Car Gen3 platforms, so reverting this
patch will break those platforms. However, those platforms do not have a
buggy DT, unlike the Jetson.

> The whole point of
> these quirks is also to make sure that existing device trees continue to
> work.
> 
> Also, checking for only the enable-gpio property is wrong in this case.
> enable-gpio is only specified for regulator-gpio. The standard GPIO for
> regulator-fixed is "gpio", so the quirks must be applied to that
> property in order to ensure backwards-compatibility.
> 
>> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
>> index 03ec3ddaba60..1b4c741e0635 100644
>> --- a/drivers/gpio/gpiolib-of.c
>> +++ b/drivers/gpio/gpiolib-of.c
>> @@ -84,6 +84,7 @@ static void of_gpio_flags_quirks(struct device_node *np,
>>  	 * Note that active low is the default.
>>  	 */
>>  	if (IS_ENABLED(CONFIG_REGULATOR) &&
>> +	    !strcmp(propname, "enable-gpio") &&
>>  	    (of_device_is_compatible(np, "regulator-fixed") ||
>>  	     of_device_is_compatible(np, "reg-fixed-voltage") ||
>>  	     of_device_is_compatible(np, "regulator-gpio"))) {
> 
> I think this would need to be something like the below to reflect what
> you were trying to achieve, while keeping backwards compatibility:
> 
> --- >8 ---
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 1b4c741e0635..bddfc6102a50 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -84,10 +84,10 @@ static void of_gpio_flags_quirks(struct device_node *np,
>  	 * Note that active low is the default.
>  	 */
>  	if (IS_ENABLED(CONFIG_REGULATOR) &&
> -	    !strcmp(propname, "enable-gpio") &&
>  	    (of_device_is_compatible(np, "regulator-fixed") ||
>  	     of_device_is_compatible(np, "reg-fixed-voltage") ||
> -	     of_device_is_compatible(np, "regulator-gpio"))) {
> +	     (of_device_is_compatible(np, "regulator-gpio") &&
> +	      strcmp(propname, "enable-gpio") == 0))) {
>  		/*
>  		 * The regulator GPIO handles are specified such that the
>  		 * presence or absence of "enable-active-high" solely controls
> --- >8 ---
> 
> That applied on top of today's linux-next fixes the regression for me
> without a need to modify the device tree. Feel free to integrate that
> into your patch.

This one works on R-Car Gen3 too, so if we can add that on top of this
patch, fine by me . Can you send a formal patch ?

-- 
Best regards,
Marek Vasut
