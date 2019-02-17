Return-Path: <SRS0=hAs+=QY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E51CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 21:58:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7043C217F9
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 21:58:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOSLW/Hy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbfBQV6G (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Feb 2019 16:58:06 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38324 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbfBQV6F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Feb 2019 16:58:05 -0500
Received: by mail-wr1-f66.google.com with SMTP id v13so16220179wrw.5;
        Sun, 17 Feb 2019 13:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YX8ky3miDkgEkW7DHbIN9+OCTvgteRysSsmh4dTzPh8=;
        b=kOSLW/HynslQEvfkOk4Wd5ao+WEHiRkWMJ2/ag6QzlLiQ7+745WpJiBVh/nh+C//q0
         U9BoomeQIcyFD89kxsin2ZlImqzAoMgVvNRQWKIwGvQcPQ3I3FMPAjF243+Vyw2K8cLA
         Hos0dMtR4oLAbfzulxD6mw7hiGCqT5FCNBFdM7w8Ld4BPQqsXdryDZtk+0TXH7LJfW5Q
         WW5RKF8f1R3XdnieHNrNzlrvwuvt0doW5Qo75c36qRlVfLqhLTGbdyxApZUocO2Edudx
         uwXN0SREaPaKLDTVxPsDdzDieAtXa4svKR/eLTeUd99rYrNnJtmk9IYSlKu9l4JODN2x
         98XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YX8ky3miDkgEkW7DHbIN9+OCTvgteRysSsmh4dTzPh8=;
        b=fPHFBM1dY7/b4AVL3RF0TVW/ERbDZNjxTvVgK99AQizEI/cAYrRb0ULuLy4mJu39iz
         A/dUXItYRdUxB7hwgpwMUgoX5dgaT4M4lw1q3KroSfWzQneriWDVq27Fl89pnqhGnV7a
         M4oKRupeFuTAx2csYJluJDQwwrxD8fCMRHdSqNJnt313HFgJxXjs3Gqb07MWs23tSaxs
         i/ST0R6aRyGVjGQ37SGs7eTDwhwVeCCwHN3V/2NI6cDp65PNRSC6XsDH3mRNxeD65Y1z
         f9HNTJ+ZeteuDrOTBjDIKfqtVkwLs336/x50PCIqFffRRQAfTzYTKvBNOqViIXHvj6We
         bcSQ==
X-Gm-Message-State: AHQUAubLV9Vxao//VREQu90tKOAKjpwnAbXUNkE4x1Mql9HRel8ZUnWa
        1fwmPHrWW4QdVf6VtbbmUF9h7/ns
X-Google-Smtp-Source: AHgI3IbYWIKBcoyzoix21hey1CrvlgvkhNGJUlQC5y/qbbhi5KUje7OkIOcNuVvLdBwNRRIrz1x+yA==
X-Received: by 2002:adf:ec8f:: with SMTP id z15mr13943877wrn.290.1550440683248;
        Sun, 17 Feb 2019 13:58:03 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id z15sm17172572wrh.18.2019.02.17.13.58.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Feb 2019 13:58:02 -0800 (PST)
Subject: Re: [PATCH] gpio: of: Apply regulator-gpio quirk only to enable-gpios
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>, Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190216134627.1601-1-marek.vasut@gmail.com>
 <CACRpkdaFL=M1Q5r=8TpjeE3wfHMEnRRXTaTVLVwgK6vjcjK56w@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <0119ea9b-ba4b-1c62-4b0b-7bda97e24a57@gmail.com>
Date:   Sun, 17 Feb 2019 22:58:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdaFL=M1Q5r=8TpjeE3wfHMEnRRXTaTVLVwgK6vjcjK56w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/17/19 10:21 PM, Linus Walleij wrote:
> On Sat, Feb 16, 2019 at 2:46 PM <marek.vasut@gmail.com> wrote:
> 
>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
>> Since commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptors")
>> the GPIO regulator had inverted the polarity of the control GPIO. This
>> problem manifested itself on systems with DT containing the following
>> description (snippet from salvator-common.dtsi):
>>
>>         gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
>>         gpios-states = <1>;
>>         states = <3300000 1
>>                   1800000 0>;
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
> 
> Patch applied for v5.1, the regulator and GPIO changes should work
> fine together in -next and merge nicely in the merge window.
> 
> Bonus for a long and descriptive commit message and keeping
> me company over the Facebook chat while fixing it up! :D

:-))

-- 
Best regards,
Marek Vasut
