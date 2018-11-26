Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59377 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbeKZT0b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 14:26:31 -0500
Date: Mon, 26 Nov 2018 09:33:04 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] sata_rcar: fix deferred probing
Message-ID: <20181126083304.ql3santzic5o2upe@verge.net.au>
References: <b28a6c60-1f20-e054-7f2a-c5a6cafde8a1@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b28a6c60-1f20-e054-7f2a-c5a6cafde8a1@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Nov 24, 2018 at 09:14:16PM +0300, Sergei Shtylyov wrote:
> The driver overrides the error codes returned by platform_get_irq() to
> -EINVAL, so if it returns -EPROBE_DEFER, the driver would fail the probe
> permanently instead of the deferred probing. Switch to propagating the
> error code upstream, still checking/overriding IRQ0 as libata regards it
> as "no IRQ" (thus polling) anyway...
> 
> Fixes: 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> ---
> This patch is against the 'master' branch of Jens Axboe's 'linux-block.git'
> repo.
> 
>  drivers/ata/sata_rcar.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Index: linux-block/drivers/ata/sata_rcar.c
> ===================================================================
> --- linux-block.orig/drivers/ata/sata_rcar.c
> +++ linux-block/drivers/ata/sata_rcar.c
> @@ -891,7 +891,9 @@ static int sata_rcar_probe(struct platfo
>  	int ret = 0;
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq <= 0)
> +	if (irq < 0)
> +		return irq;
> +	if (!irq)
>  		return -EINVAL;
>  
>  	priv = devm_kzalloc(dev, sizeof(struct sata_rcar_priv), GFP_KERNEL);
> 
