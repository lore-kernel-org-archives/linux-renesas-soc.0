Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39026 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935705AbeFMOgk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 10:36:40 -0400
Date: Wed, 13 Jun 2018 16:36:35 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH V5] ARM: shmobile: Rework the PMIC IRQ line quirk
Message-ID: <20180613143626.rrdxq4i4guy2oryg@verge.net.au>
References: <20180611121513.9673-1-marek.vasut+renesas@gmail.com>
 <20180613110647.ygg66nu36pcf6kpn@verge.net.au>
 <CAMuHMdUsBNU-1y+_UfX6GKSC11pOB_BUhPKO-axUiO+BfgqVmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUsBNU-1y+_UfX6GKSC11pOB_BUhPKO-axUiO+BfgqVmw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 13, 2018 at 01:21:34PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Jun 13, 2018 at 1:06 PM Simon Horman <horms@verge.net.au> wrote:
> > On Mon, Jun 11, 2018 at 02:15:13PM +0200, Marek Vasut wrote:
> > > Rather than hard-coding the quirk topology, which stopped scaling,
> > > parse the information from DT. The code looks for all compatible
> > > PMICs -- da9063 and da9210 -- and checks if their IRQ line is tied
> > > to the same pin. If so, the code sends a matching sequence to the
> > > PMIC to deassert the IRQ.
> > >
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > Cc: Simon Horman <horms+renesas@verge.net.au>
> > > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > Cc: linux-renesas-soc@vger.kernel.org
> > > Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be> (on Koelsch)
> >
> > This looks fine to me but I will wait to see if there are other reviews
> > before applying.
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Note that applying it now will break gose, as its DTS doesn't describe all
> regulators yet.

Ok, so old DT will break with new kernels?
