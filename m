Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:51866 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726622AbeIKSFv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 14:05:51 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] mmc: sdhi: sys_dmac: check for all Gen3 types when whitelisting
Date: Tue, 11 Sep 2018 15:06:26 +0200
Message-Id: <20180911130626.7232-1-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Fixes: 26eb2607fa28 ("mmc: renesas_sdhi: add eMMC HS400 mode support")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

So, adding HS400 support broke the detection here. I suggest we discuss
internally, if this kind of white listing is still needed, at all. Until
then, this patch makes things work again on H3 and M3-W.

 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index f5fcbb5dc8cd..f027f66fe0c1 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -495,7 +495,8 @@ static const struct soc_device_attribute gen3_soc_whitelist[] = {
 
 static int renesas_sdhi_sys_dmac_probe(struct platform_device *pdev)
 {
-	if (of_device_get_match_data(&pdev->dev) == &of_rcar_gen3_compatible &&
+	if ((of_device_get_match_data(&pdev->dev) == &of_rcar_gen3_compatible ||
+	    of_device_get_match_data(&pdev->dev) == &of_rcar_r8a7795_compatible) &&
 	    !soc_device_match(gen3_soc_whitelist))
 		return -ENODEV;
 
-- 
2.18.0
