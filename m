Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52393 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751538AbdIEIHg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2017 04:07:36 -0400
From: Simon Horman <horms@verge.net.au>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 03/13] thermal: rcar_gen3_thermal: add delay in .thermal_init on r8a7796
Date: Tue,  5 Sep 2017 10:06:38 +0200
Message-Id: <1504598808-19810-4-git-send-email-horms@verge.net.au>
In-Reply-To: <1504598808-19810-1-git-send-email-horms@verge.net.au>
References: <1504598808-19810-1-git-send-email-horms@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The .thermal_init needs to be delayed a short amount of time to allow
for the TEMP register to contain something useful. If it's not delayed
these warnings are common during boot:

thermal thermal_zone0: failed to read out thermal zone (-5)
thermal thermal_zone1: failed to read out thermal zone (-5)
thermal thermal_zone2: failed to read out thermal zone (-5)

The warnings are triggered by the first call to .get_temp() while the
TEMP register contains 0 and rcar_gen3_thermal_get_temp() returns -EIO
since a TEMP value of 0 will result in a temperature reading which is
out of specifications.

This should have been done in the initial commit which adds the driver
as the same issue was found and corrected for r8a7795.

Fixes: 564e73d283af9d4c ("thermal: rcar_gen3_thermal: Add R-Car Gen3 thermal driver")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Eduardo Valentin <edubezval@gmail.com>
(cherry picked from commit 78aefd2d5911c4e0b5dc0b0578b3b8c7673be1d2)
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/thermal/rcar_gen3_thermal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index d33c845244b1..ec477d47d0ba 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -222,6 +222,8 @@ static void r8a7796_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
 	reg_val = rcar_gen3_thermal_read(tsc, REG_GEN3_THCTR);
 	reg_val |= THCTR_THSST;
 	rcar_gen3_thermal_write(tsc, REG_GEN3_THCTR, reg_val);
+
+	usleep_range(1000, 2000);
 }
 
 static const struct rcar_gen3_thermal_data r8a7795_data = {
-- 
2.1.4
