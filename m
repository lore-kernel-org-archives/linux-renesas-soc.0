Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 10 Jan 2017 15:59:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Robin Murphy <robin.murphy@arm.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        artemi.ivanov@cogentembedded.com, fkan@apm.com,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2] arm64: do not set dma masks that device connection
        can't handle
Message-ID: <20170110145914.GE27156@lst.de>
References: <1483947002-16410-1-git-send-email-nikita.yoush@cogentembedded.com> <07253eaa-5729-0f15-42b6-e8403f1f0412@cogentembedded.com> <11daacde-5399-039f-80a3-01d7bd13e9e8@arm.com> <6116278.nQQUSuo3l4@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6116278.nQQUSuo3l4@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 10, 2017 at 02:42:23PM +0100, Arnd Bergmann wrote:
> It's a much rarer problem for the IOMMU case though, because it only
> impacts devices that are restricted to addressing of less than 32-bits.
> 
> If you have an IOMMU enabled, the dma-mapping interface does not care
> if the device can do wider than 32 bit addressing, as it will never
> hand out IOVAs above 0xffffffff.

That's absolutely not the case.  IOMMUs can and do generate addresses
larger than 32-bit.  Also various platforms have modes where an IOMMU
can be used when <= 32-bit addresses are used and bypassed if full 64-bit
addressing is supported and I/O isolation is not explicitly requested.
