Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:45369 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729915AbeGZOSQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jul 2018 10:18:16 -0400
MIME-Version: 1.0
References: <20180725143850.32985-1-chris.brandt@renesas.com>
 <CAMuHMdV=GDmte8uqi2hoy6Cu190uX6stdPkipmsDjan8L5oZRA@mail.gmail.com> <TYXPR01MB1568B3A6928B55E665AA626F8A2B0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB1568B3A6928B55E665AA626F8A2B0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jul 2018 15:01:11 +0200
Message-ID: <CAMuHMdX1piAAJeX+C=xr2ZG6Pe4_W+XH6ugURWny0rcJ3En0ew@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] serial: sh-sci: Add support for RZ/A2
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Thu, Jul 26, 2018 at 2:25 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Thursday, July 26, 2018, Geert Uytterhoeven wrote:
> > Thanks for your series!
> >
> > Unfortunately Greg has already applied your v1 (and my fix for a
> > use-after-free), so either these have to be reverted first, or you have to
> > rebase against tty-next.
>
> I assume you would prefer the newer implementation I did.
>
> In your opinion, which one would be better (revert or rebase)?

[looking at the incremental differences]

I think the easiest for Greg is to rebase, and send 3 patches:
  1. Document interrupt order in bindings,
  2. Unify SCIx_RZ_SCIFA_REGTYPE/SCIx_SH4_SCIF_REGTYPE regtypes,
  3. Simplify interrupts.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
