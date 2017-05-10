Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54398 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751507AbdEJJuW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 05:50:22 -0400
Date: Wed, 10 May 2017 11:50:17 +0200
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] mmc: renesas-sdhi: refactor DMA
 support
Message-ID: <20170510095016.GA31001@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

please consider pulling the refactoring of DMA support for SDHI (v2).

This pull request is based on mmc-v4.12.

As this pull request conflicts with recent work by Wolfram,
"[PULL REQUEST] renesas/topic/sdhi-cmd23 for renesas drivers",
I have provided a sample merge resolution at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/sdhi-refactor-v2+sdhi-cmd23


The following changes since commit a627f025eb0534052ff451427c16750b3530634c:

  mmc: sdhci-of-esdhc: limit SD clock for ls1012a/ls1046a (2017-04-28 14:53:13 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/sdhi-refactor-v2

for you to fetch changes up to 2156a07053f52c85fba8b715116b0241d5fca25b:

  mmc: renesas-sdhi: make renesas_sdhi_sys_dmac main module file (2017-05-09 15:19:55 +0200)

----------------------------------------------------------------
Simon Horman (6):
      mmc: tmio: drop filenames from comment at top of source
      mmc: renesas-sdhi, tmio: make dma more modular
      mmc: tmio: rename tmio_mmc_{pio => core}.c
      mmc: renesas-sdhi: rename tmio_mmc_dma.c => renesas_sdhi_sys_dmac.c
      mmc: renesas-sdhi: rename sh_mobile_sdhi.c => renesas_sdhi_core.c
      mmc: renesas-sdhi: make renesas_sdhi_sys_dmac main module file

 drivers/mmc/host/Kconfig                           |   4 +-
 drivers/mmc/host/Makefile                          |   4 +-
 drivers/mmc/host/renesas_sdhi.h                    |  39 ++++
 .../host/{sh_mobile_sdhi.c => renesas_sdhi_core.c} | 229 +++++----------------
 .../{tmio_mmc_dma.c => renesas_sdhi_sys_dmac.c}    | 164 +++++++++++++--
 drivers/mmc/host/tmio_mmc.c                        |  10 +-
 drivers/mmc/host/tmio_mmc.h                        |  53 ++---
 .../mmc/host/{tmio_mmc_pio.c => tmio_mmc_core.c}   |  51 ++++-
 8 files changed, 304 insertions(+), 250 deletions(-)
 create mode 100644 drivers/mmc/host/renesas_sdhi.h
 rename drivers/mmc/host/{sh_mobile_sdhi.c => renesas_sdhi_core.c} (68%)
 rename drivers/mmc/host/{tmio_mmc_dma.c => renesas_sdhi_sys_dmac.c} (58%)
 rename drivers/mmc/host/{tmio_mmc_pio.c => tmio_mmc_core.c} (97%)
