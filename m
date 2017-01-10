Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Arnd Bergmann <arnd@linaro.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>, linux-pci@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        artemi.ivanov@cogentembedded.com,
        Keith Busch <keith.busch@intel.com>, Jens Axboe <axboe@fb.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        linux-nvme@lists.infradead.org
Subject: Re: NVMe vs DMA addressing limitations
Date: Tue, 10 Jan 2017 11:54:26 +0100
Message-ID: <1967203.EWsxCL11oI@wuerfel>
In-Reply-To: <20170110070719.GA17208@lst.de>
References: <1483044304-2085-1-git-send-email-nikita.yoush@cogentembedded.com> <e084dbad-29ab-25bd-5e17-da0fcd92f7ac@cogentembedded.com> <20170110070719.GA17208@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tuesday, January 10, 2017 8:07:20 AM CET Christoph Hellwig wrote:
> On Tue, Jan 10, 2017 at 09:47:21AM +0300, Nikita Yushchenko wrote:
> > I'm now working with HW that:
> > - is now way "low end" or "obsolete", it has 4G of RAM and 8 CPU cores,
> > and is being manufactured and developed,
> > - has 75% of it's RAM located beyond first 4G of address space,
> > - can't physically handle incoming PCIe transactions addressed to memory
> > beyond 4G.
> 
> It might not be low end or obselete, but it's absolutely braindead.
> Your I/O performance will suffer badly for the life of the platform
> because someone tries to save 2 cents, and there is not much we can do
> about it.

Unfortunately it is a common problem for arm64 chips that were designed
by taking a 32-bit SoC and replacing the CPU core. The swiotlb is the
right workaround for this, and I think we all agree that we should
just make it work correctly.

	Arnd
