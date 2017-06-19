Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55193 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753845AbdFSL6m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 07:58:42 -0400
Date: Mon, 19 Jun 2017 13:58:39 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH mmc/next v2 2/4] mmc: tmio, renesas-sdhi: add complete to
 DMA ops
Message-ID: <20170619115839.GC20088@verge.net.au>
References: <1497607134-10241-1-git-send-email-horms+renesas@verge.net.au>
 <1497607134-10241-3-git-send-email-horms+renesas@verge.net.au>
 <20170617150105.esceda3kiavhmu5x@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170617150105.esceda3kiavhmu5x@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Jun 17, 2017 at 05:01:05PM +0200, Wolfram Sang wrote:
> On Fri, Jun 16, 2017 at 11:58:52AM +0200, Simon Horman wrote:
> > Add complete to DMA ops to allow DMAC implementation dependent
> > handling of DMA completion.
> > 
> > Also implement the operation for SDHI.
> > 
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Codewise, I am all fine with this patch. There is one naming, however:
> 
> > +	void (*complete)(struct tmio_mmc_host *host);
> 
> I'd rather call it 'dataend'. For internal DMAC, it is the same. But for
> SYS-DMAC there is difference between DATAEND and DMA_COMPLETE. This is
> exactly the reason we have commit 52ad9a8e854ca1 ("mmc: tmio: ensure end
> of DMA and SD access are in sync").
> 
> Basically, something like %s/complete/dataend/g would do it for me...

Sure, I will change this.

'compete' seemed like a nice name but I accept your reasoning above.
