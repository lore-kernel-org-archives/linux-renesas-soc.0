Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: avoid increasing DMA masks above what hardware
 supports
To: Arnd Bergmann <arnd@arndb.de>
References: <dca35acf-1adf-aa85-7a0b-d0c6ec702fa1@arm.com>
 <1484159512-28515-1-git-send-email-nikita.yoush@cogentembedded.com>
 <1484159512-28515-3-git-send-email-nikita.yoush@cogentembedded.com>
 <2489599.dXme8sRkvp@wuerfel>
Cc: Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Bjorn Helgaas <bhelgaas@google.com>, fkan@apm.com,
        linux-kernel@vger.kernel.org,
        Artemi Ivanov <artemi.ivanov@cogentembedded.com>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <f1c64dcd-5567-8164-86d1-e3bc42831e7d@cogentembedded.com>
Date: Thu, 12 Jan 2017 08:53:35 +0300
MIME-Version: 1.0
In-Reply-To: <2489599.dXme8sRkvp@wuerfel>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

>> @@ -959,6 +990,15 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>>         if (!dev->archdata.dma_ops)
>>                 dev->archdata.dma_ops = &swiotlb_dma_ops;
>>  
>> +       /*
>> +        * Whatever the parent bus can set. A device must not set
>> +        * a DMA mask larger than this.
>> +        */
>> +       if (enforce_range)
>> +               dev->archdata.parent_dma_mask = size - 1;
>> +       else
>> +               dev->archdata.parent_dma_mask = DMA_BIT_MASK(64);
>> +
>>         dev->archdata.dma_coherent = coherent;
>>         __iommu_setup_dma_ops(dev, dma_base, size, iommu);
>>
> 
> Could we just pass the mask instead of the size here?

We don't want to change API now.

Nikita
