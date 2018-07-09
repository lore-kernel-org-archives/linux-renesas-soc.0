Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:46929 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750952AbeGIGnp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jul 2018 02:43:45 -0400
MIME-Version: 1.0
References: <20180706085508.30791-1-geert+renesas@glider.be> <d72596f7-e03f-26c4-742b-face854a00c9@roeck-us.net>
In-Reply-To: <d72596f7-e03f-26c4-742b-face854a00c9@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Jul 2018 08:43:33 +0200
Message-ID: <CAMuHMdUV9kRHs9TxOEyhrWAVzDf5SBN8qiF7pysys29-_wCDbg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: watchdog: renesas-wdt: Add support for
 the R8A77990 wdt
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Günter,

On Mon, Jul 9, 2018 at 12:43 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On 07/06/2018 01:55 AM, Geert Uytterhoeven wrote:
> > From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> >
> > Document support for the Watchdog Timer (WDT) Controller in the Renesas
> > R-Car E3 (R8A77990) SoC.
> >
> > No driver update is needed.
> >
> > Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > Acked-by: Rob Herring <robh@kernel.org>
>
> The patch is queued in my tree, so there should be no need to resend it anymore.

Thank you, I wasn't aware of that. Your last reply was "it doesn't apply",
and the patch is not in linux-watchdog-next.git.

Aha, it's in your linux-staging.git#watchdog-next.
Perhaps that should be documented in MAINTAINERS, and be included in
linux-next, too?

BTW, the git links on https://linux-watchdog.org/ give 404.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
