Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46348 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751515AbcH3VTN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2016 17:19:13 -0400
Date: Tue, 30 Aug 2016 23:19:07 +0200
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL FOR renesas-drivers] UHS-I SDR-104 support for
 sh_mobile_sdhi
Message-ID: <20160830211906.GA13755@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

please consider pulling updated UHS-I SDR-104 support for sh_mobile_sdhi.

This updates a branch you already have in renesas-drivers,
topic/sdr104-v4, which should be dropped.

The Gen 3 portion of this patchset is not much use from a performance point
of view without DMA support provided by "[GIT PULL FOR renesas-drivers]
mmc: renesas_sdhi: add R-Car Gen-3 DMA support", which I previously
submitted to you as topic/sdhi-gen 3-dma. As there are some conflicts
between that patchset and this one I have provided
the following branches in the renesas tree at the URL below.

* topic/sdhi-gen3-dma-v3.rebase: A rebase of that patchset
* topic/sdr104-v5+sdhi-dma-v3: A merge of the two patchsets with
                               conflicts resolved


The following changes since commit 6e929eefcc2e53bc61e888d493c90af0c8a163a3:

  mmc: sdhci: Remove ->platform_init() callback as it's no longer used (2016-08-30 12:40:34 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/sdr104-v5

for you to fetch changes up to f90c8801403b687e59bbbf61ea157aa79b6805a7:

  arm64: defconfig: Enable SDHI and GPIO_REGULATOR (2016-08-30 23:05:59 +0200)

----------------------------------------------------------------
Ai Kyuse (3):
      mmc: tmio: enhance illegal sequence handling
      mmc: tmio: Add hw reset support
      mmc: tmio: Add tuning support

Simon Horman (7):
      mmc: tmio: document mandatory and optional callbacks
      mmc: sh_mobile_sdhi: Add tuning support
      ARM: dts: lager: Enable UHS-I SDR-104
      arm64: dts: r8a7795: remove unnecessary cap-mmc-highspeed property
      arm64: r8a7795: Set maximum frequencies for SDHI clocks
      arm64: dts: r8a7795: salvator-x: Enable UHS-I SDR-104
      arm64: defconfig: Enable SDHI and GPIO_REGULATOR

Wolfram Sang (1):
      arm64: dts: r8a7795: salvator: enable UHS for SDHI 0 & 3

 arch/arm/boot/dts/r8a7790-lager.dts                |   1 +
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  24 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |   6 +-
 arch/arm64/configs/defconfig                       |   2 +
 drivers/mmc/host/sh_mobile_sdhi.c                  | 275 ++++++++++++++++++++-
 drivers/mmc/host/tmio_mmc.h                        |  15 +-
 drivers/mmc/host/tmio_mmc_pio.c                    |  85 ++++++-
 7 files changed, 396 insertions(+), 12 deletions(-)
