Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751269AbdHWWlM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2017 18:41:12 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 2/2] README: Document need for killall command
Date: Wed, 23 Aug 2017 23:41:04 +0100
Message-Id: <1503528064-10454-3-git-send-email-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <1503528064-10454-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1503528064-10454-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

The killall command is provided by the psmisc package on debian based systems.
On other systems it should be built or added to the filesystem as appropriate.

Also remove unnecessary blank line.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index e503a2c41aef..7efcef394ae9 100644
--- a/README
+++ b/README
@@ -43,6 +43,7 @@ system in a directory included in $PATH.
 * media-ctl (part of v4l-utils, available at git://linuxtv.org/v4l-utils.git)
 * raw2rgbpnm (available at git://git.retiisi.org.uk/~sailus/raw2rgbpnm.git)
 * yavta (available at git://git.ideasonboard.org/yavta.git)
+* killall (available from the psmisc package)
 
 All but the HGO and CLU/LUT tests can be run with the latest version of these
 tools. To test the HGO, HGT and CLU/LUT, the 'vsp' branch of 'yavta' is currently
@@ -53,7 +54,6 @@ tool is not available the corresponding tests will be skipped.
 
 * stress (available at http://people.seas.harvard.edu/~apw/stress/)
 
-
 -----------------
 Running the Tests
 -----------------
-- 
2.7.4
