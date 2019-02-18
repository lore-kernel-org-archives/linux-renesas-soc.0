Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9596C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 09:31:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 981872184A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 09:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729373AbfBRJbL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 04:31:11 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:37141 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728342AbfBRJbK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 04:31:10 -0500
Received: by mail-vs1-f67.google.com with SMTP id s16so9265851vsk.4;
        Mon, 18 Feb 2019 01:31:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dC51Vd3PQ4saZjc086ujbamshrVevcl8Fxr/D/BWGvI=;
        b=lEDXTaIDTzJbE94LtH4U2QlARqW0UhZgK5nvHOpjzeJn6wb3IAd5UhVxa31fVoCzUg
         jWrqPNNxWSPYJGontyQmnd3o3BpiV02Y69KGPmGPB3LqzU7isCbvAWfxFQHld+EL3q5W
         hz9cr6Vp168i9gO8y9gGu5GgQA5pkRfCs07bPRt6kwCjb+mVuPZM4yOUIFlbftmqdTV1
         ipSzYIupy3mvQGfaUd/XLfMwsSbrllGxPaGAv/Whu6BcBDCwzas8vy9dslJyHDSMt4Ir
         9g+ewkyOlFVbAp9KTXlCMqGqvbGHS+uE7sdX9Rkblynjfb4u77pBw2uy7XVCDFeklize
         2qrQ==
X-Gm-Message-State: AHQUAuZxYUC7dmkSzSt/BqRNmD7ZUrFm3O9LyIAK5edO4q0Z+9k9BoDV
        NXwzUwZ6WLA9Kacwr9bCus1Y4e0xmb6tTy7s+UwZFO3c
X-Google-Smtp-Source: AHgI3IbUeUJYYKJMezIjOx7WXYR+n1Ii1ofKqJD/0EREFtoxOuRGPttZ6BwyUFxARW9lli5TRdh9vAlErI2CBw9qHKg=
X-Received: by 2002:a67:e3d3:: with SMTP id k19mr10287494vsm.96.1550482269188;
 Mon, 18 Feb 2019 01:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20190216174859.15738-1-marek.vasut@gmail.com>
In-Reply-To: <20190216174859.15738-1-marek.vasut@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Feb 2019 10:30:56 +0100
Message-ID: <CAMuHMdXeuaqLEFfV6_7cPdiq_+vuo97brx1Xa1N6c_GFSKmM0A@mail.gmail.com>
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Harald Geyer <harald@ccbib.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Sun, Feb 17, 2019 at 8:00 AM <marek.vasut@gmail.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> Reword the binding document to make it clear how the propeties work
> and which properties affect which other properties.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Harald Geyer <harald@ccbib.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-renesas-soc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> Note: The recent gpio-regulator rework caused breakage. While the
>       changes in the gpio-regulator code were according to the DT
>       binding document, they stopped working with older DTs. Make
>       the binding document clearer to prevent such breakage in the
>       future.

Thanks, adding more worms to the can, below...

> --- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> @@ -4,16 +4,25 @@ Required properties:
>  - compatible           : Must be "regulator-gpio".
>  - regulator-name       : Defined in regulator.txt as optional, but required
>                           here.
> -- states               : Selection of available voltages and GPIO configs.
> -                          if there are no states, then use a fixed regulator
> +- states               : Selection of available voltages/currents provided by
> +                         this regulator and matching GPIO configurations to
> +                         achieve them. If there are no states in the "states"
> +                         array, use a fixed regulator instead.
>
>  Optional properties:
> -- enable-gpio          : GPIO to use to enable/disable the regulator.
> -- gpios                        : GPIO group used to control voltage.
> -- gpios-states         : gpios pin's initial states array. 0: LOW, 1: HIGH.
> -                         defualt is LOW if nothing is specified.
> +- enable-gpio          : GPIO used to enable/disable the regulator.

According to modern GPIO rules, that should be "enable-gpios" (plural) ...

> +                         Warning, the GPIO phandle flags are ignored and the
> +                         GPIO polarity is controlled solely by the presence
> +                         of "enable-active-high" DT property. This is due to
> +                         compatibility with old DTs.

Wasn't the purpose of the various *active-* flags to accommodate GPIOs
lacking a flags cell (i.e. typically #gpio-cells = <1>)?
When the flags cell is present, there's indeed opportunity for confusion
(and breakage), combined with the presence/lack of *active-* below...

> +- enable-active-high   : Polarity of "enable-gpio" GPIO is active HIGH.
> +                         Default is active LOW.
> +- gpios                        : Array of one or more GPIO pins used to select the
> +                         regulator voltage/current listed in "states".
> +- gpios-states         : Initial state of GPIO pins in "gpios" array.
> +                         0: LOW, 1: HIGH.
> +                         Default is LOW if nothing else is specified.
>  - startup-delay-us     : Startup time in microseconds.
> -- enable-active-high   : Polarity of GPIO is active high (default is low).
>  - regulator-type       : Specifies what is being regulated, must be either
>                           "voltage" or "current", defaults to voltage.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
