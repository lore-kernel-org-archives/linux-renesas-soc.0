Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:40458 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933642AbeAKRBE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 12:01:04 -0500
Received: by mail-lf0-f65.google.com with SMTP id v74so1584042lfa.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jan 2018 09:01:04 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180111170059.858419764@cogentembedded.com>
Date: Thu, 11 Jan 2018 19:54:34 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: devicetree@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 2/3] drm: rcar-du: add model field to struct rcar_du_device_info
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=drm-rcar-du-add-model-field-to-struct-rcar_du_device_info.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In order to add the R-Car V3M (R8A77970) support to the DU driver we'd need
to keep  track  not only  of the SoC generation but also of the exact model
(for the LVDS encoder support).  Therefore add the 'model'  field  to the
'struct rcar_du_device_info' and initialize it accordingly  for the already
supported SoCs.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c |    9 +++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h |   14 ++++++++++++++
 2 files changed, 23 insertions(+)

Index: linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -37,6 +37,7 @@
 
 static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
 	.gen = 2,
+	.model = R8A7743,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
 	.num_crtcs = 2,
@@ -58,6 +59,7 @@ static const struct rcar_du_device_info
 
 static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 	.gen = 2,
+	.model = R8A7745,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
 	.num_crtcs = 2,
@@ -79,6 +81,7 @@ static const struct rcar_du_device_info
 
 static const struct rcar_du_device_info rcar_du_r8a7779_info = {
 	.gen = 2,
+	.model = R8A7779,
 	.features = 0,
 	.num_crtcs = 2,
 	.routes = {
@@ -100,6 +103,7 @@ static const struct rcar_du_device_info
 
 static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 	.gen = 2,
+	.model = R8A7790,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
 	.quirks = RCAR_DU_QUIRK_ALIGN_128B | RCAR_DU_QUIRK_LVDS_LANES,
@@ -128,6 +132,7 @@ static const struct rcar_du_device_info
 /* M2-W (r8a7791) and M2-N (r8a7793) are identical */
 static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 	.gen = 2,
+	.model = R8A7791,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
 	.num_crtcs = 2,
@@ -150,6 +155,7 @@ static const struct rcar_du_device_info
 
 static const struct rcar_du_device_info rcar_du_r8a7792_info = {
 	.gen = 2,
+	.model = R8A7792,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
 	.num_crtcs = 2,
@@ -169,6 +175,7 @@ static const struct rcar_du_device_info
 
 static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 	.gen = 2,
+	.model = R8A7794,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
 	.num_crtcs = 2,
@@ -191,6 +198,7 @@ static const struct rcar_du_device_info
 
 static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 	.gen = 3,
+	.model = R8A7795,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
 		  | RCAR_DU_FEATURE_VSP1_SOURCE,
@@ -223,6 +231,7 @@ static const struct rcar_du_device_info
 
 static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 	.gen = 3,
+	.model = R8A7796,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
 		  | RCAR_DU_FEATURE_VSP1_SOURCE,
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_drv.h
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -49,9 +49,22 @@ struct rcar_du_output_routing {
 	unsigned int port;
 };
 
+enum rcar_du_model {
+	R8A7743,
+	R8A7745,
+	R8A7779,
+	R8A7790,
+	R8A7791,
+	R8A7792,
+	R8A7794,
+	R8A7795,
+	R8A7796,
+};
+
 /*
  * struct rcar_du_device_info - DU model-specific information
  * @gen: device generation (2 or 3)
+ * @model: device model
  * @features: device features (RCAR_DU_FEATURE_*)
  * @quirks: device quirks (RCAR_DU_QUIRK_*)
  * @num_crtcs: total number of CRTCs
@@ -60,6 +73,7 @@ struct rcar_du_output_routing {
  */
 struct rcar_du_device_info {
 	unsigned int gen;
+	enum rcar_du_model model;
 	unsigned int features;
 	unsigned int quirks;
 	unsigned int num_crtcs;
