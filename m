Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:16636 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755670AbdESDtX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2017 23:49:23 -0400
Date: Fri, 19 May 2017 09:21:33 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/3] dmaengine: rcar-dmac: store channel IRQ in struct
 rcar_dmac_chan
Message-ID: <20170519035133.GN15061@localhost>
References: <20170515230917.31888-1-niklas.soderlund+renesas@ragnatech.se>
 <20170515230917.31888-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170515230917.31888-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 16, 2017 at 01:09:15AM +0200, Niklas S�derlund wrote:
> The IRQ number is needed after probe to be able to add synchronisation
> points in other places in the driver when freeing resources and to
> implement a device_synchronize() callback. Store the IRQ number in the
> struct rcar_dmac_chan so that it can be used later.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/dma/sh/rcar-dmac.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index db41795fe42ae6ed..c68c3336bdad44df 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -144,6 +144,7 @@ struct rcar_dmac_chan_map {
>   * @chan: base DMA channel object
>   * @iomem: channel I/O memory base
>   * @index: index of this channel in the controller
> + * @irq: channel IRQ
>   * @src: slave memory address and size on the source side
>   * @dst: slave memory address and size on the destination side
>   * @mid_rid: hardware MID/RID for the DMA client using this channel
> @@ -161,6 +162,7 @@ struct rcar_dmac_chan {
>  	struct dma_chan chan;
>  	void __iomem *iomem;
>  	unsigned int index;
> +	int irq;

Thats a bit odd choice to store per ch, I would have stored in rcar_dmac.
Any specific reason, do we have per ch irq here?

>  
>  	struct rcar_dmac_chan_slave src;
>  	struct rcar_dmac_chan_slave dst;
> @@ -1647,7 +1649,6 @@ static int rcar_dmac_chan_probe(struct rcar_dmac *dmac,
>  	struct dma_chan *chan = &rchan->chan;
>  	char pdev_irqname[5];
>  	char *irqname;
> -	int irq;
>  	int ret;
>  
>  	rchan->index = index;
> @@ -1664,8 +1665,8 @@ static int rcar_dmac_chan_probe(struct rcar_dmac *dmac,
>  
>  	/* Request the channel interrupt. */
>  	sprintf(pdev_irqname, "ch%u", index);
> -	irq = platform_get_irq_byname(pdev, pdev_irqname);
> -	if (irq < 0) {
> +	rchan->irq = platform_get_irq_byname(pdev, pdev_irqname);
> +	if (rchan->irq < 0) {
>  		dev_err(dmac->dev, "no IRQ specified for channel %u\n", index);
>  		return -ENODEV;
>  	}
> @@ -1675,11 +1676,13 @@ static int rcar_dmac_chan_probe(struct rcar_dmac *dmac,
>  	if (!irqname)
>  		return -ENOMEM;
>  
> -	ret = devm_request_threaded_irq(dmac->dev, irq, rcar_dmac_isr_channel,
> +	ret = devm_request_threaded_irq(dmac->dev, rchan->irq,
> +					rcar_dmac_isr_channel,
>  					rcar_dmac_isr_channel_thread, 0,
>  					irqname, rchan);
>  	if (ret) {
> -		dev_err(dmac->dev, "failed to request IRQ %u (%d)\n", irq, ret);
> +		dev_err(dmac->dev, "failed to request IRQ %u (%d)\n",
> +			rchan->irq, ret);

orthogonal, while at it care to fix explicit free of irq in remove, it seems
this driver doesn't do so..

-- 
~Vinod
