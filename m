Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45009 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752383AbdFLJrX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2017 05:47:23 -0400
Date: Mon, 12 Jun 2017 11:47:19 +0200
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] mmc: renesas_sdhi: add support for
 R-Car Gen3 SDHI DMAC
Message-ID: <20170612094718.GD15434@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

please consider pulling changes to add support for R-Car Gen3 SDHI DMAC.

This gives a significant performance boost;
the headline figure is 9.5MB/s -> 39.7MB/s.

This pull request is based on mmc/next.

The following changes since commit 6e75316c15df8333506377743c75fcd626193849:

  mmc: tmio: make sure SDIO gets reinitialized after resume (2017-05-30 11:51:55 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/sdhi-gen3-dma-2017

for you to fetch changes up to fd9437fc8884f039ba4a510ac99d350fd693b0dc:

  mmc: renesas-sdhi: remove gen3 support from sysc dmac driver (2017-06-08 15:03:03 +0200)

----------------------------------------------------------------
Simon Horman (4):
      mmc: sh_mobile_sdhi: set max_segs and max_blk_count values R-Car Gen3
      mmc: tmio: add complete to DMA ops
      mmc: renesas_sdhi: add support for R-Car Gen3 SDHI DMAC
      mmc: renesas-sdhi: remove gen3 support from sysc dmac driver

Yoshihiro Shimoda (1):
      mmc: tmio: add max_segs and max_blk_count in tmio_mmc_data

 drivers/mmc/host/Kconfig                      |  17 ++
 drivers/mmc/host/Makefile                     |   8 +-
 drivers/mmc/host/renesas_sdhi.h               |   2 +
 drivers/mmc/host/renesas_sdhi_core.c          |   2 +
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 275 ++++++++++++++++++++++++++
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  23 +--
 drivers/mmc/host/tmio_mmc.h                   |   2 +
 drivers/mmc/host/tmio_mmc_core.c              |  16 +-
 include/linux/mfd/tmio.h                      |   2 +
 9 files changed, 319 insertions(+), 28 deletions(-)
 create mode 100644 drivers/mmc/host/renesas_sdhi_internal_dmac.c
