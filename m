Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:38643 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728626AbeHFQsN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 12:48:13 -0400
MIME-Version: 1.0
References: <20180806140755.24087-1-geert+renesas@glider.be>
 <20180806140755.24087-5-geert+renesas@glider.be> <TY1PR01MB15621F645BA5AA48C6060F0D8A200@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB15621F645BA5AA48C6060F0D8A200@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Aug 2018 16:38:36 +0200
Message-ID: <CAMuHMdWfsdbmGUQPk4O=9jyPZ_tUEytO5z2XE6-TnagJ3taPVA@mail.gmail.com>
Subject: Re: [PATCH/RFC 4/4] sh-sci: Derive regshift value from DT compatible value
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        uli@fpond.eu, Yoshinori Sato <ysato@users.sourceforge.jp>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Mon, Aug 6, 2018 at 4:18 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Monday, August 06, 2018 1, linux-sh-owner@vger.kernel.org wrote:
> > Deriving the proper regshift value from the register block size is
> > fragile (it may have been rounded up in DT, and the mapping granularity
> > is usually PAGE_SIZE anyway), and turned out to be inappropriate for
> > earlycon support (the size is not easily available).
> >
> > On DT systems, derive it from the compatible value instead.
> > This requires adding an entry for RZ/A2 serial ports, which use an
> > atypical regshift value.
>
> I had a simple patch to add support for CONFIG_DEBUG_LL for RZ/A2
> because earlycon never worked because of RZ/A2's different register locations.

Yeah, sci_probe_regmap() assumed the wrong regtype for your TYPE_SCIF
port. You needed an OF_EARLYCON_DECLARE() line that also filled in
the correct regtype.

BTW, it would have been very valuable to know that earlycon didn't work, as that
would have helped in avoiding the earlycon breakage on other parts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
