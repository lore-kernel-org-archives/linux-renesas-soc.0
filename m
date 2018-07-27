Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:53904 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729560AbeG0LSX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jul 2018 07:18:23 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4] gpio: rcar: Enhance gpio-ranges support
Date: Fri, 27 Jul 2018 10:51:26 +0100
Message-Id: <1532685089-35645-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1532685089-35645-1-git-send-email-biju.das@bp.renesas.com>
References: <1532685089-35645-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enhance gpio-ranges to support more than one gpio-range.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
cat /sys/kernel/debug/pinctrl/e6060000.pin-controller-sh-pfc/gpio-
GPIO ranges handled:
0: e6050000.gpio GPIOS [1001 - 1023] PINS [0 - 22]
0: e6051000.gpio GPIOS [978 - 1000] PINS [32 - 54]
0: e6052000.gpio GPIOS [946 - 977] PINS [64 - 95]
0: e6053000.gpio GPIOS [926 - 942] PINS [96 - 112]
17: e6053000.gpio GPIOS [943 - 945] PINS [123 - 125]
0: e6054000.gpio GPIOS [900 - 925] PINS [128 - 153]
0: e6055000.gpio GPIOS [868 - 899] PINS [160 - 191]
---
 drivers/gpio/gpio-rcar.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 350390c..a7bbe78 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -399,13 +399,22 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
 	struct device_node *np = p->pdev->dev.of_node;
 	const struct gpio_rcar_info *info;
 	struct of_phandle_args args;
-	int ret;
+	int index = 0, ret;
 
 	info = of_device_get_match_data(&p->pdev->dev);
 
-	ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &args);
-	*npins = ret == 0 ? args.args[2] : RCAR_MAX_GPIO_PER_BANK;
 	p->has_both_edge_trigger = info->has_both_edge_trigger;
+	*npins = 0;
+	for (;; index++) {
+		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
+							index, &args);
+		if (ret) {
+			if (index == 0)
+				*npins = RCAR_MAX_GPIO_PER_BANK;
+			break;
+		}
+		*npins += args.args[2];
+	}
 
 	if (*npins == 0 || *npins > RCAR_MAX_GPIO_PER_BANK) {
 		dev_warn(&p->pdev->dev,
-- 
2.7.4
