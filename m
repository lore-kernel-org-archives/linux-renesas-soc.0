Return-Path: <SRS0=k+uM=7X=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF88C433DF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Jun 2020 12:46:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEDAC2072E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Jun 2020 12:46:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgFJMqm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Jun 2020 08:46:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50566 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728595AbgFJMqm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 08:46:42 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCD8613EE;
        Wed, 10 Jun 2020 14:46:31 +0200 (CEST)
From:   Kieran Bingham <kieran@ksquared.org.uk>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v9.2 9/9] fixes! [rdacm20]: Use usleep_range over mdelay(10)
Date:   Wed, 10 Jun 2020 13:46:23 +0100
Message-Id: <20200610124623.51085-10-kieran@bingham.xyz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200610124623.51085-1-kieran@bingham.xyz>
References: <20200610124623.51085-1-kieran@bingham.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Prefer usleep_range rather than the busy looping mdelay for 10ms waits.

msleep( n < 20 ) may sleep up to 20 milliseconds, but in this instance I
don't think that's a issue here. All the same, use usleep_range between
10, 15 milliseconds.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/rdacm20.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index cda3e6372ea9..1ed928c4ca70 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -488,9 +488,9 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 	 * MAX9271 GPIO1 and verify communication with the OV10635.
 	 */
 	max9271_clear_gpios(dev->serializer, MAX9271_GPIO1OUT);
-	mdelay(10);
+	usleep_range(10000, 15000);
 	max9271_set_gpios(dev->serializer, MAX9271_GPIO1OUT);
-	mdelay(10);
+	usleep_range(10000, 15000);
 
 again:
 	ret = ov10635_read16(dev, OV10635_PID);
-- 
2.25.1

