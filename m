Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:36725 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbeJJPWy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Oct 2018 11:22:54 -0400
MIME-Version: 1.0
References: <1538991019-18577-1-git-send-email-fabrizio.castro@bp.renesas.com> <1538991019-18577-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1538991019-18577-3-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Oct 2018 10:01:43 +0200
Message-ID: <CAMuHMdWf_NJ37fcwqyE31zo37nrUtbEg=Am4eGA7yNkxTx0Rog@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: sh-pfc: r8a77470: Add DU1 pin groups
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 8, 2018 at 11:30 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add DU1 pin groups and function to the RZ/G1C (a.k.a. R8A77470)
> pinctrl driver.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
