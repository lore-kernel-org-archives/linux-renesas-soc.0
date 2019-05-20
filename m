Return-Path: <SRS0=uQ1k=TU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43259C072A4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 20 May 2019 09:27:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 18D91206BA
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 20 May 2019 09:27:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730445AbfETJ1X (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 20 May 2019 05:27:23 -0400
Received: from sauhun.de ([88.99.104.3]:49472 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730773AbfETJ1X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 05:27:23 -0400
Received: from localhost (p54B333DA.dip0.t-ipconnect.de [84.179.51.218])
        by pokefinder.org (Postfix) with ESMTPSA id C88222C5DC5;
        Mon, 20 May 2019 11:27:21 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-input@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH RESEND 1/2] input: da9063_onkey: remove platform_data support
Date:   Mon, 20 May 2019 11:27:10 +0200
Message-Id: <20190520092711.30662-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190520092711.30662-1-wsa+renesas@sang-engineering.com>
References: <20190520092711.30662-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There are no in-kernel users anymore, so remove this outdated interface.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>
---
 drivers/input/misc/da9063_onkey.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
index 3e9c353d82ef..e3a273c74123 100644
--- a/drivers/input/misc/da9063_onkey.c
+++ b/drivers/input/misc/da9063_onkey.c
@@ -22,7 +22,6 @@
 #include <linux/regmap.h>
 #include <linux/of.h>
 #include <linux/mfd/da9063/core.h>
-#include <linux/mfd/da9063/pdata.h>
 #include <linux/mfd/da9063/registers.h>
 #include <linux/mfd/da9062/core.h>
 #include <linux/mfd/da9062/registers.h>
@@ -201,8 +200,6 @@ static void da9063_cancel_poll(void *data)
 
 static int da9063_onkey_probe(struct platform_device *pdev)
 {
-	struct da9063 *da9063 = dev_get_drvdata(pdev->dev.parent);
-	struct da9063_pdata *pdata = dev_get_platdata(da9063->dev);
 	struct da9063_onkey *onkey;
 	const struct of_device_id *match;
 	int irq;
@@ -229,12 +226,8 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	if (pdata)
-		onkey->key_power = pdata->key_power;
-	else
-		onkey->key_power =
-			!of_property_read_bool(pdev->dev.of_node,
-					       "dlg,disable-key-power");
+	onkey->key_power = !of_property_read_bool(pdev->dev.of_node,
+						  "dlg,disable-key-power");
 
 	onkey->input = devm_input_allocate_device(&pdev->dev);
 	if (!onkey->input) {
-- 
2.19.1

