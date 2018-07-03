Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:44404 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754226AbeGCFsh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jul 2018 01:48:37 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Vinod <vkoul@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dmaengine@vger.kernel.org,
        Hiroki Negishi <hiroki.negishi.bx@renesas.com>
Subject: Re: [PATCH] dmaengine: rcar-dmac: convert to SPDX identifiers
Date: Tue, 03 Jul 2018 08:49:01 +0300
Message-ID: <1941522.TqLtPnU1Jj@avalon>
In-Reply-To: <87601xrwrk.wl-kuninori.morimoto.gx@renesas.com>
References: <87601xrwrk.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

Thank you for the patch.

On Tuesday, 3 July 2018 03:29:59 EEST Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

A commit message would be nice :-)
 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/dma/sh/rcar-dmac.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 79d14af..322e57b 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1,14 +1,10 @@
> -/*
> - * Renesas R-Car Gen2 DMA Controller Driver
> - *
> - * Copyright (C) 2014 Renesas Electronics Inc.
> - *
> - * Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> - *
> - * This is free software; you can redistribute it and/or modify
> - * it under the terms of version 2 of the GNU General Public License as
> - * published by the Free Software Foundation.
> - */
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Renesas R-Car Gen2 DMA Controller Driver
> +//
> +// Copyright (C) 2014 Renesas Electronics Inc.
> +//
> +// Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I think the preferred comment style, accordingly to what other drivers do, is

// SPDX-License-Identifier: GPL-2.0
/*
 * Renesas R-Car Gen2 DMA Controller Driver
 *
 * Copyright (C) 2014 Renesas Electronics Inc.
 *
 * Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 */

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>

-- 
Regards,

Laurent Pinchart
