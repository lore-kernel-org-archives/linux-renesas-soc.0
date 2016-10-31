Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:42880 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S944930AbcJaRIY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Oct 2016 13:08:24 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/5] arm64: r8a7796: 64-bit Memory and Ethernet Prototype
Date: Mon, 31 Oct 2016 18:08:17 +0100
Message-Id: <1477933702-13423-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi all,

This series enables support for memory outside the 32-bit address space
("64-bit memory") on the R-Car M3-W-based Salvator-X development board,
and allows the RAVB Ethernet driver to use this memory without bounce
buffers.

The patch series consists of 3 parts:
  1. Patch 1 enables 64-bit memory in the DTS supplied with the kernel.
     Actually you're probably already running with 64-bit memory
     enabled, as the U-Boot versions provided with all firmware versions
     I've seen add all memory to the passed DTB anyway.
     Thanks to SWIOTLB, Linux falls back to using bounce buffers when a
     driver tries to use DMA to memory outside the 32-bit address
     space. So 64-bit memory already works ;-)

  2. Patches 2-4 enable the use of the IPMMU for RAVB Ethernet.

  3. Patch 5 widens the DMA mask in the R-Car DMAC driver, to enable DMA
     to the 40-bit address space for all devices using SYS-DMAC (e.g.
     SCIF serial).

Originally the plan was to disable CONFIG_DMA, to trap devices and DMA
engines not supporting memory outside the 32-bit address space. This
would be useful to validate proper operation when adding more device
support later.
Unfortunately CONFIG_DMA cannot be disabled on a stock arm64 kernel.
Applying a small patch (based on Mark Salter's "arm64: make
CONFIG_ZONE_DMA user settable") changes that. However:
  - With CONFIG_ZONE_DMA=n and memory present over 4G, swiotlb_init() is
    not called.
    This will lead to a NULL pointer dereference later, when
    dma_map_single() calls into an unitialized SWIOTLB subsystem through
    swiotlb_tbl_map_single().
  - With CONFIG_ZONE_DMA=n and no memory present over 4G, swiotlb_init()
    is also not called, but RAVB works fine.
Disabling CONFIG_SWIOTLB is non-trivial, as the arm64 DMA core always
uses swiotlb_dma_ops, and its operations depend a lot on SWIOTLB
helpers.

Hence I decided to keep on using CONFIG_ZONE_DMA=y, and handle the
checks in SWIOTLB. As this turned out to be fairly platform-independent,
I spun that off in a separate patch series, see "[PATCH 0/2] swiotlb:
Rate-limit printing and 64-bit memory debugging"
(https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg08384.html).
With that series applied, you can pass "swiotlb=nobounce", and all DMA
operations that would require bounce buffers will start to fail.
With just 64-bit memory enabled, this uncovered the following issues,
also fixed by this patch series:

  1. When using SCIF with DMA:

	rcar-dmac e7300000.dma-controller: Cannot do DMA to address 0x000000067a9b7000

     This is fixed by widening the DMA mask in the R-Car DMAC driver.

  2. When using RAVB:

	ravb e6800000.ethernet: Cannot do DMA to address 0x000000067aa07780

     This is fixed by enabling the IPMMU for RAVB.

     Note that while DHCP and ping work initially, and my NFS root is
     mounted succesfully, NFS root starts failing after a few seconds
     with:

	nfs: server XXX.XXX.XXX.XXX not responding, still trying

     This looks like an IPMMU issue, as NFS root works fine when the
     IPMMU is disabled (and "swiotlb=nobounce" is not specified, of
     course).

Dependencies:
  - r8a7796 Ethernet enablement,
  - r8a7796 IPMMU support,
  - r8a7796 SYS-DMAC support,
    (all three included in renesas-drivers-2016-10-25-v4.9-rc2)
  - "[PATCH 0/2] swiotlb: Rate-limit printing and 64-bit memory
    debugging", for debugging ("swiotlb=bounce")
    (https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg08384.html)

For your convenience, this series (incl. dependencies) is also available in the
topic/r8a7796-64b-mem+ravb-prototype-v1 branch of my renesas-drivers git
repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git

Thanks for your comments!

Geert Uytterhoeven (3):
  arm64: dts: r8a7796: Connect Ethernet AVB to IPMMU
  arm64: dts: r8a7796: Enable ipmmu_ds0 and ipmmu_mm
  dmaengine: rcar-dmac: Widen DMA mask to 40 bits

Magnus Damm (1):
  arm64: dts: r8a7796: Add IPMMU device nodes

Takeshi Kihara (1):
  arm64: dts: r8a7796: salvator-x: Update memory node to 4 GiB map

 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  5 ++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 90 ++++++++++++++++++++++
 drivers/dma/sh/rcar-dmac.c                         |  1 +
 3 files changed, 96 insertions(+)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
