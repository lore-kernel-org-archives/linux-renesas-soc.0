Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751551AbdIQXsx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Sep 2017 19:48:53 -0400
From: Kieran Bingham <kbingham@kernel.org>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 5/5] tests: Add a CRTC mode set stress test
Date: Mon, 18 Sep 2017 00:48:44 +0100
Message-Id: <1505692124-12167-6-git-send-email-kbingham@kernel.org>
In-Reply-To: <1505692124-12167-1-git-send-email-kbingham@kernel.org>
References: <1505692124-12167-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Provide a stress routine on the CRTC by continuously disabling and
resetting the mode.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 tests/kms-test-stresstest.py | 76 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100755 tests/kms-test-stresstest.py

diff --git a/tests/kms-test-stresstest.py b/tests/kms-test-stresstest.py
new file mode 100755
index 000000000000..0db6df63896c
--- /dev/null
+++ b/tests/kms-test-stresstest.py
@@ -0,0 +1,76 @@
+#!/usr/bin/python3
+
+import kmstest
+import pykms
+
+class StressModeSetTest(kmstest.KMSTest):
+    """Stress test the mode setting on all connectors in sequence with the default mode."""
+
+    def handle_page_flip(self, frame, time):
+        self.logger.log("Page flip complete")
+
+    def main(self):
+        for connector in self.card.connectors:
+            self.start("stress atomic mode set on connector %s" % connector.fullname)
+
+            # Skip disconnected connectors
+            if not connector.connected():
+                self.skip("unconnected connector")
+                continue
+
+            # Find a CRTC suitable for the connector
+            crtc = connector.get_current_crtc()
+            if not crtc:
+                crtcs = connector.get_possible_crtcs()
+                if len(crtcs) == 0:
+                    pass
+
+                crtc = crtcs[0]
+
+            # Get the default mode for the connector
+            try:
+                mode = connector.get_default_mode()
+            except ValueError:
+                self.skip("no mode available")
+                continue
+
+            self.logger.log("Testing connector %s on CRTC %u with mode %s" % \
+                  (connector.fullname, crtc.id, mode.name))
+
+            # Create a frame buffer
+            fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, "XR24")
+            pykms.draw_test_pattern(fb)
+
+            # Track any failures in the iterations
+            failures = 0
+
+            for i in range(50):
+                # Disable the crtc
+                ret = self.atomic_crtc_disable(crtc)
+                if ret < 0:
+                    self.fail("Failed to disable CRTC")
+                    failures += 1
+                    break
+
+                # Reset the flips counter
+                self.flips = 0
+
+                # Perform a mode set
+                ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
+                if ret < 0:
+                    self.fail("atomic mode set failed with %d" % ret)
+                    failures += 1
+                    break
+    
+                self.logger.log("Atomic mode set complete")
+                self.run(1)
+
+                if self.flips == 0:
+                    self.fail("Page flip not registered")
+                    failures += 1
+                    break
+
+            if failures == 0:
+                self.success()
+
+StressModeSetTest().execute()
-- 
2.7.4
