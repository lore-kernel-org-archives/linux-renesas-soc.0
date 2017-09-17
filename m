Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751295AbdIQXsu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Sep 2017 19:48:50 -0400
From: Kieran Bingham <kbingham@kernel.org>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 2/5] kmstest: Repeir pep8 whitespace errors
Date: Mon, 18 Sep 2017 00:48:41 +0100
Message-Id: <1505692124-12167-3-git-send-email-kbingham@kernel.org>
In-Reply-To: <1505692124-12167-1-git-send-email-kbingham@kernel.org>
References: <1505692124-12167-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

PEP8 defines that there should be no whitespace before or after the '{'
and '}' braces.

Remove whitespace from two statements that incorrectly place spaces
around these braces.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 tests/kmstest.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index e8e3c3a0305b..0cf69f44703e 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -197,7 +197,7 @@ class KMSTest(object):
 
         req = pykms.AtomicReq(self.card)
         req.add(connector, 'CRTC_ID', crtc.id)
-        req.add(crtc, { 'ACTIVE': 1, 'MODE_ID': mode_blob.id })
+        req.add(crtc, {'ACTIVE': 1, 'MODE_ID': mode_blob.id})
         if fb:
             req.add(crtc.primary_plane, {
                         'FB_ID': fb.id,
@@ -238,7 +238,7 @@ class KMSTest(object):
     def atomic_planes_disable(self, sync=True):
         req = pykms.AtomicReq(self.card)
         for plane in self.card.planes:
-            req.add(plane, { "FB_ID": 0, 'CRTC_ID': 0 })
+            req.add(plane, {"FB_ID": 0, 'CRTC_ID': 0})
 
         if sync:
             return req.commit_sync()
-- 
2.7.4
