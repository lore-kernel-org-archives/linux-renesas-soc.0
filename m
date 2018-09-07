Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:40903 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbeIGNwM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Sep 2018 09:52:12 -0400
MIME-Version: 1.0
References: <875zziqdem.wl-kuninori.morimoto.gx@renesas.com> <d55d4d25-9966-cf34-7258-97009a9fa5ce@cogentembedded.com>
In-Reply-To: <d55d4d25-9966-cf34-7258-97009a9fa5ce@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Sep 2018 11:11:59 +0200
Message-ID: <CAMuHMdVJ+3cX5hMntJ=YJwA48gju+PEcsh-NQmpDRMCnAVG=zw@mail.gmail.com>
Subject: Re: [PATCH] ethernet: renesas: convert to SPDX identifiers
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Mark Brown <broonie@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Sep 7, 2018 at 11:05 AM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 9/7/2018 5:02 AM, Kuninori Morimoto wrote:
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >
> > This patch updates license to use SPDX-License-Identifier
> > instead of verbose license text.
> >
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >   drivers/net/ethernet/renesas/Kconfig    | 1 +
> >   drivers/net/ethernet/renesas/Makefile   | 1 +
> >   drivers/net/ethernet/renesas/ravb_ptp.c | 6 +-----
> >   3 files changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/renesas/Kconfig b/drivers/net/ethernet/renesas/Kconfig
> > index f3f7477..bb0ebdf 100644
> > --- a/drivers/net/ethernet/renesas/Kconfig
> > +++ b/drivers/net/ethernet/renesas/Kconfig
> > @@ -1,3 +1,4 @@
> > +# SPDX-License-Identifier: GPL-2.0
> >   #
> >   # Renesas device configuration
> >   #
>
>     There was no license at all on this file...

So it's licensed under GPL-2.0.
Cfr. e.g. commit 7328c8f48d1895b3 ("PCI: Add SPDX GPL-2.0 when no license
was specified")

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
