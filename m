Return-Path: <devicetree-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 3/6] phy: renesas: rcar-gen3-usb2: change the function name to set_vbus_ctrl()
Date: Fri, 15 Dec 2017 14:45:23 +0900
Message-Id: <1513316726-14387-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1513316726-14387-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1513316726-14387-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch changes the function name from rcar_gen3_enable_vbus_ctrl()
to rcar_gen3_set_vbus_ctrl() because the fucntion both enables and
disables.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 480f912..bca6162 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -134,13 +134,13 @@ static void rcar_gen3_set_linectrl(struct rcar_gen3_chan *ch, int dp, int dm)
 	writel(val, usb2_base + USB2_LINECTRL1);
 }
 
-static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
+static void rcar_gen3_set_vbus_ctrl(struct rcar_gen3_chan *ch, int enable)
 {
 	void __iomem *usb2_base = ch->base;
 	u32 val = readl(usb2_base + USB2_ADPCTRL);
 
-	dev_vdbg(&ch->phy->dev, "%s: %08x, %d\n", __func__, val, vbus);
-	if (vbus)
+	dev_vdbg(&ch->phy->dev, "%s: %08x, %d\n", __func__, val, enable);
+	if (enable)
 		val |= USB2_ADPCTRL_DRVVBUS;
 	else
 		val &= ~USB2_ADPCTRL_DRVVBUS;
@@ -163,7 +163,7 @@ static void rcar_gen3_init_for_host(struct rcar_gen3_chan *ch)
 {
 	rcar_gen3_set_linectrl(ch, 1, 1);
 	rcar_gen3_set_host_mode(ch, 1);
-	rcar_gen3_enable_vbus_ctrl(ch, 1);
+	rcar_gen3_set_vbus_ctrl(ch, 1);
 
 	ch->extcon_host = true;
 	schedule_work(&ch->work);
@@ -173,7 +173,7 @@ static void rcar_gen3_init_for_peri(struct rcar_gen3_chan *ch)
 {
 	rcar_gen3_set_linectrl(ch, 0, 1);
 	rcar_gen3_set_host_mode(ch, 0);
-	rcar_gen3_enable_vbus_ctrl(ch, 0);
+	rcar_gen3_set_vbus_ctrl(ch, 0);
 
 	ch->extcon_host = false;
 	schedule_work(&ch->work);
@@ -189,7 +189,7 @@ static void rcar_gen3_init_for_b_host(struct rcar_gen3_chan *ch)
 
 	rcar_gen3_set_linectrl(ch, 1, 1);
 	rcar_gen3_set_host_mode(ch, 1);
-	rcar_gen3_enable_vbus_ctrl(ch, 0);
+	rcar_gen3_set_vbus_ctrl(ch, 0);
 
 	val = readl(usb2_base + USB2_LINECTRL1);
 	writel(val & ~USB2_LINECTRL1_OPMODE_NODRV, usb2_base + USB2_LINECTRL1);
@@ -199,14 +199,14 @@ static void rcar_gen3_init_for_a_peri(struct rcar_gen3_chan *ch)
 {
 	rcar_gen3_set_linectrl(ch, 0, 1);
 	rcar_gen3_set_host_mode(ch, 0);
-	rcar_gen3_enable_vbus_ctrl(ch, 1);
+	rcar_gen3_set_vbus_ctrl(ch, 1);
 }
 
 static void rcar_gen3_init_from_a_peri_to_a_host(struct rcar_gen3_chan *ch)
 {
 	rcar_gen3_control_otg_irq(ch, 0);
 
-	rcar_gen3_enable_vbus_ctrl(ch, 0);
+	rcar_gen3_set_vbus_ctrl(ch, 0);
 	rcar_gen3_init_for_host(ch);
 
 	rcar_gen3_control_otg_irq(ch, 1);
-- 
1.9.1

