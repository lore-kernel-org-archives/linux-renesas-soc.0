Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:39975 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753998AbcJDNJo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 09:09:44 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] tests: add hue area wraparound test for HGT
Date: Tue,  4 Oct 2016 15:09:14 +0200
Message-Id: <20161004130915.28812-3-niklas.soderlund@ragnatech.se>
In-Reply-To: <20161004130915.28812-1-niklas.soderlund@ragnatech.se>
References: <20161004130915.28812-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

One configuration for HGT histograms are where hue area 0 is wrapped
around the hue input value space (0-255), for example area 0 can cover
hue values above 220 but bellow 40. Hue area 0 is the only area which
supports this mode where the areas lower limit uses a higher value then
it's higher limit hence the area wraparound the max hue value.

Add a test to verify this works now that gen-image supports generating
reference frames with wrapped around hue areas.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 tests/vsp-unit-test-0018.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/vsp-unit-test-0018.sh b/tests/vsp-unit-test-0018.sh
index 2b49b54..944f7ac 100755
--- a/tests/vsp-unit-test-0018.sh
+++ b/tests/vsp-unit-test-0018.sh
@@ -31,6 +31,7 @@ test_histogram() {
 test_main() {
 	test_histogram "0,255,255,255,255,255,255,255,255,255,255,255"
 	test_histogram "0,40,40,80,80,120,120,160,160,200,200,255"
+	test_histogram "220,40,40,80,80,120,120,160,160,200,200,220"
 }
 
 test_init $0 "$features"
-- 
2.9.3
