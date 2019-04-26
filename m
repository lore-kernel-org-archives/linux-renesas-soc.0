Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9171C43218
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 05:23:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8C6E206BF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 05:23:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbfDZFXM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 01:23:12 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:58411 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725877AbfDZFXM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 01:23:12 -0400
X-IronPort-AV: E=Sophos;i="5.60,396,1549897200"; 
   d="scan'208";a="14381044"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Apr 2019 14:23:09 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7978741AF7E3;
        Fri, 26 Apr 2019 14:23:09 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] mmc: tmio: add init_card ops
Date:   Fri, 26 Apr 2019 14:18:48 +0900
Message-Id: <1556255930-18188-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since renesas_sdhi_internal_dmac driver would like to use
the init_card() ops in the future, this patch adds init_card ops
into the struct tmio_mmc_host and struct tmio_mmc_dma_ops.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/host/tmio_mmc.h      | 2 ++
 drivers/mmc/host/tmio_mmc_core.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index c5ba13f..cb2c42b 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -118,6 +118,7 @@ struct tmio_mmc_dma_ops {
 	void (*release)(struct tmio_mmc_host *host);
 	void (*abort)(struct tmio_mmc_host *host);
 	void (*dataend)(struct tmio_mmc_host *host);
+	void (*init_card)(struct tmio_mmc_host *host, struct mmc_card *card);
 };
 
 struct tmio_mmc_host {
@@ -178,6 +179,7 @@ struct tmio_mmc_host {
 	void (*hw_reset)(struct tmio_mmc_host *host);
 	void (*prepare_tuning)(struct tmio_mmc_host *host, unsigned long tap);
 	bool (*check_scc_error)(struct tmio_mmc_host *host);
+	void (*init_card)(struct tmio_mmc_host *host, struct mmc_card *card);
 
 	/*
 	 * Mandatory callback for tuning to occur which is optional for SDR50
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 130b91c..6019628 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1047,6 +1047,14 @@ static void tmio_mmc_hs400_complete(struct mmc_host *mmc)
 		host->hs400_complete(host);
 }
 
+static void tmio_mmc_init_card(struct mmc_host *mmc, struct mmc_card *card)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+
+	if (host->init_card)
+		host->init_card(host, card);
+}
+
 static const struct mmc_host_ops tmio_mmc_ops = {
 	.request	= tmio_mmc_request,
 	.set_ios	= tmio_mmc_set_ios,
@@ -1059,6 +1067,7 @@ static const struct mmc_host_ops tmio_mmc_ops = {
 	.prepare_hs400_tuning = tmio_mmc_prepare_hs400_tuning,
 	.hs400_downgrade = tmio_mmc_hs400_downgrade,
 	.hs400_complete	= tmio_mmc_hs400_complete,
+	.init_card	= tmio_mmc_init_card,
 };
 
 static int tmio_mmc_init_ocr(struct tmio_mmc_host *host)
-- 
2.7.4

