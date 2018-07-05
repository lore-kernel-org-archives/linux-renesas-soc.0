Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:53080 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753323AbeGEOUR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Jul 2018 10:20:17 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/4] mmc: {tmio,renesas_sdhi}: fix tuning behavior
Date: Thu,  5 Jul 2018 16:18:37 +0200
Message-Id: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

Tuning failed on my R-Car H3 ES2.0 board using latest mmc/next while the
Renesas BSP kernel worked. After some digging I found patches in the BSP
which remedied this and whit these applied tuning now works for me.

I have done small fixes, updated commit messages and rebased on latest
mmc/next but Hayakawa-san did all the real work.

Masaharu Hayakawa (4):
  mmc: tmio: Fix tuning flow
  mmc: tmio: Fix SCC error detection
  mmc: renesas_sdhi: Fix sampling clock position selecting
  mmc: renesas_sdhi: skip SCC error check when retuning

 drivers/mmc/host/renesas_sdhi_core.c | 20 ++++++++++++++++++++
 drivers/mmc/host/tmio_mmc_core.c     |  9 +++------
 2 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.17.0
