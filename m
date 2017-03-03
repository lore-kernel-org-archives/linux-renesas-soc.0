Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <kishon@ti.com>
CC: <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <stable@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] phy: core: fix the condition to enable pm_runtime in phy_create()
Date: Fri, 3 Mar 2017 20:32:46 +0900
Message-ID: <1488540814-21232-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that phy_create() never enables the pm_runtime.
And then, we can remove calling the pm_runtime_{en,dis}able from some
phy drivers.

Fixes: ff764963479a ("drivers: phy: add generic PHY framework")
Cc: stable@vger.kernel.org # v3.13+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/phy-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index a268f4d..17e350f 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -759,7 +759,7 @@ struct phy *phy_create(struct device *dev, struct device_node *node,
 	if (ret)
 		goto put_dev;
 
-	if (pm_runtime_enabled(dev)) {
+	if (!pm_runtime_enabled(dev)) {
 		pm_runtime_enable(&phy->dev);
 		pm_runtime_no_callbacks(&phy->dev);
 	}
-- 
1.9.1
