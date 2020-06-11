Return-Path: <SRS0=ii06=7Y=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8EAC433DF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Jun 2020 14:26:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC2792065C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Jun 2020 14:26:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fra2BN55"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728212AbgFKO0M (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Jun 2020 10:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgFKO0M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jun 2020 10:26:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34DD2C08C5C1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2020 07:26:12 -0700 (PDT)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 712C5F9;
        Thu, 11 Jun 2020 16:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591885566;
        bh=4+VUzWn0s3usqszl9yD7UuWbQ9nYtFBq1Y4ZTi5Gxfg=;
        h=From:To:Cc:Subject:Date:From;
        b=Fra2BN55EkUm/fFP17Z7yJ1i8aZQmkLCkW6n9qSfhadgxN0QT5L+RRxakzM8spVGy
         siIh5ccA46SvWD9E9+6al0xtpSkBH4P5VYAxnfggaKMjvMvRUxJoOiduPPBzj6ChY8
         BoxTB8+PZ5fYYzaDFlymhLVa/fL3Wn4G6d7Lm0BU=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [VIN-Tests PATCH] scripts: boards: Support alternative H3 variant
Date:   Thu, 11 Jun 2020 15:26:01 +0100
Message-Id: <20200611142601.359091-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Salvator-X H3 has had a rename of it's model information.
Support the new naming.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 scripts/boards.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/boards.sh b/scripts/boards.sh
index 0ec2981..001c017 100644
--- a/scripts/boards.sh
+++ b/scripts/boards.sh
@@ -3,7 +3,8 @@
 info=$(strings /proc/device-tree/model)
 
 case $info in
-    "Renesas Salvator-X board based on r8a7795 ES1.x")
+    "Renesas Salvator-X board based on r8a7795 ES1.x" |
+        "Renesas Salvator-X board based on r8a77950")
         gen="gen3"
         vins="0 1 2 3 4 5 6 7"
         csis="20 21 40 41"
-- 
2.1.4

