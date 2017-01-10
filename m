Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 10 Jan 2017 15:51:06 +0100
From: Christoph Hellwig <hch@lst.de>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        artemi.ivanov@cogentembedded.com, robin.murphy@arm.com,
        fkan@apm.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2] arm64: do not set dma masks that device connection
        can't handle
Message-ID: <20170110145106.GC27156@lst.de>
References: <1483947002-16410-1-git-send-email-nikita.yoush@cogentembedded.com> <20170110115132.GD21598@arm.com> <07253eaa-5729-0f15-42b6-e8403f1f0412@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07253eaa-5729-0f15-42b6-e8403f1f0412@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 10, 2017 at 03:47:25PM +0300, Nikita Yushchenko wrote:
> With this direction, semantics of dma mask becomes even more
> questionable. I'd say dma_mask is candidate for removal (or to move to
> swiotlb's or iommu's local area)

We need the dma mask so that the device can advertise what addresses
the device supports.  Many old devices only support 32-bit DMA addressing,
and some less common ones just 24-bit or other weird ones.
