Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52446 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751635AbdIEIIF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2017 04:08:05 -0400
From: Simon Horman <horms@verge.net.au>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 05/13] thermal: rcar_gen3_thermal: check that TSC exists before memory allocation
Date: Tue,  5 Sep 2017 10:06:40 +0200
Message-Id: <1504598808-19810-6-git-send-email-horms@verge.net.au>
In-Reply-To: <1504598808-19810-1-git-send-email-horms@verge.net.au>
References: <1504598808-19810-1-git-send-email-horms@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Move the check for a TSC resource before allocating memory for a new
TSC. If no TSC is found there is little point in allocating memory for
it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Eduardo Valentin <edubezval@gmail.com>
(cherry picked from commit d51546c0db975a4750161d17eef62dfcf9eedc90)
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/thermal/rcar_gen3_thermal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index cb5c362c0000..9b6bc03dd142 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -276,16 +276,16 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	for (i = 0; i < TSC_MAX_NUM; i++) {
 		struct rcar_gen3_thermal_tsc *tsc;
 
+		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
+		if (!res)
+			break;
+
 		tsc = devm_kzalloc(dev, sizeof(*tsc), GFP_KERNEL);
 		if (!tsc) {
 			ret = -ENOMEM;
 			goto error_unregister;
 		}
 
-		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		if (!res)
-			break;
-
 		tsc->base = devm_ioremap_resource(dev, res);
 		if (IS_ERR(tsc->base)) {
 			ret = PTR_ERR(tsc->base);
-- 
2.1.4
