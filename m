Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754013AbdKOOig (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2017 09:38:36 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: niklas.soderlund@ragnatech.se
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 1/3] tools: 8camera-status: Fix write failure mis-allocations
Date: Wed, 15 Nov 2017 14:38:29 +0000
Message-Id: <1510756711-6488-2-git-send-email-kbingham@kernel.org>
In-Reply-To: <1510756711-6488-1-git-send-email-kbingham@kernel.org>
References: <1510756711-6488-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Debug prints of the max9271_write call are appearing in the failure counts.

Fix the 'catcher' so that it is more specific to the failure

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 tools/8camera-status | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/8camera-status b/tools/8camera-status
index 234b8a0cab2b..cdfe76ef286f 100755
--- a/tools/8camera-status
+++ b/tools/8camera-status
@@ -21,7 +21,7 @@ BEGIN {
 	print
 }
 
-/max9271_write/ {
+/max9271_write.*write failed/ {
 	max9271_write_fail++
 	print
 }
-- 
2.7.4
