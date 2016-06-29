Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45933 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751057AbcF2J6u (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 05:58:50 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL FOR renesas-drivers] mmc: renesas_sdhi: add R-Car Gen-3 DMA support
Date: Wed, 29 Jun 2016 11:57:49 +0200
Message-Id: <1467194269-24098-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

please consider pulling a prototype to modularise SDHI DMA to the extent
that multiple providers may be built into the same kernel/module and
provide SDHI DMA support for R-Car Gen3.

As these changes rename files, which may lead to conflicts with mainline,
I will entirely understand if you decide against accepting this request.

The following changes since commit b281733437037559aec39be0c0699b044571bddf:

  mmc: tmio: make a cast explicit (2016-06-07 12:31:11 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/sdhi-gen3-dma

for you to fetch changes up to e88b79845ed4e7738a0431abffbcfd52b751257c:

  mmc: renesas_sdhi: add support for R-Car Gen3 SDHI DMAC (2016-06-15 12:52:22 +0900)

----------------------------------------------------------------
Simon Horman (3):
      mmc: renesas_sdhi: rename sh_mobile_sdhi as renesas_sdhi
      mmc: renesas_sdhi, tmio: make dma more modular
      mmc: renesas_sdhi: rename DMA source file as renesas_sdhi_dma.c

Yoshihiro Shimoda (1):
      mmc: renesas_sdhi: add support for R-Car Gen3 SDHI DMAC

 drivers/mmc/host/Kconfig                           |  22 ++-
 drivers/mmc/host/Makefile                          |   5 +-
 .../mmc/host/{sh_mobile_sdhi.c => renesas_sdhi.c}  |  43 +++++
 .../host/{tmio_mmc_dma.c => renesas_sdhi_dma.c}    |  26 ++-
 drivers/mmc/host/renesas_sdhi_dma_gen3.c           | 190 +++++++++++++++++++++
 drivers/mmc/host/tmio_mmc.h                        |  39 +----
 drivers/mmc/host/tmio_mmc_pio.c                    |  47 +++++
 7 files changed, 333 insertions(+), 39 deletions(-)
 rename drivers/mmc/host/{sh_mobile_sdhi.c => renesas_sdhi.c} (93%)
 rename drivers/mmc/host/{tmio_mmc_dma.c => renesas_sdhi_dma.c} (92%)
 create mode 100644 drivers/mmc/host/renesas_sdhi_dma_gen3.c
