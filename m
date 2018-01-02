Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f173.google.com ([209.85.216.173]:37495 "EHLO
        mail-qt0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750736AbeABIWd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jan 2018 03:22:33 -0500
Received: by mail-qt0-f173.google.com with SMTP id f2so61894086qtj.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jan 2018 00:22:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171231113609.cflgskbo4eqzgtjr@ninjato>
References: <20171231113609.cflgskbo4eqzgtjr@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jan 2018 09:22:32 +0100
Message-ID: <CAMuHMdXiGAHgybgoxZ9Nq_xY7a2tmigZFOo5AeLd-Cov6Ld_ug@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/topic/ip-switch-rework-2017 for renesas drivers
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Sun, Dec 31, 2017 at 12:36 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> here is V2 of the the topic branch to add the I2C IP core switcher to
> all busses of Gen2 boards where some kind of switching is possible
> (mostly to/from GPIO).
>
> It is based on v4.15-rc1 + renesas/dt-for-v4.16 +
> renesas/dt-fixes-for-v4.15 merged in.
>
> Please note the updated branch name (s/topc/topic/). And please pull.
>
> Kind regards,
>
>    Wolfram
>
>
> The following changes since commit d3e886748401cf19c44ba66239355fe50185d0cd:
>
>   Merge remote-tracking branch 'renesas/dt-fixes-for-v4.15' into HEAD (2017-12-31 12:30:26 +0100)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/ip-switch-rework-2017
>
> for you to fetch changes up to 3c471576f7285a55aeaf5c60b2beec1f208c4c80:
>
>   ARM: dts: gose: use demuxer for I2C4 (2017-12-31 12:30:39 +0100)

Thank you, merges cleanly into today's linux-next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
