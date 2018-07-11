Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:41258 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732594AbeGKRaB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 13:30:01 -0400
MIME-Version: 1.0
References: <20180711163319.28004-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180711163319.28004-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Jul 2018 19:24:30 +0200
Message-ID: <CAMuHMdUZR7REt8__jR9=Ef_vZeq5bUUXwgFqaa-OC50G89tjuA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: use better errno if get_direction is not available
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Wed, Jul 11, 2018 at 6:33 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> @Geert: any reason gpio-rcar is missing it? I would need it for the
> i2c-gpio-fault-injector.

Because so far no one had a need for it?
/me thought gpiolib would return a cached value from a previous
set_direction_{in,out}put(), but apparently that must have been a dream...

Do you want me to implement it?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
