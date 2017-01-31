Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36618 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751238AbdAaKYm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jan 2017 05:24:42 -0500
MIME-Version: 1.0
In-Reply-To: <73d47a53-3146-6719-ec20-39a5633350fa@arm.com>
References: <1485531259-17513-1-git-send-email-geert+renesas@glider.be>
 <1485531259-17513-2-git-send-email-geert+renesas@glider.be> <73d47a53-3146-6719-ec20-39a5633350fa@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Jan 2017 11:24:15 +0100
Message-ID: <CAMuHMdUDh0S=aWDXe=Sc0YJjC2DLNgTtr_m0REL=fiBQwgEpPw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] iommu/dma: Add support for DMA_ATTR_FORCE_CONTIGUOUS
To: Robin Murphy <robin.murphy@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Joerg Roedel <joro@8bytes.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        iommu@lists.linux-foundation.org,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Robin,

On Fri, Jan 27, 2017 at 6:50 PM, Robin Murphy <robin.murphy@arm.com> wrote:
> On 27/01/17 15:34, Geert Uytterhoeven wrote:
>> Add helpers for allocating physically contiguous DMA buffers to the
>> generic IOMMU DMA code.  This can be useful when two or more devices
>> with different memory requirements are involved in buffer sharing.
>>
>> The iommu_dma_{alloc,free}_contiguous() functions complement the existing
>> iommu_dma_{alloc,free}() functions, and allow architecture-specific code
>> to implement support for the DMA_ATTR_FORCE_CONTIGUOUS attribute on
>> systems with an IOMMU.  As this uses the CMA allocator, setting this
>> attribute has a runtime-dependency on CONFIG_DMA_CMA.
>>
>> Note that unlike the existing iommu_dma_alloc() helper,
>> iommu_dma_alloc_contiguous() has no callback to flush pages.
>> Ensuring the returned region is made visible to a non-coherent device is
>> the responsibility of the caller.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> v2:
>>   - Provide standalone iommu_dma_{alloc,free}_contiguous() functions, as
>>     requested by Robin Murphy,
>>   - Simplify operations by getting rid of the page array/scatterlist
>>     dance, as the buffer is contiguous,
>>   - Move CPU cache magement into the caller, which is much simpler with
>>     a single contiguous buffer.
>
> Thanks for the rework, that's a lot easier to make sense of! Now, please
> don't hate me, but...

I don't hate you at all. I'm just a drivers/iommu rookie ;-)

>> --- a/drivers/iommu/dma-iommu.c
>> +++ b/drivers/iommu/dma-iommu.c

>> +/**
>> + * iommu_dma_alloc_contiguous - Allocate and map a buffer contiguous in IOVA
>> + *                           and physical space
>> + * @dev: Device to allocate memory for. Must be a real device attached to an
>> + *    iommu_dma_domain
>> + * @size: Size of buffer in bytes
>> + * @prot: IOMMU mapping flags
>> + * @handle: Out argument for allocated DMA handle
>> + *
>> + * Return: Buffer page pointer, or NULL on failure.
>> + *
>> + * Note that unlike iommu_dma_alloc(), it's the caller's responsibility to
>> + * ensure the returned region is made visible to the given non-coherent device.
>> + */
>> +struct page *iommu_dma_alloc_contiguous(struct device *dev, size_t size,
>> +             int prot, dma_addr_t *handle)
>> +{
>> +     struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
>> +     struct iova_domain *iovad = cookie_iovad(domain);
>> +     dma_addr_t dma_addr;
>> +     unsigned int count;
>> +     struct page *page;
>> +     struct iova *iova;
>> +     int ret;
>> +
>> +     *handle = DMA_ERROR_CODE;
>> +
>> +     size = PAGE_ALIGN(size);
>> +     count = size >> PAGE_SHIFT;
>> +     page = dma_alloc_from_contiguous(dev, count, get_order(size));
>> +     if (!page)
>> +             return NULL;
>> +
>> +     iova = __alloc_iova(domain, size, dev->coherent_dma_mask);
>> +     if (!iova)
>> +             goto out_free_pages;
>> +
>> +     size = iova_align(iovad, size);
>> +     dma_addr = iova_dma_addr(iovad, iova);
>> +     ret = iommu_map(domain, dma_addr, page_to_phys(page), size, prot);
>> +     if (ret < 0)
>> +             goto out_free_iova;
>> +
>> +     *handle = dma_addr;
>> +     return page;
>> +
>> +out_free_iova:
>> +     __free_iova(iovad, iova);
>> +out_free_pages:
>> +     dma_release_from_contiguous(dev, page, count);
>> +     return NULL;
>> +}
>
> ...now that I can see it clearly, isn't this more or less just:
>
>         page = dma_alloc_from_contiguous(dev, ...);
>         if (page)
>                 dma_addr = iommu_dma_map_page(dev, page, ...);
> ?
>
> Would it not be even simpler to just make those two calls directly from
> the arm64 code?

You're right. Will update. Thanks a lot!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
