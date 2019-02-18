Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4542C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 19:21:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE8F221773
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 19:21:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729384AbfBRTVk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 14:21:40 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:41604 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfBRTVk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 14:21:40 -0500
Received: by mail-vs1-f66.google.com with SMTP id m20so9791141vsq.8;
        Mon, 18 Feb 2019 11:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FZDD21bqtvImTnXKrqslQCkIa9LBFLDsAjN9JGdYoAY=;
        b=QTSi/3hEF1ymRe/nhcRlwmUMIc+jM64SzlHuDmxVw6+uIHLcqFs/kwzYLl8ayD6v/S
         AsSuc8ph4RKm5HL8Zkv9m6GIo2P+H9K2iYnsNL/ltWuQb10SiR0VvxLJpqgMjlEFK/U9
         dpK68ilF7OAd5FAEq5yU79KU0/GxUjRuWt2J1P+oz/vx29BsaBpyxH1ovuP6i8n4DWr0
         pifEizW/VsIzEd7p20I40QbRmYobo+ZowggRnCs3SCuSBVnuouEvoF20IZ78XpNZRDp3
         rhwlPg7kW2Fu58SkKoW7WBfS+i3WrzS82GXvJfAz+TPaEc+Ix4b7Qsrsbszo/n9c5hOR
         wdsQ==
X-Gm-Message-State: AHQUAuZ674SOSLjGnvaxAy1RjTfgZo6t5ai7M2+5pMh5eGZWazONyTdG
        cDXDdUKIKN+jabmDIanC0Eh6v8+/quT7AXRX7O4=
X-Google-Smtp-Source: AHgI3Ib9XLq9wxF+IG7NV1LKCzMLBr36uBx2F0JK9K6LEx6VPD9fJAWeKJbAo0u78Yg3maZFEDmR+5wPgSjKiPopUiM=
X-Received: by 2002:a67:541:: with SMTP id 62mr12324616vsf.11.1550517698534;
 Mon, 18 Feb 2019 11:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20190216174859.15738-1-marek.vasut@gmail.com> <CAMuHMdXeuaqLEFfV6_7cPdiq_+vuo97brx1Xa1N6c_GFSKmM0A@mail.gmail.com>
 <8374074b-9ef0-1286-71b4-756934e7d405@gmail.com>
In-Reply-To: <8374074b-9ef0-1286-71b4-756934e7d405@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Feb 2019 20:21:26 +0100
Message-ID: <CAMuHMdVex9js2_yvrFoG+CM1WQE42RpZEJ3vEqB-ziQt-zdKVw@mail.gmail.com>
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

On Mon, Feb 18, 2019 at 8:04 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 2/18/19 10:30 AM, Geert Uytterhoeven wrote:
> > On Sun, Feb 17, 2019 at 8:00 AM <marek.vasut@gmail.com> wrote:
> >> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >> Reword the binding document to make it clear how the propeties work
> >> and which properties affect which other properties.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

> >> --- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> >> +++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> >> @@ -4,16 +4,25 @@ Required properties:
> >>  - compatible           : Must be "regulator-gpio".
> >>  - regulator-name       : Defined in regulator.txt as optional, but required
> >>                           here.
> >> -- states               : Selection of available voltages and GPIO configs.
> >> -                          if there are no states, then use a fixed regulator
> >> +- states               : Selection of available voltages/currents provided by
> >> +                         this regulator and matching GPIO configurations to
> >> +                         achieve them. If there are no states in the "states"
> >> +                         array, use a fixed regulator instead.
> >>
> >>  Optional properties:
> >> -- enable-gpio          : GPIO to use to enable/disable the regulator.
> >> -- gpios                        : GPIO group used to control voltage.
> >> -- gpios-states         : gpios pin's initial states array. 0: LOW, 1: HIGH.
> >> -                         defualt is LOW if nothing is specified.
> >> +- enable-gpio          : GPIO used to enable/disable the regulator.
> >
> > According to modern GPIO rules, that should be "enable-gpios" (plural) ...
>
> Isn't that changing the ABI spec then ?

of_find_gpio() supports both anyway, through gpio_suffixes[].

> >> +                         Warning, the GPIO phandle flags are ignored and the
> >> +                         GPIO polarity is controlled solely by the presence
> >> +                         of "enable-active-high" DT property. This is due to
> >> +                         compatibility with old DTs.
> >
> > Wasn't the purpose of the various *active-* flags to accommodate GPIOs
> > lacking a flags cell (i.e. typically #gpio-cells = <1>)?
>
> Yes
>
> > When the flags cell is present, there's indeed opportunity for confusion
> > (and breakage), combined with the presence/lack of *active-* below...
>
> The code is rather clear that the flags cell is ignored.
>
> drivers/gpio/gpiolib-of.c:
>  91 /*
>  92  * The regulator GPIO handles are specified such that the
>  93  * presence or absence of "enable-active-high" solely controls
>  94  * the polarity of the GPIO line. Any phandle flags must
>  95  * be actively ignored.
>  96  */

Yeah, the code is the binding doc...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
