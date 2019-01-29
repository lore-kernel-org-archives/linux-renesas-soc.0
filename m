Return-Path: <SRS0=a0xC=QF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B087C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 05:40:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22E972148E
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 05:40:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q81L31h3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbfA2Fkt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 29 Jan 2019 00:40:49 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33975 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfA2Fkt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jan 2019 00:40:49 -0500
Received: by mail-wr1-f66.google.com with SMTP id f7so20662666wrp.1;
        Mon, 28 Jan 2019 21:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tDV7WglP4lEqpB2G1ZcH6yOkjnxXXpzIrV9hlx+L18s=;
        b=q81L31h3ZxO8/wczeX9QAcnxBP+RwN/gTY96F/jnRN5NLv1GTLgU8myY4R/i/uwKRT
         KwnOIcrhNFmhU+qzSwCmR22poePgn2Rj7WqVq+Zj2chEsbXy+2Wogx3mlJ3JX8dGTgSI
         qoPy8jhe53OxIgN/e9duTmMCUSwz+SUPskyCCJETKX/ToE67IkwzwkkMYqujmXK3wXyd
         QYdagc8fF1MqUjcXjkLR1K7UnVN+f4pIDN+bEi/DeW7nrsSE4VmJU03/CIICMSMTG5LY
         e8LtsHfZo92kxy5fcjr6uW6rdtk1lHcyy7+K78RvPctfNHOcKjN8gq9WrmEa1PR2xxrz
         +rQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tDV7WglP4lEqpB2G1ZcH6yOkjnxXXpzIrV9hlx+L18s=;
        b=pFmo8IZnJ1IFzZ9CNwyqbyjrDgoueZJhbIL/1n0k/ohNgYSUlM1Oadp0AuHGQkrw4g
         vPn3L0XcTlRJmfIe2gfW7EIDLOrM+m2YD6SZkGGh4mJ+St3UN3kqveZQ/nzA8SowERYc
         gIr7Sj+OM9JFy2RD0qQq5SAOtgadVQUiS2GSgaRqYZKpOuQoXKhT5Pxa/6DKq/91dnOf
         JODTe7EnQU/elketXfoZ4iNq720rB8Rr9r6WIi6gcG7CJJ4yrfmG9v9gz3jPo1CAU3dw
         riOgD3sU+fhPbJAU6eZQLsQT3HiLZwJzQfQRZC2TS5b9/HStGIyTeWMmMjaRcoEuPIW2
         m4Ug==
X-Gm-Message-State: AJcUukegrx5d63A9gvSE35m5YdXLX8wdWOeF+mJ78D2X/RK0sz+1ykqh
        OjDIXeH+kJFIdBoNeDsiNkgbpO8x
X-Google-Smtp-Source: ALg8bN4+A1pIn1Sqigkve5Sp5O+svD1SFwYtD9yViTlWBhxqQHS/SRhW6Nx3jWlV0ylm9vsKbiO5qQ==
X-Received: by 2002:adf:f28d:: with SMTP id k13mr25484135wro.78.1548740447245;
        Mon, 28 Jan 2019 21:40:47 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id a12sm103382236wrm.45.2019.01.28.21.40.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Jan 2019 21:40:46 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-mmc@vger.kernel.org
Cc:     Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mmc: renesas_sdhi: Fix card initialization failure in high speed mode
Date:   Tue, 29 Jan 2019 06:40:39 +0100
Message-Id: <20190129054039.15278-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Saito <takeshi.saito.xv@renesas.com>

This fixes card initialization failure in high speed mode.

If U-Boot uses SDR or HS200/400 mode before starting Linux and Linux
DT does not enable SDR/HS200/HS400 mode, card initialization fails in
high speed mode.

It is necessary to initialize SCC registers during card initialization
phase. HW reset function is registered only for a port with either of
SDR/HS200/HS400 properties in device tree. If SDR/HS200/HS400 properties
are not present in device tree, SCC registers will not be reset. In SoC
that support SCC registers, HW reset function should be registered
regardless of the configuration of device tree.

Reproduction procedure:
- Use U-Boot that support MMC HS200/400 mode.
- Delete HS200/HS400 properties in device tree.
  (Delete mmc-hs200-1_8v and mmc-hs400-1_8v)
- MMC port works high speed mode and all commands fail.

Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-mmc@vger.kernel.org
--
NOTE: Marek: - Reworded commit message
             - Updated patch to next/master
---
 drivers/mmc/host/renesas_sdhi_core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 31a351a20dc0..7e2a75c4f36f 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -723,6 +723,13 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		host->ops.start_signal_voltage_switch =
 			renesas_sdhi_start_signal_voltage_switch;
 		host->sdcard_irq_setbit_mask = TMIO_STAT_ALWAYS_SET_27;
+
+		/* SDR and HS200/400 registers requires HW reset */
+		if (of_data && of_data->scc_offset) {
+			priv->scc_ctl = host->ctl + of_data->scc_offset;
+			host->mmc->caps |= MMC_CAP_HW_RESET;
+			host->hw_reset = renesas_sdhi_hw_reset;
+		}
 	}
 
 	/* Orginally registers were 16 bit apart, could be 32 or 64 nowadays */
@@ -775,8 +782,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		const struct renesas_sdhi_scc *taps = of_data->taps;
 		bool hit = false;
 
-		host->mmc->caps |= MMC_CAP_HW_RESET;
-
 		for (i = 0; i < of_data->taps_num; i++) {
 			if (taps[i].clk_rate == 0 ||
 			    taps[i].clk_rate == host->mmc->f_max) {
@@ -789,12 +794,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		if (!hit)
 			dev_warn(&host->pdev->dev, "Unknown clock rate for SDR104\n");
 
-		priv->scc_ctl = host->ctl + of_data->scc_offset;
 		host->init_tuning = renesas_sdhi_init_tuning;
 		host->prepare_tuning = renesas_sdhi_prepare_tuning;
 		host->select_tuning = renesas_sdhi_select_tuning;
 		host->check_scc_error = renesas_sdhi_check_scc_error;
-		host->hw_reset = renesas_sdhi_hw_reset;
 		host->prepare_hs400_tuning =
 			renesas_sdhi_prepare_hs400_tuning;
 		host->hs400_downgrade = renesas_sdhi_disable_scc;
-- 
2.19.2

