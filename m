Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751242AbdIQXst (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Sep 2017 19:48:49 -0400
From: Kieran Bingham <kbingham@kernel.org>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 1/5] kmstest: Repair pep8 line formatting
Date: Mon, 18 Sep 2017 00:48:40 +0100
Message-Id: <1505692124-12167-2-git-send-email-kbingham@kernel.org>
In-Reply-To: <1505692124-12167-1-git-send-email-kbingham@kernel.org>
References: <1505692124-12167-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

PEP8 reports issues with blank lines, both at the start and end of the module.

Fix them.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 tests/kmstest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 5938dc4a4da2..e8e3c3a0305b 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -8,6 +8,7 @@ import selectors
 import sys
 import time
 
+
 class Timer(object):
     def __init__(self, timeout, callback):
         self.timeout = time.clock_gettime(time.CLOCK_MONOTONIC) + timeout
@@ -327,4 +328,3 @@ class KMSTest(object):
         sys.stdout.write("\rTesting %s: SUCCESS\n" % self.test_name)
         sys.stdout.flush()
         return self.success
-
-- 
2.7.4
