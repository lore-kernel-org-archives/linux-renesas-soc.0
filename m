Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:52897 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2503150AbeKWVic (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 16:38:32 -0500
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH] pinctrl: rzn1: Fix of_get_child_count() error check
Date: Fri, 23 Nov 2018 10:54:28 +0000
Message-Id: <20181123105428.13457-2-phil.edworthy@renesas.com>
In-Reply-To: <20181123105428.13457-1-phil.edworthy@renesas.com>
References: <20181123105428.13457-1-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If we assign the result of of_get_child_count() to an unsigned int,
the code will not detect any errors. Therefore assign it to an int
instead.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 drivers/pinctrl/pinctrl-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rzn1.c b/drivers/pinctrl/pinctrl-rzn1.c
index a04235e3bec4..cc0e5aa9128a 100644
--- a/drivers/pinctrl/pinctrl-rzn1.c
+++ b/drivers/pinctrl/pinctrl-rzn1.c
@@ -810,8 +810,8 @@ static int rzn1_pinctrl_probe_dt(struct platform_device *pdev,
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *child;
 	unsigned int maxgroups = 0;
-	unsigned int nfuncs = 0;
 	unsigned int i = 0;
+	int nfuncs = 0;
 	int ret;
 
 	nfuncs = of_get_child_count(np);
-- 
2.17.1
