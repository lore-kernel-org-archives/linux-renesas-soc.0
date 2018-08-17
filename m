Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:51366 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726437AbeHQR5B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 13:57:01 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Eduardo Valentin <edubezval@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-pm@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] thermal: rcar_gen3_thermal: Add r8a774a1 support
Date: Fri, 17 Aug 2018 15:53:03 +0100
Message-Id: <1534517584-14434-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1534517584-14434-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1534517584-14434-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add r8a774a1 specific compatible string.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
This patch applies on top of renesas-drivers-2018-07-31-v4.18-rc7

 drivers/thermal/rcar_gen3_thermal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 766521e..53904fb 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -327,6 +327,7 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
 }
 
 static const struct of_device_id rcar_gen3_thermal_dt_ids[] = {
+	{ .compatible = "renesas,r8a774a1-thermal", },
 	{ .compatible = "renesas,r8a7795-thermal", },
 	{ .compatible = "renesas,r8a7796-thermal", },
 	{ .compatible = "renesas,r8a77965-thermal", },
-- 
2.7.4
