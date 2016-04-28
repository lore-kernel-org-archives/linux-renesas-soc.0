Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:32880 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752388AbcD1VDd (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 28 Apr 2016 17:03:33 -0400
Received: by mail-lf0-f42.google.com with SMTP id y84so98084756lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2016 14:03:32 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: laurent.pinchart@ideasonboard.com, airlied@linux.ie,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/4] rcar-du: add TCON encoder driver
Date: Fri, 29 Apr 2016 00:03:29 +0300
Message-ID: <1606151.cnY0qcbrgr@wasted.cogentembedded.com>
In-Reply-To: <1787748.qAADjKK4gv@wasted.cogentembedded.com>
References: <1787748.qAADjKK4gv@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renesas  R-Car SoCs  include the timing controller (TCON) that can directly
drive LCDs. It receives  the H/VSYNC, etc. from the Display Unit (DU)  and
converts  them to the set of signals  that a LCD panel can understand (the
RBG  signals are effectively passed thru).  TCON has a set of registers
that we need to  program based on the video mode timings, so we're adding
a DU encoder driver doing that...

Based on a large patch by Andrey Gusakov.

Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/gpu/drm/rcar-du/Kconfig           |    6 
 drivers/gpu/drm/rcar-du/Makefile          |    1 
 drivers/gpu/drm/rcar-du/rcar_du_drv.h     |    4 
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |    9 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h |    3 
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     |    4 
 drivers/gpu/drm/rcar-du/rcar_du_tconenc.c |  184 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_tconenc.h |   37 ++++++
 drivers/gpu/drm/rcar-du/rcar_tcon_regs.h  |   70 +++++++++++
 9 files changed, 318 insertions(+)

Index: linux/drivers/gpu/drm/rcar-du/Kconfig
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/Kconfig
+++ linux/drivers/gpu/drm/rcar-du/Kconfig
@@ -24,6 +24,12 @@ config DRM_RCAR_LVDS
 	help
 	  Enable support for the R-Car Display Unit embedded LVDS encoders.
 
+config DRM_RCAR_TCON
+	bool "R-Car DU TCON Encoder Support"
+	depends on DRM_RCAR_DU
+	help
+	  Enable support for the R-Car Display Unit embedded TCON encoders.
+
 config DRM_RCAR_VSP
 	bool "R-Car DU VSP Compositor Support"
 	depends on DRM_RCAR_DU
Index: linux/drivers/gpu/drm/rcar-du/Makefile
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/Makefile
+++ linux/drivers/gpu/drm/rcar-du/Makefile
@@ -10,6 +10,7 @@ rcar-du-drm-y := rcar_du_crtc.o \
 rcar-du-drm-$(CONFIG_DRM_RCAR_HDMI)	+= rcar_du_hdmicon.o \
 					   rcar_du_hdmienc.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_lvdsenc.o
+rcar-du-drm-$(CONFIG_DRM_RCAR_TCON)	+= rcar_du_tconenc.o
 
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
 
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_drv.h
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -59,6 +59,7 @@ struct rcar_du_output_routing {
  * @num_crtcs: total number of CRTCs
  * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
  * @num_lvds: number of internal LVDS encoders
+ * @num_tcon: number of internal TCON encoders
  */
 struct rcar_du_device_info {
 	unsigned int gen;
@@ -67,11 +68,13 @@ struct rcar_du_device_info {
 	unsigned int num_crtcs;
 	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
 	unsigned int num_lvds;
+	unsigned int num_tcon;
 };
 
 #define RCAR_DU_MAX_CRTCS		4
 #define RCAR_DU_MAX_GROUPS		DIV_ROUND_UP(RCAR_DU_MAX_CRTCS, 2)
 #define RCAR_DU_MAX_LVDS		2
+#define RCAR_DU_MAX_TCON		1
 #define RCAR_DU_MAX_VSPS		4
 
 struct rcar_du_device {
@@ -99,6 +102,7 @@ struct rcar_du_device {
 	unsigned int vspd1_sink;
 
 	struct rcar_du_lvdsenc *lvds[RCAR_DU_MAX_LVDS];
+	struct rcar_du_tconenc *tcon[RCAR_DU_MAX_TCON];
 
 	struct {
 		wait_queue_head_t wait;
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -24,6 +24,7 @@
 #include "rcar_du_kms.h"
 #include "rcar_du_lvdscon.h"
 #include "rcar_du_lvdsenc.h"
+#include "rcar_du_tconenc.h"
 #include "rcar_du_vgacon.h"
 
 /* -----------------------------------------------------------------------------
@@ -48,6 +49,8 @@ static void rcar_du_encoder_disable(stru
 
 	if (renc->lvds)
 		rcar_du_lvdsenc_enable(renc->lvds, encoder->crtc, false);
+	if (renc->tcon)
+		rcar_du_tconenc_enable(renc->tcon, encoder->crtc, false);
 }
 
 static void rcar_du_encoder_enable(struct drm_encoder *encoder)
@@ -56,6 +59,8 @@ static void rcar_du_encoder_enable(struc
 
 	if (renc->lvds)
 		rcar_du_lvdsenc_enable(renc->lvds, encoder->crtc, true);
+	if (renc->tcon)
+		rcar_du_tconenc_enable(renc->tcon, encoder->crtc, true);
 }
 
 static int rcar_du_encoder_atomic_check(struct drm_encoder *encoder,
@@ -142,6 +147,10 @@ int rcar_du_encoder_init(struct rcar_du_
 		renc->lvds = rcdu->lvds[1];
 		break;
 
+	case RCAR_DU_OUTPUT_TCON:
+		renc->tcon = rcdu->tcon[0];
+		break;
+
 	default:
 		break;
 	}
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -20,6 +20,7 @@
 struct rcar_du_device;
 struct rcar_du_hdmienc;
 struct rcar_du_lvdsenc;
+struct rcar_du_tconenc;
 
 enum rcar_du_encoder_type {
 	RCAR_DU_ENCODER_UNUSED = 0,
@@ -27,6 +28,7 @@ enum rcar_du_encoder_type {
 	RCAR_DU_ENCODER_VGA,
 	RCAR_DU_ENCODER_LVDS,
 	RCAR_DU_ENCODER_HDMI,
+	RCAR_DU_ENCODER_TCON,
 };
 
 struct rcar_du_encoder {
@@ -34,6 +36,7 @@ struct rcar_du_encoder {
 	enum rcar_du_output output;
 	struct rcar_du_hdmienc *hdmi;
 	struct rcar_du_lvdsenc *lvds;
+	struct rcar_du_tconenc *tcon;
 };
 
 #define to_rcar_encoder(e) \
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_kms.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -27,6 +27,7 @@
 #include "rcar_du_encoder.h"
 #include "rcar_du_kms.h"
 #include "rcar_du_lvdsenc.h"
+#include "rcar_du_tconenc.h"
 #include "rcar_du_regs.h"
 #include "rcar_du_vsp.h"
 
@@ -619,6 +620,9 @@ int rcar_du_modeset_init(struct rcar_du_
 	ret = rcar_du_lvdsenc_init(rcdu);
 	if (ret < 0)
 		return ret;
+	ret = rcar_du_tconenc_init(rcdu);
+	if (ret < 0)
+		return ret;
 
 	ret = rcar_du_encoders_init(rcdu);
 	if (ret < 0)
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_tconenc.c
===================================================================
--- /dev/null
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_tconenc.c
@@ -0,0 +1,184 @@
+/*
+ * rcar_du_tconenc.c -- R-Car Display Unit TCON Encoder
+ *
+ * Copyright (C) 2015-2016 Cogent Embedded, Inc. <source@cogentembedded.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <drm/drm_encoder_slave.h>
+
+#include "rcar_du_drv.h"
+#include "rcar_du_encoder.h"
+#include "rcar_du_tconenc.h"
+#include "rcar_tcon_regs.h"
+
+struct rcar_du_tconenc {
+	struct rcar_du_device *dev;
+
+	unsigned int index;
+	void __iomem *mmio;
+	struct clk *clock;
+	bool enabled;
+};
+
+static void rcar_tcon_write(struct rcar_du_tconenc *tcon, u32 reg, u32 data)
+{
+	iowrite32(data, tcon->mmio + reg);
+}
+
+static int rcar_du_tconenc_start(struct rcar_du_tconenc *tcon,
+				 struct rcar_du_crtc *rcrtc)
+{
+	const struct drm_display_mode *mode = &rcrtc->crtc.mode;
+	int ret;
+
+	if (tcon->enabled)
+		return 0;
+
+	ret = clk_prepare_enable(tcon->clock);
+	if (ret < 0)
+		return ret;
+
+	/* Update */
+	rcar_tcon_write(tcon, OUT_V_LATCH, OUTCNT_VEN);
+	rcar_tcon_write(tcon, TCON_V_LATCH, TCON_VEN);
+
+	/* Signals:
+	 * R-Car	Display
+	 * QCLK		SSC (Source Driver Clock Input)
+	 * QSTH		SSP (Source Scanning Signal Left/Right)
+	 * QSTB		SOE (Source Driver Output Enable)
+	 * QCPV		GOE (Gate Driver Output Enable)
+	 * QPOLA	POL (Polarity Control Signal)
+	 * QPOLB	GSC (Gate Driver Scanning Clock)
+	 * QSTVA	GSP (Gate Scanning Start Signal Up/Down)
+	 * QSTVB	nope
+	 */
+	/* Setup timings */
+	rcar_tcon_write(tcon, TCON_TIM, TCON_TIMING(50, 0));
+	/* Horizontal timings */
+	rcar_tcon_write(tcon, TCON_TIM_STH1, TCON_TIMING(mode->htotal -
+							 mode->hsync_start - 1,
+							 1));
+	rcar_tcon_write(tcon, TCON_TIM_STH2, TCON_SEL_STH_SP_HS);
+	rcar_tcon_write(tcon, TCON_TIM_STB1, TCON_TIMING(mode->htotal -
+							 mode->hsync_start +
+							 mode->hdisplay + 6,
+							 3));
+	rcar_tcon_write(tcon, TCON_TIM_STB2, TCON_SEL_STB_LP_HE);
+	rcar_tcon_write(tcon, TCON_TIM_POLB1,
+			TCON_TIMING(mode->htotal - mode->hsync_start +
+				    mode->hdisplay - 8, mode->htotal / 2));
+	rcar_tcon_write(tcon, TCON_TIM_POLB2,
+			TCON_SEL_POLB | TCON_INV | TCON_MD_NORM);
+	rcar_tcon_write(tcon, TCON_TIM_CPV1,
+			TCON_TIMING(mode->htotal - mode->hsync_start +
+				    mode->hdisplay - 33, 50));
+	rcar_tcon_write(tcon, TCON_TIM_CPV2, TCON_SEL_CPV_GCK);
+	rcar_tcon_write(tcon, TCON_TIM_POLA1,
+			TCON_TIMING(mode->htotal - mode->hsync_start +
+				    mode->hdisplay + 1, 39));
+	rcar_tcon_write(tcon, TCON_TIM_POLA2,
+			TCON_SEL_POLA | TCON_INV | TCON_MD_1X1);
+
+	/* Vertical timings */
+	rcar_tcon_write(tcon, TCON_TIM_STVA1,
+			TCON_TIMING(mode->vtotal - mode->vsync_start, 1));
+	rcar_tcon_write(tcon, TCON_TIM_STVA2, TCON_SEL_STVA_VS);
+	rcar_tcon_write(tcon, TCON_TIM_STVB1, TCON_TIMING(0, 0));
+	rcar_tcon_write(tcon, TCON_TIM_STVB2, TCON_SEL_STVB_VE);
+
+	/* Data clocked out on the falling edge of QCLK, latched in LCD on
+	 * the rising edge
+	 */
+	rcar_tcon_write(tcon, OUT_CLK_PHASE, OUTCNT_LCD_EDGE);
+
+	/* Update */
+	rcar_tcon_write(tcon, OUT_V_LATCH, OUTCNT_VEN);
+	rcar_tcon_write(tcon, TCON_V_LATCH, TCON_VEN);
+
+	tcon->enabled = true;
+
+	return 0;
+}
+
+static void rcar_du_tconenc_stop(struct rcar_du_tconenc *tcon)
+{
+	if (!tcon->enabled)
+		return;
+
+	clk_disable_unprepare(tcon->clock);
+
+	tcon->enabled = false;
+}
+
+int rcar_du_tconenc_enable(struct rcar_du_tconenc *tcon, struct drm_crtc *crtc,
+			   bool enable)
+{
+	if (!enable) {
+		rcar_du_tconenc_stop(tcon);
+		return 0;
+	} else if (crtc) {
+		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+		return rcar_du_tconenc_start(tcon, rcrtc);
+	} else
+		return -EINVAL;
+}
+
+static int rcar_du_tconenc_get_resources(struct rcar_du_tconenc *tcon,
+					 struct platform_device *pdev)
+{
+	struct resource *mem;
+	char name[7];
+
+	sprintf(name, "tcon.%u", tcon->index);
+
+	mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	tcon->mmio = devm_ioremap_resource(&pdev->dev, mem);
+	if (IS_ERR(tcon->mmio))
+		return PTR_ERR(tcon->mmio);
+
+	tcon->clock = devm_clk_get(&pdev->dev, name);
+	if (IS_ERR(tcon->clock)) {
+		dev_err(&pdev->dev, "failed to get clock for %s\n", name);
+		return PTR_ERR(tcon->clock);
+	}
+
+	return 0;
+}
+
+int rcar_du_tconenc_init(struct rcar_du_device *rcdu)
+{
+	struct platform_device *pdev = to_platform_device(rcdu->dev);
+	struct rcar_du_tconenc *tcon;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < rcdu->info->num_tcon; ++i) {
+		tcon = devm_kzalloc(&pdev->dev, sizeof(*tcon), GFP_KERNEL);
+		if (tcon == NULL)
+			return -ENOMEM;
+
+		tcon->dev = rcdu;
+		tcon->index = i;
+		tcon->enabled = false;
+
+		ret = rcar_du_tconenc_get_resources(tcon, pdev);
+		if (ret < 0)
+			return ret;
+
+		rcdu->tcon[i] = tcon;
+	}
+
+	return 0;
+}
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_tconenc.h
===================================================================
--- /dev/null
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_tconenc.h
@@ -0,0 +1,37 @@
+/*
+ * rcar_du_tconenc.h -- R-Car Display Unit TCON Encoder
+ *
+ * Copyright (C) 2015-2016 CogentEmbedded, Inc. <source@cogentembedded.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __RCAR_DU_TCONENC_H__
+#define __RCAR_DU_TCONENC_H__
+
+#include <linux/io.h>
+#include <linux/module.h>
+
+struct rcar_drm_crtc;
+struct rcar_du_tconenc;
+
+#if IS_ENABLED(CONFIG_DRM_RCAR_TCON)
+int rcar_du_tconenc_init(struct rcar_du_device *rcdu);
+int rcar_du_tconenc_enable(struct rcar_du_tconenc *tcon,
+			   struct drm_crtc *crtc, bool enable);
+#else
+static inline int rcar_du_tconenc_init(struct rcar_du_device *rcdu)
+{
+	return 0;
+}
+static inline int rcar_du_tconenc_enable(struct rcar_du_tconenc *tcon,
+					 struct drm_crtc *crtc, bool enable)
+{
+	return 0;
+}
+#endif
+
+#endif /* __RCAR_DU_TCONENC_H__ */
Index: linux/drivers/gpu/drm/rcar-du/rcar_tcon_regs.h
===================================================================
--- /dev/null
+++ linux/drivers/gpu/drm/rcar-du/rcar_tcon_regs.h
@@ -0,0 +1,70 @@
+/*
+ * rcar_tcon_regs.h -- R-Car TCON Registers Definitions
+ *
+ * Copyright (C) 2015-2016 CogentEmbedded, Inc. <source@cogentembedded.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2
+ * as published by the Free Software Foundation.
+ */
+
+#ifndef __RCAR_TCON_REGS_H__
+#define __RCAR_TCON_REGS_H__
+
+#define OUT_V_LATCH		0x0000
+#define OUTCNT_VEN		(1 << 0)
+
+#define OUT_CLK_PHASE		0x0024
+#define OUTCNT_LCD_EDGE		(1 << 8)	/* If set, LCDOUT[23:0] are */
+						/* output on the falling edge */
+						/* of QCLK */
+
+#define TCON_V_LATCH		0x0280
+#define TCON_VEN		(1 << 0)
+
+#define TCON_TIM		0x0284
+
+/* Synced to VSYNC */
+#define TCON_TIM_STVA1		0x0288
+#define TCON_TIM_STVA2		0x028c
+#define TCON_TIM_STVB1		0x0290
+#define TCON_TIM_STVB2		0x0294
+
+/* Synced to HSYNC */
+#define TCON_TIM_STH1		0x0298
+#define TCON_TIM_STH2		0x029c
+#define TCON_TIM_STB1		0x02a0
+#define TCON_TIM_STB2		0x02a4
+#define TCON_TIM_CPV1		0x02a8
+#define TCON_TIM_CPV2		0x02ac
+#define TCON_TIM_POLA1		0x02b0
+#define TCON_TIM_POLA2		0x02b4
+#define TCON_TIM_POLB1		0x02b8
+#define TCON_TIM_POLB2		0x02bc
+#define TCON_TIM_DE		0x02c0
+
+/* Common definitions for all TCON_TIM_*1 registers */
+#define TCON_TIMING(start, width) (((start) << 16) | ((width) << 0))
+
+/* Common definitions for all TCON_TIM_*2 registers */
+#define TCON_INV		(1 << 4)
+/* Output signal select */
+#define TCON_SEL_STVA_VS	0
+#define TCON_SEL_STVB_VE	1
+#define TCON_SEL_STH_SP_HS	2
+#define TCON_SEL_STB_LP_HE	3
+#define TCON_SEL_CPV_GCK	4
+#define TCON_SEL_POLA		5
+#define TCON_SEL_POLB		6
+#define TCON_SEL_DE		7
+/* Definitions for HSYNC-related TIM registers */
+#define TCON_HS_SEL		(1 << 8)	/* If set, horizontal sync    */
+						/* signal reference after the */
+						/* offset */
+/* Polarity generation mode */
+#define TCON_MD_NORM		(0 << 12)
+#define TCON_MD_1X1		(1 << 12)
+#define TCON_MD_1X2		(2 << 12)
+#define TCON_MD_2X2		(3 << 12)
+
+#endif /* __RCAR_TCON_REGS_H__ */
