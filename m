Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F104418EC;
	Thu, 30 Jul 2026 17:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431632; cv=none; b=FCinDeFMZL+0rcSB9Xw5H1DyID71vNwCXuOJPF9jAq1Ic6NZP891jzZpiyTeIEn5MvyOWKlClyeiNSELcQXPFPa/Y6wZH3edBR7+c1aA0re/XQhG05FmyqWVucEhKwoEv2M2GxMqFVNOwAIzw2eEVWtJLGBdfISYxxsd3PEEhf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431632; c=relaxed/simple;
	bh=K3LfQ8iK6urTGA/NwlyLm6Dtlf8Xo1CZ1Kk2P8dJTK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oqvDIXcbknDuSxDyL6fHqWVOMMrINYB0rA5CVd09xHGkYgkqIm6vPtA+krBXVclNLni6PwdoMpjeclPmxsS0X1TZw/mLCJvJkwcBJqXNoSXA7pSsaQIsBR+is3AuSLsU36t+gzVGA+cP3vfUp4lQRkViSYI0JVqUMd6EzQ8ZMME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=xR1XGn/v; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=k5eSZCUU; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="xR1XGn/v";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="k5eSZCUU"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 59AD4EC01D5;
	Thu, 30 Jul 2026 13:13:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 30 Jul 2026 13:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785431629;
	 x=1785518029; bh=f7LUM3UhcJZoXYjPfq1LdeXrw59TYDk+njKw7uEl6FM=; b=
	xR1XGn/vFB1e1nybv8pIr6MIwYX4r9Zcsxip2iq/U8YsBgCi8QmZgfmXdmwFRKxD
	xNXfOwiH/9Yf0fAnWQGCBh02ry2ikMH8Ijlrfp1pBKnDHCvN3H4YTdL1NG1zeigL
	K8DOvngw+mmnz3a2CR3ny5ARtxL0weAvZFNpUWKFi1AW0gej2y+AVWPQ1iFViPtY
	QjNZI1hRVfM5L14CK+MCAMYXSI/yqOTOSo/cpkvegCrobi2vG2HOuKMS35BPZZfs
	upMZviOfPL1W6iFSDi6n61VixPoFuSk9fl9uXBpkpYBOsuFy3b+LJ556C+mOvhgI
	G+B16PFJBuji52ltzz4D+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785431629; x=
	1785518029; bh=f7LUM3UhcJZoXYjPfq1LdeXrw59TYDk+njKw7uEl6FM=; b=k
	5eSZCUU+k2DTWkB8g9Zk3OI0Kk6/T+8Yg0ZtkwvUA49B+iDVwv4ATVlTdbFP5Jv7
	KJtQRrtKGxItPsJOrGd2BtPiiMeVIFKzrT/jL08oJV6bgLTXHrDvF7k0/iTNjSi1
	S1cRejtTwI+eaY5YNFJFAmPS64sw14QFbiLaX6RDTQw/Jxt59uouTvSlP26uEqHz
	p3eWMEIZP5S3tl3Gc6wq1DrLi/EZgjLF5HUE9CzMPFKpBBuOr2LS57vCoAgYEliw
	Tse42nytzyoR4fXY8RU0yvBraYFyOQzjN4J5GzUMuK84BJpEMdsLr0yrQVRcMPtw
	4QcWhrXe2KVYSFYBkNtog==
X-ME-Sender: <xms:TYZrap53k--EB18DFd-4Fs3r0oKDBbJOj0-jO6Xa_wMogZZipZdNwQ>
    <xme:TYZraiy1zr-UyTYqA7JnLLHTWi3h42B-42seBXnqGNnTdeWEcaBv3T1F9HaAlJR4l
    dOIbku_eScCw-L8Vd_YtczXhaB1sn8aW8ZvKIX3JKeQlyVtVmOlYt1Q>
X-ME-Received: <xmr:TYZratfGI14LQhS9R47KbPTtozTOQVTtnQPnRmY33eind2RtDoY3WBbS5sNzWHFWJ9aLoxXR_YrLRJ6H6NgkpK9V1PaBZak>
X-ME-Proxy-Cause: dmFkZTFOq5HV7pFlivUgdPwPRAxGxbHRNTfy6vBVOHgod0zrgXGDmySPLFo7BpMftJCTJ/
    5TwiEW7PeT9yV09PmD5VscpYBiJirkn2nNabuXgdwB4L7X5kODY2a34jcjlRheXp3B+5Y5
    r1VYSnfxm2coLxYgvHLmWTyMHpg4x9bW2D7mJwV+m47uxhwh1/2p/xFLvVbzBf0z0FJue+
    j38Ign91JlbRZXPwc8X8tn/DXfA8q0gAV+jV3s6AcayiPfsDuAaZo5/Cs8yU9W5M60aUXE
    GEoJC63r1Ggz8UKsyRpWwtKQi4N4s0lqSK05ib71QZsvjvzPxbWIuyi8aZrouHMW2az1He
    haFnp/asO/ZEIaFBLRGZU3Cm+Zuj734YhxrnW3PupPCbkrFBgbQ2SeoRZywQMzm+BV7cPA
    eUo1MAYrVDLZd6W7PxanUkCJ2NHVBN86Xew6moKahAn02fwQg9xc5PPrFlJjMce+k1ggXm
    i3qTcbmshmBc5g77DA7a2GNiLZbZEcCy4uDrv/GQjwO+COgFUr9wub4qyD8R19Pa4qjC8B
    5Z/iOgUJkY7MuFVMapswUi8TnQuMb/k0wx5JoHRZYoYDSfV4ymkIRIt6WZWb9GXtV3p3i7
    PDrxg3CxzgFcdj6/lYCykMkdJ2mihWfqQEcYkvBQo2u93So/mhHC/LxXmuzQ
X-ME-Proxy: <xmx:TYZranA-Rrdkm2vjEsGID57tMpo0GfRBW3DKqkhkWTPbUb6_rwIyMQ>
    <xmx:TYZrah5vkpzVsP4vOMeYwH3aN260V6ZqMZCfmTD7weC8RnUh4l_O5w>
    <xmx:TYZrageBhOAjntmf4TiVG4l3CYACtrl5MhA_gtagoJEl4yyw7jqvYQ>
    <xmx:TYZranvQVe-QROxdo6VGVtsh9VIYNb_CdiuHE9-3HFW_a9mEvpN3UQ>
    <xmx:TYZraqGADl-uHOixq563P1ZgvBttMM_NhIU7m4OtM_GEfCqnnI-CiKbc>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 13:13:48 -0400 (EDT)
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
Subject: [PATCH v11 10/13] media: rppx1: ccor: Add support for color correction matrix
Date: Thu, 30 Jul 2026 19:12:38 +0200
Message-ID: <20260730171241.483870-11-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the color correction matrix
configuration parameters. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
* Changes since v10
- No holes and no implicit padding in UAPI structures. Work by Jacopo,
  big thanks!
---
 .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |  4 ++
 .../platform/dreamchip/rppx1/rppx1_ccor.c     | 61 +++++++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 30 ++++++++-
 4 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 5e20fcdcbcc4..e039746ac542 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -49,6 +49,7 @@ union rppx1_params_block {
 	struct v4l2_isp_block_header header;
 	struct rppx1_bls_params bls;
 	struct rppx1_awbg_params awbg;
+	struct rppx1_ccor_params ccor;
 	struct rppx1_hist_params hist;
 	struct rppx1_exm_params exm;
 	struct rppx1_wbmeas_params wbmeas;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 831cf7ca154c..a83d393d0504 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -21,6 +21,7 @@ rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
+	RPPX1_PARAMS_BLOCK_INFO(CCOR_POST, ccor),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE2, hist),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_POST, hist),
@@ -66,6 +67,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
 			module = &rpp->pre1.awbg;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST:
+			module = &rpp->post.ccor;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_HIST_POST:
 			module = &rpp->post.hist;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
index 3bfad3ba12e6..5ddc7edf6930 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
@@ -67,9 +67,70 @@ static int rppx1_ccor_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int
+rppx1_ccor_fill_params(struct rpp_module *mod,
+		       const union rppx1_params_block *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_ccor_params *cfg = &block->ccor;
+
+	/* If the modules is disabled, configure in bypass mode. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + CCOR_COEFF_REG(0), 0x1000);
+		write(priv, mod->base + CCOR_COEFF_REG(1), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(2), 0x0000);
+
+		write(priv, mod->base + CCOR_COEFF_REG(3), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(4), 0x1000);
+		write(priv, mod->base + CCOR_COEFF_REG(5), 0x0000);
+
+		write(priv, mod->base + CCOR_COEFF_REG(6), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(7), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(8), 0x1000);
+
+		write(priv, mod->base + CCOR_OFFSET_R_REG, 0x00000000);
+		write(priv, mod->base + CCOR_OFFSET_G_REG, 0x00000000);
+		write(priv, mod->base + CCOR_OFFSET_B_REG, 0x00000000);
+
+		return 0;
+	}
+
+	/*
+	 * Coefficient n for color correction matrix.
+	 *
+	 * RPP coefficients are 16-bit signed fixed-point numbers with 4 bit
+	 * integer and 12 bit fractional part ranging from -8 (0x8000) to
+	 * +7.9996 (0x7FFF). 0 is represented by 0x0000 and a coefficient
+	 * value of 1 as 0x1000.
+	 */
+	write(priv, mod->base + CCOR_COEFF_REG(0), cfg->coeff[0][0]);
+	write(priv, mod->base + CCOR_COEFF_REG(1), cfg->coeff[0][1]);
+	write(priv, mod->base + CCOR_COEFF_REG(2), cfg->coeff[0][2]);
+
+	write(priv, mod->base + CCOR_COEFF_REG(3), cfg->coeff[1][0]);
+	write(priv, mod->base + CCOR_COEFF_REG(4), cfg->coeff[1][1]);
+	write(priv, mod->base + CCOR_COEFF_REG(5), cfg->coeff[1][2]);
+
+	write(priv, mod->base + CCOR_COEFF_REG(6), cfg->coeff[2][0]);
+	write(priv, mod->base + CCOR_COEFF_REG(7), cfg->coeff[2][1]);
+	write(priv, mod->base + CCOR_COEFF_REG(8), cfg->coeff[2][2]);
+
+	/*
+	 * Offset for color components correction matrix.
+	 *
+	 * Values are a two's complement integer with one sign bit.
+	 */
+	write(priv, mod->base + CCOR_OFFSET_R_REG, cfg->offset[0]);
+	write(priv, mod->base + CCOR_OFFSET_G_REG, cfg->offset[1]);
+	write(priv, mod->base + CCOR_OFFSET_B_REG, cfg->offset[2]);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_ccor_ops = {
 	.probe = rppx1_ccor_probe,
 	.start = rppx1_ccor_start,
+	.fill_params = rppx1_ccor_fill_params,
 };
 
 static int rppx1_ccor_csm_start(struct rpp_module *mod,
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 0049977870ad..feea30585d4c 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -87,6 +87,7 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_HIST_POST: POST pipe Histogram Measurement
  * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1: PRE1 pipe Black Level Subtraction
  * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2: PRE2 pipe Black Level Subtraction
+ * @RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST: POST pipe Color Correction
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -100,6 +101,7 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_HIST_POST,
 	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST,
 };
 
 /**
@@ -433,6 +435,31 @@ struct rppx1_bls_params {
 	__u8 reserved[5];
 };
 
+/**
+ * struct rppx1_ccor_params - Color CORrection configuration
+ *
+ * The CCOR (Color Correction) module is available on the MAIN_POST pipe. It
+ * performs color space correction on a pixel-per-pixel basis using a 3x3 matrix
+ * of coefficients and per-color channel offsets.
+ *
+ * The matrix coefficients are represented as 16 bits signed fixed point values
+ * in Q4.12 format ranging from -8 to +7.999.
+ *
+ * The per-channel color offsets are represented as 2's complement values
+ * stored in 25 bits ranging from -16777216 to 16777215.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST)
+ * @coeff: color correction matrix coefficients, 16 bits signed Q4.12
+ * @reserved: padding
+ * @offset: R, G, B offsets, 2's complement 25 bits
+ */
+struct rppx1_ccor_params {
+	struct v4l2_isp_params_block_header header;
+	__u16 coeff[3][3];
+	__u16 reserved;
+	__u32 offset[3];
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -450,7 +477,8 @@ struct rppx1_bls_params {
 	sizeof(struct rppx1_hist_params)			+	\
 	sizeof(struct rppx1_hist_params)			+	\
 	sizeof(struct rppx1_bls_params)				+	\
-	sizeof(struct rppx1_bls_params))
+	sizeof(struct rppx1_bls_params)				+	\
+	sizeof(struct rppx1_ccor_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.55.0

