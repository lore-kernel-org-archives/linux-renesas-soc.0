Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DB44D179B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 09:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847654; cv=none; b=hyr8EY2a4UwnVD2wBFpiH4xw6GxAx2huUnyzhfsPqanMYolr7LSyjKhZ6pJ8gfj/7hp0MEN4+bSXbJwh3rNkGS8ancp/JGpgzztSUqlOAuqPp6zoiVab/DkXuUNk8FDICMgmT0i5q7dNn+nwI2v0nJhfpxrLiaRgyDAs7gVaQdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847654; c=relaxed/simple;
	bh=tVLavnniL4ftxwqmT4gLyOj7j/kLe0zIc/Q7qsoTNtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBQNR9C0RDW+TiufOhl8aeuuRqk/O6fKfWbjal0IDVD4DONgM6Z6aVq2iXn+3iuLISFkRL60UDFZItlhZDnMhIdr6D7k+30KoYjwsIqZln73oUPQNl3epLnPbLPolwK2c28MuNgTxJhMP7ZpjplOJuB9sWf4UyfZm/eeNYcu0Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8gtoq1F; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8gtoq1F"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso65047245e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847650; x=1791452450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fskw90E+QGlw02aD4pq00FSiBnVtB9B+RDo+X91DPIo=;
        b=f8gtoq1FXYrtWjL7X7vm3M5uqqiP+fhReWSaBTuVfCrJ+vX9tVzvpyb0ybBGlRh5Ym
         NVNRW0MAVnfLyuID6fOUJ2JqRKlRhhl//zB6M0ws9WTnOViKFtCPNtxtOfqSkBrv+hPN
         JRBNc3dO5vD6VjO5aeNAjZa8Qjl81n+wUwuYrxY+RRNw9Uoh50khx/8VD8jWF8vtE6BS
         XfN2DDZ1bYVSvbkA/mBjC2rk+4DK+G92pOlBcLONk/W4/joIlzyxhjDyefAO9ch9dta0
         YA4HXanJiV5xc0sXvirsotuFY7Gv+BKPMuth/1V96C7zfY4bdpF6XtIvgx7iBesi1pAS
         2s0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847650; x=1791452450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fskw90E+QGlw02aD4pq00FSiBnVtB9B+RDo+X91DPIo=;
        b=YkRhceUPuSkFZm5KeOnXQYLLFL6fq+7rushvFZBt3rVJ6kuR4w4gMlmJeG9zFBuw/2
         UxL6o4RAlCx1owBXG7keeGw2rqvl/rNvNaCxNRuGWyoWb9g/OBlKVlCANunAwc+40a1s
         2S7wmpQpxRCb5Y6pBKgA43ml3ulag8bWruXRg8AXcnlJ38N4z7ghFisMRW2GWBjDFFSO
         xrMKMSM7kr6/WQC3TNMx/6DbE10exf3L3Ml8tcqpr+CvTvwW1y7MV4yPI+0KVNwAU9A4
         iFh/yKRgCN+Hq2PxX1K2fAcE92aFoghXJ5CBfwEDbo6woPulcl4S/fWxiwHUcKVN5jUc
         LHTg==
X-Forwarded-Encrypted: i=1; AKwUvBzREYIzvBpU+rrQK7ZwwVBowLlxNHSWy7OBHuTNb4LpnL5r/vnwv6g9JaSRSzyk+eUjSG0Da0R3cGNIeReZoawopQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l0ZrnH3Hy+fu3q4qadgzUNRwFriHX+5TJpH/aQKbzMGkGt/q8Q
	0Ac8DDebuF4SW+NyrnjUMQ0G58iAIjIRSOLTFV+8oyd18Vqa7VKOfAq4
X-Gm-Gg: AYBFou2uKcdrQeDPjgIwYWcSeOxuGTz89HuO3JTSDncQj21tAhHUpKFQZ+c6XI5Wtfh
	HjZ88C0UWgs10jA2EgmdJP/o9CVBQh2XeNo/4UPjQEtY0xM8e61aeFlg9DfGvXtxLAjibtvSQhA
	hsWH+20l8G6PGKZdZKh7pvHcAt1kNtf7f/QyE4DOvuiYPSUYRjl7RekbHhs18pSmg9Lay1EirBH
	pYoVl74gX7gFLxnYfuJnhZSOK7JvtPT7rKLYM46nOwmGfkK1a2yLZmuY69kgs0MJigPN5InM0sm
	OvLrg7tgxhHQ5vZ+tXLDXUPDYaL5qP2ttkFRCnhEcKCuslYooAtJea1yOlAysH2I53XimCeQxoJ
	0dNkxHZHT21EcWY70YdyzJwtPDOo5mROTh4G3xxOwuhffgnn4lfinkVq+h+LvowhWNLzJmIKxjq
	ZQf/18/BQDmWj0aF0wbwdIDAMs8SgtZQSSSFsOyWYptQ33+7S+0Hq1GqZ7nuAOugd6SEiOkh+fn
	MvwC5m7Icpsh00=
X-Received: by 2002:a05:600c:8b88:b0:4a0:62d:4424 with SMTP id 5b1f17b1804b1-4a01addebd5mr62080285e9.8.1790847649889;
        Thu, 01 Oct 2026 02:40:49 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:5563:a938:8fc:9dc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm38937725e9.6.2026.10.01.02.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:40:49 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v5 6/9] drm: renesas: rz-du: Add RZ/G3L (R9A08G046) DU support
Date: Thu,  1 Oct 2026 10:40:21 +0100
Message-ID: <20261001094041.135697-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
References: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add Display Unit support for the Renesas RZ/G3L SoC (R9A08G046). It is
similar to the one found on RZ/G2L, but has LVDS support.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Restored mode_clock_min to 5440 kHz.
v3->v4:
 * Updated mode_clock_min from 5440->5400 kHz.
 * Collected tag.
v2->v3:
 * Set duty cycle handling in DU encoder
 * Added min/max frequencies for DPI.
v1->v2:
 * Dropped the macro RZG2L_DU_FEATURE_SMUX2_DSI_CLK and RZG2L_DU_MAX_LVDS.
 * Dropped the variable rcdu from struct rzg2l_du_encoder.
 * Dropped the variable lvds from struct rzg2l_du_device.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 24 ++++++++++++++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  3 ++-
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 24 +++++++++++++++++++
 3 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 3d13f61d3c97..6c2dc86abc7d 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -55,6 +55,26 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	.mode_clock_max = 83500,
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a08g046_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.port = 1,
+		},
+		[RZG2L_DU_OUTPUT_LVDS0] = {
+			.possible_outputs = BIT(0),
+			.port = 2,
+		},
+	},
+	.mode_clock_min = 5440,
+	.mode_clock_max = 87000,
+};
+
 static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 	.channels_mask = BIT(0),
 	.routes = {
@@ -81,6 +101,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g077_info = {
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a08g046-du", .data = &rzg2l_du_r9a08g046_info },
 	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ .compatible = "renesas,r9a09g077-du", .data = &rzg2l_du_r9a09g077_info },
 	{ /* sentinel */ }
@@ -92,7 +113,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output output)
 {
 	static const char * const names[] = {
 		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
-		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0"
+		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0",
+		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0"
 	};
 
 	if (output >= ARRAY_SIZE(names))
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index baf076d69cda..e9626ef37cde 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -25,6 +25,7 @@ struct drm_property;
 enum rzg2l_du_output {
 	RZG2L_DU_OUTPUT_DSI0,
 	RZG2L_DU_OUTPUT_DPAD0,
+	RZG2L_DU_OUTPUT_LVDS0,
 	RZG2L_DU_OUTPUT_MAX,
 };
 
@@ -33,7 +34,7 @@ enum rzg2l_du_output {
  * @possible_outputs: bitmask of possible outputs
  * @port: device tree port number corresponding to this output route
  *
- * The DU has 2 possible outputs (DPAD0, DSI0). Output routing data
+ * The DU has 3 possible outputs (DPAD0, DSI0, LVDS0). Output routing data
  * specify the valid SoC outputs, which CRTC can drive the output, and the type
  * of in-SoC encoder for the output.
  */
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index 3d0999e4fcfd..a1b48973aa8e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -7,6 +7,7 @@
  * Based on rcar_du_encoder.c
  */
 
+#include <linux/clk.h>
 #include <linux/export.h>
 #include <linux/of.h>
 
@@ -15,6 +16,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_panel.h>
 
+#include "rzg2l_du_crtc.h"
 #include "rzg2l_du_drv.h"
 #include "rzg2l_du_encoder.h"
 
@@ -64,8 +66,30 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *encoder,
 	return MODE_OK;
 }
 
+static void rzg2l_du_encoder_atomic_mode_set(struct drm_encoder *encoder,
+					     struct drm_crtc_state *crtc_state,
+					     struct drm_connector_state *conn_state)
+{
+	struct rzg2l_du_encoder *renc = to_rzg2l_encoder(encoder);
+	struct rzg2l_du_crtc *rcrtc = to_rzg2l_crtc(crtc_state->crtc);
+	struct clk *clk_parent;
+
+	clk_parent = clk_get_parent(rcrtc->rzg2l_clocks.dclk);
+
+	/*
+	 * Request appropriate duty cycle
+	 * - LVDS path has DUTY H/L=4/3, 4/7 duty cycle.
+	 * - DSI/RGB path has symmetric 50% duty cycle.
+	 */
+	if (renc->output == RZG2L_DU_OUTPUT_LVDS0)
+		clk_set_duty_cycle(clk_parent, 4, 7);
+	else
+		clk_set_duty_cycle(clk_parent, 1, 2);
+}
+
 static const struct drm_encoder_helper_funcs rzg2l_du_encoder_helper_funcs = {
 	.mode_valid = rzg2l_du_encoder_mode_valid,
+	.atomic_mode_set = rzg2l_du_encoder_atomic_mode_set,
 };
 
 int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
-- 
2.43.0

