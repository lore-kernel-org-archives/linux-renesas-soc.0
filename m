Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:53665 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751157AbdLCKzr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Dec 2017 05:55:47 -0500
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 37D5520226
        for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Dec 2017 11:54:03 +0100 (CET)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] kmstest.py: Add CRC reader class
Date: Sun,  3 Dec 2017 12:55:53 +0200
Message-Id: <20171203105554.10416-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20171203105554.10416-1-laurent.pinchart@ideasonboard.com>
References: <20171203105554.10416-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The CRCReader class uses the DRM/KMS debugfs-based CRC API to configure
CRC computation on a CRTC and read the computed CRC values.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index cb0d9a7546d8..45d619c7a9be 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -145,6 +145,61 @@ class Logger(object):
         self.logfile.flush()
 
 
+class CRC(object):
+    def __init__(self, crc):
+        if crc.startswith("XXXXXXXXXX"):
+            self.frame = None
+        else:
+            self.frame = int(crc[:10], 16)
+
+        crc = crc[11:].strip('\n\0').split(' ')
+        self.crcs = [int(c, 16) for c in crc]
+
+
+class CRCReader(object):
+
+    MAX_CRC_ENTRIES = 10
+    MAX_LINE_LEN  = 10 + 11 * MAX_CRC_ENTRIES + 1
+
+    def __init__(self, crtc):
+        self.pipe = crtc.idx
+
+        # Hardcode the device minor to 0 as the KMSTest constructor opens the
+        # default card object.
+        self.dir = os.open("/sys/kernel/debug/dri/0/crtc-%u/crc" % self.pipe, 0)
+        self.ctrl = os.open("control", os.O_WRONLY, dir_fd = self.dir)
+        self.data = -1
+
+    def __del__(self):
+        self.stop()
+        os.close(self.ctrl)
+        os.close(self.dir)
+
+    def start(self, source):
+        os.write(self.ctrl, source.encode("ascii"))
+        self.data = os.open("data", os.O_RDONLY, dir_fd = self.dir)
+
+    def stop(self):
+        if self.data != -1:
+            os.close(self.data)
+            self.data = -1
+
+    def read(self, num_entries=1):
+        crcs = []
+        while len(crcs) < num_entries:
+            try:
+                crc = os.read(self.data, CRCReader.MAX_LINE_LEN)
+                crc = crc.decode("ascii")
+            except OSError as e:
+                if e.errno == errno.EAGAIN:
+                    break
+                else:
+                    raise e
+            crcs.append(CRC(crc))
+
+        return crcs
+
+
 class Rect(object):
     def __init__(self, left, top, width, height):
         self.left = left
-- 
Regards,

Laurent Pinchart
