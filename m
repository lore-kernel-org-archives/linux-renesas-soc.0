Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www381.your-server.de ([78.46.137.84]:59857 "EHLO
        www381.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750950AbdBFMjq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Feb 2017 07:39:46 -0500
Subject: Re: [PATCH] dmaengine: rcar: Fix release resources after interrupt
 process
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        vinod.koul@intel.com
References: <1486384214-23580-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <761b3333-732d-9b5f-feb3-89768ac1c74c@metafoo.de>
Date: Mon, 6 Feb 2017 13:39:39 +0100
MIME-Version: 1.0
In-Reply-To: <1486384214-23580-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/06/2017 01:30 PM, Yoshihiro Shimoda wrote:
> From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> 
> This patch fixes the problem that occasionally released resources
> before the end of interrupt processing.
> 
> [   58.156412] Unable to handle kernel NULL pointer dereference at virtual
>  address 00000000
> [   58.166155] pgd = ffff8006f78b0000
> [   58.169822] [00000000] *pgd=000000073773b003 , *pud=0000000737c70003 ,
>  *pmd=0000000000000000
> [   58.179738]
> [   58.181548] Internal error: Oops: 96000046 [#1] PREEMPT SMP
> [   58.187484] Modules linked in:
> [   58.190919] CPU: 0 PID: 2898 Comm: dma_ioctl Not tainted 4.9.0-00002-g501
> 07f2-dirty #147
> [   58.199438] Hardware name: Renesas Salvator-X board based on r8a7795 (DT)
> [   58.206680] task: ffff8006f77b1900 task.stack: ffff8006f7bd4000
> [   58.213090] PC is at rcar_dmac_chan_prep_sg+0xa4/0x3f0
> [   58.218725] LR is at rcar_dmac_chan_prep_sg+0x6c/0x3f0
> 
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

How about implementing the synchronize() callback. This will fix not only
this race condition, but also others that can result from the same issue.
E.g. the completion callback still running after terminate() has completed.

> ---
>  drivers/dma/sh/rcar-dmac.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 2e441d0..2e0a0d4 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -986,8 +986,11 @@ static void rcar_dmac_free_chan_resources(struct dma_chan *chan)
>  {
>  	struct rcar_dmac_chan *rchan = to_rcar_dmac_chan(chan);
>  	struct rcar_dmac *dmac = to_rcar_dmac(chan->device);
> +	struct platform_device *pdev = to_platform_device(dmac->dev);
>  	struct rcar_dmac_desc_page *page, *_page;
>  	struct rcar_dmac_desc *desc;
> +	int irq;
> +	char pdev_irqname[5];
>  	LIST_HEAD(list);
>  
>  	/* Protect against ISR */
> @@ -995,6 +998,14 @@ static void rcar_dmac_free_chan_resources(struct dma_chan *chan)
>  	rcar_dmac_chan_halt(rchan);
>  	spin_unlock_irq(&rchan->lock);
>  
> +	sprintf(pdev_irqname, "ch%u", rchan->index);
> +	irq = platform_get_irq_byname(pdev, pdev_irqname);
> +	if (irq < 0) {
> +		dev_err(dmac->dev, "no IRQ specified for channel %u\n",
> +			rchan->index);
> +		return;
> +	}
> +	synchronize_irq(irq);
>  	/* Now no new interrupts will occur */
>  
>  	if (rchan->mid_rid >= 0) {
> 
