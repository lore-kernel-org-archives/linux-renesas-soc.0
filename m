Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:35867 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388069AbeGWKLh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 06:11:37 -0400
Received: by mail-ua0-f195.google.com with SMTP id y8-v6so11288953uan.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jul 2018 02:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1532086504.git.horms+renesas@verge.net.au> <20180721220343.yuwrfxz3fo25krzv@localhost>
In-Reply-To: <20180721220343.yuwrfxz3fo25krzv@localhost>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Jul 2018 11:11:12 +0200
Message-ID: <CAMuHMdVbyUa5PtQf4LZQDv-=aqToahX5Eb4TEDvsJniYm-trNQ@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v4.19
To: Olof Johansson <olof@lixom.net>
Cc: Simon Horman <horms+renesas@verge.net.au>, arm@kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof,

On Sun, Jul 22, 2018 at 12:27 AM Olof Johansson <olof@lixom.net> wrote:
> On Fri, Jul 20, 2018 at 02:03:54PM +0200, Simon Horman wrote:
> > Please consider these Renesas ARM based SoC defconfig updates for v4.19.

> > * Set CONFIG_LOCALVERSION to shmobile_defconfig
> >
> >   This follows what appears to be common practice in defconfigs
> >   and allows easier management of the kernel flavour at run-time.
>
> I replied to the multi-versions of defconfig for this patch -- it's not a good
> way to solve the problem of detecting config at runtime. Please drop this
> patch. See:
>
> https://lore.kernel.org/lkml/CAOesGMgkU6yBRpAsED2fPyuAo9Tc=YprndGdkmBVrc+0783VwQ@mail.gmail.com/

One more comment to the rescue: it does complicate regression testing,
as the test software running on the DUT has no easy way to distinguish
between e.g. shmobile_defconfig and multi_v7_defconfig (and whatever
other board-specific configs I use for testing).
Yes, I can have these as local patches in my tree (of course I already have ;-),
but when bisecting, I have to remember to (un)apply them in every step.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
