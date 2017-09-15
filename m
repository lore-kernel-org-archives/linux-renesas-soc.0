Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751370AbdION36 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 09:29:58 -0400
From: Kieran Bingham <kbingham@kernel.org>
To: laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 2/2] tests: Test suspend and resume on active pipelines
Date: Fri, 15 Sep 2017 14:29:52 +0100
Message-Id: <1505482192-23896-3-git-send-email-kbingham@kernel.org>
In-Reply-To: <1505482192-23896-1-git-send-email-kbingham@kernel.org>
References: <1505482192-23896-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Utilise the CONFIG_PM_DEBUG framework to perform automated suspend
testing of the hardware devices.

Generate active frames on a plane, and ensure that flip notifications
are received both before a suspend, and then following a resume action.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 tests/kms-test-suspend-resume.py | 189 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 189 insertions(+)
 create mode 100755 tests/kms-test-suspend-resume.py

diff --git a/tests/kms-test-suspend-resume.py b/tests/kms-test-suspend-resume.py
new file mode 100755
index 000000000000..69c66e269cdd
--- /dev/null
+++ b/tests/kms-test-suspend-resume.py
@@ -0,0 +1,189 @@
+#!/usr/bin/python3
+
+import kmstest
+import os
+import pykms
+import threading
+
+
+class PageFlipper(object):
+    """Test page flipping on a connector with the default mode."""
+
+    BAR_WIDTH = 20
+    BAR_SPEED = 8
+
+    def __init__(self, test):
+        self.test = test
+        self.logger = test.logger
+        self.loop = test.loop
+        self.card = test.card
+
+        # Register ourselves as the parent test's flip handler ... :S
+        test.handle_page_flip = self.handle_page_flip
+
+    def handle_page_flip(self, frame, time):
+        self.flips += 1
+
+        if self.flips == 1:
+            self.logger.log("first page flip frame %u time %f" % (frame, time))
+            self.frame_start = frame
+            self.time_start = time
+
+        if self.stop_requested:
+            self.logger.log("last page flip frame %u time %f" % (frame, time))
+            self.frame_end = frame
+            self.time_end = time
+            self.loop.stop()
+            self.stop_requested = False
+            return
+
+        fb = self.fbs[self.front_buf]
+        self.front_buf = self.front_buf ^ 1
+
+        old_xpos = (self.bar_xpos - self.BAR_SPEED) % (fb.width - self.BAR_WIDTH)
+        new_xpos = (self.bar_xpos + self.BAR_SPEED) % (fb.width - self.BAR_WIDTH)
+        self.bar_xpos = new_xpos
+
+        pykms.draw_color_bar(fb, old_xpos, new_xpos, self.BAR_WIDTH)
+
+        source = kmstest.Rect(0, 0, fb.width, fb.height)
+        destination = kmstest.Rect(0, 0, fb.width, fb.height)
+        self.test.atomic_plane_set(self.plane, self.crtc, source, destination, fb)
+
+    def stop_page_flip(self):
+        self.stop_requested = True
+
+    def run(self, connector):
+        # Skip disconnected connectors
+        if not connector.connected():
+            return self.test.skip("unconnected connector")
+
+        # Find a CRTC suitable for the connector
+        crtc = connector.get_current_crtc()
+        if not crtc:
+            crtcs = connector.get_possible_crtcs()
+            if len(crtcs) == 0:
+                pass
+
+            crtc = crtcs[0]
+
+        self.crtc = crtc
+
+        # Find a plane suitable for the CRTC
+        for plane in self.card.planes:
+            if plane.supports_crtc(crtc):
+                self.plane = plane
+                break
+        else:
+            return self.test.skip("no plane available for CRTC %u" % crtc.id)
+
+        # Get the default mode for the connector
+        try:
+            mode = connector.get_default_mode()
+        except ValueError:
+            return self.test.skip("no mode available")
+
+        self.logger.log("Testing connector %s, CRTC %u, plane %u, mode %s" %
+                        (connector.fullname, crtc.id, self.plane.id, mode.name))
+
+        # Initialise run state
+        self.bar_xpos = 0
+        self.front_buf = 0
+        self.frame_start = 0
+        self.frame_end = 0
+        self.time_start = 0
+        self.time_end = 0
+        self.flips = 0
+        self.previous_flips = 0
+        self.stop_requested = False
+
+        # Create two frame buffers
+        self.fbs = []
+        for i in range(2):
+            self.fbs.append(pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, "XR24"))
+
+        # Set the mode and perform the initial page flip
+        ret = self.test.atomic_crtc_mode_set(crtc, connector, mode, self.fbs[0])
+        if ret < 0:
+            return self.test.fail("atomic mode set failed with %d" % ret)
+
+        # Flipper is now running!
+        return True
+
+    def is_running(self):
+            running = self.flips != self.previous_flips
+            self.previous_flips = self.flips
+            return running
+
+    def verify_completion(self):
+            if not self.flips:
+                return self.test.fail("No page flip registered")
+
+            if self.stop_requested:
+                return self.test.fail("Last page flip not registered")
+
+            frames = self.frame_end - self.frame_start + 1
+            interval = self.time_end - self.time_start
+            self.logger.log("Frame rate: %f (%u/%u frames in %f s)" %
+                            (frames / interval, self.flips, frames, interval))
+
+            return self.test.success()
+
+
+class PMTest(object):
+    def supported(self):
+        return os.path.exists("/sys/power/pm_test")
+
+    def suspend(self, mode):
+        with open('/sys/power/pm_test', 'a') as pm_test:
+            pm_test.write(mode + '\n')
+
+        with open('/sys/power/state', 'a') as state:
+            state.write('mem' + '\n')
+
+
+class SuspendResume(kmstest.KMSTest):
+    """Test suspend resume cycle while the display is active."""
+
+    def main(self):
+        # The PageFlipper will register itself as our Page Flip Handler
+        self.flipper = PageFlipper(self)
+
+        # First ensure that we have CONFIG_PM_DEBUG. We cannot continue without
+        self.start("dependencies for suspend-resume")
+        if not PMTest().supported():
+            self.skip("CONFIG_PM_DEBUG not available")
+            return
+
+        self.success()
+
+        for connector in self.card.connectors:
+            self.start("suspend resume with connector %s" % connector.fullname)
+
+            status = self.flipper.run(connector)
+            if status is not True:
+                continue
+
+            # Let the display pipeline get started
+            self.run(5)
+
+            if not self.flipper.is_running():
+                self.fail("Page flip not active before suspend")
+                continue
+
+            # Try a suspend cycle
+            PMTest().suspend('devices')
+
+            # Reset the run check, and verify the pipeline is still active
+            self.flipper.is_running()
+            self.run(5)
+            if not self.flipper.is_running():
+                self.fail("Page flip not active after suspend")
+                continue
+
+            # Test completed, verify we stop correctly
+            self.flipper.stop_page_flip()
+            self.run(1)
+            self.flipper.verify_completion()
+
+SuspendResume().execute()
-- 
2.7.4
