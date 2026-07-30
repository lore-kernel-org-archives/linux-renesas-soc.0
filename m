Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A0C43F0BA;
	Thu, 30 Jul 2026 17:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431628; cv=none; b=A/jd2Y5XcVOp7oG2jFPBDXG0RmBVxWkUzTf9xsBdrN9XvU5+ZNpSN0TQTCFzCsB/ZMH4emMYGeAGa3vg4iqdfxteobLBgSh1mo+i9Jc77zZMP4jgSG2qGZP1sT6AEjIOMm8V9ksl+3tr3AytrjoedF8xOzmVv5tKMW3FqKYe9yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431628; c=relaxed/simple;
	bh=k7QPCJTDTXqRiNr2qPXLEHH/E5rPQHqXcKmwYpFtsSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s6IwhFPFvDrXmMHPBo+g9gm0XGftp4bd7VOnbC3ccjf95jpepYDN758+g8vyKbCoTV1CNZknKn3ScmUo62fkKrzhM3o9jnHbgpXGlM/pZPJbp3AnKx2z8V+l/1P5Pm/qTCWsnv8n0uVBN6RTJkl8Hpyuq589x1oHZUC+RyBTPlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LT/pphC/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Vw/xsdtT; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LT/pphC/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Vw/xsdtT"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 18768EC019F;
	Thu, 30 Jul 2026 13:13:45 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 30 Jul 2026 13:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785431625;
	 x=1785518025; bh=V2PFTu9j640c5y0RYXsAKzfDz7j9gqPtk6eSIVc8nAI=; b=
	LT/pphC/bAPn+H/En7ljjqkFTm5avVjpWUocnfqeaJbTR3Bglaz0onUW0ZHIjhiq
	NpgGHMvL3qroK0R8hCrnMGTqVmG9NciSAcxc7X6cKRSCGOIEm3LNv05fmiagrEks
	bpg2vRV/Ej09wtGgLxv1Io3IQKA86ZnVBF1nstAUtr+7Q4jbDzqYOF8NkB8vz6Us
	l/y5hCYCJFBW5vBWz5O4hhLn3rPXcSyo5Ns4/B/3Z04vTlFuTZ7cgy2cZp1WakKm
	44bpw+FncbSmog+3Gd37TcatvYXEIcVGA+9yNgn0+Jr9r8fh4KiiMgjgnbzAPFFM
	ZpeXKtpHuz6nAnntYc375g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785431625; x=
	1785518025; bh=V2PFTu9j640c5y0RYXsAKzfDz7j9gqPtk6eSIVc8nAI=; b=V
	w/xsdtT4tSSKOMxoQL7m/1ecBBvF2SE1aeOr9QRFphKCFIcKDVu0FH23kkPXRUlk
	zgnkSeHwWln8VdWRH1DBa8fCm7Bt6+vXiHT7o0oCuXP0WlsTnXeyrd9SRGaDwp9G
	H3JbU5YT5vfzQ9FxXChGMWbzQXCydzc2WK7YFbuOa9k16wi6+pJ+eRH8t7VofVLJ
	c1zFIh1SA4hxQlxmT4FI4n1UGzDvS6SHltZP+bpv+NYftPCg1C5lEe05VDkBx7wQ
	6TYG4YVAzz8zrNQ59ftKI8U5FoFgYETp6g6pzH5Jg+xa4MX8eXDfukzXRJ/C00Mp
	HgOyZ6bRwWKoQdVC++FpQ==
X-ME-Sender: <xms:SIZramaN_eXRlfqOwld23-dDh_Np59Drmx3E3r59fuA6C2ADqH0wmA>
    <xme:SIZralSr637Go5cwxcNy1cUJyDq8bGnzd6cu5gAulWlYD4Fd0GyM1l1KI97a117ml
    hOlK5blfsxDexfgQnwxxwv5xUNE5hLqPztaUSyFErqPQ7hhlowqDA>
X-ME-Received: <xmr:SIZrat-FgF-lF6yJl9zjAE0uFVRRxfMmZ6GLB_r-ju5m45Rls9LrcVVHeJw0IfFdW2qCEOxjeL3vlIHGbEv4pgi0lgfIPAc>
X-ME-Proxy-Cause: dmFkZTFOq5HV7pFlivUgdPwPRAxGxbHRNTfy6vBVOHgod0zrgXGDmySPLFo7BpMftJCTJ/
    5TwiEW7PeT9yV09PmD5VscpYBiJirkn2nNabuXgdwB4L7X5kODY2a34jcjlRheXp3B+5Y5
    r1VYSnfxm2coLxYgvHLmWTyMHpg4x9bW2D7mJwV+m47uxhwh1/2p/xFLvVbzBf0z0FJue+
    j38Ign91JlbRZXPwc8X8tn/DXfA8q0gAV+jV3s6AcayiPfsDuAaZo5/Cs8yU9W5M60aUXE
    GEoJC63r1Ggz8UKsyRpWwtKQi4N4s0lqSK05ib71QZsvjvzPxbWIuyi8aZrouHMW2az1ah
    UbMp9JF2/vlyP7AiAv0z9eQymjagy9XMa9N63UddAAaBVnZr5Q3YVeQsnKbWWP+cjbqhXa
    oGye+gEzb1gED2D4Q88OGhO/9ZeRaP/A1Uu9eJmeuuoPyBLf2lnWg6IVeBznJLZ/r3PgaS
    +SMBCb3+DDUuakVHCGs5NeWr/p+rYMlS3nTqbWEQ69Cd/7v0XG5e9ieJ3vnsAqaVrqgu9m
    A1GQFRw7DaCiHj6k2S/7ygQF91dCavogh9wXo76IaJD53jMZ4aOSwHFjGU/FAtRBzlhs6D
    WmliuvPz+J0MOz8sOdUi3kBz6IcHGj90TEnr4bR/3B0QP0pjudvtfWE19Wyg
X-ME-Proxy: <xmx:SIZratjExKq9I6S9WvOGH8HOpkxrOPTp9QkW6F0L5S7VDvcwmIkqAQ>
    <xmx:SYZramYZEw6ymJS_4DENMnv8t7aUdVCxp8C3WixVqSgl7AcJQ7Ijwg>
    <xmx:SYZraq-xqTfZPFoIp1aO-OXLxqEyn_VOqDOpEIVdWt7cIdHe8dKbKw>
    <xmx:SYZragN4wv6cSruGPJEVuvWbvoPr_3j9p8cBJi9MHnL2xMGTxxLaew>
    <xmx:SYZras2bxOXEt-thPlQA38QdgmIGI1kx1bmfeCLQDK97pZE9MrmLqBJB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 13:13:44 -0400 (EDT)
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
Subject: [PATCH v11 08/13] media: rppx1: hist: Add support histogram measurement
Date: Thu, 30 Jul 2026 19:12:36 +0200
Message-ID: <20260730171241.483870-9-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the histogram measurement
configuration and consuming the resulting statistics. It uses the RPPX1
framework for parameters and its writer abstraction to allow the user to
control how, and when, configuration is applied to the RPPX1.

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
- Add missing bitfield.h include.

* Changes since v9
- Update comments
- Drop mask when reading stats, the hardware already do this.

* Changes since v8
- Use IS_ERR to check rppx1_init_stats_block() return code.
---
 .../platform/dreamchip/rppx1/rpp_module.h     |   2 +
 .../platform/dreamchip/rppx1/rpp_params.c     |   6 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |  10 ++
 .../platform/dreamchip/rppx1/rppx1_hist.c     | 111 ++++++++++++++++-
 .../uapi/linux/media/dreamchip/rppx1-config.h | 117 +++++++++++++++++-
 5 files changed, 243 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index e968ec67b9f5..b134d140fe22 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -48,12 +48,14 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 union rppx1_params_block {
 	struct v4l2_isp_block_header header;
 	struct rppx1_awbg_params awbg;
+	struct rppx1_hist_params hist;
 	struct rppx1_exm_params exm;
 	struct rppx1_wbmeas_params wbmeas;
 };
 
 union rppx1_stats_block {
 	struct v4l2_isp_block_header header;
+	struct rppx1_hist_stats hist;
 	struct rppx1_exm_stats exm;
 	struct rppx1_wbmeas_stats wbmeas;
 };
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 8c0f45e8066a..975ce3a42fb5 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -19,6 +19,9 @@ static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
+	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
+	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE2, hist),
+	RPPX1_PARAMS_BLOCK_INFO(HIST_POST, hist),
 	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE1, exm),
 	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE2, exm),
 	RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
@@ -58,6 +61,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
 			module = &rpp->pre1.awbg;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_HIST_POST:
+			module = &rpp->post.hist;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1:
 			module = &rpp->pre1.exm;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index 388c758d805d..4c7fe611d004 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -17,6 +17,7 @@
 
 static const struct v4l2_isp_stats_block_type_info
 rppx1_stats_blocks_info[] = {
+	RPPX1_STATS_BLOCK_INFO(HIST_POST, hist),
 	RPPX1_STATS_BLOCK_INFO(EXM_PRE1, exm),
 	RPPX1_STATS_BLOCK_INFO(WBMEAS_POST, wbmeas),
 };
@@ -35,6 +36,15 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 
 	v4l2_isp_stats_init_buffer(stats, V4L2_ISP_VERSION_V1);
 
+	if (isc & RPPX1_IRQ_ID_POST_HIST_MEAS) {
+		block = rppx1_init_stats_block(rpp, stats,
+					       RPPX1_STATS_BLOCK_TYPE_HIST_POST);
+		if (IS_ERR(block))
+			return;
+
+		rpp_module_call(&rpp->post.hist, fill_stats, block);
+	}
+
 	if (isc & RPPX1_IRQ_ID_PRE1_EXM) {
 		block = rppx1_init_stats_block(rpp, stats,
 					       RPPX1_STATS_BLOCK_TYPE_EXM_PRE1);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
index 7c1b42e96b96..8fe8cbbc85df 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
@@ -7,6 +7,8 @@
 
 #include "rpp_module.h"
 
+#include <linux/bitfield.h>
+
 #define HIST_VERSION_REG			0x0000
 
 #define HIST_CTRL_REG				0x0004
@@ -26,6 +28,9 @@
 
 #define HIST_LAST_MEAS_LINE_REG			0x0010
 #define HIST_SUBSAMPLING_REG			0x0014
+#define HIST_SUBSAMPLING_V_STEPSIZE(x)		(((x) & 0x7f) << 24)
+#define HIST_SUBSAMPLING_H_STEP_INC(x)		(((x) & 0x1ffff))
+
 #define HIST_COEFF_R_REG			0x0018
 #define HIST_COEFF_G_REG			0x001c
 #define HIST_COEFF_B_REG			0x0020
@@ -49,7 +54,6 @@
 #define HIST_FORCED_UPDATE_REG			0x0058
 #define HIST_VSTART_STATUS_REG			0x005c
 
-#define HIST_BIN_REG_NUM			32
 #define HIST_BIN_REG(n)				(0x0060 + (4 * (n)))
 
 static int rppx1_hist_probe(struct rpp_module *mod)
@@ -72,6 +76,111 @@ static int rppx1_hist_probe(struct rpp_module *mod)
 	return 0;
 }
 
+#define RPPX1_HIST_WEIGHT(v0, v1, v2, v3) \
+	(((v0) & 0x1f) | (((v1) & 0x1f) << 8)  | \
+	(((v2) & 0x1f) << 16) | \
+	(((v3) & 0x1f) << 24))
+
+static int rppx1_hist_fill_params(struct rpp_module *mod,
+				  const union rppx1_params_block *block,
+				  rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_hist_params *cfg = &block->hist;
+	u32 h_offs, v_offs, h_size, v_size;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + HIST_MODE_REG,
+		      HIST_MODE_HIST_MODE_DISABLE);
+		return 0;
+	}
+
+	/* Select sample point */
+	write(priv, mod->base + HIST_CHANNEL_SEL_REG,
+	      cfg->channel_sel & HIST_CHANNEL_SEL_CHANNEL_SELECT_MASK);
+
+	/*
+	 * Configure the input subsampling.
+	 *
+	 * In Bayer mode the vertical and horizontal subsampling counters are
+	 * only incremented for color channels selected by hist_mode.
+	 */
+	write(priv, mod->base + HIST_SUBSAMPLING_REG,
+	      HIST_SUBSAMPLING_V_STEPSIZE(cfg->v_stepsize) |
+	      HIST_SUBSAMPLING_H_STEP_INC(cfg->h_step_inc));
+
+	/*
+	 * Adjust and set measurement window to hardware limitations,
+	 * - Offsets must be even.
+	 * - Width and height must be even and divisible in 5 windows.
+	 */
+	h_offs = cfg->wnd.h_offs & 0x1ffe;
+	v_offs = cfg->wnd.v_offs & 0x1ffe;
+	h_size = cfg->wnd.h_size - cfg->wnd.h_size % 10;
+	v_size = cfg->wnd.v_size - cfg->wnd.v_size % 10;
+
+	write(priv, mod->base + HIST_H_OFFS_REG, h_offs);
+	write(priv, mod->base + HIST_V_OFFS_REG, v_offs);
+	write(priv, mod->base + HIST_H_SIZE_REG, h_size / 5);
+	write(priv, mod->base + HIST_V_SIZE_REG, v_size / 5);
+
+	/*
+	 * Set last measurement line for ready interrupt. Ignore the value
+	 * from the parameters as it is only useful for fast-channel switching.
+	 */
+	write(priv, mod->base + HIST_LAST_MEAS_LINE_REG, v_offs + v_size + 1);
+
+	/* Set measurement window weights. */
+	write(priv, mod->base + HIST_WEIGHT_00TO30_REG,
+	      RPPX1_HIST_WEIGHT(cfg->weights[0], cfg->weights[1],
+				cfg->weights[2], cfg->weights[3]));
+	write(priv, mod->base + HIST_WEIGHT_40TO21_REG,
+	      RPPX1_HIST_WEIGHT(cfg->weights[4], cfg->weights[5],
+				cfg->weights[6], cfg->weights[7]));
+	write(priv, mod->base + HIST_WEIGHT_31TO12_REG,
+	      RPPX1_HIST_WEIGHT(cfg->weights[8], cfg->weights[9],
+				cfg->weights[10], cfg->weights[11]));
+	write(priv, mod->base + HIST_WEIGHT_22TO03_REG,
+	      RPPX1_HIST_WEIGHT(cfg->weights[12], cfg->weights[13],
+				cfg->weights[14], cfg->weights[15]));
+	write(priv, mod->base + HIST_WEIGHT_13TO43_REG,
+	      RPPX1_HIST_WEIGHT(cfg->weights[16], cfg->weights[17],
+				cfg->weights[18], cfg->weights[19]));
+	write(priv, mod->base + HIST_WEIGHT_04TO34_REG,
+	      RPPX1_HIST_WEIGHT(cfg->weights[20], cfg->weights[21],
+				cfg->weights[22], cfg->weights[23]));
+	write(priv, mod->base + HIST_WEIGHT_44_REG,
+	      RPPX1_HIST_WEIGHT(cfg->weights[24], 0, 0, 0));
+
+	write(priv, mod->base + HIST_MODE_REG, cfg->mode);
+	write(priv, mod->base + HIST_COEFF_R_REG, cfg->coeff[0]);
+	write(priv, mod->base + HIST_COEFF_G_REG, cfg->coeff[1]);
+	write(priv, mod->base + HIST_COEFF_B_REG, cfg->coeff[2]);
+
+	u32 sample_reg = FIELD_PREP(HIST_SAMPLE_RANGE_SAMPLE_SHIFT_MASK,
+				    cfg->sample_shift) |
+			 FIELD_PREP(HIST_SAMPLE_RANGE_SAMPLE_OFFSET_MASK,
+				    cfg->sample_offs);
+	write(priv, mod->base + HIST_SAMPLE_RANGE_REG, sample_reg);
+
+	write(priv, mod->base + HIST_FORCED_UPDATE_REG, 1);
+
+	return 0;
+}
+
+static int rppx1_hist_fill_stats(struct rpp_module *mod,
+				 union rppx1_stats_block *block)
+{
+	struct rppx1_hist_stats *stats = &block->hist;
+
+	for (unsigned int i = 0; i < RPPX1_HIST_NUM_BINS; i++)
+		stats->hist_bins[i] = rpp_module_read(mod, HIST_BIN_REG(i));
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_hist_ops = {
 	.probe = rppx1_hist_probe,
+	.fill_params = rppx1_hist_fill_params,
+	.fill_stats = rppx1_hist_fill_stats,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 6864df2d4436..934e18731b08 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -82,6 +82,9 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST: MAIN_POST White Balance Gains
  * @RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1: PRE1 pipe Exposure Measurement
  * @RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE2: PRE2 pipe Exposure Measurement
+ * @RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1: PRE1 pipe Histogram Measurement
+ * @RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2: PRE2 pipe Histogram Measurement
+ * @RPPX1_PARAMS_BLOCK_TYPE_HIST_POST: POST pipe Histogram Measurement
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -90,6 +93,9 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST,
 	RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1,
+	RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_HIST_POST,
 };
 
 /**
@@ -243,6 +249,87 @@ struct rppx1_exm_params {
 	__u8 reserved[3];
 };
 
+/* Histogram */
+#define RPPX1_HIST_WEIGHT_GRIDS_SIZE 25
+
+/**
+ * enum rppx1_hist_mode - Histogram measurement mode
+ *
+ * Histogram measurement mode. Select which channel or combination of channels
+ * the histogram measurement is performed on.
+ *
+ * @RPPX1_HIST_MODE_DISABLE: histogram disabled
+ * @RPPX1_HIST_MODE_RGB_COMBINED: combined RGB histogram
+ * @RPPX1_HIST_MODE_R_HISTOGRAM: red channel histogram
+ * @RPPX1_HIST_MODE_GR_HISTOGRAM: green/red channel histogram
+ * @RPPX1_HIST_MODE_B_HISTOGRAM: blue channel histogram
+ * @RPPX1_HIST_MODE_GB_HISTOGRAM: green/blue histogram
+ */
+enum rppx1_hist_mode {
+	RPPX1_HIST_MODE_DISABLE,
+	RPPX1_HIST_MODE_RGB_COMBINED,
+	RPPX1_HIST_MODE_R_HISTOGRAM,
+	RPPX1_HIST_MODE_GR_HISTOGRAM,
+	RPPX1_HIST_MODE_B_HISTOGRAM,
+	RPPX1_HIST_MODE_GB_HISTOGRAM,
+};
+
+/**
+ * struct rppx1_hist_params - Histogram measurement configuration
+ *
+ * The RPP-X1 Histogram measurement unit is available on the PRE1, PRE2 and
+ * MAIN_POST pipes. Userspace selects which pipe to operate by setting the
+ * @header.type field to RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1,
+ * RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2 or
+ * RPPX1_PARAMS_BLOCK_TYPE_HIST_POST.
+ *
+ * The histogram measurement point is selected using the @channel field while
+ * histogram measurement mode is selected using the @mode field.
+ *
+ * Histogram measurement is performed by programming subsampling factors using
+ * the @v_stepsize and @h_step_inc fields and by weighted windowing, by
+ * programming the size of the measurement window @wnd with @weights associated
+ * to each cell of the 5x5 measurement grid. Weights are represented as 5 bits
+ * integer values ranging from 0 to 16.
+ *
+ * The @last_line fields controls when the histogram measurement completes. It
+ * is usually programmed to the value of (@wnd.v_offs + @wnd.v_size - 1).
+ *
+ * Histogram values are calculated by applying a per-color channel coefficient
+ * represented as an 8 bits unsigned Q1.7 integer value. The @sample_offs and
+ * @sample_shift fields allow to reduce the color dynamic range on which
+ * histogram data are produced.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1,
+ *	    type = RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2 or
+ *	    type = RPPX1_PARAMS_BLOCK_TYPE_HIST_POST)
+ * @wnd: measurement window coordinates
+ * @last_line: line number for which the histogram measurement completes
+ * @v_stepsize: vertical subsampling divider, 7 bits
+ * @h_step_inc: horizontal subsampling step counter, 17 bits
+ * @sample_offs: sample offset, 24 bits
+ * @mode: histogram measurement mode (from enum rppx1_hist_mode)
+ * @channel_sel: histogram measurement point (see enum rppx1_meas_chan)
+ * @weights: weighting factors for each sub-window (5x5 grid)
+ * @coeff: R-G-B coefficients, 8 bits unsigned Q1.7
+ * @sample_shift: sample shift, 4 bits
+ * @reserved: padding
+ */
+struct rppx1_hist_params {
+	struct v4l2_isp_params_block_header header;
+	struct rppx1_window wnd;
+	__u32 last_line;
+	__u32 v_stepsize;
+	__u32 h_step_inc;
+	__u32 sample_offs;
+	__u8 mode;
+	__u8 channel_sel;
+	__u8 weights[RPPX1_HIST_WEIGHT_GRIDS_SIZE];
+	__u8 coeff[3];
+	__u8 sample_shift;
+	__u8 reserved;
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -255,7 +342,10 @@ struct rppx1_exm_params {
 	sizeof(struct rppx1_awbg_params)			+	\
 	sizeof(struct rppx1_awbg_params)			+	\
 	sizeof(struct rppx1_exm_params)				+	\
-	sizeof(struct rppx1_exm_params))
+	sizeof(struct rppx1_exm_params)				+	\
+	sizeof(struct rppx1_hist_params)			+	\
+	sizeof(struct rppx1_hist_params)			+	\
+	sizeof(struct rppx1_hist_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
@@ -274,11 +364,17 @@ struct rppx1_exm_params {
  * @RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST: post-fusion white-balance measurement
  * @RPPX1_STATS_BLOCK_TYPE_EXM_PRE1: pre-fusion pipe1 exposure measurement
  * @RPPX1_STATS_BLOCK_TYPE_EXM_PRE2: pre-fusion pipe2 exposure measurement
+ * @RPPX1_STATS_BLOCK_TYPE_HIST_PRE1: pre-fusion pipe1 histogram
+ * @RPPX1_STATS_BLOCK_TYPE_HIST_PRE2: pre-fusion pipe2 histogram
+ * @RPPX1_STATS_BLOCK_TYPE_HIST_POST: post-fusion histogram
  */
 enum rppx1_stats_block_type {
 	RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST,
 	RPPX1_STATS_BLOCK_TYPE_EXM_PRE1,
 	RPPX1_STATS_BLOCK_TYPE_EXM_PRE2,
+	RPPX1_STATS_BLOCK_TYPE_HIST_PRE1,
+	RPPX1_STATS_BLOCK_TYPE_HIST_PRE2,
+	RPPX1_STATS_BLOCK_TYPE_HIST_POST,
 };
 
 /**
@@ -317,6 +413,20 @@ struct rppx1_exm_stats {
 	__u32 reserved;
 };
 
+/* Histogram */
+#define RPPX1_HIST_NUM_BINS 32
+
+/**
+ * struct rppx1_hist_stats - Histogram statistics
+ *
+ * @header: block header (type = RPPX1_STATS_BLOCK_TYPE_HIST_POST)
+ * @hist_bins: accumulation histogram results in unsigned 20-bit Q16.4 format
+ */
+struct rppx1_hist_stats {
+	struct v4l2_isp_block_header header;
+	__u32 hist_bins[RPPX1_HIST_NUM_BINS];
+};
+
 /**
  * RPPX1_STATS_MAX_SIZE - Maximum size of all RPP-X1 statistics
  *
@@ -326,6 +436,9 @@ struct rppx1_exm_stats {
 #define RPPX1_STATS_MAX_SIZE						\
 	(sizeof(struct rppx1_wbmeas_stats)			+	\
 	sizeof(struct rppx1_exm_stats)				+	\
-	sizeof(struct rppx1_exm_stats))
+	sizeof(struct rppx1_exm_stats)				+	\
+	sizeof(struct rppx1_hist_stats)				+	\
+	sizeof(struct rppx1_hist_stats)				+	\
+	sizeof(struct rppx1_hist_stats))
 
 #endif /* __UAPI_RPP_X1_CONFIG_H */
-- 
2.55.0

