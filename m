Return-Path: <SRS0=XP2S=QL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4256C282CB
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 22:00:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9DFF320818
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 22:00:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbfBDWAU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Feb 2019 17:00:20 -0500
Received: from sauhun.de ([88.99.104.3]:52174 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725981AbfBDWAU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Feb 2019 17:00:20 -0500
Received: from localhost (host-78-129-117-189.dynamic.voo.be [78.129.117.189])
        by pokefinder.org (Postfix) with ESMTPSA id 7273F4A16DE;
        Mon,  4 Feb 2019 23:00:18 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] i2c: sh_mobile: use new clock calculation formulas for Gen3
Date:   Mon,  4 Feb 2019 23:00:10 +0100
Message-Id: <20190204220010.5671-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190204220010.5671-1-wsa+renesas@sang-engineering.com>
References: <20190204220010.5671-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We could finally measure the clock on an Ebisu board. The new formula
gives way better results, i.e. 100kHz instead of 106kHz and 400kHz
instead of 387kHz. Switch to these formulas for all Gen3 SoCs.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 875cc5d09aa2..3c1552f14bec 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -806,11 +806,11 @@ static const struct of_device_id sh_mobile_i2c_dt_ids[] = {
 	{ .compatible = "renesas,iic-r8a7792", .data = &fast_clock_dt_config },
 	{ .compatible = "renesas,iic-r8a7793", .data = &fast_clock_dt_config },
 	{ .compatible = "renesas,iic-r8a7794", .data = &fast_clock_dt_config },
-	{ .compatible = "renesas,iic-r8a7795", .data = &fast_clock_dt_config },
-	{ .compatible = "renesas,iic-r8a77990", .data = &fast_clock_dt_config },
+	{ .compatible = "renesas,iic-r8a7795", .data = &v2_freq_calc_dt_config },
+	{ .compatible = "renesas,iic-r8a77990", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,iic-sh73a0", .data = &fast_clock_dt_config },
 	{ .compatible = "renesas,rcar-gen2-iic", .data = &fast_clock_dt_config },
-	{ .compatible = "renesas,rcar-gen3-iic", .data = &fast_clock_dt_config },
+	{ .compatible = "renesas,rcar-gen3-iic", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,rmobile-iic", .data = &default_dt_config },
 	{},
 };
-- 
2.19.1

