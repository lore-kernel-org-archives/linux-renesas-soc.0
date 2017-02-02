Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45929 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750977AbdBBJWJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Feb 2017 04:22:09 -0500
Date: Thu, 2 Feb 2017 10:22:03 +0100
From: Simon Horman <horms@verge.net.au>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH/RFC] arm64: defconfig: Enlarge CMA alignment to 2 MiB
Message-ID: <20170202092203.GK21831@verge.net.au>
References: <1485532996-19719-1-git-send-email-geert+renesas@glider.be>
 <CANqRtoQJaRK7Kys-fudyxJuojBmZyXMsNoDudSt4p=gj5srviA@mail.gmail.com>
 <a4e171b0-6403-9d88-3b8f-e63f3f050689@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4e171b0-6403-9d88-3b8f-e63f3f050689@arm.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Feb 01, 2017 at 02:06:45PM +0000, Robin Murphy wrote:
> On 01/02/17 13:45, Magnus Damm wrote:
> > Hi Geert,
> > 
> > On Sat, Jan 28, 2017 at 1:03 AM, Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> >> Some IOMMUs (e.g. Renesas IPMMU/VMSA) support only page sizes of 4 KiB,
> >> 2 MiB, and 1 GiB.
> >>
> >> With the default setting of CONFIG_CMA_ALIGNMENT = 8, allocations larger
> >> than 1 MiB are aligned to a 1 MiB boundary only.  Hence a 2 MiB
> >> allocation may not be aligned, leading to a mapping of 512 4 KiB pages.
> >>
> >> Increase CONFIG_CMA_ALIGNMENT to allow mapping a 2 MiB buffer using a
> >> single PTE, decreasing memory usage and TLB pressure.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >> Is this useful?
> >>
> >> Should there instead be different defaults in Kconfig, depending on
> >> enabled platform support?
> > 
> > I think there is a dependency on the kernel page size configuration as
> > well. In case of 16 KiB or 64 KiB page size configuration other large
> > page sizes may be required.
> 
> I don't see the original patch (linux-arm-kernel doesn't look to have it
> archived either), but I think bumping the default up to 2MB to match our
> normal section size sounds generally reasonable - users can still
> override it manually in their config, right? For 16KB and 64KB granules,
> it is at least the size covered by contiguous-hinted pages; the actual
> section sizes there are far too big to be practical for alignment
> purposes anyway (32MB and 512MB respectively).

I am happy to take this patch on the strength of the above but an Ack or
similar tag from Robin would be nice. Geert, perhaps you could repost the
patch with Robin CCed?
