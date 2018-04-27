Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:60296 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759077AbeD0UZP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 16:25:15 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 2/2] tests: Add a legacy mode set test
Date: Fri, 27 Apr 2018 23:25:24 +0300
Message-Id: <20180427202524.14225-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20180427202524.14225-1-laurent.pinchart@ideasonboard.com>
References: <20180427202524.14225-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Perform mode sets through the legacy API to test the DRM core legacy
code paths, as well as the rcar-du code paths that could be exercised
differently by the atomic legacy mode set helpers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-legacy-modeset.py | 60 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100755 tests/kms-test-legacy-modeset.py

diff --git a/tests/kms-test-legacy-modeset.py b/tests/kms-test-legacy-modeset.py
new file mode 100755
index 000000000000..eac365f44b64
--- /dev/null
+++ b/tests/kms-test-legacy-modeset.py
@@ -0,0 +1,60 @@
+#!/usr/bin/python3
+
+import kmstest
+import pykms
+
+class LegacyModeSetTest(kmstest.KMSTest):
+    """Test mode setting on all connectors in sequence with the default mode through the legacy mode set API."""
+
+    def handle_page_flip(self, frame, time):
+        self.logger.log("Page flip complete")
+
+    def main(self):
+        for connector in self.card.connectors:
+            self.start("legacy mode set on connector %s" % connector.fullname)
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
+            # Perform a mode set
+            ret = crtc.set_mode(connector, fb, mode)
+            if ret < 0:
+                self.fail("legacy mode set failed with %d" % ret)
+                continue
+
+            self.logger.log("Legacy mode set complete")
+            self.run(5)
+
+            ret = crtc.disable_mode()
+            if ret < 0:
+                self.fail("legacy mode set disable failed with %d" % ret)
+                continue
+
+            self.success()
+
+LegacyModeSetTest().execute()
-- 
Regards,

Laurent Pinchart
