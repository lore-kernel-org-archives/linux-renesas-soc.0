Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:46416 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752050AbdJKN0n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 09:26:43 -0400
Received: by mail-wm0-f68.google.com with SMTP id m72so4764005wmc.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2017 06:26:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1507727130-17641-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1507725113-18070-1-git-send-email-geert+renesas@glider.be> <1507727130-17641-1-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Oct 2017 15:26:42 +0200
Message-ID: <CAMuHMdVq9W3egZh7k0-m3X2hs8TLwCdg5ma9-n6=6fG_rro=zQ@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource/drivers/ostm: Use unique device name
 instead of ostm
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Wed, Oct 11, 2017 at 3:05 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Currently all OSTM devices are called "ostm", also in kernel messages.
>
> As there can be multiple instances in an SoC, this can confuse the user.
> Hence construct a unique name from the DT node name, like is done for
> platform devices.
>
> On GR-Peach, the boot log changes like:
>
>     -clocksource: ostm: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
>     +clocksource: ostm /timer@fcfec000: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
>      sched_clock: 32 bits at 33MHz, resolution 30ns, wraps every 64440619504ns
>     -ostm: used for clocksource
>     -ostm: used for clock events
>     +ostm /timer@fcfec000: used for clocksource
>     +ostm /timer@fcfec400: used for clock events
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for testing!

> ---
> Hi Geert,
>    with your original patch boot log looks like:
>
>  clocksource: ostm timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57339246898 ns
>  ostm timer: used for clocksource
>  ostm timer: used for clock events
>  clocksource: Switched to clocksource ostm timer
>
> Using "np->name" to sprintf the ostm name is not that useful as all ostm
> instances will appear as "ostm timer".
>
> With this v2 I am using "np->full_name" and custom print modifier "%pOF" to
> sprintf the node name, and now boot log looks like what I have reported in the
> change log (*)
>
> Thanks
>    j
>
> (*) Using %pOF results in "/timer@fcfec000" with the "/" at beginning of
>     timer name. I used %pOF as it has been recently introduced, but if you
>     feel like it's better to get rid of the "/" I can fall back to
>     ("%s", np->full_name)

Right, I forgot the unit address is not included.

What I really intended was to print "fcfec000.timer", cfr.
of_device_make_bus_id()
for platform devices.

IMHO the full name is a bit long.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
