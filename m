Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbeGaGGa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 02:06:30 -0400
Date: Tue, 31 Jul 2018 09:58:04 +0530
From: Vinod <vkoul@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: vinod.koul@intel.com, dmaengine@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sh: rcar-dmac: Should not stop the DMAC by
 rcar_dmac_sync_tcr()
Message-ID: <20180731042804.GB16775@vkoul-mobl>
References: <1532507224-4213-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1532507224-4213-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 25-07-18, 17:27, Yoshihiro Shimoda wrote:
> rcar_dmac_chan_get_residue() should not stop the DMAC, because
> the commit 538603c6026c ("dmaengine: sh: rcar-dmac: avoid to write
> CHCR.TE to 1 if TCR is set to 0") had fixed unexpected re-transferring
> issue. But it had caused the next issue which might stop the cyclic
> mode transferring. Thus, for example R-Car sound might be stopped
> suddenly.
> 
> According to the commit 73a47bd0da66 ("dmaengine: rcar-dmac: use TCRB
> instead of TCR for residue"), the purpose of clearing CHCR.DE bit is
> flushing buffered data to calculate the exact residue.
> 
> Such the "exact" residue had been required by sh-sci driver. sh-sci
> driver is calling dmaengine_pause() to stop transferring, and get
> "exact" residue. Otherwise, it might receive extra data during
> getting residue without pausing.
> 
> In rx_timer_fn() of sh-sci driver:
> 	dmaengine_tx_status();		/* For checking roughly */
>  	dmaengine_pause();
> 	dmaengine_tx_status();		/* For getting residue */
> 	dmaengine_terminate_all();
> 
> But, unfortunately the rcar-dmac driver didn't support dmaengine_pause()
> at that time. So, the sh-sci driver cannot get the "exact" residue
> without stopping the transferring, because rcar-dmac is buffering data
> inside.
> 
> Because of these backgrounds, rcar-dmac had been cleared/set CHCR.DE
> bit in rcar_dmac_chan_get_residue() to synchronizing data and getting
> "exact" residue.
> 
> However, rcar-dmac driver has rcar_dmac_chan_pause() now, and clearing
> CHCR.DE bit in rcar_dmac_chan_get_residue() doesn't need anymore.
> So, this patch removes the rcar_dmac_sync_tcr().

Applied, thanks

-- 
~Vinod
