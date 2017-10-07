Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:46629 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750952AbdJGKhI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Oct 2017 06:37:08 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 00/11] mmc: document mmc_regulator_get_supply and fix users
Date: Sat,  7 Oct 2017 12:36:47 +0200
Message-Id: <20171007103658.16868-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Fix the drivers and add some docs according to the outcome of this discussion
[1] we had recently. The motivation from the patch description:

Bail out everytime when mmc_regulator_get_supply() returns an errno, not only
when probing gets deferred. This is currently a no-op, because this function
only returns -EPROBE_DEFER or 0 right now. But if it will throw another error
somewhen, it will be for a reason. (This still doesn't change that getting
regulators is optional, so 0 can still mean no regulators found). So, let us a)
be future proof and b) have driver code which is easier to understand.

The patches have been created with coccinelle. A branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/mmc-get-supply-docs

Looking forward to comments!

Kind regards,

   Wolfram

[1] https://patchwork.kernel.org/patch/9965823/

Wolfram Sang (11):
  mmc: add kerneldoc to mmc_regulator_get_supply()
  mmc: cavium: catch all errors when getting regulators
  mmc: dw_mmc: catch all errors when getting regulators
  mmc: meson-gx-mmc: catch all errors when getting regulators
  mmc: meson-mx-sdio: catch all errors when getting regulators
  mmc: mmci: catch all errors when getting regulators
  mmc: mtk-sd: catch all errors when getting regulators
  mmc: mxcmmc: catch all errors when getting regulators
  mmc: omap_hsmmc: catch all errors when getting regulators
  mmc: sdhci: catch all errors when getting regulators
  mmc: usdhi6rol0: catch all errors when getting regulators

 drivers/mmc/core/core.c          | 10 ++++++++++
 drivers/mmc/host/cavium.c        |  2 +-
 drivers/mmc/host/dw_mmc.c        |  2 +-
 drivers/mmc/host/meson-gx-mmc.c  |  2 +-
 drivers/mmc/host/meson-mx-sdio.c |  2 +-
 drivers/mmc/host/mmci.c          |  2 +-
 drivers/mmc/host/mtk-sd.c        |  2 +-
 drivers/mmc/host/mxcmmc.c        |  2 +-
 drivers/mmc/host/omap_hsmmc.c    |  2 +-
 drivers/mmc/host/sdhci.c         |  2 +-
 drivers/mmc/host/usdhi6rol0.c    |  2 +-
 11 files changed, 20 insertions(+), 10 deletions(-)

-- 
2.11.0
