Return-Path: <SRS0=YZYO=5Z=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EF1C2BB86
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 12:12:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8FD3C20771
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 12:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P9jwI+it"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgDIMMO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 9 Apr 2020 08:12:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48746 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDIMMO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:12:14 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D05A3197C;
        Thu,  9 Apr 2020 14:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586434332;
        bh=/i8VSC5ksIEGuKDnU07wtDJLKCWwHQrqZLvlXYuUgtU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P9jwI+itR1UQASimt7fZduQph3tuCYzsd03+OKYJb3NwZB7PlBxibeZDHqaxJj3+0
         ElrrFOu+yMzcfY7scMegzdb++naxyk1Nl5Qt45uHjZ920v303nkytXnEHdKJuLDDcj
         milV4f7b3dO+ql5c3iFGziIWiaBQj38oY3RckqX8=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v8 08/13] squash! max9286: Remove I2C mod-table
Date:   Thu,  9 Apr 2020 13:11:57 +0100
Message-Id: <20200409121202.11130-9-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

'Technically' this table is still required for module autoloading, until
some solution such as [0] is merged:

[0] [PATCH RFC] modpost: Support I2C Aliases from OF tables

https://lore.kernel.org/lkml/20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com/

However in practice, I think the only restriction that gets lost is
device instantiation from sysfs, which wouldn't really work for this
driver anyway, because it requires a description of connected endpoints.

So - it should be quite safe to drop it.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index cdebee8a0a22..911323d6d3c4 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1253,12 +1253,6 @@ static const struct of_device_id max9286_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, max9286_dt_ids);
 
-static const struct i2c_device_id max9286_id[] = {
-	{ "max9286", 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, max9286_id);
-
 static struct i2c_driver max9286_i2c_driver = {
 	.driver	= {
 		.name		= "max9286",
@@ -1266,7 +1260,6 @@ static struct i2c_driver max9286_i2c_driver = {
 	},
 	.probe_new	= max9286_probe,
 	.remove		= max9286_remove,
-	.id_table	= max9286_id,
 };
 
 module_i2c_driver(max9286_i2c_driver);
-- 
2.20.1

