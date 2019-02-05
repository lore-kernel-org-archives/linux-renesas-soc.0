Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09C3C282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 17:00:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AEC02081B
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 17:00:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbfBERA4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 12:00:56 -0500
Received: from sauhun.de ([88.99.104.3]:59098 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727544AbfBERA4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 12:00:56 -0500
Received: from localhost (hsvpn34.hotsplots.net [176.74.57.181])
        by pokefinder.org (Postfix) with ESMTPSA id 6CBED2C0509;
        Tue,  5 Feb 2019 18:00:54 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: sh_mobile: use new clock calculation formulas for Gen2
Date:   Tue,  5 Feb 2019 18:00:46 +0100
Message-Id: <20190205170046.5046-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We measured the clock on a Lager and an Ebisu board. The new formula
gives better results for both. So after Gen3, switch to this formula for
all Gen2 SoCs.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 3c1552f14bec..6dfe1b3e2a3b 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -802,14 +802,14 @@ static const struct of_device_id sh_mobile_i2c_dt_ids[] = {
 	{ .compatible = "renesas,iic-r8a7740", .data = &r8a7740_dt_config },
 	{ .compatible = "renesas,iic-r8a774c0", .data = &fast_clock_dt_config },
 	{ .compatible = "renesas,iic-r8a7790", .data = &v2_freq_calc_dt_config },
-	{ .compatible = "renesas,iic-r8a7791", .data = &fast_clock_dt_config },
-	{ .compatible = "renesas,iic-r8a7792", .data = &fast_clock_dt_config },
-	{ .compatible = "renesas,iic-r8a7793", .data = &fast_clock_dt_config },
-	{ .compatible = "renesas,iic-r8a7794", .data = &fast_clock_dt_config },
+	{ .compatible = "renesas,iic-r8a7791", .data = &v2_freq_calc_dt_config },
+	{ .compatible = "renesas,iic-r8a7792", .data = &v2_freq_calc_dt_config },
+	{ .compatible = "renesas,iic-r8a7793", .data = &v2_freq_calc_dt_config },
+	{ .compatible = "renesas,iic-r8a7794", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,iic-r8a7795", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,iic-r8a77990", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,iic-sh73a0", .data = &fast_clock_dt_config },
-	{ .compatible = "renesas,rcar-gen2-iic", .data = &fast_clock_dt_config },
+	{ .compatible = "renesas,rcar-gen2-iic", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,rcar-gen3-iic", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,rmobile-iic", .data = &default_dt_config },
 	{},
-- 
2.19.1

