Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDFEC433E9
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Mar 2021 13:03:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62C1E6500D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Mar 2021 13:03:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbhCLNDG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Mar 2021 08:03:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbhCLNCw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 08:02:52 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB7BC061763
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 05:02:51 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:f9e2:c536:b8cc:fbbc])
        by andre.telenet-ops.be with bizsmtp
        id fR2o240061ACAb301R2oAV; Fri, 12 Mar 2021 14:02:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lKhRH-0077p5-JO; Fri, 12 Mar 2021 14:02:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lKhRH-00EDut-5z; Fri, 12 Mar 2021 14:02:47 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] regulator: bd9571mwv: Fix AVS and DVFS voltage range
Date:   Fri, 12 Mar 2021 14:02:40 +0100
Message-Id: <20210312130242.3390038-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312130242.3390038-1-geert+renesas@glider.be>
References: <20210312130242.3390038-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to Table 30 ("DVFS_MoniVDAC [6:0] Setting Table") in the
BD9571MWV-M Datasheet Rev. 002, the valid voltage range is 600..1100 mV
(settings 0x3c..0x6e).  While the lower limit is taken into account (by
setting regulator_desc.linear_min_sel to 0x3c), the upper limit is not.

Fix this by reducing regulator_desc.n_voltages from 0x80 to 0x6f.

Fixes: e85c5a153fe237f2 ("regulator: Add ROHM BD9571MWV-M PMIC regulator driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/regulator/bd9571mwv-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bd9571mwv-regulator.c b/drivers/regulator/bd9571mwv-regulator.c
index 7b0cd08db4462395..13393cdc6be1497e 100644
--- a/drivers/regulator/bd9571mwv-regulator.c
+++ b/drivers/regulator/bd9571mwv-regulator.c
@@ -125,7 +125,7 @@ static const struct regulator_ops vid_ops = {
 
 static const struct regulator_desc regulators[] = {
 	BD9571MWV_REG("VD09", "vd09", VD09, avs_ops, 0, 0x7f,
-		      0x80, 600000, 10000, 0x3c),
+		      0x6f, 600000, 10000, 0x3c),
 	BD9571MWV_REG("VD18", "vd18", VD18, vid_ops, BD9571MWV_VD18_VID, 0xf,
 		      16, 1625000, 25000, 0),
 	BD9571MWV_REG("VD25", "vd25", VD25, vid_ops, BD9571MWV_VD25_VID, 0xf,
@@ -134,7 +134,7 @@ static const struct regulator_desc regulators[] = {
 		      11, 2800000, 100000, 0),
 	BD9571MWV_REG("DVFS", "dvfs", DVFS, reg_ops,
 		      BD9571MWV_DVFS_MONIVDAC, 0x7f,
-		      0x80, 600000, 10000, 0x3c),
+		      0x6f, 600000, 10000, 0x3c),
 };
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.25.1

