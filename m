Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: NVMe vs DMA addressing limitations
To: Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@linaro.org>
References: <1483044304-2085-1-git-send-email-nikita.yoush@cogentembedded.com>
 <20170110070719.GA17208@lst.de>
 <c4fd007c-3f07-fc2a-8cbb-7152f578609d@cogentembedded.com>
 <4137257.d2v87kqLLv@wuerfel> <20170110144839.GB27156@lst.de>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>, linux-pci@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        artemi.ivanov@cogentembedded.com,
        Keith Busch <keith.busch@intel.com>, Jens Axboe <axboe@fb.com>,
        linux-nvme@lists.infradead.org
From: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <80676b35-121b-0462-23fc-ed5608e1e671@grimberg.me>
Date: Thu, 12 Jan 2017 12:09:11 +0200
MIME-Version: 1.0
In-Reply-To: <20170110144839.GB27156@lst.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


>> Another workaround me might need is to limit amount of concurrent DMA
>> in the NVMe driver based on some platform quirk. The way that NVMe works,
>> it can have very large amounts of data that is concurrently mapped into
>> the device.
>
> That's not really just NVMe - other storage and network controllers also
> can DMA map giant amounts of memory.  There are a couple aspects to it:
>
>  - dma coherent memoery - right now NVMe doesn't use too much of it,
>    but upcoming low-end NVMe controllers will soon start to require
>    fairl large amounts of it for the host memory buffer feature that
>    allows for DRAM-less controller designs.  As an interesting quirk
>    that is memory only used by the PCIe devices, and never accessed
>    by the Linux host at all.

Would it make sense to convert the nvme driver to use normal allocations
and use the DMA streaming APIs (dma_sync_single_for_[cpu|device]) for
both queues and future HMB?

>  - size vs number of the dynamic mapping.  We probably want the dma_ops
>    specify a maximum mapping size for a given device.  As long as we
>    can make progress with a few mappings swiotlb / the iommu can just
>    fail mapping and the driver will propagate that to the block layer
>    that throttles I/O.

Isn't max mapping size per device too restrictive? it is possible that
not all devices posses active mappings concurrently.
