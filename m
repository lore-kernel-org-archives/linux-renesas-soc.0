Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:33433 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751946AbcFTGkn (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 20 Jun 2016 02:40:43 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-gpio@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [RFC] pinctrl: sh-pfc: propagate errors on group config
Date: Mon, 20 Jun 2016 08:40:22 +0200
Message-Id: <1466404822-2540-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

On group configuration, bail out if setting one of the individual pins
fails. We don't need to roll-back, the pinctrl core will do this for us.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested on a Lager and Salvator-X without problems. Needs probably more testing
on various HW to avoid regressions?

 drivers/pinctrl/sh-pfc/pinctrl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index d4e65bc7dacd67..c52ca5873974f3 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -739,13 +739,16 @@ static int sh_pfc_pinconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 	struct sh_pfc_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
 	const unsigned int *pins;
 	unsigned int num_pins;
-	unsigned int i;
+	unsigned int i, ret;
 
 	pins = pmx->pfc->info->groups[group].pins;
 	num_pins = pmx->pfc->info->groups[group].nr_pins;
 
-	for (i = 0; i < num_pins; ++i)
-		sh_pfc_pinconf_set(pctldev, pins[i], configs, num_configs);
+	for (i = 0; i < num_pins; ++i) {
+		ret = sh_pfc_pinconf_set(pctldev, pins[i], configs, num_configs);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.8.1
