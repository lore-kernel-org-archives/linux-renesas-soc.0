Return-Path: <SRS0=k+uM=7X=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2FAC433E0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Jun 2020 12:46:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 181DA2072E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Jun 2020 12:46:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgFJMqc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Jun 2020 08:46:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50548 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728540AbgFJMqb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 08:46:31 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DEBC12C1;
        Wed, 10 Jun 2020 14:46:27 +0200 (CEST)
From:   Kieran Bingham <kieran@ksquared.org.uk>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v9.2 1/9] fixes! [max9286]: Fix whitespace indent
Date:   Wed, 10 Jun 2020 13:46:15 +0100
Message-Id: <20200610124623.51085-2-kieran@bingham.xyz>
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

Fix a minor 8space->tab conversion

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 590f384161a5..ef824d2b26b8 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -813,7 +813,7 @@ static int max9286_s_ctrl(struct v4l2_ctrl *ctrl)
 }
 
 static const struct v4l2_ctrl_ops max9286_ctrl_ops = {
-	.s_ctrl	= max9286_s_ctrl,
+	.s_ctrl = max9286_s_ctrl,
 };
 
 static int max9286_v4l2_register(struct max9286_priv *priv)
-- 
2.25.1

