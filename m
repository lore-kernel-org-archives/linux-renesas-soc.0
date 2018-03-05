Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:59168 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932896AbeCELZw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Mar 2018 06:25:52 -0500
Date: Mon, 5 Mar 2018 16:59:45 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dmaengine: rcar-dmac: Check the done lists in
 rcar_dmac_chan_get_residue()
Message-ID: <20180305112945.GO15443@localhost>
References: <1517565915-14234-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1517565915-14234-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 02, 2018 at 07:05:15PM +0900, Yoshihiro Shimoda wrote:
> This patch fixes an issue that a race condition happens between a client
> driver and the rcar-dmac driver:
> 
> - The rcar_dmac_isr_transfer_end() is called.
>  - The done list appears, and desc.running is the next active list.
> - rcar_dmac_chan_get_residue() is called by a client driver before
>   rcar_dmac_isr_channel_thread() is called.
>  - The rcar_dmac_chan_get_residue() will not find any descriptors.
>  - And, the following WARNING happens:
> 	WARN(1, "No descriptor for cookie!");
> 
> The sh-sci driver with HSCIF (921,600bps) on R-Car H3 can cause this
> situation.
> So, this patch checks the done lists in rcar_dmac_chan_get_residue()
> and returns zero if the done lists has the argument cookie.

Applied, thanks

> 
> Tested-by: Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/dma/sh/rcar-dmac.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 2b2c7db..f748be6 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1264,8 +1264,17 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
>  	 * If the cookie doesn't correspond to the currently running transfer
>  	 * then the descriptor hasn't been processed yet, and the residue is
>  	 * equal to the full descriptor size.
> +	 * Also, a client driver is possible to call this function before
> +	 * rcar_dmac_isr_channel_thread() runs. In this case, the "desc.running"
> +	 * will be the next descriptor, and the done list will appear. So, if
> +	 * the argument cookie matches the done list's cookie, we can assume
> +	 * the residue is zero.
>  	 */
>  	if (cookie != desc->async_tx.cookie) {
> +		list_for_each_entry(desc, &chan->desc.done, node) {
> +			if (cookie == desc->async_tx.cookie)
> +				return 0;
> +		}
>  		list_for_each_entry(desc, &chan->desc.pending, node) {
>  			if (cookie == desc->async_tx.cookie)
>  				return desc->size;
> -- 
> 1.9.1
> 

-- 
~Vinod
