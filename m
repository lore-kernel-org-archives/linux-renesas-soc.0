Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:64100 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1756546AbcJQHMI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Oct 2016 03:12:08 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <kishon@ti.com>
CC: <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] phy: rcar-gen3-usb2: add sysfs for usb role swap
Date: Mon, 17 Oct 2016 16:10:48 +0900
Message-ID: <1476688248-983-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds sysfs "otg_inputs" for usb role swap. This parameter
is write-only and if you use them as the following, you can swap
the usb role.

For example:
 1) connect a usb cable using 2 salvator-x boards
 2) On A-device (as host), you input the following command:
   # echo a_bus_req/ > /sys/devices/platform/soc/ee080200.usb-phy/otg_inputs
 3) On B-device (as peripheral), you input the following command:
   # echo b_bus_req > /sys/devices/platform/soc/ee080200.usb-phy/otg_inputs

Then, the A-device acts as a peripheral (A-peripheral) and the B-device
acts as a host (B-host).
Please note that A-device must input the following command if you
want the board to act as a host again. (even if you disconnect the usb
cable, since id state may be the same, the condition keeps "A-peripheral".)
 # echo a_bus_drop > /sys/devices/platform/soc/ee080200.usb-phy/otg_inputs

Also you can use the following command if you want the B-device board to
act as a peripheral again.
 # echo b_bus_req/ > /sys/devices/platform/soc/ee080200.usb-phy/otg_inputs

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on the linux-phy.git / phy-for-4.9-resolved_v3 tag.
 (commit id = c4b0bf82f705747ed7de90c5736b07248cbb29cd)

 .../ABI/testing/sysfs-platform-phy-rcar-gen3-usb2  |  11 ++
 drivers/phy/phy-rcar-gen3-usb2.c                   | 124 ++++++++++++++++++++-
 2 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb2

diff --git a/Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb2 b/Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb2
new file mode 100644
index 0000000..c7e715af
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb2
@@ -0,0 +1,11 @@
+What:		/sys/devices/platform/<phy-name>/otg-inputs
+Date:		October 2016
+KernelVersion:	4.10
+Contact:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+Description:
+		This write-only file changes the phy mode for role swap of usb.
+		This file accepts the following strings:
+		 "a_bus_req/" - switching from A-Host to A-Peripheral
+		 "a_bus_drop" - switching from A-Peripheral to A-Host
+		 "b_bus_req"  - switching from B-Peripheral to B-Host
+		 "b_bus_req/" - switching from B-Host to B-Peripheral
diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-gen3-usb2.c
index 3d97ead..80f5bcc 100644
--- a/drivers/phy/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/phy-rcar-gen3-usb2.c
@@ -70,6 +70,7 @@
 #define USB2_LINECTRL1_DP_RPD		BIT(18)
 #define USB2_LINECTRL1_DMRPD_EN		BIT(17)
 #define USB2_LINECTRL1_DM_RPD		BIT(16)
+#define USB2_LINECTRL1_OPMODE_NODRV	BIT(6)
 
 /* ADPCTRL */
 #define USB2_ADPCTRL_OTGSESSVLD		BIT(20)
@@ -161,6 +162,43 @@ static void rcar_gen3_init_for_peri(struct rcar_gen3_chan *ch)
 	schedule_work(&ch->work);
 }
 
+static void rcar_gen3_init_for_b_host(struct rcar_gen3_chan *ch)
+{
+	void __iomem *usb2_base = ch->base;
+	u32 val;
+
+	val = readl(usb2_base + USB2_LINECTRL1);
+	writel(val | USB2_LINECTRL1_OPMODE_NODRV, usb2_base + USB2_LINECTRL1);
+
+	rcar_gen3_set_linectrl(ch, 1, 1);
+	rcar_gen3_set_host_mode(ch, 1);
+	rcar_gen3_enable_vbus_ctrl(ch, 0);
+
+	val = readl(usb2_base + USB2_LINECTRL1);
+	writel(val & ~USB2_LINECTRL1_OPMODE_NODRV, usb2_base + USB2_LINECTRL1);
+}
+
+static void rcar_gen3_init_for_a_peri(struct rcar_gen3_chan *ch)
+{
+	rcar_gen3_set_linectrl(ch, 0, 1);
+	rcar_gen3_set_host_mode(ch, 0);
+	rcar_gen3_enable_vbus_ctrl(ch, 1);
+}
+
+static void rcar_gen3_init_from_a_peri_to_a_host(struct rcar_gen3_chan *ch)
+{
+	void __iomem *usb2_base = ch->base;
+	u32 val;
+
+	val = readl(usb2_base + USB2_OBINTEN);
+	writel(val & ~USB2_OBINT_BITS, usb2_base + USB2_OBINTEN);
+
+	rcar_gen3_enable_vbus_ctrl(ch, 0);
+	rcar_gen3_init_for_host(ch);
+
+	writel(val | USB2_OBINT_BITS, usb2_base + USB2_OBINTEN);
+}
+
 static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 {
 	return !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
@@ -174,6 +212,71 @@ static void rcar_gen3_device_recognition(struct rcar_gen3_chan *ch)
 		rcar_gen3_init_for_peri(ch);
 }
 
+/*
+ * The following table is a state transition for usb phy mode:
+ * State			Event	Next state
+ * disconnected:		E1	a_host
+ *				E2	b_peripheral
+ * A-Device - a_host:		E2	b_peripheral
+ *				E3	disconnected
+ *				E4	a_suspend
+ * A-Device - a_suspend:	E2	b_peripheral
+ *				E3	disconnected
+ *				E5	a_host
+ *				E6	a_peripheral
+ * A-Device - a_peripheral:	E2	b_peripheral
+ *				E3	disconnected
+ *				E5	a_host
+ * B-Device - b_peripheral:	E3	disconnected
+ *				E7	b_wait_acon
+ * B-Device - b_wait_acon	E3	disconnected
+ *				E8	b_host
+ * B-Device - b_host:		E3	disconnected
+ *				E9	b_peripheral
+ * Events:
+ * E1: ID = 0 && Host detects D+ pull up,	E2: ID = 1 && VBUS = 1
+ * E3: VBUS = 0 || ID is changed,		E4: a_bus_req/
+ * E5: a_bus_drop,				E6: Turns D+ pull up off
+ * E7: b_bus_req,				E8: Detects D+ pull up
+ * E9: b_bus_req/
+ */
+static ssize_t otg_inputs_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
+	bool is_host, is_b_device;
+
+	if (!ch->has_otg || !ch->phy->init_count)
+		return -EIO;
+
+	is_b_device = rcar_gen3_check_id(ch);	/* true = B-Device */
+	is_host = !(readl(ch->base + USB2_COMMCTRL) & USB2_COMMCTRL_OTG_PERI);
+
+	if (!strncmp(buf, "a_bus_req/", strlen("a_bus_req/"))) {
+		if (is_b_device)		/* fail if B-device */
+			return -ENODEV;
+		rcar_gen3_init_for_a_peri(ch);
+	} else if (!strncmp(buf, "a_bus_drop", strlen("a_bus_drop"))) {
+		if (is_b_device || is_host)	/* fail if B-device or A-host */
+			return -ENODEV;
+		rcar_gen3_init_from_a_peri_to_a_host(ch);
+	} else if (!strncmp(buf, "b_bus_req/", strlen("b_bus_req/"))) {
+		if (!is_b_device || !is_host)	/* fail if A-device or B-peri */
+			return -ENODEV;
+		rcar_gen3_init_for_peri(ch);
+	} else if (!strncmp(buf, "b_bus_req", strlen("b_bus_req"))) {
+		if (!is_b_device)		/* fail if A-device */
+			return -ENODEV;
+		rcar_gen3_init_for_b_host(ch);
+	} else {
+		return -EINVAL;
+	}
+
+	return count;
+}
+static DEVICE_ATTR_WO(otg_inputs);
+
 static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 {
 	void __iomem *usb2_base = ch->base;
@@ -351,21 +454,40 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		channel->vbus = NULL;
 	}
 
+	platform_set_drvdata(pdev, channel);
 	phy_set_drvdata(channel->phy, channel);
 
 	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-	if (IS_ERR(provider))
+	if (IS_ERR(provider)) {
 		dev_err(dev, "Failed to register PHY provider\n");
+	} else if (channel->has_otg) {
+		int ret;
+
+		ret = device_create_file(dev, &dev_attr_otg_inputs);
+		if (ret < 0)
+			return ret;
+	}
 
 	return PTR_ERR_OR_ZERO(provider);
 }
 
+static int rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
+{
+	struct rcar_gen3_chan *channel = platform_get_drvdata(pdev);
+
+	if (channel->has_otg)
+		device_remove_file(&pdev->dev, &dev_attr_otg_inputs);
+
+	return 0;
+};
+
 static struct platform_driver rcar_gen3_phy_usb2_driver = {
 	.driver = {
 		.name		= "phy_rcar_gen3_usb2",
 		.of_match_table	= rcar_gen3_phy_usb2_match_table,
 	},
 	.probe	= rcar_gen3_phy_usb2_probe,
+	.remove = rcar_gen3_phy_usb2_remove,
 };
 module_platform_driver(rcar_gen3_phy_usb2_driver);
 
-- 
1.9.1
