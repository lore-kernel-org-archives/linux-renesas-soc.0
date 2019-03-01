Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F12C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 13:27:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 090272084D
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 13:27:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfCAN1n (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 08:27:43 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:34878 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727697AbfCAN1n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 08:27:43 -0500
Received: by mail-ua1-f65.google.com with SMTP id f88so22421113uaf.2;
        Fri, 01 Mar 2019 05:27:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FNYEgdqRep3t+Kb1QewR1ACCgXdYEVZ3QvHWvY4hSWM=;
        b=kcYMKJ3uUGpoHAVxOHFmeB1XnD/ODjoqBxh4kw6N9H8qK2MeJkG8Qws+y0qPm8W9Do
         i3Q/+cvA6G/FDyWyrqgNIoutnbDbzxCs0FheZbKOgtqSEjsPksGLoyoM/HktCeaf1uuv
         XP3TyQikIlFltiT0JUVVn+QTag9CGi6epmKxDteFmjoH30dlP2NOcw7IVg0Tq/6njZ+4
         6T9cMSvseWv1nnQ+FCD4S41G/xABNH3jOiqgoQbLEMi1WtZdp9TUaSV24m705etYshpd
         ciBRARvsR0a8b7LP6CAKPpej5Gi4hlfamrjGPvX2iGwdWEG9Vpj8UqAJKGaPuHuCV7Mq
         OYsw==
X-Gm-Message-State: APjAAAXUa7vS9PXN+i+6bkKS7GF912p3Wykasb4YEkMaVWMQwiOil6cn
        te71ADIXvCPiW3r3yWw/zRm0nZ/6nY/qPNAG/b8=
X-Google-Smtp-Source: APXvYqxWxJLvrHIR73qqjPtEWucQSl9HMhutEQWrQ4L+rIcAvIZ3hla88tbEOa8jitJ794vCFOTsYB0VyJUwGCF4LC0=
X-Received: by 2002:a67:fc9a:: with SMTP id x26mr2633975vsp.166.1551446862274;
 Fri, 01 Mar 2019 05:27:42 -0800 (PST)
MIME-Version: 1.0
References: <1542727156-31432-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1542727156-31432-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CACRpkdbf+MpB24etuXUGypOwHUW_w4ECu-iFFT3aEB10wG0Huw@mail.gmail.com> <TY1PR01MB177090970EE98AC699E22E3CC0A90@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB177090970EE98AC699E22E3CC0A90@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Mar 2019 14:27:30 +0100
Message-ID: <CAMuHMdUxcxRJv_H+_25pavjeJOKoEihrjBQTxjWR-fe9x5rBNw@mail.gmail.com>
Subject: Re: [RFC v3 1/2] pinctrl: core: Add pinctrl_mux_gpio_request_enable
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Thu, Dec 6, 2018 at 10:47 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: Linus Walleij <linus.walleij@linaro.org>
> > Sent: 05 December 2018 21:46
> > Subject: Re: [RFC v3 1/2] pinctrl: core: Add pinctrl_mux_gpio_request_enable
> >
> > On Tue, Nov 20, 2018 at 4:19 PM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> >
> > > Sometimes there is the need to change the muxing of a pin to make it
> > > a GPIO without going through gpiolib.
> > > This patch adds pinctrl_mux_gpio_request_enable to deal with this new
> > > use case from code that has nothing to do with pinctrl.
> >
> > It has a lot to do with pinctrl I think, so I get confused by this
> > commit message.
>
> I can improve that
>
> >
> > >  extern int pinctrl_gpio_request(unsigned gpio);
> > > +extern int pinctrl_mux_gpio_request_enable(unsigned gpio);
> >
> > What's wrong with just using the existing call
> > pinctrl_gpio_request() right above your new one?
> >
> > It's not like we're reference counting or something, it's just
> > a callback. Sprinkle some comments to show what's going
> > on.
>
> I tried that, and it was working for me, then something changed lately
> in gpiolib that broke that solution, and Geert picked it up on his end.
> Please see this:
> https://patchwork.kernel.org/patch/10671325/
>
> This patch was made to overcome the problems of the previous patch.
>
> >
> > If you for some reason need a new call for this specific
> > use case, it needs to be named after the use case,
> > like pinctrl_gpio_request_for_irq()
> > so it is obvious what the function is doing.
>
> I can do that, but I would like to hear from Geert first, no point in going
> around in circle if this solution is not acceptable to him.
>
> Geert, what do you think?

/me gives v3 a try on Koelsch, Salvator-XS, and Ebisu-4D:

    BUG: sleeping function called from invalid context

for mmc, adv7511, gpio-keys, and Ethernet PHY.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
