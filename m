Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751370AbdION35 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 09:29:57 -0400
From: Kieran Bingham <kbingham@kernel.org>
To: laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 1/2] tests/kmstest: Status functions return themselves.
Date: Fri, 15 Sep 2017 14:29:51 +0100
Message-Id: <1505482192-23896-2-git-send-email-kbingham@kernel.org>
In-Reply-To: <1505482192-23896-1-git-send-email-kbingham@kernel.org>
References: <1505482192-23896-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Make status functions such as skip(), pass() and fail() return their own method
function as a means to identifing which status value is determined for a given
test operation.

This allows test results to be determined in methods, and for the parent method
or class to respond accordingly

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 tests/kmstest.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index cb0d9a7546d8..5938dc4a4da2 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -310,6 +310,7 @@ class KMSTest(object):
         self.logger.flush()
         sys.stdout.write("\rTesting %s: FAIL\n" % self.test_name)
         sys.stdout.flush()
+        return self.fail
 
     def skip(self, reason):
         """Complete a test with skip."""
@@ -317,6 +318,7 @@ class KMSTest(object):
         self.logger.flush()
         sys.stdout.write("SKIP\n")
         sys.stdout.flush()
+        return self.skip
 
     def success(self):
         """Complete a test with success."""
@@ -324,4 +326,5 @@ class KMSTest(object):
         self.logger.flush()
         sys.stdout.write("\rTesting %s: SUCCESS\n" % self.test_name)
         sys.stdout.flush()
+        return self.success
 
-- 
2.7.4
