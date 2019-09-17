Return-Path: <SRS0=L50G=XM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90E7C4CEC9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 17 Sep 2019 18:36:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8E07214AF
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 17 Sep 2019 18:36:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbfIQSgz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 17 Sep 2019 14:36:55 -0400
Received: from sauhun.de ([88.99.104.3]:55818 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbfIQSgz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 14:36:55 -0400
Received: from localhost (p54B331E4.dip0.t-ipconnect.de [84.179.49.228])
        by pokefinder.org (Postfix) with ESMTPSA id 460B22C0489;
        Tue, 17 Sep 2019 20:36:53 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: tmio: remove workaround for NON_REMOVABLE
Date:   Tue, 17 Sep 2019 20:36:52 +0200
Message-Id: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PM has been reworked, so eMMC gets now detected on R-Car H3 ES1.0 and
2.0 as well as M3-N without the workaround. Card detect and write
protect also still work. Remove the workaround.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc_core.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 9b6e1001e77c..63dc37481fba 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1208,15 +1208,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	if (!_host->reset)
 		_host->reset = tmio_mmc_reset;
 
-	/*
-	 * On Gen2+, eMMC with NONREMOVABLE currently fails because native
-	 * hotplug gets disabled. It seems RuntimePM related yet we need further
-	 * research. Since we are planning a PM overhaul anyway, let's enforce
-	 * for now the device being active by enabling native hotplug always.
-	 */
-	if (pdata->flags & TMIO_MMC_MIN_RCAR2)
-		_host->native_hotplug = true;
-
 	/*
 	 * While using internal tmio hardware logic for card detection, we need
 	 * to ensure it stays powered for it to work.
-- 
2.20.1

