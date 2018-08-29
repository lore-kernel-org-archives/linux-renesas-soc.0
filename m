Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:64590 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727212AbeH3Dbx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 23:31:53 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 0/3] mmc: {tmio,renesas_sdhi}: retune if SCC error detected
Date: Thu, 30 Aug 2018 01:32:04 +0200
Message-Id: <20180829233207.30646-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

These patches triggers a retune if a SCC error is detected. They where
ported from the renesas BSP. Masaharu-san did all the real work I just
ported them to upstream and did small fixups.

These patches where broken out of my retuning series as more work where
needed to adapt them to the recent HS400 series picked-up. It's tested
on M3-N using both HS200 and HS400 and on H3 ES2.0 using HS200.

Masaharu Hayakawa (2):
  mmc: renesas_sdhi: skip SCC error check when retuning
  mmc: tmio: Fix SCC error detection

Niklas Söderlund (1):
  mmc: core: add helper to see if a host is doing a retune

 drivers/mmc/host/renesas_sdhi_core.c | 13 +++++++++++++
 drivers/mmc/host/tmio_mmc_core.c     |  4 ++--
 include/linux/mmc/host.h             |  5 +++++
 3 files changed, 20 insertions(+), 2 deletions(-)

-- 
2.18.0
