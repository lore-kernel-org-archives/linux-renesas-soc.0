Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f174.google.com ([209.85.220.174]:34707 "EHLO
        mail-qk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750765AbeC3HxR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Mar 2018 03:53:17 -0400
MIME-Version: 1.0
In-Reply-To: <1522318628-52821-1-git-send-email-biju.das@bp.renesas.com>
References: <1522318628-52821-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Mar 2018 09:53:16 +0200
Message-ID: <CAMuHMdUsO_jw5Lb4jDKk6H2Zn=4kJHhFp_fBArnaddkBXDQ24Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: Document r8a77470 support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 29, 2018 at 12:17 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> Renesas RZ/G SoC have the R-Car gen2 compatible IRQC interrupt
> controllers. Document RZ/G1C (also known as R8A77470) SoC bindings.
>
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
