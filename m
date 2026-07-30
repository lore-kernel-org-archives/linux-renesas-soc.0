Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAE144AB61;
	Thu, 30 Jul 2026 17:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431636; cv=none; b=EnUxoUCp6bymUDgAgrqL3SsJH7I+Thc+PsQtwZna8TLa892wIAMTvHR/JqF6PQXYOFFpy8ZhtaatvlK3ed5Ro3Uc9+mtN5ZjK6QXNHlnp/+KdOMmFdhgo3byCBovweS7tTJbQiWvGAnbwYPv4ZfRoXVQF2B3i0aIv4RniVSeUMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431636; c=relaxed/simple;
	bh=ljwcRmzt02JIZ9sR9TIzMw+dD7vu4S/4Ngm/jyA+Z4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cj46TDRFq/VTKWNPy6+k3BxMvxKOcAff4gu6fKUH9yK81Buha0bfoL3J9IPX5R0QqFakUzqsexwkXMBxB9zCzncGixnLFKAi/+bLTRgBUu++0UZujvZmF2BhXjICGFLJ3mzaMcn3XMLc8XkCeuzRqKvLFNgEQJoSLNsE8If6XVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=01nzrIbL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fJT5e2c1; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="01nzrIbL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fJT5e2c1"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id A157AEC01E4;
	Thu, 30 Jul 2026 13:13:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 30 Jul 2026 13:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785431633;
	 x=1785518033; bh=E0LgDilqi55URS2aTly4MCWfyFfcv4u8VqYBf2sm3Uk=; b=
	01nzrIbLQE+FX4+2Qv97RXy0B1ce0vB/yOX41sMZIj9jECYP/OCty4/4eDPv4gnY
	njCf2CZQFQW6bWBgdKkfZo5wB/Yd1Wk4m/G8PbWz/5bqMGA61qjb+Av0I8jYL/ub
	KcmDNYeftH6XXPDBuh21PoXbgTqwFAq+PjSa5tUPezSZ60302w5pcJWYQ6JcPXBb
	eMo4/xG/e6bo9f1fuaWUZyynT2FgW4YyJmLduGDkFrlDmXuZ6M0AfQVJxJ0Na0K2
	KgB5BTlWFylSzjU2Y9lgOFIbYHl6TBfBzachBZAvOyU5posa6pvNtm8ItR1yS2eL
	WFLjGt5eBufb11nr6mIqHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785431633; x=
	1785518033; bh=E0LgDilqi55URS2aTly4MCWfyFfcv4u8VqYBf2sm3Uk=; b=f
	JT5e2c1alxg/SfL4l2Cy2O/9C4YWmlMV0Kj0I2YNJodXid3pgOLEQMoslTRzB6MD
	7BmxhTxJGYoz3Q2anokbk5vEaQ8OoZcVRMfsy8WdEXN6XU/RixMaMeYbJwQtUSj9
	ChsNhG78aCQbFK22gfYYbINAOlgZeD6VwtHmTiqfYc+E4YP+/qD0mc9+v0ADxHwN
	Sx94myuJ6L724MbvUG/lsegad0qvn+7vVlOcuBUKyng55ujzquX9CLUe/Use+Bhj
	XO7v+QJVj8mfWOf0Mu/EyLDY6zF5KRTmeJxWcMNhbQnSb950An8nWMn5nFbVMMkH
	9DRte8tNnCdySrA2og4JA==
X-ME-Sender: <xms:UYZralcqIq6ZgK-DYXQ7EagDR8TchIN4MrJYuiCiB5Gfeae8LOB2GA>
    <xme:UYZravEDr0fmMCW83FEs4IsIElm5VE_AtJj8IaUVWNIDXVRl-E8M1-H1N00ws3U_W
    edrv84OHdI9khwe_J5B8TJ4QQ2ojk1oEDhKDQne_7zkbaingxUCsg>
X-ME-Received: <xmr:UYZrarhOBjOfQBCR-TN-4aHkYlwwyLqqnL83kl4uAqpptmmLgPDaX92VLknn_PXDv2Vwebpj4m9_a0gQP73T9WBT625X570>
X-ME-Proxy-Cause: dmFkZTFOq5HV7pFlivUgdPwPRAxGxbHRNTfy6vBVOHgod0zrgXGDmySPLFo7BpMftJCTJ/
    5TwiEW7PeT9yV09PmD5VscpYBiJirkn2nNabuXgdwB4L7X5kODY2a34jcjlRheXp3B+5Y5
    r1VYSnfxm2coLxYgvHLmWTyMHpg4x9bW2D7mJwV+m47uxhwh1/2p/xFLvVbzBf0z0FJue+
    j38Ign91JlbRZXPwc8X8tn/DXfA8q0gAV+jV3s6AcayiPfsDuAaZo5/Cs8yU9W5M60aUXE
    GEoJC63r1Ggz8UKsyRpWwtKQi4N4s0lqSK05ib71QZsvjvzPxbWIuyi8aZrouHMW2az1bc
    nwJYSajbIiPygHFM1+iQp1+0zXcwj3jtzmr/+thGYAgjgeQ9C6AGEOZM3rVpcxVTrcgHhB
    1d67HMymYBHpzOobtO0VFqRMulv3p61hPQHJEhLxcRO/kCDpvbzP5p524gsLfWPR71b8pO
    PhuAOy6189WQt+Fj38/9AhjrdtvjaGRtZKL1XeygAIip8h6gVQ2Neey2DO3/rjC5D3kWzx
    Wh0kcpJqJDBKL9UTmfflj2v9l8W05buQ4dWmLHUgSVJJBHkhzXx2urQz0X0mN0E8wrN2z2
    R0P7S/SJWBBsnIraKixij2ZFJOJXob+kOc/jGPc1OOBtungifPYX8bnwqbyQ
X-ME-Proxy: <xmx:UYZraj0_OkP5K6SQyouB636VDwAjgSoSmfCsRnvDXoEQuKaAqjTpJA>
    <xmx:UYZramf0Ku8DL1mnoHAbX_G6gdJJDEV9cAEdWMPGFJCKdrSzhfuxcw>
    <xmx:UYZrahzXgEC6x_klH6L8t27GXGzfeI3HuJ7Lb-110ry0pKe0h4qTbw>
    <xmx:UYZramxVeRQKz9UmWhXq0rVPqH6D9MgSlP1QEHt5lBk9lq6jGMr38A>
    <xmx:UYZrahpUsigbfsb-YQUzm7Q1EG83f_fEQF9I0JN0RvRd4t0f_z0cR6eq>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 13:13:52 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v11 12/13] media: rppx1: ga: Add support for gamma out correction
Date: Thu, 30 Jul 2026 19:12:40 +0200
Message-ID: <20260730171241.483870-13-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730171241.483870-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260730171241.483870-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the RPPX1 driver to allow setting the gamma out correction
configuration parameters. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
* Changes since v10
- No holes and no implicit padding in UAPI structures. Work by Jacopo,
  big thanks!
---
 .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |  5 ++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c | 43 ++++++++++++++-
 .../uapi/linux/media/dreamchip/rppx1-config.h | 55 ++++++++++++++++++-
 4 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 48b61b5c35b4..948e26d7361d 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -54,6 +54,7 @@ union rppx1_params_block {
 	struct rppx1_hist_params hist;
 	struct rppx1_exm_params exm;
 	struct rppx1_wbmeas_params wbmeas;
+	struct rppx1_ga_params ga;
 };
 
 union rppx1_stats_block {
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 8d85d0c7bff1..86d445b52504 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -30,6 +30,8 @@ rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE1, exm),
 	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE2, exm),
 	RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
+	RPPX1_PARAMS_BLOCK_INFO(GA_HV, ga),
+	RPPX1_PARAMS_BLOCK_INFO(GA_MV, ga),
 };
 
 int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
@@ -84,6 +86,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST:
 			module = &rpp->post.wbmeas;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_GA_HV:
+			module = &rpp->hv.ga;
+			break;
 		default:
 			dev_warn(rpp->dev,
 				 "Not handled RPPX1 block type: 0x%04x\n",
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
index 0667672b2694..1d9c24c43f77 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
@@ -15,9 +15,11 @@
 #define GAMMA_OUT_MODE_REG			0x0008
 #define GAMMA_OUT_MODE_GAMMA_OUT_EQU_SEGM	BIT(0)
 
-#define GAMMA_OUT_Y_REG_NUM			17
 #define GAMMA_OUT_Y_REG(n)			(0x000c + (4 * (n)))
 
+#define GAMMA_OUT_HV_GAMMA_CURVE_MASK		GENMASK(11, 0)
+#define GAMMA_OUT_MV_GAMMA_CURVE_MASK		GENMASK(23, 0)
+
 static int rppx1_ga_probe(struct rpp_module *mod)
 {
 	/* Version check. */
@@ -44,7 +46,46 @@ static int rppx1_ga_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int
+rppx1_ga_fill_params(struct rpp_module *mod,
+		     const union rppx1_params_block *block,
+		     rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_ga_params *cfg = &block->ga;
+	u32 mask;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + GAMMA_OUT_ENABLE_REG, 0);
+		return 0;
+	}
+
+	switch (cfg->header.type) {
+	case RPPX1_PARAMS_BLOCK_TYPE_GA_HV:
+		mask = GAMMA_OUT_HV_GAMMA_CURVE_MASK;
+		break;
+	case RPPX1_PARAMS_BLOCK_TYPE_GA_MV:
+		mask = GAMMA_OUT_MV_GAMMA_CURVE_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	write(priv, mod->base + GAMMA_OUT_MODE_REG, cfg->mode);
+
+	for (unsigned int i = 0; i < RPPX1_GA_MAX_SAMPLES; i++)
+		write(priv, mod->base + GAMMA_OUT_Y_REG(i),
+		      cfg->gamma_y[i] & mask);
+
+	/* Enable module. */
+	write(priv, mod->base + GAMMA_OUT_ENABLE_REG,
+	      GAMMA_OUT_ENABLE_GAMMA_OUT_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_ga_ops = {
 	.probe = rppx1_ga_probe,
 	.start = rppx1_ga_start,
+	.fill_params = rppx1_ga_fill_params,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index eec8a9c50bbe..aa8a078493af 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -90,6 +90,8 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST: POST pipe Color Correction
  * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1: PRE1 pipe Lens Shading Correction
  * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2: PRE2 pipe Lens Shading Correction
+ * @RPPX1_PARAMS_BLOCK_TYPE_GA_HV: Human Vision Pipe Gamma Out Correction
+ * @RPPX1_PARAMS_BLOCK_TYPE_GA_MV: Machine Vision Gamma Out Correction
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -106,6 +108,8 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST,
 	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_GA_HV,
+	RPPX1_PARAMS_BLOCK_TYPE_GA_MV,
 };
 
 /**
@@ -510,6 +514,53 @@ struct rppx1_lsc_params {
 	__u16 y_sect_size[RPPX1_LSC_NUM_SECTORS];
 };
 
+/* Gamma Out */
+#define RPPX1_GA_MAX_SAMPLES 17
+
+/**
+ * enum rppx1_ga_seg_mode - Gamma out curve segmentation mode
+ *
+ * Segmentation mode of the 16 input sampling points for the Gamma Out
+ * Correction module.
+ *
+ * @RPPX1_GA_SEG_MODE_LOGARITHMIC: logarithmic-like segmentation mode
+ * @RPPX1_GA_SEG_MODE_EQUIDISTANT: equidistant segmentation mode
+ */
+enum rppx1_ga_seg_mode {
+	RPPX1_GA_SEG_MODE_LOGARITHMIC,
+	RPPX1_GA_SEG_MODE_EQUIDISTANT
+};
+
+/**
+ * struct rppx1_ga_params - Gamma Out Correction configuration
+ *
+ * The Gamma Out Correction module is available on the Human Vision Output
+ * Pipe (HV) and the Machine Vision Output Pipe (MV). Userspace selects
+ * which pipe to operate by setting the @header.type field to
+ * RPPX1_PARAMS_BLOCK_TYPE_GA_HV or RPPX1_PARAMS_BLOCK_TYPE_GA_MV.
+ *
+ * The module allows to apply a @gamma_y gamma correction curve to RGB data
+ * represented as a table of 16 entries. The 16 input sampling points can be
+ * equidistant or segmented using a logarithmic scale according to the value of
+ * @mode.
+ *
+ * The gamma curve values are 12 bits on the HV output pipe and 24 bits on the
+ * MV output pipe. Userspace is expected to provide the curve values with a
+ * bit-depth matching the one of pipe in use.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_GA_HV or
+ *	    type = RPPX1_PARAMS_BLOCK_TYPE_GA_MV)
+ * @gamma_y: gamma out curve y-axis values
+ * @mode: gamma curve input segmentation mode (see rppx1_ga_seg_mode)
+ * @reserved: padding
+ */
+struct rppx1_ga_params {
+	struct v4l2_isp_params_block_header header;
+	__u32 gamma_y[RPPX1_GA_MAX_SAMPLES];
+	__u8 mode;
+	__u8 reserved[3];
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -530,7 +581,9 @@ struct rppx1_lsc_params {
 	sizeof(struct rppx1_bls_params)				+	\
 	sizeof(struct rppx1_ccor_params)			+	\
 	sizeof(struct rppx1_lsc_params)				+	\
-	sizeof(struct rppx1_lsc_params))
+	sizeof(struct rppx1_lsc_params)				+	\
+	sizeof(struct rppx1_ga_params)				+	\
+	sizeof(struct rppx1_ga_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.55.0

