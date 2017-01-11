Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:50714 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750872AbdAKOvb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 09:51:31 -0500
Subject: Re: [PATCH] arm64: avoid increasing DMA masks above what hardware
 supports
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Will Deacon <will.deacon@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
References: <11daacde-5399-039f-80a3-01d7bd13e9e8@arm.com>
 <1484056844-9567-1-git-send-email-nikita.yoush@cogentembedded.com>
 <dca35acf-1adf-aa85-7a0b-d0c6ec702fa1@arm.com>
 <67314806-361d-e0ac-9292-37542160ead5@cogentembedded.com>
 <57459a4a-2c57-e081-8f27-cb83f23b5815@arm.com>
 <09cac197-9e57-5d3e-e742-f29c00051813@cogentembedded.com>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Bjorn Helgaas <bhelgaas@google.com>, fkan@apm.com
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c5bada32-fbaf-3631-268b-db49dffe3eb9@arm.com>
Date: Wed, 11 Jan 2017 14:50:31 +0000
MIME-Version: 1.0
In-Reply-To: <09cac197-9e57-5d3e-e742-f29c00051813@cogentembedded.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/01/17 13:41, Nikita Yushchenko wrote:
>> Yes, I think that ought to work, although the __iommu_setup_dma_ops()
>> call will still want a real size reflecting the default mask
> 
> I see iommu_dma_ops do not define set_dma_mask.
> 
> So what if setup was done for size reflecting one mask and then driver
> changes mask?  Will things still operate correctly?

We've overridden dma_set_mask() at the function level, so it should
always apply regardless. Besides, none of the arm64 ops implement
.set_dma_mask anyway, so we could possibly drop the references to it
altogether.

Conversely, I suppose we could just implement said callback for
swiotlb_dma_ops and iommu_dma_ops with the parent_dma_mask-checking
function and drop the HAVE_ARCH_DMA_SET_MASK override instead. I'm not
sure which approach is preferable - the latter seems arguably cleaner in
isolation, but would also be less consistent with how the coherent mask
has to be handled. Ho hum.

Robin.
