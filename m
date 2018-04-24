Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f47.google.com ([209.85.213.47]:42750 "EHLO
        mail-vk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750736AbeDXOpo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 10:45:44 -0400
MIME-Version: 1.0
In-Reply-To: <1524558425-8285-1-git-send-email-biju.das@bp.renesas.com>
References: <1524558425-8285-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Apr 2018 16:45:43 +0200
Message-ID: <CAMuHMdXUp56MiM2TLgO9HnYy1MkNyzswQTeV7hkfb5au4UqMBQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: rcar: Add r8a77470 (RZ/G1C) support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 24, 2018 at 10:27 AM, Biju Das <biju.das@bp.renesas.com> wrote:
> Renesas RZ/G1C (R8A77470) SoC GPIO blocks are identical to the R-Car Gen2
> family. Add support for its GPIO controllers.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
