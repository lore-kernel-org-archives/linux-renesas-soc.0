Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:41918 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbeHHNZL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Aug 2018 09:25:11 -0400
MIME-Version: 1.0
References: <20180806140755.24087-1-geert+renesas@glider.be>
 <20180806140755.24087-5-geert+renesas@glider.be> <TY1PR01MB15621F645BA5AA48C6060F0D8A200@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWfsdbmGUQPk4O=9jyPZ_tUEytO5z2XE6-TnagJ3taPVA@mail.gmail.com>
 <TY1PR01MB1562F2D2FD1BF47A80B044028A270@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWgJrPRh8TRTrEjWsaRAhEQX0T7M5eBGP_z3Ft=T6FfDg@mail.gmail.com>
 <TY1PR01MB1562BACED660584300228AA08A260@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdU4WW_Yx7P1rJjUNSaDXXcSGDAyqap1Gm9sVcDRgL09dg@mail.gmail.com> <TY1PR01MB1562EEC8C0F3AB19370AC6F98A260@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562EEC8C0F3AB19370AC6F98A260@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Aug 2018 13:05:46 +0200
Message-ID: <CAMuHMdVbYak4N3RAR-kqT+m1981BdSnB2+SMmCnN0ffUrjKaVA@mail.gmail.com>
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

On Wed, Aug 8, 2018 at 12:39 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wednesday, August 08, 2018, Geert Uytterhoeven wrote:
> > BTW, I guess earlycon also works on RZ/A2 with current tty-next or
> > latest renesas-drivers?
>
> I was using your RFC patches on top of the current renesas-drivers.

I meant without the RFC patch series.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
