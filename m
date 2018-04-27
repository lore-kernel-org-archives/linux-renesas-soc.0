Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:60286 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759039AbeD0UZP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 16:25:15 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/2] tests: modeset: Disabling connectors explicitly
Date: Fri, 27 Apr 2018 23:25:23 +0300
Message-Id: <20180427202524.14225-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

At the end of the modeset test run for each CRTC the test disables the
CRTC through the atomic API by setting its ACTIVE property to 0, without
touching connector properties. While this work, it doesn't exercise the
connector atomic_check disable code path. Disable to connector as well
to extend code path coverage.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-modeset.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms-test-modeset.py b/tests/kms-test-modeset.py
index f8a78ad2926b..2898b7753503 100755
--- a/tests/kms-test-modeset.py
+++ b/tests/kms-test-modeset.py
@@ -49,7 +49,13 @@ class ModeSetTest(kmstest.KMSTest):
 
             self.logger.log("Atomic mode set complete")
             self.run(5)
-            self.atomic_crtc_disable(crtc)
+
+            # Disablee the CRTC and connector explicitly to exercise all
+            # atomic_check handlers.
+            req = pykms.AtomicReq(self.card)
+            req.add(crtc, { 'ACTIVE': False, 'MODE_ID': 0 })
+            req.add(connector, 'CRTC_ID', 0)
+            req.commit_sync(True)
 
             if self.flips == 0:
                 self.fail("Page flip not registered")
-- 
Regards,

Laurent Pinchart
