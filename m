Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933415AbeGIRZa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jul 2018 13:25:30 -0400
Date: Mon, 9 Jul 2018 22:55:21 +0530
From: Vinod <vkoul@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] dma: sh: rcar-dmac: Add dma_pause operation
Message-ID: <20180709172521.GN22377@vkoul-mobl>
References: <1530523312-2253-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530523312-2253-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02-07-18, 18:21, Yoshihiro Shimoda wrote:
> This patch set is based on the lasest slave-dma / next branch.
> 
> This issue can be reproduced by the following commands on r8a7795
> Salvator-XS with the fixed patch [1] and Windows Teraterm :) :
>  # stty 921600
>  (Change Teraterm baud rate)
>  # cat > rx.txt
>  (Send 5MiB file by Teraterm.)
>  # cmp <somewhere the 5MiB file> rx.txt
>  output "differ: byte NNNNN, line MMM"

Looks okay to me, Acks/tested-by..?

> 
> [1] https://patchwork.kernel.org/patch/10500775/
> 
> Yoshihiro Shimoda (2):
>   dma: sh: rcar-dmac: add a new function to clear CHCR.DE with barrier
>   dma: sh: rcar-dmac: Add dma_pause operation
> 
>  drivers/dma/sh/rcar-dmac.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
~Vinod
