Return-Path: <SRS0=PbOa=TQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948E1C04E53
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 May 2019 01:48:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6772220873
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 May 2019 01:48:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727540AbfEPBqh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 15 May 2019 21:46:37 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:59014 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726937AbfEPBPH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 21:15:07 -0400
X-Halon-ID: 08405dd3-7778-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 08405dd3-7778-11e9-8ab4-005056917a89;
        Thu, 16 May 2019 03:15:03 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ulrich Hecht <uli@fpond.eu>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 3/8] rcar-vin: Allow interrupting lock when trying to open the video device
Date:   Thu, 16 May 2019 03:14:12 +0200
Message-Id: <20190516011417.10590-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The user should be allowed to break waiting for the lock when opening
the video device.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 0841f1a0bfd7ba3a..f67cef97b89a3bd4 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -821,7 +821,9 @@ static int rvin_open(struct file *file)
 	struct rvin_dev *vin = video_drvdata(file);
 	int ret;
 
-	mutex_lock(&vin->lock);
+	ret = mutex_lock_interruptible(&vin->lock);
+	if (ret)
+		return ret;
 
 	file->private_data = vin;
 
-- 
2.21.0

