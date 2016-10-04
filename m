Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:39972 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753510AbcJDNJo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 09:09:44 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] tests: add none adjoined hue areas test for HGT
Date: Tue,  4 Oct 2016 15:09:15 +0200
Message-Id: <20161004130915.28812-4-niklas.soderlund@ragnatech.se>
In-Reply-To: <20161004130915.28812-1-niklas.soderlund@ragnatech.se>
References: <20161004130915.28812-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The HGT can be configured in such a way that the 6 user configurable hue
areas are not joined next to each other. In such cases a hue value
outside of a hue area should be attributed with a weight to both its
adjoining hue areas.

Add a test to verify this works now that gen-image supports generating
reference frames for none adjoined hue areas.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 tests/vsp-unit-test-0018.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/vsp-unit-test-0018.sh b/tests/vsp-unit-test-0018.sh
index 944f7ac..c0aba4b 100755
--- a/tests/vsp-unit-test-0018.sh
+++ b/tests/vsp-unit-test-0018.sh
@@ -32,6 +32,9 @@ test_main() {
 	test_histogram "0,255,255,255,255,255,255,255,255,255,255,255"
 	test_histogram "0,40,40,80,80,120,120,160,160,200,200,255"
 	test_histogram "220,40,40,80,80,120,120,160,160,200,200,220"
+	test_histogram "0,10,50,60,100,110,150,160,200,210,250,255"
+	test_histogram "10,20,50,60,100,110,150,160,200,210,230,240"
+	test_histogram "240,20,60,80,100,120,140,160,180,200,210,220"
 }
 
 test_init $0 "$features"
-- 
2.9.3
