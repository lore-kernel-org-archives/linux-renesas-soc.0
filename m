Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751537AbdIQXsv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Sep 2017 19:48:51 -0400
From: Kieran Bingham <kbingham@kernel.org>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 3/5] kmstest: Provide a Kernel log validator
Date: Mon, 18 Sep 2017 00:48:42 +0100
Message-Id: <1505692124-12167-4-git-send-email-kbingham@kernel.org>
In-Reply-To: <1505692124-12167-1-git-send-email-kbingham@kernel.org>
References: <1505692124-12167-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Implement a Kernel log validator as a decorator to run before and after
test execution.

This validator will look for keywords in the kernel log buffer, and
report a test failure if a match is discovered.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 tests/kmstest.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 0cf69f44703e..94067a502abd 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -109,6 +109,26 @@ class KernelLogReader(object):
         return msgs
 
 
+def KernelLogValidator(test_function):
+    kernel_fault_strings = ("Kernel panic", "Oops", "WARNING:")
+
+    def kernel_log_validator(self):
+        klog = KernelLogReader()
+        fault = False
+
+        test_function(self)
+
+        kmsgs = klog.read()
+        for msg in kmsgs:
+            if any(s in msg.msg for s in kernel_fault_strings):
+                fault = True
+
+        if fault:
+            self.fail("Post Test Kernel Fault Found")
+
+    return kernel_log_validator
+
+
 class Logger(object):
     def __init__(self, name):
         self.logfile = open("%s.log" % name, "w")
@@ -265,6 +285,7 @@ class KMSTest(object):
         sys.stdin.readline()
         self.loop.stop()
 
+    @KernelLogValidator
     def execute(self):
         """Execute the test by running the main function."""
         self.main()
-- 
2.7.4
