Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:45978 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbeHGKt5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 06:49:57 -0400
MIME-Version: 1.0
References: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com> <1533628626-26503-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533628626-26503-2-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Aug 2018 10:36:28 +0200
Message-ID: <CAMuHMdXaSxw-B9=KwQxELHmr36hTLJWDSiLBSBOASGKW317OwA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] gpio: rcar: Add GPIO hole support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 7, 2018 at 10:03 AM Biju Das <biju.das@bp.renesas.com> wrote:
> GPIO hole is present in RZ/G1C SoC. Valid GPIO pins on bank3 are in the
> range GP3_0 to GP3_16 and GP3_27 to GP3_29. The GPIO pins between GP3_17
> to GP3_26 are unused. Add support for handling unused GPIO's.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V1-->V2
>     * Added gpio-reserved-ranges support for handling
>       unused gpios.
> V2-->V3
>     * Incorporated Geert's review comment.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
