Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:43393 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733173AbeHAJuS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Aug 2018 05:50:18 -0400
MIME-Version: 1.0
References: <1532936891-25034-1-git-send-email-biju.das@bp.renesas.com> <1532936891-25034-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1532936891-25034-3-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Aug 2018 10:05:38 +0200
Message-ID: <CAMuHMdVVfOS3XF=-cqFpUcWGfGT0yFUN==BvauNOWamad1EwEA@mail.gmail.com>
Subject: Re: [PATCH 2/5] soc: renesas: rcar-sysc: Add r8a774a1 support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 30, 2018 at 9:54 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add support for RZ/G2M (R8A774A1) SoC power areas to the R-Car SYSC
> driver.
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
