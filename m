Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:55212 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752292AbdC2SpT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 14:45:19 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: linux-pm@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 4/7] thermal: rcar_gen3_thermal: record and check number of TSCs found
Date: Wed, 29 Mar 2017 20:43:53 +0200
Message-Id: <20170329184356.8610-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20170329184356.8610-1-niklas.soderlund+renesas@ragnatech.se>
References: <20170329184356.8610-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Record how many TSCs are found in struct rcar_gen3_thermal_priv, this is
needed to be able to add hardware interrupts for trip points later. Also
add a check to make sure at least one TSC is found.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/thermal/rcar_gen3_thermal.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 9b6bc03dd142a8dd..4a08b35533dcc3a9 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -75,6 +75,7 @@ struct rcar_gen3_thermal_tsc {
 
 struct rcar_gen3_thermal_priv {
 	struct rcar_gen3_thermal_tsc *tscs[TSC_MAX_NUM];
+	unsigned int num_tscs;
 };
 
 struct rcar_gen3_thermal_data {
@@ -307,6 +308,13 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 		tsc->zone = zone;
 	}
 
+	priv->num_tscs = i;
+
+	if (!priv->num_tscs) {
+		ret = -ENODEV;
+		goto error_unregister;
+	}
+
 	return 0;
 
 error_unregister:
-- 
2.12.1
