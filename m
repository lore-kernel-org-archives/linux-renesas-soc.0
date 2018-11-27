Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:42013 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbeK1EuU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Nov 2018 23:50:20 -0500
MIME-Version: 1.0
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
 <0e51165d-65cb-1522-3174-b63818180070@cogentembedded.com> <CAMuHMdX6n860T9oOgYiqxiF0QpNyKqEtQW9yEksAv_A02Z9qRw@mail.gmail.com>
 <5cb1471a-db86-e074-6585-10d625738d5a@cogentembedded.com>
In-Reply-To: <5cb1471a-db86-e074-6585-10d625738d5a@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Nov 2018 18:51:24 +0100
Message-ID: <CAMuHMdXfsXgOFxbfdbqmMNOfZS2mYYOEyBKhFbV29VmCVkEn0A@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r8a77980-cpg-mssr: add RPC clocks
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Tue, Nov 27, 2018 at 6:45 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 11/23/2018 03:59 PM, Geert Uytterhoeven wrote:
> >> Add the RPCSRC internal clock on R-Car V3H (R8A77980) -- it's controlled
> >> by the RPCCKCR.DIV[4:3] on all the R-Car gen3 SoCs except V3M (R8A77970)
> >> but the encoding of this field is different between SoCs.

> >> --- renesas-drivers.orig/drivers/clk/renesas/r8a77980-cpg-mssr.c
> >> +++ renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
> [...]
> >> +               const struct clk *parent = clks[core->parent];
> >> +
> >> +               if (IS_ERR(parent))
> >> +                       return ERR_CAST(parent);
> >> +
> >> +               return clk_register_divider_table(NULL, core->name,
> >> +                                                 __clk_get_name(parent), 0,
> >> +                                                 base + CPG_RPCCKCR, 3, 2, 0,
> >> +                                                 cpg_rpcsrc_div_table, NULL);
> >
> > Don't you need a spinlock (last parameter, currently NULL)?
> > This needs to be synchronized with controlling the RPCD2 and RPC clocks,
> > as they operate on the same register.
>
>    Indeed. How about the RMW accesses to the other register? I'd like to place
> the lock/unlock right in cpg_reg_modify()...

Yes, RMW, too.

> > However, that would deadlock, as enabling e.g. RPC-IF will enable
> > all parent clocks?
>
>   Could toy please elaborate?

Sorry, I incorrectly assumed it would hold the lock while calling into the
parent, which would deadlock if using the same lock.
But as it only holds the lock for register access, it's fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
