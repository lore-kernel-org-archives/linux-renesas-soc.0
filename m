Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 19 Dec 2016 08:31:44 -0500
From: Konrad Rzeszutek Wilk <konrad@darnok.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        David Vrabel <david.vrabel@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] swiotlb: Add swiotlb=noforce debug option
Message-ID: <20161219133143.GA4182@localhost.localdomain>
References: <1481894922-28828-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481894922-28828-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 16, 2016 at 02:28:39PM +0100, Geert Uytterhoeven wrote:
> 	Hi Konrad,

Heya!
> 
> This patch series adds a kernel command line option to aid debugging
> when developing support for DMA to memory outside the 32-bit address
> space.  If specified, trying to map memory that cannot be used with DMA
> will fail, and a warning will be printed.  This has been used
> succesfully to find drivers and DMA engines that do not support 64-bit
> memory.
> 
> Changes compared to v1:
>   - Dropp patch "swiotlb: Rate-limit printing when running out of
>     SW-IOMMU space", which has been picked up,
>   - Add cleanup patch 1/3,
>   - Add patch 2/3, to convert the flag swiotlb_force from an int to an
>     enum,
>   - Change the kernel parameter "swiotlb=nobounce" to "swiotlb=noforce"
>     (requested by Konrad Wilk),
>   - Extend swiotlb_force enum instead of adding an swiotlb_nobounce
>     variable (requested by Konrad Wilk).
> 
> This has been tested on ra7796/salvator-x, and compile-tested on x86.

Let me run it on various combinations of x86 and if all is good
will ask Linus to pick it up for rc1.

Thanks!
> 
> Thanks!
> 
> Geert Uytterhoeven (3):
>   x86, swiotlb: Simplify pci_swiotlb_detect_override()
>   swiotlb: Convert swiotlb_force from int to enum
>   swiotlb: Add swiotlb=noforce debug option
> 
>  Documentation/admin-guide/kernel-parameters.txt |  3 ++-
>  arch/arm64/mm/dma-mapping.c                     |  3 ++-
>  arch/arm64/mm/init.c                            |  3 ++-
>  arch/x86/kernel/pci-swiotlb.c                   |  6 ++----
>  arch/x86/xen/pci-swiotlb-xen.c                  |  2 +-
>  drivers/xen/swiotlb-xen.c                       |  4 ++--
>  include/linux/swiotlb.h                         |  8 +++++++-
>  include/trace/events/swiotlb.h                  | 17 +++++++++-------
>  lib/swiotlb.c                                   | 26 +++++++++++++++++++------
>  9 files changed, 48 insertions(+), 24 deletions(-)
> 
> -- 
> 1.9.1
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds
