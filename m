Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:41778 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbeLAAvf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 19:51:35 -0500
Received: by mail-ua1-f65.google.com with SMTP id z24so1869942ual.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Nov 2018 05:42:14 -0800 (PST)
MIME-Version: 1.0
References: <20181129003949.19984-1-niklas.soderlund+renesas@ragnatech.se>
 <20181129003949.19984-3-niklas.soderlund+renesas@ragnatech.se>
 <20181129165429.GA1660@kunai> <20181129171801.GD26216@bigcity.dyn.berto.se> <20181130114711.xa6g5w52lbpvuzru@ninjato>
In-Reply-To: <20181130114711.xa6g5w52lbpvuzru@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Nov 2018 14:42:01 +0100
Message-ID: <CAMuHMdW6xLx8Dqn=eMFYAjAe=qe=zu0jW=T-ruX2gp-_gg-sVw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: rcar-gen3: add HS400 quirk for SD clock
To: Wolfram Sang <wsa@the-dreams.de>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Fri, Nov 30, 2018 at 12:47 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > That should have been rate :-) To elaborate a bit more:
> >
> > The patch is different from v1 as a different approach to solve the
> > issue have been found. Instead of only ignoring the first row of the
> > list of possible settings when selecting which divider to use also
> > ignore it when examining which state the hardware is in. That is the
> > driver is no longer aware the first row exists with this patch.
> >
> > This was in v1 not possible as the first row might be a state the
> > bootloader left the hardware in and then the clock failed to register as
> > it would need to update its own state to match the hardware.
> >
> > As the driver needed to know about the state the hardware was in when
> > probing but not use it when selecting a divider the more complex v1 was
> > needed. When selecting a divider we wish for it to select the second
> > option for the divider value '4' when running on a SoC which needs the
> > quirk.
> >
> > With v2 which depends on [1] this is not needed as the clock driver now
> > sets a know state when registering the clock so this patch can be made
> > much simpler by simply 'removing' the first row from all operations.
>
> Thanks for the elaboration. I still think the above is the way to go and
> I still wonder a little why it was implemented differently beforehand.

Probably the initial implementation didn't care at all about selecting clock
speeds (no fancy SDR/HS modes supported), so just used whatever U-Boot
had set up.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
