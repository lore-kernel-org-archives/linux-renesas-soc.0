Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from m12-16.163.com ([220.181.12.16]:43948 "EHLO m12-16.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753826AbcGFMEW (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 6 Jul 2016 08:04:22 -0400
From: weiyj_lk@163.com
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH -next] sh-pfc: Use PTR_ERR_OR_ZERO() to simplify the code
Date: Wed,  6 Jul 2016 12:03:32 +0000
Message-Id: <1467806612-23904-1-git-send-email-weiyj_lk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/pinctrl/sh-pfc/pinctrl.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index d4e65bc..e208ee0 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -814,8 +814,5 @@ int sh_pfc_register_pinctrl(struct sh_pfc *pfc)
 	pmx->pctl_desc.npins = pfc->info->nr_pins;
 
 	pmx->pctl = devm_pinctrl_register(pfc->dev, &pmx->pctl_desc, pmx);
-	if (IS_ERR(pmx->pctl))
-		return PTR_ERR(pmx->pctl);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(pmx->pctl);
 }
