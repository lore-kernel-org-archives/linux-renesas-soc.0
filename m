Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37978 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbeKUSM7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 13:12:59 -0500
MIME-Version: 1.0
References: <20181118172903.4481-1-marek.vasut+renesas@gmail.com>
 <20181118172903.4481-4-marek.vasut+renesas@gmail.com> <CAMuHMdXjFguUO1QJXDrfjbOBY7ZHy2PM41vAKx4oppqoY0RviA@mail.gmail.com>
 <CAMuHMdWBgEXHS1tfbysindPyfjm54Qrtf3o+gEzN1N4gOzzydQ@mail.gmail.com> <e89dbb42-2c43-0201-ad26-b2f3ae8bc8cf@gmail.com>
In-Reply-To: <e89dbb42-2c43-0201-ad26-b2f3ae8bc8cf@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Nov 2018 08:39:24 +0100
Message-ID: <CAMuHMdWueA-rmyc5FSkW6uQzPzdBm_kBdUthnwsghBvZKL5EVQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: sh-pfc: r8a77990: Add CAN FD pins, groups
 and functions
To: Marek Vasut <marek.vasut@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Wed, Nov 21, 2018 at 12:33 AM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 11/19/2018 10:47 AM, Geert Uytterhoeven wrote:
> > On Mon, Nov 19, 2018 at 10:06 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> >> On Sun, Nov 18, 2018 at 6:29 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> >>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >>>
> >>> This patch adds CAN FD{0,1} pins, groups and functions to the R8A77990
> >>> SoC.
> >>>
> >>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> i.e. will queue in sh-pfc-for-v4.21.
> >
> > Upon second look, the canfd groups and functions should be moved from
> > the common to the automotive section, as RZ/G2E does not have them.
> > As I have to update the array sizes anyway (my branch already has more
> > patches applied), I moved them while applying.
> >
> > Please check the result later today, after I have pushed.
>
> Looks OK to me. Incrementing the array sizes in the driver is kinda icky

Thanks!

> though.

Unfortunately I see no way to avoid that, as both arrays need to be consecutive
in memory.  Do you see a better solution?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
