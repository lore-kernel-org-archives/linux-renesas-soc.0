Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932613AbeGCGUY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jul 2018 02:20:24 -0400
Date: Tue, 3 Jul 2018 11:50:08 +0530
From: Vinod <vkoul@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20180703062008.GM22377@vkoul-mobl>
References: <87601xrwrk.wl-kuninori.morimoto.gx@renesas.com>
 <1941522.TqLtPnU1Jj@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1941522.TqLtPnU1Jj@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03-07-18, 08:49, Laurent Pinchart wrote:
> Hi Morimoto-san,
> 
> Thank you for the patch.
> 
> On Tuesday, 3 July 2018 03:29:59 EEST Kuninori Morimoto wrote:
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> A commit message would be nice :-)
>  
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >  drivers/dma/sh/rcar-dmac.c | 18 +++++++-----------
> >  1 file changed, 7 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> > index 79d14af..322e57b 100644
> > --- a/drivers/dma/sh/rcar-dmac.c
> > +++ b/drivers/dma/sh/rcar-dmac.c
> > @@ -1,14 +1,10 @@
> > -/*
> > - * Renesas R-Car Gen2 DMA Controller Driver
> > - *
> > - * Copyright (C) 2014 Renesas Electronics Inc.
> > - *
> > - * Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > - *
> > - * This is free software; you can redistribute it and/or modify
> > - * it under the terms of version 2 of the GNU General Public License as
> > - * published by the Free Software Foundation.
> > - */
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Renesas R-Car Gen2 DMA Controller Driver
> > +//
> > +// Copyright (C) 2014 Renesas Electronics Inc.
> > +//
> > +// Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I think the preferred comment style, accordingly to what other drivers do, is
> 
> // SPDX-License-Identifier: GPL-2.0
> /*
>  * Renesas R-Car Gen2 DMA Controller Driver
>  *
>  * Copyright (C) 2014 Renesas Electronics Inc.
>  *
>  * Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  */

And Linus said this https://lkml.org/lkml/2017/11/25/133

So lets keep C99 style as Morimoto-San proposed.

And high time, this should be documented :)

-- 
~Vinod
