Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36191 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751870AbeDRJ5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 05:57:12 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v4 0/4] mmc: renesas_sdhi: add eMMC HS400 mode support
Date: Wed, 18 Apr 2018 11:56:56 +0200
Message-Id: <20180418095700.29948-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

this patch-set provides SDHI driver support for eMMC HS400.

Based on mmc-v4.17-2

Dependencies for applying these patches:
* none

Dependencies to test eMMC HS400:
* [PATCH] clk: renesas: rcar-gen3: Fix SD divider setting
* [PATCH v2] arm64: dts: salvator-common: Enable HS400 of SDHI2

To assist testing and review this patch and the above mentioned
dependencies, which are necessary and sufficient to enable HS400 on H3 /
Salvator-X, M3-W 1.0 / Salvator-X and H3 ES2.0 Salvator-XS are available
at:

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/hs400-v4

Changes since v3:
* As a follow-up to discussion with Ulf and Wolfram I have proposed
  two new HS400 tuning host operations. These are provided, and explained,
  in "mmc: core: more fine-grained hooks for HS400 tuning".

  The following driver patches have been updated to use these new operations.

  And "mmc: tmio: add eMMC HS400 mode support" proposes a minor cleanup
  to make it a little cleaner to add the proposed new host operations to
  the MMC core.

Changes since v2:
* Consolidate disable_scc and reset_hs400_mode into reset_hs400_tuning
  callback
* Reuse renesas_sdhi_reset_hs400_mode() in renesas_sdhi_hw_reset()
* Factor out renesas_sdhi_reset_scc()


Masaharu Hayakawa (2):
  mmc: tmio: add eMMC HS400 mode support
  mmc: renesas_sdhi: add eMMC HS400 mode support

Simon Horman (2):
  mmc: core: select HS400 from HS200 tuning function
  mmc: core: more fine-grained hooks for HS400 tuning

 drivers/mmc/core/host.c              |  13 +++-
 drivers/mmc/core/mmc.c               |  28 +++++---
 drivers/mmc/host/renesas_sdhi_core.c | 136 +++++++++++++++++++++++++++++------
 drivers/mmc/host/tmio_mmc.h          |   9 +++
 drivers/mmc/host/tmio_mmc_core.c     |  49 ++++++++++++-
 include/linux/mmc/host.h             |  26 ++++++-
 6 files changed, 226 insertions(+), 35 deletions(-)

-- 
2.11.0
