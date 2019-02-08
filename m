Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C12C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 19:30:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B278B20855
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 19:30:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbfBHTaW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 14:30:22 -0500
Received: from sauhun.de ([88.99.104.3]:58960 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727209AbfBHTaW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 14:30:22 -0500
Received: from localhost (p54B331AB.dip0.t-ipconnect.de [84.179.49.171])
        by pokefinder.org (Postfix) with ESMTPSA id BD7642C282F;
        Fri,  8 Feb 2019 20:30:18 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: renesas_sdhi: Change HW adjustment register according to speed mode
Date:   Fri,  8 Feb 2019 20:30:02 +0100
Message-Id: <20190208193002.16915-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Saito <takeshi.saito.xv@renesas.com>

SCC is used for SDR104/HS200/HS400. We need to change SCC_DT2FF
according to the mode. If it is inappropriate, CRC error tends to occur.

This adds variable "tap_hs400" for HS400 mode and configures SCC_DT2FF
as needed.

Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
[wsa: rebased to upstream and updated commit message]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I don't have a testcase currently, so I don't think this is stable material. If
this ever changes, we can have it added to stable later. But I am open for
other opinions here. Tested on Salvator-XS with Renesas R-Car M3N, no
regressions in both detecting HS400 and transferring large files.

 drivers/mmc/host/renesas_sdhi.h               | 2 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 8 ++++++++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
 3 files changed, 11 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index da1e49c45bec..8394a7bb1fc1 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -15,6 +15,7 @@
 struct renesas_sdhi_scc {
 	unsigned long clk_rate;	/* clock rate for SDR104 */
 	u32 tap;		/* sampling clock position for SDR104 */
+	u32 tap_hs400;		/* sampling clock position for HS400 */
 };
 
 struct renesas_sdhi_of_data {
@@ -49,6 +50,7 @@ struct renesas_sdhi {
 	struct pinctrl_state *pins_default, *pins_uhs;
 	void __iomem *scc_ctl;
 	u32 scc_tappos;
+	u32 scc_tappos_hs400;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 7e2a75c4f36f..71e13844df6c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -337,6 +337,10 @@ static void renesas_sdhi_hs400_complete(struct tmio_mmc_host *host)
 	/* Set HS400 mode */
 	sd_ctrl_write16(host, CTL_SDIF_MODE, 0x0001 |
 			sd_ctrl_read16(host, CTL_SDIF_MODE));
+
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF,
+		       priv->scc_tappos_hs400);
+
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       (SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
 			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
@@ -396,6 +400,9 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 	/* Reset HS400 mode */
 	sd_ctrl_write16(host, CTL_SDIF_MODE, ~0x0001 &
 			sd_ctrl_read16(host, CTL_SDIF_MODE));
+
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, priv->scc_tappos);
+
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
 			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
@@ -786,6 +793,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 			if (taps[i].clk_rate == 0 ||
 			    taps[i].clk_rate == host->mmc->f_max) {
 				priv->scc_tappos = taps->tap;
+				priv->scc_tappos_hs400 = taps->tap_hs400;
 				hit = true;
 				break;
 			}
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 92c9b15252da..9dfafa2a90a3 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -81,6 +81,7 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 	{
 		.clk_rate = 0,
 		.tap = 0x00000300,
+		.tap_hs400 = 0x00000704,
 	},
 };
 
-- 
2.11.0

