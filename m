Return-Path: <SRS0=YZYO=5Z=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84711C2BBFD
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 12:12:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52EB720771
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 12:12:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gg0arIRu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgDIMMM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 9 Apr 2020 08:12:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48748 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgDIMMM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:12:12 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4067913CB;
        Thu,  9 Apr 2020 14:12:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586434330;
        bh=rHbDeXJMztOUf1um+41rM5Ol+trow3LDpX1T8XQm69w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gg0arIRuqxaDITf1D7mlblhzOfuYbMhJcHYXp7d/1LU3v5i/0NsJ3gZokoo1f83+G
         0YHGSp8jozTKsv5wqLVbursx8TmNOZGPNPaeAKMGwVBhTj9whlAmv+/lb/VN61WZ/2
         wMsHE04kE/IkbHefw6XUGn0g28Ev+M52o8SeIF2k=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v8 05/13] squash! max9286: Convert to use devm_regulator_get()
Date:   Thu,  9 Apr 2020 13:11:54 +0100
Message-Id: <20200409121202.11130-6-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

 - Convert to use devm_regulator_get()
---
 drivers/media/i2c/max9286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index d0749c537152..c374078c7001 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1187,7 +1187,7 @@ static int max9286_probe(struct i2c_client *client)
 	if (ret)
 		goto err_powerdown;
 
-	priv->regulator = regulator_get(&client->dev, "poc");
+	priv->regulator = devm_regulator_get(&client->dev, "poc");
 	if (IS_ERR(priv->regulator)) {
 		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
 			dev_err(&client->dev,
-- 
2.20.1

