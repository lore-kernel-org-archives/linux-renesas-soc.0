Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:13083 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731793AbeGQPZk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 11:25:40 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 0/4] mmc: {tmio,renesas_sdhi}: fix tuning behavior
Date: Tue, 17 Jul 2018 16:52:12 +0200
Message-Id: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
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
mmc/next but Hayakawa-san did all the real work. This change helped me 
to successfully tune a stubborn card I have had trouble in the past to 
get to work.

Masaharu Hayakawa (3):
  mmc: tmio: Fix tuning flow
  mmc: tmio: Fix SCC error detection
  mmc: renesas_sdhi: skip SCC error check when retuning

Niklas Söderlund (1):
  mmc: renesas_sdhi: Fix sampling clock position selecting

 drivers/mmc/host/renesas_sdhi_core.c | 20 ++++++++++++++++++++
 drivers/mmc/host/tmio_mmc_core.c     |  6 ++----
 2 files changed, 22 insertions(+), 4 deletions(-)

-- 
2.18.0
