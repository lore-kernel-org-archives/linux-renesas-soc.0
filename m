Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: do not set dma masks that device connection
 can't handle
To: Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>
References: <1483947002-16410-1-git-send-email-nikita.yoush@cogentembedded.com>
 <07253eaa-5729-0f15-42b6-e8403f1f0412@cogentembedded.com>
 <11daacde-5399-039f-80a3-01d7bd13e9e8@arm.com> <6116278.nQQUSuo3l4@wuerfel>
 <5c5cd4fd-4854-a2dd-10b6-9cc98e63a85c@arm.com>
Cc: Will Deacon <will.deacon@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        artemi.ivanov@cogentembedded.com, fkan@apm.com,
        Christoph Hellwig <hch@lst.de>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <7c6a1523-e41b-ad83-501a-27c260b9f9ee@cogentembedded.com>
Date: Wed, 11 Jan 2017 15:37:22 +0300
MIME-Version: 1.0
In-Reply-To: <5c5cd4fd-4854-a2dd-10b6-9cc98e63a85c@arm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> I actually have a third variation of this problem involving a PCI root
> complex which *could* drive full-width (40-bit) addresses, but won't,
> due to the way its PCI<->AXI interface is programmed. That would require
> even more complicated dma-ranges handling to describe the windows of
> valid physical addresses which it *will* pass, so I'm not pressing the
> issue - let's just get the basic DMA mask case fixed first.

R-Car + NVMe is actually not "basic case".

It has PCI<->AXI interface involved.
PCI addresses are 64-bit and controller does handle 64-bit addresses
there. Mapping between PCI addresses and AXI addresses is defined. But
AXI is 32-bit.

SoC has iommu that probably could be used between PCIe module and RAM.
Although AFAIK nobody made that working yet.

Board I work with has 4G of RAM, in 4 banks, located at different parts
of wide address space, and only one of them is below 4G. But if iommu is
capable of translating addresses such that 4 gigabyte banks map to first
4 gigabytes of address space, then all memory will become available for
DMA from PCIe device.
