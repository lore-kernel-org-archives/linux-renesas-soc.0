Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:7082 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751393AbdIACo6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2017 22:44:58 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: kishon@ti.com
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 2/4] phy: rcar-gen3-usb2: split the two meaning of "has_otg"
Date: Fri,  1 Sep 2017 11:41:23 +0900
Message-Id: <1504233685-17947-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1504233685-17947-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1504233685-17947-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The has_otg on previous code has the two meaning:
 - The channel has dedicated otg pins (ID, VBUS).
 - The channel can swap the role via sysfs.

However, some SoCs (e.g. R-Car D3) doesn't have such dedicated pins,
but the SoCs can swap the role. So, this patch split the two meaning
of has_otg as "has dedicated otg pins" and adds a new value
"can_role_swap". For now, the behavior is the same as before.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 61 ++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index e00e99a..4ea9902 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -87,7 +87,8 @@ struct rcar_gen3_chan {
 	struct regulator *vbus;
 	struct work_struct work;
 	bool extcon_host;
-	bool has_otg;
+	bool has_otg;	/* has dedicated pins (ID, VBUS) */
+	bool can_role_swap;
 };
 
 static void rcar_gen3_phy_usb2_work(struct work_struct *work)
@@ -219,14 +220,10 @@ static bool rcar_gen3_is_host(struct rcar_gen3_chan *ch)
 	return !(readl(ch->base + USB2_COMMCTRL) & USB2_COMMCTRL_OTG_PERI);
 }
 
-static ssize_t role_store(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
+static ssize_t rcar_gen3_otg_change_role(struct rcar_gen3_chan *ch,
+					 bool new_mode_is_host)
 {
-	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
-	bool is_b_device, is_host, new_mode_is_host;
-
-	if (!ch->has_otg || !ch->phy->init_count)
-		return -EIO;
+	bool is_b_device, is_host;
 
 	/*
 	 * is_b_device: true is B-Device. false is A-Device.
@@ -234,12 +231,6 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 	 */
 	is_b_device = rcar_gen3_check_id(ch);
 	is_host = rcar_gen3_is_host(ch);
-	if (!strncmp(buf, "host", strlen("host")))
-		new_mode_is_host = true;
-	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
-		new_mode_is_host = false;
-	else
-		return -EINVAL;
 
 	/* If current and new mode is the same, this returns the error */
 	if (is_host == new_mode_is_host)
@@ -257,6 +248,32 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 			rcar_gen3_init_for_peri(ch);
 	}
 
+	return 0;
+}
+
+static ssize_t role_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
+	bool new_mode_is_host;
+	ssize_t ret = -EIO;
+
+	if (!ch->phy->init_count)
+		return -EIO;
+
+	if (!strncmp(buf, "host", strlen("host")))
+		new_mode_is_host = true;
+	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
+		new_mode_is_host = false;
+	else
+		return -EINVAL;
+
+	if (ch->has_otg)
+		ret = rcar_gen3_otg_change_role(ch, new_mode_is_host);
+
+	if (ret < 0)
+		return ret;
+
 	return count;
 }
 
@@ -264,12 +281,17 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
+	bool is_host;
 
-	if (!ch->has_otg || !ch->phy->init_count)
+	if (!ch->phy->init_count)
 		return -EIO;
 
-	return sprintf(buf, "%s\n", rcar_gen3_is_host(ch) ? "host" :
-							    "peripheral");
+	if (ch->has_otg)
+		is_host = rcar_gen3_is_host(ch);
+	else
+		return -EIO;
+
+	return sprintf(buf, "%s\n", is_host ? "host" : "peripheral");
 }
 static DEVICE_ATTR_RW(role);
 
@@ -427,6 +449,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		int ret;
 
 		channel->has_otg = true;
+		channel->can_role_swap = true;
 		channel->extcon = devm_extcon_dev_allocate(dev,
 							rcar_gen3_phy_cable);
 		if (IS_ERR(channel->extcon))
@@ -468,7 +491,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		dev_err(dev, "Failed to register PHY provider\n");
 		ret = PTR_ERR(provider);
 		goto error;
-	} else if (channel->has_otg) {
+	} else if (channel->can_role_swap) {
 		int ret;
 
 		ret = device_create_file(dev, &dev_attr_role);
@@ -488,7 +511,7 @@ static int rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 {
 	struct rcar_gen3_chan *channel = platform_get_drvdata(pdev);
 
-	if (channel->has_otg)
+	if (channel->can_role_swap)
 		device_remove_file(&pdev->dev, &dev_attr_role);
 
 	pm_runtime_disable(&pdev->dev);
-- 
1.9.1
