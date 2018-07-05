Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46988 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753287AbeGEI3h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Jul 2018 04:29:37 -0400
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
Subject: Re: [PATCH v2] dmaengine: rcar-dmac: convert to SPDX identifiers
Date: Thu, 05 Jul 2018 11:30:07 +0300
Message-ID: <7735701.7c6vkt9JJK@avalon>
In-Reply-To: <87r2kjx2qw.wl-kuninori.morimoto.gx@renesas.com>
References: <87r2kjx2qw.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

Thank you for the patch.

On Wednesday, 4 July 2018 03:34:10 EEST Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch is using C++ comment style for SPDX line only,
> because driver author want it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> I posted this because I don't know which style was OK.
> Please pick-up best side patch
> 
> v1 -> v2
> 
>  - used // for SPDX line only
> 
>  drivers/dma/sh/rcar-dmac.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 79d14af..ebd160d 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1,13 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Renesas R-Car Gen2 DMA Controller Driver
>   *
>   * Copyright (C) 2014 Renesas Electronics Inc.
>   *
>   * Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> - *
> - * This is free software; you can redistribute it and/or modify
> - * it under the terms of version 2 of the GNU General Public License as
> - * published by the Free Software Foundation.
>   */
> 
>  #include <linux/delay.h>


-- 
Regards,

Laurent Pinchart
