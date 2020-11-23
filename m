Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7C5C56202
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 23 Nov 2020 12:02:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EED2920888
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 23 Nov 2020 12:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729319AbgKWMCE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 23 Nov 2020 07:02:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729317AbgKWMCD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Nov 2020 07:02:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92DBC0613CF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2020 04:02:00 -0800 (PST)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C09242A4;
        Mon, 23 Nov 2020 13:01:57 +0100 (CET)
From:   Kieran Bingham <kieran@ksquared.org.uk>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2] scripts: boards: Support alternative H3 variant
Date:   Mon, 23 Nov 2020 12:01:50 +0000
Message-Id: <20201123120150.117735-1-kieran@bingham.xyz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The Salvator-X H3 has had a rename of it's model information.
Support the new naming, and add the extra variants now available.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 scripts/boards.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/boards.sh b/scripts/boards.sh
index 151ee3ed3459..8335e41836ed 100644
--- a/scripts/boards.sh
+++ b/scripts/boards.sh
@@ -8,7 +8,9 @@ case $info in
         vins="4 5"
         csis="40"
         ;;
-    "Renesas Salvator-X board based on r8a7795 ES1.x")
+    "Renesas Salvator-X board based on r8a7795 ES1.x" | \
+    "Renesas Salvator-X board based on r8a77950" | \
+    "Renesas Salvator-X board based on r8a77951")
         gen="gen3"
         vins="0 1 2 3 4 5 6 7"
         csis="20 21 40 41"
-- 
2.25.1

