Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:53872 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732409AbeKAIPL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Nov 2018 04:15:11 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/3] mmc: renesas_sdhi: extend quirk selection to handle ES revisions
Date: Thu,  1 Nov 2018 00:13:37 +0100
Message-Id: <20181031231340.1958-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Hi,

Recent datasheet updates have made it clear that some quirks are not SoC
specific but SoC + ES version specific. Currently the quirks are
selected using compatibility values but whit this new information that
is not enough.

Patch 1/3 adds support to select quirks based on SoC + ES revision using 
soc_device_match() and converts the only existing quirk. Patch 2/3 
Removes the old method to select quirk based on compatibility string.  
While Patch 3/3 adds a new quirk from the BSP which blacklists some 
known problematic ES versions for HS400. HS400 is not yet enabled 
upstream so blacklisting these ES versions is not a regression of 
functionality.

Based on mmc/next and tested on H3 and M3-N.

Niklas Söderlund (3):
  mmc: renesas_sdhi: handle 4tap hs400 mode quirk based on SoC revision
  mmc: renesas_sdhi: align compatibility properties for H3 and M3-W
  mmc: renesas_sdhi: disable HS400 on H3 ES1.x and M3-W ES1.x

 drivers/mmc/host/renesas_sdhi_core.c          | 36 +++++++++++++++++++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 20 ++---------
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 20 ++---------
 3 files changed, 41 insertions(+), 35 deletions(-)

-- 
2.19.1
