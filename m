Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35972 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754185AbdJINFC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 09:05:02 -0400
Received: by mail-wm0-f67.google.com with SMTP id 131so14374791wmk.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Oct 2017 06:05:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1507209837-16938-1-git-send-email-horms+renesas@verge.net.au>
References: <1507209837-16938-1-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Oct 2017 15:05:00 +0200
Message-ID: <CAMuHMdW83Wv1d9oKCcHRUh+kSnxxDrgFvfgT=f5t9nq0C8Jq6Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] clk: renesas: r8a779[56]: Add Z and Z2 clock support
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Oct 5, 2017 at 3:23 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> this patch-set adds Z and Z2 clock support.
>
> These are dependencies for supporting CPUFreq. The remainder of that
> work is being posted separately and can be found at:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/rcar-gen3-cpufreq
>
>
> A description of steps taken to lightly exercise the same feature for the
> r88a7795 the above can be found at the link below. The results are the same
> for the r8a7796 with the exception that it has two active CPU cores rather
> than four.
>
> http://elinux.org/Tests:R-CAR-GEN3-CPUFreq

Thanks for your patches!

I see the following anomalies on Salvator-X (R-Car H3 ES1.0 and M3-W ES1.0)
and Salvator-XS (R-Car H3 ES2.0):

1. dmesg:

    cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 2999999 KHz
    cpu cpu0: dev_pm_opp_set_rate: failed to find current OPP for freq
2999999880 (-34)
    cpufreq: cpufreq_online: CPU0: Unlisted initial frequency changed
to: 1500000 KHz

2. Z2 clock frequency:

    grep -wE "(z|z2)" /sys/kernel/debug/clk/clk_summary
          z2                              0            0  2399999904
       0 0
          z                               0            0  1499999940
       0 0

So Linux is off by a factor of two for the initial Z and Z2 clock frequencies.
Which means it's probably off by a factor of two all the time, and thus running
the CA57 CPU cores at 750 MHz instead of 1.5 GHz?

<looking at the PMU cycle counter>

Yes, it's only running at 750 MHz.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
