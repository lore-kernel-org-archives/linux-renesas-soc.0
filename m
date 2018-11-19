Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:36798 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729825AbeKTCmr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 21:42:47 -0500
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH] pinctrl: rzn1: Fix check for used MDIO bus
Date: Mon, 19 Nov 2018 16:18:38 +0000
Message-Id: <20181119161838.10610-1-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This fixes the check for unused mdio bus setting and the following static
checker warning:
 drivers/pinctrl/pinctrl-rzn1.c:198 rzn1_pinctrl_mdio_select()
 warn: always true condition '(ipctl->mdio_func[mdio] >= 0) => (0-u32max >= 0)'

It also fixes the return var when calling of_get_child_count()

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
v2:
 - Don't rely on rely on the implicit typecast from -1 to uint
---
 drivers/pinctrl/pinctrl-rzn1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rzn1.c b/drivers/pinctrl/pinctrl-rzn1.c
index 57886dcff53d..cc0e5aa9128a 100644
--- a/drivers/pinctrl/pinctrl-rzn1.c
+++ b/drivers/pinctrl/pinctrl-rzn1.c
@@ -112,7 +112,7 @@ struct rzn1_pinctrl {
 	struct rzn1_pinctrl_regs __iomem *lev2;
 	u32 lev1_protect_phys;
 	u32 lev2_protect_phys;
-	u32 mdio_func[2];
+	int mdio_func[2];
 
 	struct rzn1_pin_group *groups;
 	unsigned int ngroups;
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
