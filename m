Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:40205 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731482AbeGMILZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jul 2018 04:11:25 -0400
Received: by mail-vk0-f66.google.com with SMTP id s23-v6so17749682vks.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jul 2018 00:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20180712160857.31471-1-geert+renesas@glider.be> <CANqRtoTuofutGtWycNcHq+rPzHqAsjy8ZY0W0k9m_SNWnOajVg@mail.gmail.com>
In-Reply-To: <CANqRtoTuofutGtWycNcHq+rPzHqAsjy8ZY0W0k9m_SNWnOajVg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jul 2018 09:57:43 +0200
Message-ID: <CAMuHMdVsASDbnk-8CtgZu6g5JYCVpj2eF4qFCy7q6bzBr1OEoA@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: shmobile: Always enable ARCH_TIMER on SoCs with
 A7 and/or A15
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Brandt <Chris.Brandt@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Fri, Jul 13, 2018 at 5:11 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> On Fri, Jul 13, 2018 at 1:08 AM, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
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

> > We still need shmobile_init_delay to setup loops-per-jiffies for the
> > other SoCs.  But perhaps we can use the Cortex-A9 global timer on those?
>
> Perhaps unrelated, but on older kernels with Cortex-A9 the TWD timer
> was only available when using SMP. So historically on our single-core
> systems (with CA8 or CA9 or when using CA9 multi core with maxcpus=1)
> we had no timer available unless we also used a CMT/TMU or similar.
>
> Exactly what the level of software support is available for the ARM
> timers at this point I'm not so sure about.

Using the TWD timer indeed has two issues:
  - It's available on multi-core Cortex-A9 SoCs only,
  - Its driver does not call register_current_timer_delay(), so it doesn't set
    up lpj_fine for skipping loop calibration.

The global timer driver does call register_current_timer_delay(), but so far no
Renesas SoCs describe its presence in DT.

At least SH-Mobile AG5 and R-Car M1A and H1 seem to have it.
RZ/A1 (and A2) and R-Mobile A1 don't seem to have it, though.
Perhaps the call to register_current_timer_delay() could be added to
the RZ/A OSTM driver?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
