Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54380 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965047AbdIZKGN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:13 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 5A28D20218
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:04 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC 00/13] R-Car: Enable lossy compression in VSP video pipelines
Date: Tue, 26 Sep 2017 13:05:50 +0300
Message-Id: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

These patches are a proof-of-concept implementation of lossy compression and
decompression support for the VSP driver.

Patches for the whole stack are needed, in the ARM trusted firmware BL2, U-Boot
and the Linux kernel. For convenience, and because this is an RFC, I've included
them all in a single series.

The ARM trusted firmware and U-Boot patches are based on the Renesas firmware
v2.16.0, which contains

	git://github.com/renesas-rcar/arm-trusted-firmware.git#c040be5a757a945da75cf97d3a3e1db3a43168f9

	git://github.com/renesas-rcar/u-boot.git#rcar-3.5.0

The kernel patches are based on v4.14-rc2, which contains the following required
v4.14-rc1 regression fix.

commit 6d57339890c9a9dfcd4ba4f8931b911b962968e3
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Fri Sep 15 17:08:16 2017 +0200

    dma-coherent: fix rmem_dma_device_init regression

The DT bindings and userspace APIs are really work in progress. In particular
allocation of lossy decompression memory (implemented in the VSP driver in
13/13) should probably not be specific to the VSP.

A preliminary test that exercices the compression and decompression is available
from

	git://git.ideasonboard.com/renesas/vsp-tests.git#fcnl

The test currently passes unconditionally without attempting to check whether
the results are correct.

Laurent Pinchart (13):
  dt-bindings: reserved-memory: Add binding for the Renesas lossy
    decompression area
  dt-bindings: media: renesas-fcp: Add a compatible string for VSPI FCP
  dt-bindings: media: renesas-fcp: Add memory-region property
  arm64: dts: renesas: Use renesas,fcpvi compatible string
  arm64: dts: r8a7795: Add lossy decompression reserved memory nodes
  arm64: dts: r8a7795: Reference the lossy memory region from the FCPss
  arm64: dts: r8a7795: Add dma-ranges property in the /soc node
  v4l: rcar-fcp: Check device revision at probe time
  v4l: rcar-fcp: Configure the number of outstanding read transactions
  v4l: rcar-fcp: Prepare driver API for FCNL support
  v4l: rcar-fcp: Support FCNL decompression
  v4l: vsp1: Add support for near-lossless compression (FCNL) in the WPF
  v4l: vsp1: Add support for near-lossless compression (FCNL) in the RPF

 .../devicetree/bindings/media/renesas,fcp.txt      |  10 +-
 .../renesas,lossy-decompression.txt                | 102 ++++++
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi       |   2 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  58 +++-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |   2 +-
 drivers/media/platform/rcar-fcp.c                  | 358 ++++++++++++++++++++-
 drivers/media/platform/vsp1/vsp1.h                 |   1 +
 drivers/media/platform/vsp1/vsp1_drv.c             |  10 +-
 drivers/media/platform/vsp1/vsp1_pipe.c            |  57 ++--
 drivers/media/platform/vsp1/vsp1_pipe.h            |   2 +
 drivers/media/platform/vsp1/vsp1_regs.h            |   1 +
 drivers/media/platform/vsp1/vsp1_rwpf.c            |  50 +++
 drivers/media/platform/vsp1/vsp1_rwpf.h            |   1 +
 drivers/media/platform/vsp1/vsp1_video.c           |  22 +-
 drivers/media/platform/vsp1/vsp1_wpf.c             |  17 +-
 include/media/rcar-fcp.h                           |  14 +-
 16 files changed, 650 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/renesas,lossy-decompression.txt

-- 
Regards,

Laurent Pinchart
