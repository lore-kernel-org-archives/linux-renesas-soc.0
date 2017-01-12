Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:44796 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750879AbdALMRQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2017 07:17:16 -0500
Date: Thu, 12 Jan 2017 12:16:24 +0000
From: Will Deacon <will.deacon@arm.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Bjorn Helgaas <bhelgaas@google.com>, fkan@apm.com,
        linux-kernel@vger.kernel.org,
        Artemi Ivanov <artemi.ivanov@cogentembedded.com>
Subject: Re: [PATCH 1/2] dma-mapping: let arch know origin of dma range
 passed to arch_setup_dma_ops()
Message-ID: <20170112121623.GH1771@arm.com>
References: <dca35acf-1adf-aa85-7a0b-d0c6ec702fa1@arm.com>
 <1484159512-28515-1-git-send-email-nikita.yoush@cogentembedded.com>
 <1484159512-28515-2-git-send-email-nikita.yoush@cogentembedded.com>
 <30025121.yS4lyZEDrk@wuerfel>
 <764334db-3400-58c6-cc4b-3f7ce66daa27@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <764334db-3400-58c6-cc4b-3f7ce66daa27@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 12, 2017 at 08:52:51AM +0300, Nikita Yushchenko wrote:
> >> diff --git a/drivers/staging/fsl-mc/bus/fsl-mc-bus.c b/drivers/staging/fsl-mc/bus/fsl-mc-bus.c
> >> index 5ac373c..480b644 100644
> >> --- a/drivers/staging/fsl-mc/bus/fsl-mc-bus.c
> >> +++ b/drivers/staging/fsl-mc/bus/fsl-mc-bus.c
> >> @@ -540,7 +540,7 @@ int fsl_mc_device_add(struct dprc_obj_desc *obj_desc,
> >>  
> >>  	/* Objects are coherent, unless 'no shareability' flag set. */
> >>  	if (!(obj_desc->flags & DPRC_OBJ_FLAG_NO_MEM_SHAREABILITY))
> >> -		arch_setup_dma_ops(&mc_dev->dev, 0, 0, NULL, true);
> >> +		arch_setup_dma_ops(&mc_dev->dev, 0, 0, false, NULL, true);
> >>  
> >>  	/*
> >>  	 * The device-specific probe callback will get invoked by device_add()
> > 
> > Why are these actually calling arch_setup_dma_ops() here in the first
> > place? Are these all devices that are DMA masters without an OF node?
> 
> I don't know, but that's a different topic. This patch just adds
> argument and sets it to false everywhere but in the location when range
> should be definitely enforced.

I also wouldn't lose any sleep over a staging driver.

Will
