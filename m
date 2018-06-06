Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:39489 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752142AbeFFXXx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 19:23:53 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] mmc: tmio: Fix reset operation
Date: Thu,  7 Jun 2018 01:22:49 +0200
Message-Id: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

While looking at the Renesas BSP kernel I found patches which improves 
the state of the hardware at probe and after runtime resume. This is 
tested on R-Car H3 ES2.

Patch 1/3 ensures the IRQ mask have the default value according the 
datasheet (Rev 0.15) in case the bootloader have changed it. Patch 2/3 
moves code around to prepare for 3/3 which improves the hardware reset 
by also resetting the SCC which was not previously reset.

Patches from Hayakawa-san have small changes done by me needed after 
they where rebased to mmc/next.

Masaharu Hayakawa (2):
  mmc: tmio: Add initial setting of interrupt mask register
  mmc: tmio: Fix reset operation

Niklas Söderlund (1):
  mmc: tmio: move tmio_mmc_hw_reset()

 drivers/mmc/host/tmio_mmc.h      |  1 +
 drivers/mmc/host/tmio_mmc_core.c | 27 ++++++++++++++++-----------
 2 files changed, 17 insertions(+), 11 deletions(-)

-- 
2.17.0
