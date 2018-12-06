Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:37201 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728930AbeLFIWh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 03:22:37 -0500
MIME-Version: 1.0
References: <20181205153945.13767-1-geert+renesas@glider.be>
 <20181205153945.13767-5-geert+renesas@glider.be> <20181205212112.2ls6ta27ok3yiyco@verge.net.au>
In-Reply-To: <20181205212112.2ls6ta27ok3yiyco@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Dec 2018 09:22:24 +0100
Message-ID: <CAMuHMdW9kt3QyoJRkKA6c8OpCB7N-jEAo=qcxjhmy3nD2a0A9Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] soc: renesas: rcar-sysc: Fix power domain control
 after system resume
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Dec 5, 2018 at 10:21 PM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Dec 05, 2018 at 04:39:45PM +0100, Geert Uytterhoeven wrote:
> > To control power to a power domain, the System Controller (SYSC) needs
> > the corresponding interrupt source to be enabled, but masked, to prevent
> > the CPU from receiving it.
> >
> > Currently this is handled in the driver's probe() routine, and set up
> > for every domain present, even if it will not be controlled directly by
> > SYSC (CPU domains are powered through the APMU on R-Car Gen2 and later).
> >
> > On R-Car Gen3, PSCI powers down the SoC during system suspend, thus
> > loosing any configured interrupt state.  Hence after system resume, power
> > domains not controlled through the APMU (e.g. A3IR, A3VC, A3VP) fail to
> > power up.
>
> I corrected the spelling of losing when applying this patch.

Checkpatch complained about that as well, so I did some investigation, and
decided to keep it... Was I wrong?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
