Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:35936 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752747AbeDRM00 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 08:26:26 -0400
Date: Wed, 18 Apr 2018 20:26:08 +0800
From: kbuild test robot <lkp@intel.com>
To: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [RFC PATCH renesas] mmc: tmio: tmio_mmc_prepare_hs400_tuning() can
 be static
Message-ID: <20180418122608.GA52968@lkp-hsx03>
References: <201804182048.TydzQbRW%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201804182048.TydzQbRW%fengguang.wu@intel.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Fixes: 485c8281e412 ("mmc: tmio: add eMMC HS400 mode support")
Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 tmio_mmc_core.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 4a83320..cd7afa9 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1100,7 +1100,7 @@ static int tmio_multi_io_quirk(struct mmc_card *card,
 	return blk_size;
 }
 
-int tmio_mmc_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_ios *ios)
+static int tmio_mmc_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_ios *ios)
 {
 	struct tmio_mmc_host *host = mmc_priv(mmc);
 
@@ -1110,8 +1110,8 @@ int tmio_mmc_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_ios *ios)
 	return 0;
 }
 
-void tmio_mmc_prepare_hs400_tuning_downgrade(struct mmc_host *mmc,
-					     struct mmc_ios *ios)
+static void tmio_mmc_prepare_hs400_tuning_downgrade(struct mmc_host *mmc,
+						    struct mmc_ios *ios)
 {
 	struct tmio_mmc_host *host = mmc_priv(mmc);
 
@@ -1119,8 +1119,8 @@ void tmio_mmc_prepare_hs400_tuning_downgrade(struct mmc_host *mmc,
 		host->prepare_hs400_tuning_downgrade(host, ios);
 }
 
-void tmio_mmc_complete_hs400_tuning(struct mmc_host *mmc,
-				    struct mmc_ios *ios)
+static void tmio_mmc_complete_hs400_tuning(struct mmc_host *mmc,
+					   struct mmc_ios *ios)
 {
 	struct tmio_mmc_host *host = mmc_priv(mmc);
 
