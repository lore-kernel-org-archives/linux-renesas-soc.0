Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49035C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:40:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A3C020882
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:40:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731532AbfDBOk0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 10:40:26 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:35010 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729541AbfDBOk0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 10:40:26 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id vSgQ1z01F3XaVaC01SgQZk; Tue, 02 Apr 2019 16:40:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hBKaO-0002la-MJ; Tue, 02 Apr 2019 16:40:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hBKaO-00079T-L5; Tue, 02 Apr 2019 16:40:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/3] spi: sh-msiof: Use readl_poll_timeout_atomic() instead of open-coding
Date:   Tue,  2 Apr 2019 16:40:22 +0200
Message-Id: <20190402144023.27422-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190402144023.27422-1-geert+renesas@glider.be>
References: <20190402144023.27422-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace the open-coded loop in sh_msiof_modify_ctr_wait() by a call to
the readl_poll_timeout_atomic() helper macro.

Suggested-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/spi/spi-sh-msiof.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 6edc76636e81a801..3243ff258896595b 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -18,6 +18,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -219,21 +220,14 @@ static int sh_msiof_modify_ctr_wait(struct sh_msiof_spi_priv *p,
 {
 	u32 mask = clr | set;
 	u32 data;
-	int k;
 
 	data = sh_msiof_read(p, CTR);
 	data &= ~clr;
 	data |= set;
 	sh_msiof_write(p, CTR, data);
 
-	for (k = 100; k > 0; k--) {
-		if ((sh_msiof_read(p, CTR) & mask) == set)
-			break;
-
-		udelay(10);
-	}
-
-	return k > 0 ? 0 : -ETIMEDOUT;
+	return readl_poll_timeout_atomic(p->mapbase + CTR, data,
+					 (data & mask) == set, 10, 1000);
 }
 
 static irqreturn_t sh_msiof_spi_irq(int irq, void *data)
-- 
2.17.1

