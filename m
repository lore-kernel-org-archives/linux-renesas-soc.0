Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:18557 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726550AbeJOWrb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Oct 2018 18:47:31 -0400
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH v2] pinctrl: rzn1: Fix check for used MDIO bus
Date: Mon, 15 Oct 2018 16:01:47 +0100
Message-Id: <20181015150147.23295-1-phil.edworthy@renesas.com>
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
 - Don't use implicit type conversion.
 - Fix type of return var when calling of_get_child_count().
---
 drivers/pinctrl/pinctrl-rzn1.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rzn1.c b/drivers/pinctrl/pinctrl-rzn1.c
index ce05e3a00be2..4998463c54a0 100644
--- a/drivers/pinctrl/pinctrl-rzn1.c
+++ b/drivers/pinctrl/pinctrl-rzn1.c
@@ -112,13 +112,13 @@ struct rzn1_pinctrl {
 	struct rzn1_pinctrl_regs __iomem *lev2;
 	u32 lev1_protect_phys;
 	u32 lev2_protect_phys;
-	u32 mdio_func[2];
+	int mdio_func[2];
 
 	struct rzn1_pin_group *groups;
 	unsigned int ngroups;
 
 	struct rzn1_pmx_func *functions;
-	unsigned int nfunctions;
+	int nfunctions;
 };
 
 #define RZN1_PINS_PROP "pinmux"
@@ -195,9 +195,9 @@ static void rzn1_hw_set_lock(struct rzn1_pinctrl *ipctl, u8 lock, u8 value)
 static void rzn1_pinctrl_mdio_select(struct rzn1_pinctrl *ipctl, int mdio,
 				     u32 func)
 {
-	if (ipctl->mdio_func[mdio] >= 0 && ipctl->mdio_func[mdio] != func)
+	if (ipctl->mdio_func[mdio] >= 0 && ipctl->mdio_func[mdio] != (int)func)
 		dev_warn(ipctl->dev, "conflicting setting for mdio%d!\n", mdio);
-	ipctl->mdio_func[mdio] = func;
+	ipctl->mdio_func[mdio] = (int)func;
 
 	dev_dbg(ipctl->dev, "setting mdio%d to %u\n", mdio, func);
 
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
