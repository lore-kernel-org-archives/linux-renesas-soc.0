Return-Path: <SRS0=hAs+=QY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A8BC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 21:22:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BD81217F9
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 21:22:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x0vwqbWP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbfBQVWP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Feb 2019 16:22:15 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43620 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbfBQVWO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Feb 2019 16:22:14 -0500
Received: by mail-lf1-f65.google.com with SMTP id j1so10817196lfb.10
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Feb 2019 13:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zs5QAgN+bGdpqZtxfdidg4jO7t1WAcRt4W1LHmaQmGk=;
        b=x0vwqbWPyg+Ha3o1z319y9cII/iFtctCnTn5n51nPHO/bNUAx36aMPz3OXbRrXimTg
         FordKt6QZMx+k8KpFumD0Bokey52XTUll+QkWNoaRSG437N8x9XhvClki4V+0sl6U03T
         D7ia18+nqcBFhh3LzQjr9ayPeGvVeEsCtAFO2bpMK1a5PJBbThM2Lhsd3X/ywexJusye
         tRkf+wGMgmBXTfCWSVRw4x1PER+pwSYOyRliAnjhh5TgawCW2wlShjYgC0Lrb3bJVymF
         pDhzgI+PjzPbwbwtziCvTPYlZQQaEiz6HeNV7QTvxbJu34bmZ0H/fEbHVjOcO2XkiQF6
         stKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zs5QAgN+bGdpqZtxfdidg4jO7t1WAcRt4W1LHmaQmGk=;
        b=Ceu1Y2Sp6xS2vq73YYxuZoIpqfEg4w/C80NvUIfunPj5SPc2s99/6cenrh/rZ99L1f
         csT0tF6mYqZwwrlIETIHk58aACCSzBRMSk05PwTct60vznQ+mq1+oZCz3qiqGNALbuGV
         kJgTLf0lLnRgEwUuWMOmm2dGBQ8XewLx7kgqBOwVqXJMeGsM7dOeihLoG+B2gzMs9XtK
         5zIG3eM7dgklTbvtj2qDNfaBDfuihnOJLD9sNCXAOwrKQjPFaUrE7TNdbf3Xayccqzg/
         NN3NeZFyn55mH4UmMOKA7OvHrSDxfp93txnlcaaTPnGL3RGFDeG5bTSjVJu7/K55kE/4
         AOUw==
X-Gm-Message-State: AHQUAuYjhuBt691uz7BfWgUZRozdwUQJ/iTSKorBGZIBIyJZOmE838eL
        0AJJPm5Kgl9kOB1GpyGu0i+1vcIUKKIlk/TQ9O8w9A==
X-Google-Smtp-Source: AHgI3IZ2FDX1CEIwIztbU7kDl4BYEHXybCXHvulq9bR1+SPGvBEPJRjcRZwL5VKxDdgW3+GmHefS9JtBt7QavVyVL5M=
X-Received: by 2002:a19:c48e:: with SMTP id u136mr11225113lff.167.1550438532719;
 Sun, 17 Feb 2019 13:22:12 -0800 (PST)
MIME-Version: 1.0
References: <20190216134627.1601-1-marek.vasut@gmail.com>
In-Reply-To: <20190216134627.1601-1-marek.vasut@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 17 Feb 2019 22:21:59 +0100
Message-ID: <CACRpkdaFL=M1Q5r=8TpjeE3wfHMEnRRXTaTVLVwgK6vjcjK56w@mail.gmail.com>
Subject: Re: [PATCH] gpio: of: Apply regulator-gpio quirk only to enable-gpios
To:     Mark Vasut <marek.vasut@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>, Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Feb 16, 2019 at 2:46 PM <marek.vasut@gmail.com> wrote:

> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> Since commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptors")
> the GPIO regulator had inverted the polarity of the control GPIO. This
> problem manifested itself on systems with DT containing the following
> description (snippet from salvator-common.dtsi):
>
>         gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
>         gpios-states = <1>;
>         states = <3300000 1
>                   1800000 0>;
>
> Prior to the aforementioned commit, the gpio-regulator code used
> gpio_request_array() to claim the GPIO(s) specified in the "gpios"
> DT node, while the commit changed that to devm_gpiod_get_index().
>
> The legacy gpio_request_array() calls gpio_request_one() and then
> gpiod_request(), which parses the DT flags of the "gpios" node and
> populates the GPIO descriptor flags field accordingly.
>
> The new devm_gpiod_get_index() calls gpiod_get_index(), then
> of_find_gpio(), of_get_named_gpiod_flags() with flags != NULL,
> and then of_gpio_flags_quirks(). Since commit a603a2b8d86e
> ("gpio: of: Add special quirk to parse regulator flags"),
> of_gpio_flags_quirks() contains a quirk for regulator-gpio
> which was never triggered by the legacy gpio_request_array()
> code path, but is triggered by devm_gpiod_get_index() code
> path.
>
> This quirk checks whether a GPIO is associated with a fixed
> or gpio-regulator and if so, checks two additional conditions.
> First, whether such GPIO is active-low, and if so, ignores the
> active-low flag. Second, whether the regulator DT node does
> have an "enable-active-high" property and if the property is
> NOT present, sets the GPIO flags as active-low.
>
> The second check triggers a problem, since it is applied to all
> GPIOs associated with a gpio-regulator, rather than only on the
> "enable" GPIOs, as the old code did. This changes the way the
> gpio-regulator interprets the DT description of the control
> GPIOs.
>
> The old code using gpio_request_array() explicitly parsed the
> "enable-active-high" DT property and only applied it to the
> GPIOs described in the "enable-gpios" DT node, and only if
> those were present.
>
> This patch fixes the quirk code by only applying the quirk
> to "enable-gpios", thus restoring the old behavior.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Jan Kotas <jank@cadence.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-gpio@vger.kernel.org

Patch applied for v5.1, the regulator and GPIO changes should work
fine together in -next and merge nicely in the merge window.

Bonus for a long and descriptive commit message and keeping
me company over the Facebook chat while fixing it up! :D

Yours,
Linus Walleij
