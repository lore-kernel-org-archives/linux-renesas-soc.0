Return-Path: <SRS0=VuhC=74=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4457BC433DF
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Jun 2020 12:16:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28A0C206B7
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Jun 2020 12:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729876AbgFOMQZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Jun 2020 08:16:25 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:53019 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729879AbgFOMQZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jun 2020 08:16:25 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 40E5B10000E;
        Mon, 15 Jun 2020 12:16:23 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/3] scripts/boards.sh: Fix M3-W identifier
Date:   Mon, 15 Jun 2020 14:19:33 +0200
Message-Id: <20200615121935.108142-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615121935.108142-1-jacopo@jmondi.org>
References: <20200615121935.108142-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The M3-W SoC has been renamed to r8a77960, adjust the board.sh script to
identify it correctly.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 scripts/boards.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/boards.sh b/scripts/boards.sh
index 0ec2981..2069494 100644
--- a/scripts/boards.sh
+++ b/scripts/boards.sh
@@ -13,7 +13,7 @@ case $info in
         vins="0 1 2 3 4 5 6 7"
         csis="20 40 41"
         ;;
-    "Renesas Salvator-X board based on r8a7796" | \
+    "Renesas Salvator-X board based on r8a77960" | \
         "Renesas Salvator-X 2nd version board based on r8a77965")
         gen="gen3"
         vins="0 1 2 3 4 5 6 7"
-- 
2.27.0

