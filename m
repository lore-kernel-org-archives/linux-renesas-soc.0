Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:33347 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932511AbdGKI5O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2017 04:57:14 -0400
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1-yuxQ-m5h+u38TKoybfxrAF8XpwcB9xFYKePhukXaQw@mail.gmail.com>
References: <1499693302-25120-1-git-send-email-geert+renesas@glider.be>
 <1499693302-25120-10-git-send-email-geert+renesas@glider.be>
 <CANqRtoSi8x7zqwV3Gp_n0dBe4Uw6LDRvC1Lheu+GrLZNYuxAHw@mail.gmail.com>
 <CAMuHMdXb1yAgw4AVvheYhPV=V9HeDCW2NdvhJWzoSz8i-mM3TQ@mail.gmail.com> <CAK8P3a1-yuxQ-m5h+u38TKoybfxrAF8XpwcB9xFYKePhukXaQw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Jul 2017 10:57:07 +0200
Message-ID: <CAMuHMdUiXQEYroYsDAvrM_evGv0Fy-+knEoiQHdha3UExhQTEg@mail.gmail.com>
Subject: Re: [PATCH 9/9] ARM: multi_v7_defconfig: Enable DMA for Renesas
 serial ports
To: Arnd Bergmann <arnd@arndb.de>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kevin Hilman <khilman@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE"
        <uclinux-h8-devel@lists.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Arnd,

On Tue, Jul 11, 2017 at 10:39 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Jul 11, 2017 at 8:59 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>
>> Whether we want to hide the option (and default to y if ARCH_RENESAS, i.e.
>> ARM) is another question.  Note that that wouldn't reduce code maintainability,
>> as the #ifdefs would be kept, and it would prevent building and testing
>> with/without DMA on ARM.
>
> arch/sh/configs/sdk7786_defconfig enables it, too, so it should at least be
> a user-selectable option on SuperH if you do that.

But that can't enable DMA, as (1) the non-DT DMA configuration was removed
due to (2) being unused.

Cfr. commit 219fb0c1436e4893 ("serial: sh-sci: Remove the platform data dma
slave rx/tx channel IDs").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
