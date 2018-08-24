Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:49215 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbeHXN6d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 09:58:33 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/4] vin-tests: Fix vdev name in propagate_parallel
Date: Fri, 24 Aug 2018 12:24:20 +0200
Message-Id: <1535106262-13004-3-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
References: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The $vdev variable was not defined in propagate_parallel() function.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 scripts/vin-tests.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/vin-tests.sh b/scripts/vin-tests.sh
index ebb1477..0c5b29a 100644
--- a/scripts/vin-tests.sh
+++ b/scripts/vin-tests.sh
@@ -83,6 +83,7 @@ mc_propagate_cvbs() {
 }
 
 mc_propagate_parallel() {
+    vin="$1"
     mdev=$(mc_get_mdev)
 
     cam="'$parallelname':1"
-- 
2.7.4
