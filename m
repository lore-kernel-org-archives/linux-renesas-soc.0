Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35385 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbeJ2ECI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Oct 2018 00:02:08 -0400
Received: by mail-lf1-f66.google.com with SMTP id d7-v6so4431588lfi.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Oct 2018 12:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <1540583850-30825-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1540583850-30825-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Oct 2018 20:16:20 +0100
Message-ID: <CACRpkdahZAKWSPdMk=yp-GrSSAjFAzBijMK1ws3a4KUfzFmzgg@mail.gmail.com>
Subject: Re: [RFC] gpio: rcar: Request GPIO before enabling interrupt
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 26, 2018 at 9:57 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:

> There are cases when the bootloader configures a pin to work
> as a function rather than GPIO, and other cases when the pin
> is configured as a function at POR.
> This commit makes sure the pin is configured as a GPIO the
> moment we need it to work as an interrupt.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
(...)
> +       err = gc->request(gc, hwirq);

This is done in some drivers when what you want is exactly
the work carried out by that callback. But can't you just call
gpio_rcar_request() directly in this case so it is clear that
the driver is meddling with the internal state of the hardware
and not really intending to loop out into the external
API or external callbacks?

You're not on one of these platforms that prefer setting up
the pin as GPIO using a pin control hog in the device tree?

Sadly there is sometimes more than one way to do things
around here :/

Geert will know what is best.

Yours,
Linus Walleij
