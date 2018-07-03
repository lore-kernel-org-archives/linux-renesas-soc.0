Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:44552 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932944AbeGCGZY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jul 2018 02:25:24 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vinod <vkoul@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dmaengine@vger.kernel.org,
        Hiroki Negishi <hiroki.negishi.bx@renesas.com>
Subject: Re: [PATCH] dmaengine: rcar-dmac: convert to SPDX identifiers
Date: Tue, 03 Jul 2018 09:25:52 +0300
Message-ID: <2357768.TA8FcFTrJo@avalon>
In-Reply-To: <20180703062008.GM22377@vkoul-mobl>
References: <87601xrwrk.wl-kuninori.morimoto.gx@renesas.com> <1941522.TqLtPnU1Jj@avalon> <20180703062008.GM22377@vkoul-mobl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vinod,

On Tuesday, 3 July 2018 09:20:08 EEST Vinod wrote:
> On 03-07-18, 08:49, Laurent Pinchart wrote:
> > Hi Morimoto-san,
> > 
> > Thank you for the patch.
> > 
> > On Tuesday, 3 July 2018 03:29:59 EEST Kuninori Morimoto wrote:
> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > 
> > A commit message would be nice :-)
> > 
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > ---
> > > 
> > >  drivers/dma/sh/rcar-dmac.c | 18 +++++++-----------
> > >  1 file changed, 7 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> > > index 79d14af..322e57b 100644
> > > --- a/drivers/dma/sh/rcar-dmac.c
> > > +++ b/drivers/dma/sh/rcar-dmac.c
> > > @@ -1,14 +1,10 @@
> > > -/*
> > > - * Renesas R-Car Gen2 DMA Controller Driver
> > > - *
> > > - * Copyright (C) 2014 Renesas Electronics Inc.
> > > - *
> > > - * Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > - *
> > > - * This is free software; you can redistribute it and/or modify
> > > - * it under the terms of version 2 of the GNU General Public License as
> > > - * published by the Free Software Foundation.
> > > - */
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +//
> > > +// Renesas R-Car Gen2 DMA Controller Driver
> > > +//
> > > +// Copyright (C) 2014 Renesas Electronics Inc.
> > > +//
> > > +// Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > I think the preferred comment style, accordingly to what other drivers do,
> > is
> > 
> > // SPDX-License-Identifier: GPL-2.0
> > /*
> > 
> >  * Renesas R-Car Gen2 DMA Controller Driver
> >  *
> >  * Copyright (C) 2014 Renesas Electronics Inc.
> >  *
> >  * Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >  */
> 
> And Linus said this https://lkml.org/lkml/2017/11/25/133
> 
> So lets keep C99 style as Morimoto-San proposed.
> 
> And high time, this should be documented :)

As mentioned before, while I certainly prefer the traditional C-style 
comments, I ultimately let driver authors decide. What matters most in my 
opinion is consistency, mixing styles in the same driver just makes the code 
harder to read.

What matters in the end is how easy reading the code will be, and until the 
majority of kernel developers get used to the C++ comment style, no matter 
what Linus' personal preference is, // will be an annoyance.

-- 
Regards,

Laurent Pinchart
