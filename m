Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44782 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388241AbeGXMUR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 08:20:17 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] thermal: rcar_thermal: avoid NULL dereference in absense of IRQ resources
Date: Tue, 24 Jul 2018 13:14:13 +0200
Message-Id: <20180724111413.4056-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Ensure that the base address used by a call to rcar_thermal_common_write()
may be NULL if the SOC supports interrupts for use with the thermal device
but none are defined in DT as is the case for R-Car H1 (r8a7779). Guard
against this condition to prevent a NULL dereference when the device is
probed.

Tested on:
* R-Mobile APE6 (r8a73a4) / APE6EVM
* R-Car H1 (r8a7779) / Marzen
* R-Car H2 (r8a7790) / Lager
* R-Car M2-W (r8a7791) / Koelsch
* R-Car M2-N (r8a7793) / Gose
* R-Car D3 ES1.0 (r8a77995) / Draak

Fixes: 1969d9dc2079 ("thermal: rcar_thermal: add r8a77995 support")
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v4.18-rc6
---
 drivers/thermal/rcar_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
index 45fb284d4c11..e77e63070e99 100644
--- a/drivers/thermal/rcar_thermal.c
+++ b/drivers/thermal/rcar_thermal.c
@@ -598,7 +598,7 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 			enr_bits |= 3 << (i * 8);
 	}
 
-	if (enr_bits)
+	if (common->base && enr_bits)
 		rcar_thermal_common_write(common, ENR, enr_bits);
 
 	dev_info(dev, "%d sensor probed\n", i);
-- 
2.11.0
