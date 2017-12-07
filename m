Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:56016 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750922AbdLGSc6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 13:32:58 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] kmstest.py: Update to th latest kmsxx Python bindings
Date: Thu,  7 Dec 2017 20:33:12 +0200
Message-Id: <20171207183312.27962-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Commit 706a44abb3aa ("Update to latest pybind11") of kmsxx broke the
test suite by changing the signature of the AtomicRequest::commit
function. Update the test suite accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

The aforementioned commit also broke the test suite due to two other issues
that need to be fixed in kmsxx. Two patches have been submitted for upstream
inclusion, they can in the meantime be found at

	git://git.ideasonboard.com/renesas/kmsxx.git master

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 45d619c7a9be..7de785edd1e3 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -238,7 +238,7 @@ class KMSTest(object):
         if sync:
             return req.commit_sync(True)
         else:
-            return req.commit(self, True)
+            return req.commit(0, True)
 
     def atomic_crtc_mode_set(self, crtc, connector, mode, fb=None, sync=False):
         """Perform a mode set on the given connector and CRTC. The framebuffer,
@@ -268,7 +268,7 @@ class KMSTest(object):
         if sync:
             return req.commit_sync(True)
         else:
-            return req.commit(self, True)
+            return req.commit(0, True)
 
     def atomic_plane_set(self, plane, crtc, source, destination, fb, sync=False):
         req = pykms.AtomicReq(self.card)
@@ -287,7 +287,7 @@ class KMSTest(object):
         if sync:
             return req.commit_sync()
         else:
-            return req.commit(self)
+            return req.commit(0)
 
     def atomic_planes_disable(self, sync=True):
         req = pykms.AtomicReq(self.card)
@@ -297,7 +297,7 @@ class KMSTest(object):
         if sync:
             return req.commit_sync()
         else:
-            return req.commit(self)
+            return req.commit(0)
 
     def __handle_page_flip(self, frame, time):
         self.flips += 1
-- 
Regards,

Laurent Pinchart
