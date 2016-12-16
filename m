Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        David Vrabel <david.vrabel@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/3] swiotlb: Add swiotlb=noforce debug option
Date: Fri, 16 Dec 2016 14:28:39 +0100
Message-Id: <1481894922-28828-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Konrad,

This patch series adds a kernel command line option to aid debugging
when developing support for DMA to memory outside the 32-bit address
space.  If specified, trying to map memory that cannot be used with DMA
will fail, and a warning will be printed.  This has been used
succesfully to find drivers and DMA engines that do not support 64-bit
memory.

Changes compared to v1:
  - Dropp patch "swiotlb: Rate-limit printing when running out of
    SW-IOMMU space", which has been picked up,
  - Add cleanup patch 1/3,
  - Add patch 2/3, to convert the flag swiotlb_force from an int to an
    enum,
  - Change the kernel parameter "swiotlb=nobounce" to "swiotlb=noforce"
    (requested by Konrad Wilk),
  - Extend swiotlb_force enum instead of adding an swiotlb_nobounce
    variable (requested by Konrad Wilk).

This has been tested on ra7796/salvator-x, and compile-tested on x86.

Thanks!

Geert Uytterhoeven (3):
  x86, swiotlb: Simplify pci_swiotlb_detect_override()
  swiotlb: Convert swiotlb_force from int to enum
  swiotlb: Add swiotlb=noforce debug option

 Documentation/admin-guide/kernel-parameters.txt |  3 ++-
 arch/arm64/mm/dma-mapping.c                     |  3 ++-
 arch/arm64/mm/init.c                            |  3 ++-
 arch/x86/kernel/pci-swiotlb.c                   |  6 ++----
 arch/x86/xen/pci-swiotlb-xen.c                  |  2 +-
 drivers/xen/swiotlb-xen.c                       |  4 ++--
 include/linux/swiotlb.h                         |  8 +++++++-
 include/trace/events/swiotlb.h                  | 17 +++++++++-------
 lib/swiotlb.c                                   | 26 +++++++++++++++++++------
 9 files changed, 48 insertions(+), 24 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
