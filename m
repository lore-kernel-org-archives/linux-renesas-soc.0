Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:33227 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729284AbeGMIdd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jul 2018 04:33:33 -0400
Received: by mail-ua0-f195.google.com with SMTP id i4-v6so13241214uak.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jul 2018 01:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20180712160857.31471-1-geert+renesas@glider.be> <20180713080823.l4tng6oclhr6nxrh@verge.net.au>
In-Reply-To: <20180713080823.l4tng6oclhr6nxrh@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jul 2018 10:19:46 +0200
Message-ID: <CAMuHMdUrgP=YOrgeEnpQ0XVOoC_8Dz9Lt2FJ4P5GKb53KRNpNw@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: shmobile: Always enable ARCH_TIMER on SoCs with
 A7 and/or A15
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Jul 13, 2018 at 10:08 AM Simon Horman <horms@verge.net.au> wrote:
> On Thu, Jul 12, 2018 at 06:08:57PM +0200, Geert Uytterhoeven wrote:
> > R-Mobile APE6, R-Car Gen2, and RZ/G1 SoCs have Cortex-A7 and/or
> > Cortex-A15 CPU cores, all of which have ARM architectured timers.
> >
> > Force use of the ARM architectured timer on these SoCs.
> > This allows to:
> >   - Remove the calls to shmobile_init_delay() from the corresponding
> >     machine vectors,
> >   - Remove a check in timer setup specific to R-Car Gen2,
> >   - Remove a check in shmobile_init_delay().
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Hi Geert,
>
> on which boards did you test this?

On APE6EVM and Koelsch (R-Car M2-W).
I can give it a spin on a few more remote R-Car Gen2 boards if you want.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
