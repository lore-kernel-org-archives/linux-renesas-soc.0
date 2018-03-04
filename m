Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:36472 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932118AbeCDWtl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 4 Mar 2018 17:49:41 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: tmio: populate correct callback when using GPIO CD
Date: Sun,  4 Mar 2018 23:49:33 +0100
Message-Id: <20180304224933.17498-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch "mmc: tmio: support IP-builtin card detection logic" had a
typo and populated RO instead of CD. Fix it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Ulf: I didn't add a Fixes: tag because you used to sometimes rebase your
for-next branch and thus the tag would dangle then. Do you still do that BTW?

 drivers/mmc/host/tmio_mmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index d82dfea381727e..e30df9ad8197c4 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1244,7 +1244,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 		_host->ops.get_ro = mmc_gpio_get_ro;
 
 	if (mmc_can_gpio_cd(mmc))
-		_host->ops.get_ro = mmc_gpio_get_cd;
+		_host->ops.get_cd = mmc_gpio_get_cd;
 
 	_host->native_hotplug = !(mmc_can_gpio_cd(mmc) ||
 				  mmc->caps & MMC_CAP_NEEDS_POLL ||
-- 
2.11.0
