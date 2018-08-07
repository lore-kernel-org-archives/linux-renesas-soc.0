Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:34053 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733160AbeHGKF5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 06:05:57 -0400
MIME-Version: 1.0
References: <1533626118-26583-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533626118-26583-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Aug 2018 09:52:39 +0200
Message-ID: <CAMuHMdWhK11pXfy_FUir+wwFdNgQrou9BhOA_4kWLb+MMF+M7Q@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Avoid calling chip->request() for unused gpios
To: Biju Das <biju.das@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

Thanks for your patch!

On Tue, Aug 7, 2018 at 9:21 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add a check for unused gpios to avoid chip->request() call to client
> driver for unused gpios.

"... so not every driver has to do this in its chip->request() callback."

Note that currently no driver seems to check for this.
I was mistaken in my earlier report about msm_pinmux_request
(this is pinmux_ops.request(), not gpio_chip.request()).

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
