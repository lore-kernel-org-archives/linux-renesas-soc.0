Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:39202 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbeKTAGp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 19:06:45 -0500
MIME-Version: 1.0
References: <20181107182733.62155-1-chris.brandt@renesas.com>
 <20181107182733.62155-3-chris.brandt@renesas.com> <CAMuHMdX3QJq+QgU-wwFLawyLwqqoUDLS=uwNqRhJqVtP0_yLNQ@mail.gmail.com>
 <OSAPR01MB15538DC8B31310DF044242DF8AC20@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <CAMuHMdV5QXj-O6NNOF0FjVEjukhQwa7BbvB1AW3jZNT9TenWaQ@mail.gmail.com> <CACRpkdasMsVZS_H=xxDC4JKkOyx1i4JWZyu7UF95EVkBNimGKQ@mail.gmail.com>
In-Reply-To: <CACRpkdasMsVZS_H=xxDC4JKkOyx1i4JWZyu7UF95EVkBNimGKQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Nov 2018 14:42:50 +0100
Message-ID: <CAMuHMdVKbShmqZ3O1ctckr_SQBqf0iBRJVyFG=HTtu6cFE9_fw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: pinctrl: Add RZ/A2 pinctrl and GPIO
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Chris Brandt <Chris.Brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jacopo Mondi <jacopo@jmondi.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Linus,

On Mon, Nov 19, 2018 at 2:22 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Nov 13, 2018 at 6:28 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Anyway, we're getting closer to bikeshedding, so with the real issues fixed:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I assume you are queueing the RZ/A2 stuff as well Geert?

Yes, that's the plan...

> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> FWIW, I trust Geert to have the final say on Renesas code.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
