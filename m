Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:50029 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388528AbeGXP7A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 11:59:00 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 0/2] mmc: {tmio,renesas_sdhi}: fix tuning behavior
Date: Tue, 24 Jul 2018 16:51:36 +0200
Message-Id: <20180724145138.26536-1-niklas.soderlund+renesas@ragnatech.se>
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

Since v3 of this patchset I have dropped 2 patches as they requier more 
work as HS400 have been merged since the initial posting. These two 
patches stand alone still fixes tuning issues so while work continues on 
the dropped two these two are ready for upstream consumption.

Masaharu Hayakawa (1):
  mmc: tmio: Fix tuning flow

Niklas Söderlund (1):
  mmc: renesas_sdhi: Fix sampling clock position selecting

 drivers/mmc/host/renesas_sdhi_core.c | 12 ++++++++++++
 drivers/mmc/host/tmio_mmc_core.c     |  2 --
 2 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.18.0
