Received: from mail-wr2-f29.google.com (mail-wr2-f29.google.com [74.125.225.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259204E50B3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775207; cv=none; b=ga3TJ6hAu4LMxkoB4nXLHpeXhxfHmV8IxuMwguxc4nZ/N9ssTCHgbjR3n69sVfOrm9DgKfLMdAlJ4cBRWDLeNq1yXPgE8ko8PNRA1QUMSdytLzLOW4zcaOTXylQ1jQsZDh+Zj+NU8MFzwHE7Mcvh4NenXiCQWLlEr2eSDAOb4Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775207; c=relaxed/simple;
	bh=7LfXRY/HylNs7LLMvBTAcm3WPFa2lqMZ/7+JWFcyeUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cHuTfiCqLz6Vpz1PI29d8vz54aMT8bsO191HsqBtg77Iy1B/mE3M9rXfdBPxugZ+6jyC03G9NQqU93RhcK9Vsi3VCVZJ5DFcnafPe7Vqemgk5vldJjOb6GZQnstM2+5+y+PBZJ0BhCyMKA9MuNN1NKAaQw7M50keefE8LSW2oyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8/sk/kH; arc=none smtp.client-ip=74.125.225.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8/sk/kH"
Received: by mail-wr2-f29.google.com with SMTP id ffacd0b85a97d-48aef5d66c1so1255451f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 06:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775193; x=1791379993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKIiizSYW31L1vO4ApR8f8ju96g4F85wMaS7zBn4gvI=;
        b=P8/sk/kHpo/M/+B7iGu/PY6gFh1JCUMtKC/3fHbZvYNUhRkzM34ALdNU5ydz5MrHmu
         clqPBrozL/23Y34MaBN+pt+pknA0boZk2tNWh9fLke6F3r5gneVYuDHCLvok5gCv6vFF
         dJRAWeJDmASQAo8k0uh+UF0vpNPzKts0zU+hx3fFtMcLJb+V/wjpebipYnl+BrgfCTvg
         fI9x8hjKt0wfOXjDv8sftfyyehAJgfWu9A0hNIK9V2iDqg5ZEee4/3n+bgCNT2GIn099
         0i+Qa3gJQkPGKZ2wPZqSYRWKk3+pmgTHNgAwjta0BBDMhdrdYeVv8z6qDblDJ/mSMcTX
         3Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775193; x=1791379993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKIiizSYW31L1vO4ApR8f8ju96g4F85wMaS7zBn4gvI=;
        b=V5yfgm+0w71MLBxzXMFKevje89CNpZqh8/agjuGeSErtY37o/W1n3FzL8i/p4x5TEm
         RBqYTYeExeSDpsXzSaDrn4SypG7IsI6Lb/fXbXlQpqFoOsvDS4hkUk3qVQFERFeXC7UB
         IBmN5qV5s3hDw3U8ytg3WX6WowMVmEj4q/X8ZAZqq1rUjWJ9bAb0IpgZQ+P48gDoLhnS
         zjzQ2Q92mgdIASEOGV9cfjgsLpZ2T1OV5cGSLnXufGXMMmjprA5mXbdXrjy/HO0FjUN2
         1URTfmdYNagzIy+3M8MPtnhjCXqZIYJNLrhlaI/fGmJLT5/jPzWakt4MFirQ8t1gqwj0
         3wQg==
X-Forwarded-Encrypted: i=1; AKwUvBwqNw77Embc0VM2CyyMhme1YEUwfAIszFuh+AGs6Lv/FQIoKcqNibBQPqbuExxLbu4BYGzGDP5VApMvpTwu8guMWw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIQWtW2Lfl6EMr7dibp92m6Jw5FjfOBrn4AqgLVxdMuNlDSn3Ms
	lNjM+8tNAT/a9sPByl6SowXmviazWQFtlGDzNWgIsh2qzB2hLgLVbH7+
X-Gm-Gg: AYBFou1COgsUcXxIWQnmUOYyY7otwA/Cuu+SDf54Nh2OrPtU95sgG+ReT5RWGpGQ81O
	QsxbzIQHsJTc0w8+afVJWo3laYq5kqp+GJb8WsBRfD2HhQ7JwW7N1Z3DnvQrPil+TR2ROYyNnOb
	JenruhPLwLMrgVdrb2kgVqhtD7j3a74EZinfAFb/cEpr36fCfDRMFd1TgIP0jlRLdumXFdw+Mgy
	+7AJb70Rz8PECrvMpe2RvohN84DVBln2HFiyAYcIaxNHnjJl5q1Kxqt0IRnCWva5qJmOcYRehkZ
	cGSI9k3i3S4li0+940kHHmBcl0PKYhCDsWrUCZX1tnRr7a02DrvWPcUmNNRfjrXGopf8eauw/od
	MILPHO6Wse3yFoku2aWgpnoXAdFT4Xyl3yR9G0LSskRq4udwBj3npn+xaYuruxZ38s361I9UHZO
	bW9+P/TUMD4buIVw6KdPapAJ3fCeH0NOJRJMVWpXMlpTQT0hISsMucSO8u50AG+xVPcUNVo2mOT
	UMUUpgsshyUMZRsuaAVBo49
X-Received: by 2002:a5d:5f55:0:b0:48b:1a0:5630 with SMTP id ffacd0b85a97d-48b025224eamr3337001f8f.41.1790775193055;
        Wed, 30 Sep 2026 06:33:13 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:bade:1500:bcd:b3ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b02sm3685582f8f.24.2026.09.30.06.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:33:12 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v4 7/9] drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder
Date: Wed, 30 Sep 2026 14:32:49 +0100
Message-ID: <20260930133257.23210-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
References: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
from 25 to 87 MHz. The LVDS module cannot be used at the same time as
MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
module.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Added resets in pair for simplification.
 * Added comment in probe() for asserting resets.
v2->v3:
 * Moved set duty cycle to DU encoder.
v1->v2:
 * No change.
v5[1]->v1:
 * Added clk.h as LVDS requires 4:7 duty clock and moved this handling to
   LVDS driver
 * Avoided accessing register in disable if clk is disabled.
v5[1]: https://lore.kernel.org/all/20260625172359.292631-3-biju.das.jz@bp.renesas.com/
v4->v5:
 * Added Kconfig functional dependency for DRM_RZG2L_DU
 * Dropped DRM_PANEL from DRM_RZG3L_LVDS config
 * Dropped unused headers of_device.h,of_graph.h and drm_panel.h
 * Dropped the unused macro LVDS_CMN_RST_PHY0_SEL_CH0
 * Used plain number for macro LVDS_0_PHY_CH_IO_EN0_MSK
 * Retained the tag as the above changes are trivial.
v3->v4:
 * Dropped the header files clk.h and syscon.h
 * Dropped next_bridge check in attach().
 * Dropped syscon for getting regmap.
 * Replaced the below macros to match with hardware manual:
	LVDS_0_CTL_FMT_SEL_MSK->LVDS_0_CTL_FMT_SEL0_MSK
	LVDS_0_PHY_CH_IO_EN_MSK->LVDS_0_PHY_CH_IO_EN0_MSK
	Replaced LVDS_0_PHY_CH_IO_EN->LVDS_0_PHY_CH_IO_EN0
 * Replaced atomic_reset()->atomic_create_state()
 * Dropped the tags as there are new changes.
v2->v3:
 * Collected tags.
v2->v2[1]:
 * Replace drm_atomic_state with drm_atomic_commit in
   rzg3l_lvds_atomic_{en,dis}able().
 * Drop local variable ret and dev_err() messages in
   rzg3l_lvds_atomic_enable(); use WARN_ON() instead to
   capture unexpected failures since atomic_enable should not fail.
 * Drop local variable next_bridge from rzg3l_lvds_probe().
[1] https://lore.kernel.org/all/20260524194457.479681-3-biju.das.jz@bp.renesas.com/
v1->v2:
 * Dropped unused function rzg3l_lvds_is_connected() and removed the 
   corresponding header file rzg3l_lvds.h
 * Dropped next_bridge from struct rzg3l_lvds instead using bridge's
   next_bridge.
 * Replaced pm_runtime_resume_and_get()->pm_runtime_get_sync() as
   atomic_enable doesn't fail and for each enable there always will be an
   atomic_disable() call.
 * Started using DEFINE_RUNTIME_DEV_PM_OPS for PM callback.
 * Replaced rzg3l_lvds_parse_dt() with devm_drm_of_get_bridge() in probe()
 * Started using reset_control_bulk_*() in rzg3l_lvds_pm_runtime_{suspend,
   resume}()
---
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 282 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  25 ++
 4 files changed, 321 insertions(+)
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
index 7f2ef7137ae5..0dbe86bd65d0 100644
--- a/drivers/gpu/drm/renesas/rz-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
@@ -26,3 +26,16 @@ config DRM_RZG2L_MIPI_DSI
 	def_tristate DRM_RZG2L_DU
 	depends on DRM_RZG2L_USE_MIPI_DSI
 	select DRM_MIPI_DSI
+
+config DRM_RZG3L_USE_LVDS
+	bool "RZ/G3L DU LVDS Encoder Support"
+	depends on DRM_BRIDGE && OF
+	depends on DRM_RZG2L_DU || COMPILE_TEST
+	default DRM_RZG2L_DU
+	help
+	  Enable support for the RZ/G3L Display Unit embedded LVDS encoder.
+
+config DRM_RZG3L_LVDS
+	def_tristate DRM_RZG2L_DU
+	depends on DRM_RZG3L_USE_LVDS
+	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile b/drivers/gpu/drm/renesas/rz-du/Makefile
index 2987900ea6b6..46decb7ac4f1 100644
--- a/drivers/gpu/drm/renesas/rz-du/Makefile
+++ b/drivers/gpu/drm/renesas/rz-du/Makefile
@@ -8,3 +8,4 @@ rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+= rzg2l_du_vsp.o
 obj-$(CONFIG_DRM_RZG2L_DU)		+= rzg2l-du-drm.o
 
 obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
+obj-$(CONFIG_DRM_RZG3L_LVDS)		+= rzg3l_lvds.o
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
new file mode 100644
index 000000000000..1658be8da545
--- /dev/null
+++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/G3L LVDS Encoder Driver
+ *
+ * Copyright (C) 2026 Renesas Electronics Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+
+#include "rzg3l_lvds_regs.h"
+
+enum rzg3l_lvds_mode {
+	RZG3L_LVDS_MODE_JEIDA = 0,
+	RZG3L_LVDS_MODE_JEIDA_MIRROR = 1,
+	RZG3L_LVDS_MODE_MODE2 = 2,
+	RZG3L_LVDS_MODE_MODE2_MIRROR = 3,
+	RZG3L_LVDS_MODE_VESA = 4,
+	RZG3L_LVDS_MODE_VESA_MIRROR = 5,
+	RZG3L_LVDS_MODE_MODE6 = 6,
+	RZG3L_LVDS_MODE_MODE6_MIRROR = 7,
+};
+
+struct rzg3l_lvds {
+	struct device *dev;
+	struct clk *dotclk;
+	struct reset_control_bulk_data resets[2];
+	struct regmap *regmap;
+	struct drm_bridge bridge;
+};
+
+#define bridge_to_rzg3l_lvds(b) \
+	container_of(b, struct rzg3l_lvds, bridge)
+
+static const struct regmap_config rzg3l_lvds_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = LVDS_0_CTL_OFFSET,
+};
+
+/* -----------------------------------------------------------------------------
+ * Bridge
+ */
+
+static void rzg3l_lvds_atomic_enable(struct drm_bridge *bridge,
+				     struct drm_atomic_commit *state)
+{
+	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
+	const struct drm_bridge_state *bridge_state;
+	u32 fmt;
+
+	/* Get the LVDS format from the bridge state. */
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	if (WARN_ON(!bridge_state))
+		return;
+
+	switch (bridge_state->output_bus_cfg.format) {
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		fmt = RZG3L_LVDS_MODE_JEIDA;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		fmt = RZG3L_LVDS_MODE_VESA;
+		break;
+	default:
+		fmt = RZG3L_LVDS_MODE_VESA;
+		dev_warn(lvds->dev, "Unsupported bus fmt 0x%04x\n",
+			 bridge_state->output_bus_cfg.format);
+		break;
+	}
+
+	if (WARN_ON(pm_runtime_get_sync(lvds->dev) < 0))
+		return;
+
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_EN_BGR, LVDS_0_PHY_CH_EN_BGR);
+	fsleep(20);
+
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_EN_LDO, LVDS_0_PHY_CH_EN_LDO);
+	fsleep(10);
+
+	regmap_write(lvds->regmap, LVDS_CMN, LVDS_CMN_RST_PHY0_SEL);
+	regmap_update_bits(lvds->regmap, LVDS_0_CTL_OFFSET,
+			   LVDS_0_CTL_FMT_SEL0_MSK,
+			   FIELD_PREP(LVDS_0_CTL_FMT_SEL0_MSK, fmt));
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_IO_EN0_MSK, LVDS_0_PHY_CH_IO_EN0);
+	regmap_write(lvds->regmap, LVDS_CMN,
+		     LVDS_CMN_RST_PHY0_SEL | LVDS_CMN_PHY_RESET);
+	fsleep(100);
+}
+
+static void rzg3l_lvds_atomic_disable(struct drm_bridge *bridge,
+				      struct drm_atomic_commit *state)
+{
+	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(lvds->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret < 0)
+		goto pm_put_sync;
+
+	regmap_update_bits(lvds->regmap, LVDS_CMN, LVDS_CMN_PHY_RESET, 0);
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_IO_EN0_MSK, 0);
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_EN_LDO, 0);
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_EN_BGR, 0);
+
+pm_put_sync:
+	pm_runtime_put_sync(lvds->dev);
+}
+
+static int rzg3l_lvds_attach(struct drm_bridge *bridge,
+			     struct drm_encoder *encoder,
+			     enum drm_bridge_attach_flags flags)
+{
+	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
+
+	return drm_bridge_attach(encoder, lvds->bridge.next_bridge, bridge, flags);
+}
+
+static enum drm_mode_status
+rzg3l_lvds_bridge_mode_valid(struct drm_bridge *bridge,
+			     const struct drm_display_info *info,
+			     const struct drm_display_mode *mode)
+{
+	if (mode->clock > 87000)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->clock < 25000)
+		return MODE_CLOCK_LOW;
+
+	return MODE_OK;
+}
+
+static const struct drm_bridge_funcs rzg3l_lvds_bridge_ops = {
+	.attach = rzg3l_lvds_attach,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
+	.atomic_enable = rzg3l_lvds_atomic_enable,
+	.atomic_disable = rzg3l_lvds_atomic_disable,
+	.mode_valid = rzg3l_lvds_bridge_mode_valid,
+};
+
+/* -----------------------------------------------------------------------------
+ * Power Management
+ */
+
+static int rzg3l_lvds_pm_runtime_suspend(struct device *dev)
+{
+	struct rzg3l_lvds *lvds = dev_get_drvdata(dev);
+
+	return reset_control_bulk_assert(ARRAY_SIZE(lvds->resets), lvds->resets);
+}
+
+static int rzg3l_lvds_pm_runtime_resume(struct device *dev)
+{
+	struct rzg3l_lvds *lvds = dev_get_drvdata(dev);
+
+	return reset_control_bulk_deassert(ARRAY_SIZE(lvds->resets), lvds->resets);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(rzg3l_lvds_pm_ops,
+				 rzg3l_lvds_pm_runtime_suspend,
+				 rzg3l_lvds_pm_runtime_resume, NULL);
+
+/* -----------------------------------------------------------------------------
+ * Probe & Remove
+ */
+
+static int rzg3l_lvds_probe(struct platform_device *pdev)
+{
+	static struct reset_control_bulk_data resets[2];
+	struct device *dev = &pdev->dev;
+	struct rzg3l_lvds *lvds;
+	void __iomem *base;
+	int ret;
+
+	lvds = devm_drm_bridge_alloc(dev, struct rzg3l_lvds, bridge,
+				     &rzg3l_lvds_bridge_ops);
+	if (IS_ERR(lvds))
+		return PTR_ERR(lvds);
+
+	lvds->dev = dev;
+	lvds->bridge.of_node = pdev->dev.of_node;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	lvds->regmap = devm_regmap_init_mmio(dev, base, &rzg3l_lvds_regmap_config);
+	if (IS_ERR(lvds->regmap))
+		return dev_err_probe(dev, PTR_ERR(lvds->regmap),
+				     "Failed to init regmap\n");
+
+	lvds->dotclk = devm_clk_get(dev, "dotclk");
+	if (IS_ERR(lvds->dotclk))
+		return PTR_ERR(lvds->dotclk);
+
+	lvds->resets[0].id = "prst";
+	lvds->resets[1].id = "lvdrst";
+	ret = devm_reset_control_bulk_get_exclusive(dev, ARRAY_SIZE(lvds->resets),
+						    lvds->resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get prst/core resets\n");
+
+	platform_set_drvdata(pdev, lvds);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable Runtime PM\n");
+
+	lvds->bridge.next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(lvds->bridge.next_bridge))
+		return dev_err_probe(dev, PTR_ERR(lvds->bridge.next_bridge),
+				     "Failed to get next bridge\n");
+
+	/*
+	 * This module cannot be used at the same time as MIPI-DSI, so assert
+	 * the MIPI_DSI_CMN_RSTB and MIPI_DSI_ARESET_N resets before using this
+	 * module.
+	 */
+	resets[0].id = "rst";
+	resets[1].id = "arst";
+	ret = devm_reset_control_bulk_get_exclusive(dev, ARRAY_SIZE(resets),
+						    resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get rst/arst resets\n");
+
+	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_drm_bridge_add(dev, &lvds->bridge);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register drm bridge\n");
+
+	return ret;
+}
+
+static const struct of_device_id rzg3l_lvds_of_table[] = {
+	{ .compatible = "renesas,r9a08g046-lvds" },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, rzg3l_lvds_of_table);
+
+static struct platform_driver rzg3l_lvds_platform_driver = {
+	.probe		= rzg3l_lvds_probe,
+	.driver		= {
+		.name	= "rzg3l-lvds",
+		.pm	= pm_ptr(&rzg3l_lvds_pm_ops),
+		.of_match_table = rzg3l_lvds_of_table,
+	},
+};
+
+module_platform_driver(rzg3l_lvds_platform_driver);
+
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/G3L LVDS Encoder Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
new file mode 100644
index 000000000000..5b276cca9a5d
--- /dev/null
+++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * RZ/G3L LVDS Interface Registers Definitions
+ *
+ * Copyright (C) 2026 Renesas Electronics Corporation
+ *
+ */
+
+#ifndef __RZG3L_LVDS_REGS_H__
+#define __RZG3L_LVDS_REGS_H__
+
+#define LVDS_CMN			0x00
+#define LVDS_CMN_RST_PHY0_SEL		BIT(24)
+#define LVDS_CMN_PHY_RESET		BIT(0)
+
+#define LVDS_0_PHY_OFFSET		0x10
+#define LVDS_0_PHY_CH_IO_EN0_MSK	0x1f
+#define LVDS_0_PHY_CH_IO_EN0		(LVDS_0_PHY_CH_IO_EN0_MSK << 0)
+#define LVDS_0_PHY_CH_EN_BGR		BIT(8)
+#define LVDS_0_PHY_CH_EN_LDO		BIT(9)
+
+#define LVDS_0_CTL_OFFSET		0x14
+#define LVDS_0_CTL_FMT_SEL0_MSK		GENMASK(23, 20)
+
+#endif /* __RZG3L_LVDS_REGS_H__ */
-- 
2.43.0

