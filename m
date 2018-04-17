Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:65263 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752633AbeDQU6Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 16:58:24 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] thermal: rcar_gen3_thermal: update max temperature clamp
Date: Tue, 17 Apr 2018 22:57:47 +0200
Message-Id: <20180417205747.15492-3-niklas.soderlund@ragnatech.se>
In-Reply-To: <20180417205747.15492-1-niklas.soderlund@ragnatech.se>
References: <20180417205747.15492-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Change the upper limit to clamp the high temperature value to 120C when
setting trip points.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/thermal/rcar_gen3_thermal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 79c2cdb4105fc0b8..3905ec8b2689827c 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -207,8 +207,8 @@ static int rcar_gen3_thermal_set_trips(void *devdata, int low, int high)
 {
 	struct rcar_gen3_thermal_tsc *tsc = devdata;
 
-	low = clamp_val(low, -40000, 125000);
-	high = clamp_val(high, -40000, 125000);
+	low = clamp_val(low, -40000, 120000);
+	high = clamp_val(high, -40000, 120000);
 
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQTEMP1,
 				rcar_gen3_thermal_mcelsius_to_temp(tsc, low));
-- 
2.17.0
