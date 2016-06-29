Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55231 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751505AbcF2W3e (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 18:29:34 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers v2] mmc: renesas_sdhi: add R-Car Gen-3 DMA support
Date: Thu, 30 Jun 2016 00:12:31 +0200
Message-Id: <1467238351-25267-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

please consider pulling a prototype to modularise SDHI DMA to the extent
that multiple providers may be built into the same kernel/module and
provide SDHI DMA support for R-Car Gen3.

As these changes rename files, which may lead to conflicts with mainline,
I will entirely understand if you decide against accepting this request.

This pull request is based on mmc/next

The following changes since commit 466780648db4aed7722de91e9d9749c6c5969327:

  mmc: sh_mmcif: Use a 10s timeout in the error recovery path (2016-06-27 11:19:29 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/sdhi-gen3-dma-v2

for you to fetch changes up to 8af14f568146e167ad76dbf416246cd3be557f7c:

  mmc: renesas_sdhi: add support for R-Car Gen3 SDHI DMAC (2016-06-29 23:25:10 +0200)

----------------------------------------------------------------
Simon Horman (2):
      mmc: sh_mobile_sdhi, tmio: make dma more modular
      mmc: sh_mobile_sdhi: rename DMA source file as renesas_sdhi_sysc_dmac.c

Yoshihiro Shimoda (3):
      mmc: tmio: add max_segs and max_blk_count in tmio_mmc_data
      mmc: sh_mobile_sdhi: add some SoC specific data for R-Car Gen3
      mmc: renesas_sdhi: add support for R-Car Gen3 SDHI DMAC

 drivers/mmc/host/Kconfig                           |  18 ++
 drivers/mmc/host/Makefile                          |   7 +-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c      | 192 +++++++++++++++++++++
 .../{tmio_mmc_dma.c => renesas_sdhi_sysc_dmac.c}   |  55 ++++--
 drivers/mmc/host/sh_mobile_sdhi.c                  |  49 ++++++
 drivers/mmc/host/tmio_mmc.h                        |  39 +----
 drivers/mmc/host/tmio_mmc_pio.c                    |  49 +++++-
 include/linux/mfd/tmio.h                           |   2 +
 8 files changed, 360 insertions(+), 51 deletions(-)
 create mode 100644 drivers/mmc/host/renesas_sdhi_internal_dmac.c
 rename drivers/mmc/host/{tmio_mmc_dma.c => renesas_sdhi_sysc_dmac.c} (83%)
