Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbeIKMqP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 08:46:15 -0400
Date: Tue, 11 Sep 2018 13:18:02 +0530
From: Vinod <vkoul@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH] dma: sh: convert to SPDX identifiers
Message-ID: <20180911074802.GO2634@vkoul-mobl>
References: <878t4eqdkw.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878t4eqdkw.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07-09-18, 01:58, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch updates license to use SPDX-License-Identifier
> instead of verbose license text.

Thanks but the style is not consistent in files :(

Can we use one only?

> diff --git a/drivers/dma/sh/shdma-arm.h b/drivers/dma/sh/shdma-arm.h
> index a1b0ef4..30bcfe3 100644
> --- a/drivers/dma/sh/shdma-arm.h
> +++ b/drivers/dma/sh/shdma-arm.h
> @@ -1,11 +1,8 @@
> -/*
> +/* SPDX-License-Identifier: GPL-2.0

this is one

>  #ifndef SHDMA_ARM_H
> diff --git a/drivers/dma/sh/shdma-base.c b/drivers/dma/sh/shdma-base.c
> index 6b5626e..c51de49 100644
> --- a/drivers/dma/sh/shdma-base.c
> +++ b/drivers/dma/sh/shdma-base.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0

different

> diff --git a/drivers/dma/sh/shdma.h b/drivers/dma/sh/shdma.h
> index 2c0a969..73aec72 100644
> --- a/drivers/dma/sh/shdma.h
> +++ b/drivers/dma/sh/shdma.h
> @@ -1,14 +1,9 @@
> -/*
> +/* SPDX-License-Identifier: GPL-2.0+

this and so on..

-- 
~Vinod
