Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:43779 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934972AbeFMLVq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 07:21:46 -0400
Received: by mail-ua0-f196.google.com with SMTP id z16-v6so1443307uaz.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jun 2018 04:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20180611121513.9673-1-marek.vasut+renesas@gmail.com> <20180613110647.ygg66nu36pcf6kpn@verge.net.au>
In-Reply-To: <20180613110647.ygg66nu36pcf6kpn@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Jun 2018 13:21:34 +0200
Message-ID: <CAMuHMdUsBNU-1y+_UfX6GKSC11pOB_BUhPKO-axUiO+BfgqVmw@mail.gmail.com>
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

On Wed, Jun 13, 2018 at 1:06 PM Simon Horman <horms@verge.net.au> wrote:
> On Mon, Jun 11, 2018 at 02:15:13PM +0200, Marek Vasut wrote:
> > Rather than hard-coding the quirk topology, which stopped scaling,
> > parse the information from DT. The code looks for all compatible
> > PMICs -- da9063 and da9210 -- and checks if their IRQ line is tied
> > to the same pin. If so, the code sends a matching sequence to the
> > PMIC to deassert the IRQ.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Cc: Simon Horman <horms+renesas@verge.net.au>
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Cc: linux-renesas-soc@vger.kernel.org
> > Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be> (on Koelsch)
>
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Note that applying it now will break gose, as its DTS doesn't describe all
regulators yet.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
