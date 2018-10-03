Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:27478 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727443AbeJCSZZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Oct 2018 14:25:25 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mmc: tmio: remove confusing TMIO_MMC_HAVE_HIGH_REG flag
Date: Wed,  3 Oct 2018 20:36:25 +0900
Message-Id: <1538566587-29452-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

CTL_SDIO_REGS is a register specific to tmio_mmc.c

Currently, we handle it in tmio_mmc_core.c, hence need
TMIO_MMC_HAVE_HIGH_REG flag to prevent the other platforms
from accessing to it.

We can just move CTL_SDIO_REGS to tmio_mmc.c
and delete the confusing TMIO_MMC_HAVE_HIGH_REG flag.


Masahiro Yamada (2):
  mmc: tmio: move MFD variant reset to a platform hook
  mmc: tmio: remove TMIO_MMC_HAVE_HIGH_REG flag

 drivers/mmc/host/tmio_mmc.c      | 24 ++++++++++++++++++++++--
 drivers/mmc/host/tmio_mmc.h      |  4 +---
 drivers/mmc/host/tmio_mmc_core.c |  8 +++-----
 include/linux/mfd/tmio.h         |  7 -------
 4 files changed, 26 insertions(+), 17 deletions(-)

-- 
2.7.4
