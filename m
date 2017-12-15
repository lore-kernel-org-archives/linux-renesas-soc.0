Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:53275 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756232AbdLONsv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 08:48:51 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] [kms-tests] tests: Add colorkey test
Date: Fri, 15 Dec 2017 15:48:48 +0200
Message-Id: <20171215134848.19680-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The test will display an overlay with large colored boxes on top of the
root plane and turn the boxes translucent or transparent in sequence
using color keying.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-colorkey.py | 111 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100755 tests/kms-test-colorkey.py

diff --git a/tests/kms-test-colorkey.py b/tests/kms-test-colorkey.py
new file mode 100755
index 000000000000..310165f83b1e
--- /dev/null
+++ b/tests/kms-test-colorkey.py
@@ -0,0 +1,111 @@
+#!/usr/bin/python3
+
+import kmstest
+import pykms
+import time
+
+class ColorKeyTest(kmstest.KMSTest):
+    """Test color keying with two planes."""
+
+    def main(self):
+        self.start("color keying")
+
+        # Find a CRTC with a connected connector and at least one overlay plane
+        for connector in self.card.connectors:
+            if not connector.connected():
+                continue
+
+            try:
+                mode = connector.get_default_mode()
+            except ValueError:
+                continue
+
+            crtcs = connector.get_possible_crtcs()
+            for crtc in crtcs:
+                overlay = None
+                for plane in self.card.planes:
+                    if plane.supports_crtc(crtc) and plane != crtc.primary_plane:
+                        overlay = plane
+
+                if overlay:
+                    break
+            else:
+                crtc = None
+
+            if crtc:
+                break
+
+        else:
+            self.skip("no CRTC available with connector and at least one overlay plane")
+            return
+
+        self.logger.log("Testing connector %s, CRTC %u, mode %s" % \
+              (connector.fullname, crtc.id, mode.name))
+
+        # Create the frame buffers
+        colors = ((255, 0, 0), (0, 255, 0), (0, 0, 255), (255, 255, 255))
+        width = mode.hdisplay
+        height = mode.vdisplay
+        fbs = []
+
+        fb = pykms.DumbFramebuffer(self.card, width, height, "XR24")
+        pykms.draw_test_pattern(fb)
+        fbs.append(fb)
+
+        fb = pykms.DumbFramebuffer(self.card, width, height, "XR24")
+        pykms.draw_rect(fb, 0,          0,           width // 2, height // 2, pykms.RGB(*colors[0]))
+        pykms.draw_rect(fb, width // 2, 0,           width // 2, height // 2, pykms.RGB(*colors[1]))
+        pykms.draw_rect(fb, 0,          height // 2, width // 2, height // 2, pykms.RGB(*colors[2]))
+        pykms.draw_rect(fb, width // 2, height // 2, width // 2, height // 2, pykms.RGB(*colors[3]))
+        fbs.append(fb)
+
+        # Set the mode with the primary plane and add an overlay plane
+        ret = self.atomic_crtc_mode_set(crtc, connector, mode, fbs[0])
+        if ret < 0:
+            self.fail("atomic mode set failed with %d" % ret)
+            return
+
+        self.logger.log("Initial atomic mode set completed")
+
+        # Add the overlay plane to cover the whole CRTC
+        source = kmstest.Rect(0, 0, fbs[1].width, fbs[1].height)
+        destination = kmstest.Rect(0, 0, fbs[1].width, fbs[1].height)
+        ret = self.atomic_plane_set(overlay, crtc, source, destination, fbs[1], sync=True)
+        if ret < 0:
+            self.fail("atomic plane set for overlay plane failed with %d" % ret)
+            return
+
+        self.logger.log("Overlay plane enabled")
+        time.sleep(3)
+
+        # Try to set different minimum and maximum values, this should be
+        # rejected.
+        req = pykms.AtomicReq(self.card)
+        req.add(plane, {"colorkey.min": 1, "colorkey.max": 2})
+        ret = req.commit_sync()
+        if ret >= 0:
+            self.fail("Non-equal colorkey min and max not rejected")
+            return
+
+        self.logger.log("Non-equal colorkey min and max correctly rejected")
+
+        # Cycle over color keys to make the four rectangles in the overlay plane
+        # transparent in turn.
+        for i in range(len(colors)):
+            color = (colors[i][0] << 40) | (colors[i][1] << 24) | (colors[i][2] << 8)
+
+            plane.set_props({
+                    "colorkey.mode": 1,
+                    "colorkey.min": color,
+                    "colorkey.max": color,
+                    "colorkey.value": (255 * (len(colors) - i - 1) // 4) << 56,
+            })
+
+            self.logger.log("Color key set to %s" % repr(colors[i]))
+            time.sleep(3)
+
+        plane.set_prop("colorkey.mode", 0)
+        self.atomic_crtc_disable(crtc)
+        self.success()
+
+ColorKeyTest().execute()
-- 
Regards,

Laurent Pinchart
