Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34216 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbeLEVqd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 16:46:33 -0500
Received: by mail-lf1-f68.google.com with SMTP id p6so15891917lfc.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Dec 2018 13:46:31 -0800 (PST)
MIME-Version: 1.0
References: <1542727156-31432-1-git-send-email-fabrizio.castro@bp.renesas.com> <1542727156-31432-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1542727156-31432-2-git-send-email-fabrizio.castro@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 5 Dec 2018 22:46:17 +0100
Message-ID: <CACRpkdbf+MpB24etuXUGypOwHUW_w4ECu-iFFT3aEB10wG0Huw@mail.gmail.com>
Subject: Re: [RFC v3 1/2] pinctrl: core: Add pinctrl_mux_gpio_request_enable
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 20, 2018 at 4:19 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:

> Sometimes there is the need to change the muxing of a pin to make it
> a GPIO without going through gpiolib.
> This patch adds pinctrl_mux_gpio_request_enable to deal with this new
> use case from code that has nothing to do with pinctrl.

It has a lot to do with pinctrl I think, so I get confused by this
commit message.

>  extern int pinctrl_gpio_request(unsigned gpio);
> +extern int pinctrl_mux_gpio_request_enable(unsigned gpio);

What's wrong with just using the existing call
pinctrl_gpio_request() right above your new one?

It's not like we're reference counting or something, it's just
a callback. Sprinkle some comments to show what's going
on.

If you for some reason need a new call for this specific
use case, it needs to be named after the use case,
like pinctrl_gpio_request_for_irq()
so it is obvious what the function is doing.

Yours,
Linus Walleij
