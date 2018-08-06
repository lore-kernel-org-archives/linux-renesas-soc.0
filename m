Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:36313 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727551AbeHFQvY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 12:51:24 -0400
MIME-Version: 1.0
References: <20180806140755.24087-1-geert+renesas@glider.be> <5328542.T44L6SpoGe@avalon>
In-Reply-To: <5328542.T44L6SpoGe@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Aug 2018 16:41:47 +0200
Message-ID: <CAMuHMdWOdT9UVbogNm1oDGHm160Nvfmbz7pE_TSE_RHvxdi4ZA@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/4] sh-sci : Do not derive regshift from regsize
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
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

Hi Laurent,

On Mon, Aug 6, 2018 at 4:37 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Monday, 6 August 2018 17:07:51 EEST Geert Uytterhoeven wrote:
> > This RFC patch series was sparked by noticing that commit 2d4dd0da45401c7a
>
> Where can that commit be found ?

tty-next

> > ("serial: sh-sci: Allow for compressed SCIF address") broke earlycon
> > support on most Renesas ARM SoCs using SCIF ports, and by the fragility of
> > deriving regshift from the register block size (which may be rounded up):
>
> Why should it be rounded up ?

There's no requirement to round it up.  But it's not uncommon to round up
register block sizes to the next power of two, or more.

In hindsight, perhaps we should have adopted the "reg-shift" DT property,
which is used by other serial port drivers, and by of_setup_earlycon().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
