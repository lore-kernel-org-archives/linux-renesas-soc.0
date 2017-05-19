Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:42932 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752294AbdESQDW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2017 12:03:22 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org
Subject: [RFC v4 8/8] arch: sh: migor: Use new CEU camera driver
Date: Fri, 19 May 2017 18:03:00 +0200
Message-Id: <1495209780-27342-9-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1495209780-27342-1-git-send-email-jacopo@jmondi.org>
References: <1495209780-27342-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Update the interface for CEU camera driver and update migor machine init
to use it.
Get rid of soc_camera_links and and register subdevices as I2c devices.
Change power on/off routines to be called by sensor driver to
select/deselect which sensor to use.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 arch/sh/boards/mach-migor/setup.c | 125 +++++++++++++++-----------------------
 1 file changed, 49 insertions(+), 76 deletions(-)

diff --git a/arch/sh/boards/mach-migor/setup.c b/arch/sh/boards/mach-migor/setup.c
index 5de60a7..6b67ed5 100644
--- a/arch/sh/boards/mach-migor/setup.c
+++ b/arch/sh/boards/mach-migor/setup.c
@@ -26,7 +26,7 @@
 #include <linux/videodev2.h>
 #include <linux/sh_intc.h>
 #include <video/sh_mobile_lcdc.h>
-#include <media/drv-intf/sh_mobile_ceu.h>
+#include <media/drv-intf/renesas_ceu.h>
 #include <media/i2c/ov772x.h>
 #include <media/soc_camera.h>
 #include <media/i2c/tw9910.h>
@@ -302,12 +302,9 @@ static struct platform_device migor_lcdc_device = {
 };
 
 static struct clk *camera_clk;
-static DEFINE_MUTEX(camera_lock);
 
-static void camera_power_on(int is_tw)
+static void camera_vio_clk_on(void)
 {
-	mutex_lock(&camera_lock);
-
 	/* Use 10 MHz VIO_CKO instead of 24 MHz to work
 	 * around signal quality issues on Panel Board V2.1.
 	 */
@@ -317,49 +314,52 @@ static void camera_power_on(int is_tw)
 
 	/* use VIO_RST to take camera out of reset */
 	mdelay(10);
-	if (is_tw) {
-		gpio_set_value(GPIO_PTT2, 0);
-		gpio_set_value(GPIO_PTT0, 0);
-	} else {
-		gpio_set_value(GPIO_PTT0, 1);
-	}
 	gpio_set_value(GPIO_PTT3, 0);
 	mdelay(10);
 	gpio_set_value(GPIO_PTT3, 1);
 	mdelay(10); /* wait to let chip come out of reset */
 }
 
-static void camera_power_off(void)
+/* Platform camera driver to make sure these two are enabled alternatively */
+static int ov7725_enable(void)
 {
-	clk_disable(camera_clk); /* stop VIO_CKO */
-	clk_put(camera_clk);
+	gpio_set_value(GPIO_PTT0, 1);
 
-	gpio_set_value(GPIO_PTT3, 0);
-	mutex_unlock(&camera_lock);
+	return 0;
 }
 
-static int ov7725_power(struct device *dev, int mode)
+static void ov7725_disable(void)
 {
-	if (mode)
-		camera_power_on(0);
-	else
-		camera_power_off();
-
-	return 0;
+	gpio_set_value(GPIO_PTT0, 0);
 }
 
-static int tw9910_power(struct device *dev, int mode)
+static int tw9910_enable(void)
 {
-	if (mode)
-		camera_power_on(1);
-	else
-		camera_power_off();
+	gpio_set_value(GPIO_PTT2, 1);
 
 	return 0;
 }
 
-static struct sh_mobile_ceu_info sh_mobile_ceu_info = {
-	.flags = SH_CEU_FLAG_USE_8BIT_BUS,
+static void tw9910_disable(void)
+{
+	gpio_set_value(GPIO_PTT2, 0);
+}
+
+static struct ceu_info ceu_info = {
+	.num_subdevs		= 2,
+	.subdevs = {
+		{ /* [0] = ov772x */
+			.flags		= CEU_FLAG_USE_8BIT_BUS |
+					  CEU_FLAG_PRIMARY_SENS,
+			.i2c_adapter_id	= 0,
+			.i2c_address	= 0x21,
+		},
+		{ /* [1] = tw9910 */
+			.flags		= CEU_FLAG_USE_8BIT_BUS,
+			.i2c_adapter_id	= 0,
+			.i2c_address	= 0x45,
+		},
+	},
 };
 
 static struct resource migor_ceu_resources[] = {
@@ -379,12 +379,12 @@ static struct resource migor_ceu_resources[] = {
 };
 
 static struct platform_device migor_ceu_device = {
-	.name		= "sh_mobile_ceu",
+	.name		= "renesas-ceu",
 	.id             = 0, /* "ceu0" clock */
 	.num_resources	= ARRAY_SIZE(migor_ceu_resources),
 	.resource	= migor_ceu_resources,
 	.dev	= {
-		.platform_data	= &sh_mobile_ceu_info,
+		.platform_data	= &ceu_info,
 	},
 };
 
@@ -423,6 +423,20 @@ static struct platform_device sdhi_cn9_device = {
 	},
 };
 
+static struct ov772x_camera_info ov7725_info = {
+	.platform_enable = ov7725_enable,
+	.platform_disable = ov7725_disable,
+};
+
+static struct tw9910_video_info tw9910_info = {
+	.buswidth       = TW9910_DATAWIDTH_8,
+	.mpout          = TW9910_MPO_FIELD,
+
+	.platform_enable = tw9910_enable,
+	.platform_disable = tw9910_disable,
+};
+
+
 static struct i2c_board_info migor_i2c_devices[] = {
 	{
 		I2C_BOARD_INFO("rs5c372b", 0x32),
@@ -434,51 +448,13 @@ static struct i2c_board_info migor_i2c_devices[] = {
 	{
 		I2C_BOARD_INFO("wm8978", 0x1a),
 	},
-};
-
-static struct i2c_board_info migor_i2c_camera[] = {
 	{
 		I2C_BOARD_INFO("ov772x", 0x21),
+		.platform_data = &ov7725_info,
 	},
 	{
 		I2C_BOARD_INFO("tw9910", 0x45),
-	},
-};
-
-static struct ov772x_camera_info ov7725_info;
-
-static struct soc_camera_link ov7725_link = {
-	.power		= ov7725_power,
-	.board_info	= &migor_i2c_camera[0],
-	.i2c_adapter_id	= 0,
-	.priv		= &ov7725_info,
-};
-
-static struct tw9910_video_info tw9910_info = {
-	.buswidth	= SOCAM_DATAWIDTH_8,
-	.mpout		= TW9910_MPO_FIELD,
-};
-
-static struct soc_camera_link tw9910_link = {
-	.power		= tw9910_power,
-	.board_info	= &migor_i2c_camera[1],
-	.i2c_adapter_id	= 0,
-	.priv		= &tw9910_info,
-};
-
-static struct platform_device migor_camera[] = {
-	{
-		.name	= "soc-camera-pdrv",
-		.id	= 0,
-		.dev	= {
-			.platform_data = &ov7725_link,
-		},
-	}, {
-		.name	= "soc-camera-pdrv",
-		.id	= 1,
-		.dev	= {
-			.platform_data = &tw9910_link,
-		},
+		.platform_data = &tw9910_info,
 	},
 };
 
@@ -490,8 +466,6 @@ static struct platform_device *migor_devices[] __initdata = {
 	&migor_nor_flash_device,
 	&migor_nand_flash_device,
 	&sdhi_cn9_device,
-	&migor_camera[0],
-	&migor_camera[1],
 };
 
 extern char migor_sdram_enter_start;
@@ -632,8 +606,6 @@ static int __init migor_devices_setup(void)
 #endif
 	__raw_writew(__raw_readw(PORT_MSELCRB) | 0x2000, PORT_MSELCRB); /* D15->D8 */
 
-	platform_resource_setup_memory(&migor_ceu_device, "ceu", 4 << 20);
-
 	/* SIU: Port B */
 	gpio_request(GPIO_FN_SIUBOLR, NULL);
 	gpio_request(GPIO_FN_SIUBOBT, NULL);
@@ -647,6 +619,7 @@ static int __init migor_devices_setup(void)
 	 */
 	__raw_writew(__raw_readw(PORT_MSELCRA) | 1, PORT_MSELCRA);
 
+	camera_vio_clk_on();
 	i2c_register_board_info(0, migor_i2c_devices,
 				ARRAY_SIZE(migor_i2c_devices));
 
-- 
2.7.4
