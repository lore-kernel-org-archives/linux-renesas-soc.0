Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:53666 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751463AbdLCKzs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Dec 2017 05:55:48 -0500
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 85681202D7
        for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Dec 2017 11:54:03 +0100 (CET)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] tests: crc: Add CRC computation test
Date: Sun,  3 Dec 2017 12:55:54 +0200
Message-Id: <20171203105554.10416-3-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20171203105554.10416-1-laurent.pinchart@ideasonboard.com>
References: <20171203105554.10416-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The test exercises the CRC API by enabling CRC computation on the
pipeline output, capturing CRC values and verifying that they all match.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-crc.py | 103 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100755 tests/kms-test-crc.py

diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
new file mode 100755
index 000000000000..93b5d8210b4e
--- /dev/null
+++ b/tests/kms-test-crc.py
@@ -0,0 +1,103 @@
+#!/usr/bin/python3
+
+import kmstest
+import pykms
+
+class CRCTest(kmstest.KMSTest):
+    """Test CRC calculation on pipeline output."""
+
+    def handle_page_flip(self, frame, time):
+        self.logger.log("Page flip complete")
+
+    def main(self):
+        # Create the connectors to CRTCs map
+        connectors = {}
+        for connector in self.card.connectors:
+            # Skip disconnected connectors
+            if not connector.connected():
+                continue
+
+            # Add the connector to the map
+            for crtc in connector.get_possible_crtcs():
+                if crtc not in connectors:
+                    connectors[crtc] = connector
+
+        for crtc in self.card.crtcs:
+            self.start("CRC calculation on CRTC %u" % crtc.id)
+
+            # Get the connector and default mode
+            try:
+                connector = connectors[crtc];
+                mode = connector.get_default_mode()
+            except KeyError:
+                self.skip("no connector or mode available")
+                continue
+
+            # List planes available for the CRTC
+            planes = []
+            for plane in self.card.planes:
+                if plane.supports_crtc(crtc) and plane != crtc.primary_plane:
+                    planes.append(plane)
+
+            if len(planes) == 0:
+                self.skip("no plane available for CRTC")
+                continue
+
+            self.logger.log("Testing connector %s, CRTC %u, mode %s with %u planes" % \
+                  (connector.fullname, crtc.id, mode.name, len(planes)))
+
+            # Create a frame buffer
+            fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, "XR24")
+            pykms.draw_test_pattern(fb)
+
+            # Set the mode and add all planes
+            ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
+            if ret < 0:
+                self.fail("atomic mode set failed with %d" % ret)
+                continue
+
+            req = pykms.AtomicReq(self.card)
+
+            offset = 100
+            for plane in planes:
+                source = kmstest.Rect(0, 0, fb.width, fb.height)
+                destination = kmstest.Rect(offset, offset, fb.width, fb.height)
+                req.add(plane, {
+                        'FB_ID': fb.id,
+                        'CRTC_ID': crtc.id,
+                        'SRC_X': int(source.left * 65536),
+                        'SRC_Y': int(source.top * 65536),
+                        'SRC_W': int(source.width * 65536),
+                        'SRC_H': int(source.height * 65536),
+                        'CRTC_X': destination.left,
+                        'CRTC_Y': destination.top,
+                        'CRTC_W': destination.width,
+                        'CRTC_H': destination.height,
+                })
+                offset += 50
+
+            ret = req.commit_sync()
+            if ret < 0:
+                self.fail("atomic plane set failed with %d" % ret)
+                continue
+
+            # Wait for one second and make sure the page flip has completed.
+            self.run(1)
+            if self.flips == 0:
+                self.fail("No page flip registered")
+                continue
+
+            crc_reader = kmstest.CRCReader(crtc)
+            crc_reader.start("auto")
+            crcs = crc_reader.read(10)
+            crc_reader.stop()
+
+            crcs = [c.crcs[0] for c in crcs]
+            if len(set(crcs)) != 1:
+                self.fail("CRC values not constant")
+                continue
+
+            self.logger.log("CRC value 0x%08x" % crcs[0])
+            self.success()
+
+CRCTest().execute()
-- 
Regards,

Laurent Pinchart
