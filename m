Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:47174 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933385AbdAKLyk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 06:54:40 -0500
Subject: Re: [PATCH] arm64: avoid increasing DMA masks above what hardware
 supports
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Will Deacon <will.deacon@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
References: <11daacde-5399-039f-80a3-01d7bd13e9e8@arm.com>
 <1484056844-9567-1-git-send-email-nikita.yoush@cogentembedded.com>
 <dca35acf-1adf-aa85-7a0b-d0c6ec702fa1@arm.com>
 <67314806-361d-e0ac-9292-37542160ead5@cogentembedded.com>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Bjorn Helgaas <bhelgaas@google.com>, fkan@apm.com
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <57459a4a-2c57-e081-8f27-cb83f23b5815@arm.com>
Date: Wed, 11 Jan 2017 11:54:37 +0000
MIME-Version: 1.0
In-Reply-To: <67314806-361d-e0ac-9292-37542160ead5@cogentembedded.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/01/17 07:59, Nikita Yushchenko wrote:
>>> +	/*
>>> +	 * we don't yet support buses that have a non-zero mapping.
>>> +	 *  Let's hope we won't need it
>>> +	 */
>>> +	WARN_ON(dma_base != 0);
>>
>> I believe we now accomodate the bus remap bits on BCM2837 as a DMA
>> offset, so unfortunately I think this is no longer true.
> 
> Arnd, this check is from you. Any updates? Perhaps this check can be
> just dropped?
> 
> In swiotlb code, dma address (i.e. with offset already applied) is
> checked against mask.  Not sure what 'dma_base' means in iommu case.
> 
>>> +	/*
>>> +	 * Whatever the parent bus can set. A device must not set
>>> +	 * a DMA mask larger than this.
>>> +	 */
>>> +	dev->archdata.parent_dma_mask = size - 1;
>>
>> This will effectively constrain *all* DMA masks to be 32-bit, since for
>> 99% of devices we're going to see a size derived from the default mask
>> passed in here. I worry that that's liable to lead to performance and
>> stability regressions
> 
> That was exactly my concern when I first tried to address this issue. My
> first attempt was to alter very locally exact configuration where
> problem shows, while ensuring that everything else stays as is. See
> https://lkml.org/lkml/2016/12/29/218
> 
> But looks like people want a generic solution.
> 
>> I reckon the easiest way forward would be to pass in some flag to
>> arch_setup_dma_ops to indicate whether it's an explicitly-configured
>> range or not - then simply initialising parent_dma_mask to ~0 for the
>> default case *should* keep things working as before.
> 
> Currently only arm, arm64 and mips define arch_setup_dma_ops().
> Mips version only checks 'coherent' argument, 'size' is used only by arm
> and arm64.
> 
> Maybe move setting the default from caller to callee?
> I.e. pass size=0 if no explicit information exists, and let architecture
> handle that?

Yes, I think that ought to work, although the __iommu_setup_dma_ops()
call will still want a real size reflecting the default mask, so
something like:

if (size == 0) {
	dev->archdata.parent_dma_mask = ~0;
	size = 1ULL << 32;
} else {
	dev->archdata.parent_dma_mask = size - 1;
}

should probably do the trick.

Robin.
