Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:41656 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbeINSOo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 14:14:44 -0400
MIME-Version: 1.0
References: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com> <1536660771-32278-9-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1536660771-32278-9-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Sep 2018 15:00:09 +0200
Message-ID: <CAMuHMdV9XbkrpYcAfK_OFH+NCjbOS8QfRAoRvjxNyhn7TX6tKg@mail.gmail.com>
Subject: Re: [PATCH 08/10] clk: renesas: r8a7743: Add r8a7744 support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 11, 2018 at 12:19 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add RZ/G1N (R8A7744) Clock Pulse Generator / Module Standby and Software
> Reset support.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
