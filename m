Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:34872 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965197AbcIWHZL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Sep 2016 03:25:11 -0400
Received: by mail-lf0-f41.google.com with SMTP id l131so86097565lfl.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Sep 2016 00:25:02 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Fri, 23 Sep 2016 09:25:00 +0200
To: Vinod Koul <vinod.koul@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux@armlinux.org.uk,
        hch@infradead.org, dan.j.williams@intel.com, robin.murphy@arm.com,
        laurent.pinchart@ideasonboard.com, linus.walleij@linaro.org
Subject: Re: [PATCHv9 0/6] dmaengine: rcar-dmac: add iommu support for slave
 transfers
Message-ID: <20160923072459.GJ19172@bigcity.dyn.berto.se>
References: <20160810112219.17964-1-niklas.soderlund+renesas@ragnatech.se>
 <20160810173710.GK9681@localhost>
 <20160915162650.GZ13920@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160915162650.GZ13920@localhost>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vinod,

On 2016-09-15 21:56:51 +0530, Vinod Koul wrote:
> On Wed, Aug 10, 2016 at 11:07:10PM +0530, Vinod Koul wrote:
> > On Wed, Aug 10, 2016 at 01:22:13PM +0200, Niklas S�derlund wrote:
> > > Hi,
> > > 
> > > This series tries to solve the problem with DMA with device registers
> > > (MMIO registers) that are behind an IOMMU for the rcar-dmac driver. A
> > > recent patch '9575632 (dmaengine: make slave address physical)'
> > > clarifies that DMA slave address provided by clients is the physical
> > > address. This puts the task of mapping the DMA slave address from a
> > > phys_addr_t to a dma_addr_t on the DMA engine.
> > > 
> > > Without an IOMMU this is easy since the phys_addr_t and dma_addr_t are
> > > the same and no special care is needed. However if you have a IOMMU you
> > > need to map the DMA slave phys_addr_t to a dma_addr_t using something
> > > like this.
> > > 
> > > This series is based on top of v4.8-rc1. And I'm hoping to be able to collect a
> > > Ack from Russell King on patch 4/6 that adds the ARM specific part and then be
> > > able to take the whole series through the dmaengine tree. If this is not the
> > > best route I'm more then happy to do it another way.
> > > 
> > > It's tested on a Koelsch with CONFIG_IPMMU_VMSA and by enabling the
> > > ipmmu_ds node in r8a7791.dtsi. I verified operation by interacting with
> > > /dev/mmcblk1, i2c and the serial console which are devices behind the
> > > iommu.
> > 
> > As I said in last one, the dmaengine parts look fine to me. But to go thru
> > dmaengine tree I would need ACK on non dmaengine patches.
> 
> I havent heard back from this one and I am inclined to merge this one now.
> If anyone has any objects, please speak up now...

I'm just curios, do you plan to merge this series with Arnds Ack? If not 
is there anything I can do to help move the series in the right 
direction?

> 
> Also ACKs welcome...
> 

-- 
Regards,
Niklas S�derlund
