Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:34784 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934619AbeFMQsw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 12:48:52 -0400
Received: by mail-vk0-f66.google.com with SMTP id q135-v6so1937176vkh.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jun 2018 09:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20180611121513.9673-1-marek.vasut+renesas@gmail.com>
 <20180613110647.ygg66nu36pcf6kpn@verge.net.au> <CAMuHMdUsBNU-1y+_UfX6GKSC11pOB_BUhPKO-axUiO+BfgqVmw@mail.gmail.com>
 <20180613143626.rrdxq4i4guy2oryg@verge.net.au>
In-Reply-To: <20180613143626.rrdxq4i4guy2oryg@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Jun 2018 18:48:37 +0200
Message-ID: <CAMuHMdUbpfpH6m1ScdegC8ra_W1mu_vwqC5g_GDGvC+oaxmmyA@mail.gmail.com>
Subject: Re: [PATCH V5] ARM: shmobile: Rework the PMIC IRQ line quirk
To: Simon Horman <horms@verge.net.au>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Jun 13, 2018 at 4:36 PM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Jun 13, 2018 at 01:21:34PM +0200, Geert Uytterhoeven wrote:
> > On Wed, Jun 13, 2018 at 1:06 PM Simon Horman <horms@verge.net.au> wrote:
> > > On Mon, Jun 11, 2018 at 02:15:13PM +0200, Marek Vasut wrote:
> > > > Rather than hard-coding the quirk topology, which stopped scaling,
> > > > parse the information from DT. The code looks for all compatible
> > > > PMICs -- da9063 and da9210 -- and checks if their IRQ line is tied
> > > > to the same pin. If so, the code sends a matching sequence to the
> > > > PMIC to deassert the IRQ.
> > > >
> > > > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > > > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > > Cc: Simon Horman <horms+renesas@verge.net.au>
> > > > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > Cc: linux-renesas-soc@vger.kernel.org
> > > > Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be> (on Koelsch)
> > >
> > > This looks fine to me but I will wait to see if there are other reviews
> > > before applying.
> > >
> > > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> >
> > Note that applying it now will break gose, as its DTS doesn't describe all
> > regulators yet.
>
> Ok, so old DT will break with new kernels?

For Lager, it will break with pre-v4.2 DTS, so I think that's not a problem.
For Koelsch, the regulators were added even earlier.
Stout had all regulators from the initial support in upstream.

So Gose is the only issue. Do we care?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
