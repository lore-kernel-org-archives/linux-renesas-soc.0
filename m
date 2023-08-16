Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A4EC41513
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Aug 2023 13:57:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244037AbjHPN43 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Aug 2023 09:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245704AbjHPN4C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2023 09:56:02 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 380E01FCE
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2023 06:56:01 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,177,1684767600"; 
   d="scan'208";a="176786540"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Aug 2023 22:56:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.162])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F3CC3420C300;
        Wed, 16 Aug 2023 22:55:58 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] regulator: raa215300: Add const definition
Date:   Wed, 16 Aug 2023 14:55:50 +0100
Message-Id: <20230816135550.146657-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230816135550.146657-1-biju.das.jz@bp.renesas.com>
References: <20230816135550.146657-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add const definition to the initialized local variable name to avoid
overriding. Also the second parameter in strscpy is const char * instead of
char *.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/regulator/raa215300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/raa215300.c b/drivers/regulator/raa215300.c
index 898f53cac02c..bdbf1e4ce468 100644
--- a/drivers/regulator/raa215300.c
+++ b/drivers/regulator/raa215300.c
@@ -119,7 +119,7 @@ static int raa215300_i2c_probe(struct i2c_client *client)
 	}
 
 	if (clk_name) {
-		char *name = pmic_version >= 0x12 ? "isl1208" : "raa215300_a0";
+		const char *name = pmic_version >= 0x12 ? "isl1208" : "raa215300_a0";
 		struct device_node *np = client->dev.of_node;
 		u32 addr = RAA215300_RTC_DEFAULT_ADDR;
 		struct i2c_board_info info = {};
-- 
2.25.1

