Return-Path: <SRS0=Wq11=C7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79932C4363D
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Sep 2020 17:23:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24C3720888
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Sep 2020 17:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600795381;
	bh=lhgvr2VdNEC+Qr3visSERhKQaZhdHQJEwqleu+L2xVU=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=KQ9VQK+VjmON/FOlSIJ46xa2SoOWd4711SVQK/k1yBxKCiOKfoO0xWFEsvqPfp+rA
	 c+UjRe0J1jYS8/WTsaIjK62ieC1Wz/dehahm8dAe8gXjNZbdiv7/BOz3vHVxju9mdO
	 Iz/wWQiUHzIXj3KMkhZt+SF3dMH/r1sz85Q7SrbU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgIVRXA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Sep 2020 13:23:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:58776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726608AbgIVRXA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 13:23:00 -0400
Received: from localhost (p54b332c9.dip0.t-ipconnect.de [84.179.50.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 29A372084C;
        Tue, 22 Sep 2020 17:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600795379;
        bh=lhgvr2VdNEC+Qr3visSERhKQaZhdHQJEwqleu+L2xVU=;
        h=From:To:Cc:Subject:Date:From;
        b=PdzXZ0Xn2XUPkIwa/QiddqQzaowP363SDZhbe5+MMud3zoOH4knR9app2+ZQ+ThIM
         huZP+Uyg9CvyOQ+1kj7qcqXZEomD4BsAGASttzkFh5XNL3NVaxJypJjpHUfgZy127E
         9g+sSXggfVrw6mSODNip/XGDxqZonZlCHbnDbZGY=
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT] mmc: renesas_sdhi: drop local flag for tuning
Date:   Tue, 22 Sep 2020 19:22:53 +0200
Message-Id: <20200922172253.4458-1-wsa@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

The MMC core has now a generic check if some tuning is in progress. Its
protected area is a bit larger than the custom one in this driver but we
concluded that this works equally well for the intended case. So, drop
the local flag and switch to the generic one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I had this patch applied while working on other SDHI topics and
experienced no regressions. But I'd like to give Shimoda-san and the BSP
team some time for testing. We agreed on the approach already.

 drivers/mmc/host/renesas_sdhi.h      | 1 -
 drivers/mmc/host/renesas_sdhi_core.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 24958de274c1..cb962c7883dc 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -63,7 +63,6 @@ struct renesas_sdhi {
 	u32 scc_tappos_hs400;
 	const u8 *adjust_hs400_calib_table;
 	bool needs_adjust_hs400;
-	bool doing_tune;
 
 	/* Tuning values: 1 for success, 0 for failure */
 	DECLARE_BITMAP(taps, BITS_PER_LONG);
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index d621a4af8e87..20e5eb63caf8 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -581,7 +581,6 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	unsigned int taps_size = priv->tap_num * 2, min_tap_row;
 	unsigned long *bitmap;
 
-	priv->doing_tune = false;
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ, 0);
 
 	/*
@@ -656,7 +655,6 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
 		return -EINVAL;
 	}
 
-	priv->doing_tune = true;
 	bitmap_zero(priv->taps, priv->tap_num * 2);
 	bitmap_zero(priv->smpcmp, priv->tap_num * 2);
 
@@ -765,7 +763,7 @@ static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
 	    !(host->mmc->ios.timing == MMC_TIMING_MMC_HS400 && !use_4tap))
 		return false;
 
-	if (mmc_doing_retune(host->mmc) || priv->doing_tune)
+	if (mmc_doing_tune(host->mmc))
 		return false;
 
 	if (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL) &
-- 
2.20.1

