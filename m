Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2C640FD86;
	Thu, 30 Jul 2026 17:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431630; cv=none; b=qo3zxkJBEzyUR2Llhvgs3MCA9ZRy/6Kg7j0iZalnMftQnWWGOHxOCNyb68hsBYvCcSMf8nQD3GbXGGPO17gxbMTBUHVldSz0FUSCDUdz9gYek8/0ugNfnCauefObzYPjmlkVHbceWuN45GTeXMlrV3qYWiBar20X5KBwpwLCVYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431630; c=relaxed/simple;
	bh=ymNEYJF6KqbNGJcu6SCEhN/juSz7Mvb4B1cB2t6c8V8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u4/k41M/ECkQ3RT9FsW0DwX6zByErBR2xDxbIjEtWVFQtfiJDpIZr07r0+2TJUE4c2Icn7FJTJonlWfIdVdoT7mVWsQyNLQmn8qnkv2n1KA8ibeS5KRxkBY7zBBBBdLXLnRZv765QlOpCD3awLQX3lmiqePhvFGp+WO2pWgzxuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=X4+4hUoI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cDC/x+gA; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="X4+4hUoI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cDC/x+gA"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 376D21400138;
	Thu, 30 Jul 2026 13:13:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Thu, 30 Jul 2026 13:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785431627;
	 x=1785518027; bh=QCz7p7j4tsg1qjIAF0+BLqDqN7VXNFoKovqcB7AGxQI=; b=
	X4+4hUoIbiq9rxiAMhcl6ra6W784fCtn3FSOrNXKOIXj5v9pexPTAHnM0OP2RXaU
	/nC6lk2kPfXVrazpcFiDRFbBbKP4brUEgUjx6+B0fzWe+WYPHOfdi9om5vjCoY+r
	gC8iSvBrTwc7yRUZN6OTGXJ6XDiJsyRSXuT2AFJb2PBSp5I3PFDbQGZ7FT3slbXw
	7W6MJFZKZvMssqx/ZJq9fyCJaUzBDSZS1wxf5NyjjmBoeRRDnSGaZLBpr1NJk1+P
	Ib/icIgnH7sScw/hUI9+4cjUQOHxavvJZ6LCr26/Uliot5sTNAniS/Ok6jfBhgil
	pXonjJ6TQdrvVsx5JufzhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785431627; x=
	1785518027; bh=QCz7p7j4tsg1qjIAF0+BLqDqN7VXNFoKovqcB7AGxQI=; b=c
	DC/x+gASa1N2DX+z7OghOi8nIDlgo3h4ogmWvNVz9odS/Qw7upRyz8qnWymUcGC5
	/5hShkB2VkqQVKsfQf+o6MGHdOXSptUp9ZWYDzErqQPBGXMJ1hxLhZBIJXcjqZ6D
	6CsTpuI7EA0hJN8DzIABZ+G7AJelSMl2tG/ZNIjyJb4OCTfhPHHNetGRgx0ZpTE0
	bsEnxpbM2I945nZKl4KxCaN8RabuwYLxzVbWD1kRlI3ozDdheYXCHNjjjmrKli/0
	FUcROrkv6F+bItdVcMYPvSLcHQw1ZvsTsvNEWJB9Cm6P8fKmMAs0xsuxyTz6RQwM
	XdkNRP4Q0PzXQwBYLkKng==
X-ME-Sender: <xms:S4ZralN0BfR4gvzlCBHj0RPXBwFfiysWsaOymUan06ki3yganlcBFg>
    <xme:S4Zraj3sPfqFBsKHTQDZ-whRiu8s9S0usel3pgpVP4naQAcJsXqnxpnGNU1k8EZyS
    I_mxUWkrzxS7uP6egezL9zj3zPLPyOOiyaY8uP066MZ-bQ0Rg9BKA3a>
X-ME-Received: <xmr:S4ZrahR_o6zuZWTmsK4rvRJCiXuCJVBz9vQAwnvCMUl4A_BPsoCwd3YT-bYq9-tNLSDBVxya7Qx9XP-fVuL8pY2kPU98C9M>
X-ME-Proxy-Cause: dmFkZTELvaJeUFAo6Jk93Ho1ClBxVgpyoTLZkiyVj369qIETlF2YVab2bC/ct6ZiUv2xk5
    p1wkG/z57/Xb5mUpDOjy5MQhivvd1iHTrDPFtB1mkBSneF20kCkLnGZhSwh2zgIZV3NY7p
    bIg59jXFjiTumrJhCj4qsRTbQL/Lj267EAfnxlYAv42uUkTjUG6+yGtp3aK8Shk1gxDN32
    IiJPHC10NWd3Vl1To57EMBeNO1HvC6ug7xjCIiLINjpCi7HPWp3yfrx0EsW4aH0fgigiWW
    DrKaQ/l6p6CA6m/EgKlaAEke5q5uW/U9j1Q0AM//2rQ6m7Nc6qXAwFH7a7irApaI0QrvYP
    5ZC188HhiRlcfYs/EVv7pY+AvfHjQ1Bf/hpkIRhLuI8XcRz8dJRdif2hl9YrVHI7I2kyMv
    PcKzPJV9xpIj9J03IK27aqOCvLKPtXJCYJY84XJ5br+IVWNE90+/3gO2Fh7VwDikDoUUMP
    GcUwFLCGIjq3P0WdXi3OAWBJp4rHsHWDKgLuPS4gBAZIgOarI8PIsJEVdTOwYMp9dJwck+
    CPu9MfcnY5uhTHmPoB6sr+bkgF6C5T5HzU5gKof1NkNYqLmkXOEcoGQZqUWu/xbmS3hWA7
    Yij4x88KCqu8v/zkDFOhQoO4fJrhbq7HYO6W/0UCJY0ZimuIBqBP8eDBf92A
X-ME-Proxy: <xmx:S4Zraml-aqENT4i_AUZVxkp2Exl-FO4WxBXpYmVi7IkLPfXNU8FVsw>
    <xmx:S4ZraiNiB8fDYzHDFarGBOs0LB0fGX0ieYtlRI9kOVukhuBvdq53rw>
    <xmx:S4Zraih4QmV3lQHDYldyYylOwjCjir2kN3SrEflzuCZEaBT5uIoO9g>
    <xmx:S4Zraoivq5APmwdicbToAPyKsFYpK3a2kL3Qbyh2aooId-xjMyU-zg>
    <xmx:S4ZraqaxT4ElqBImb1mBVmvUdhotL_jl9xum-i4qLAoe7QLAPt9sUk_C>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 13:13:46 -0400 (EDT)
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
Subject: [PATCH v11 09/13] media: rppx1: bls: Add support for black level compensation
Date: Thu, 30 Jul 2026 19:12:37 +0200
Message-ID: <20260730171241.483870-10-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the black level measurement
and gain configuration. It uses the RPPX1 framework for parameters and
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
 .../platform/dreamchip/rppx1/rpp_module.h     |   1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
 .../platform/dreamchip/rppx1/rppx1_bls.c      |  97 ++++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 107 +++++++++++++++++-
 4 files changed, 209 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index b134d140fe22..5e20fcdcbcc4 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -47,6 +47,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 
 union rppx1_params_block {
 	struct v4l2_isp_block_header header;
+	struct rppx1_bls_params bls;
 	struct rppx1_awbg_params awbg;
 	struct rppx1_hist_params hist;
 	struct rppx1_exm_params exm;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 975ce3a42fb5..831cf7ca154c 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -17,6 +17,8 @@
 
 static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
+	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE1, bls),
+	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
@@ -58,6 +60,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
+			module = &rpp->pre1.bls;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
 			module = &rpp->pre1.awbg;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
index 882a9a819229..01a61db279bf 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
@@ -6,6 +6,7 @@
  */
 
 #include "rpp_module.h"
+#include "rppx1.h"
 
 #define BLS_VERSION_REG				0x0000
 
@@ -32,6 +33,8 @@
 #define BLS_B_MEASURED_REG			0x0040
 #define BLS_C_MEASURED_REG			0x0044
 #define BLS_D_MEASURED_REG			0x0048
+#define BLS_PRE1_FIXED_MASK			GENMASK(24, 0)
+#define BLS_PRE2_FIXED_MASK			GENMASK(12, 0)
 
 static int rppx1_bls_probe(struct rpp_module *mod)
 {
@@ -55,6 +58,100 @@ static int rppx1_bls_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static void
+rppx1_bls_swap_regs(struct rpp_module *mod, const u32 input[4], u32 output[4])
+{
+	static const unsigned int swap[4][4] = {
+		[RPP_RGGB] = { 0, 1, 2, 3 },
+		[RPP_GRBG] = { 1, 0, 3, 2 },
+		[RPP_GBRG] = { 2, 3, 0, 1 },
+		[RPP_BGGR] = { 3, 2, 1, 0 },
+	};
+
+	/* Swap to pattern used in our path, PRE1 or PRE2. */
+	struct rpp_module *acq = mod == &mod->rpp->pre1.bls ?
+		&mod->rpp->pre1.acq : &mod->rpp->pre2.bls;
+	enum rpp_raw_pattern pattern = acq->info.acq.raw_pattern;
+
+	for (unsigned int i = 0; i < 4; ++i)
+		output[i] = input[swap[pattern][i]];
+}
+
+static int
+rppx1_bls_fill_params(struct rpp_module *mod,
+		      const union rppx1_params_block *block,
+		      rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_bls_params *cfg = &block->bls;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + BLS_CTRL_REG, 0);
+		return 0;
+	}
+
+	u32 ctrl = BLS_CTRL_BLS_EN;
+
+	if (cfg->mode == RPPX1_BLS_MODE_FIXED) {
+		static const u32 regs[] = {
+			BLS_A_FIXED_REG,
+			BLS_B_FIXED_REG,
+			BLS_C_FIXED_REG,
+			BLS_D_FIXED_REG,
+		};
+		u32 swapped[4];
+
+		rppx1_bls_swap_regs(mod, regs, swapped);
+
+		/*
+		 * The PRE1 pipe fixed values are 24-bits + 1 sign bit, while
+		 * the PRE2 pipe values are 12-bits + 1 sign bit.
+		 */
+		u32 mask;
+
+		switch (cfg->header.type) {
+		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
+			mask = BLS_PRE1_FIXED_MASK;
+			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2:
+			mask = BLS_PRE2_FIXED_MASK;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		write(priv, mod->base + swapped[0], cfg->fixed.a & mask);
+		write(priv, mod->base + swapped[1], cfg->fixed.b & mask);
+		write(priv, mod->base + swapped[2], cfg->fixed.c & mask);
+		write(priv, mod->base + swapped[3], cfg->fixed.d & mask);
+	} else {
+		write(priv, mod->base + BLS_SAMPLES_REG, cfg->samples);
+
+		if (cfg->en_windows & RPPX1_BLS_WIN_EN_WIN1) {
+			write(priv, mod->base + BLS_H1_START_REG, cfg->window1.h_offs);
+			write(priv, mod->base + BLS_H1_STOP_REG, cfg->window1.h_size);
+			write(priv, mod->base + BLS_V1_START_REG, cfg->window1.v_offs);
+			write(priv, mod->base + BLS_V1_STOP_REG, cfg->window1.v_size);
+			ctrl |= BLS_CTRL_BLS_WIN1;
+		}
+
+		if (cfg->en_windows & RPPX1_BLS_WIN_EN_WIN2) {
+			write(priv, mod->base + BLS_H2_START_REG, cfg->window2.h_offs);
+			write(priv, mod->base + BLS_H2_STOP_REG, cfg->window2.h_size);
+			write(priv, mod->base + BLS_V2_START_REG, cfg->window2.v_offs);
+			write(priv, mod->base + BLS_V2_STOP_REG, cfg->window2.v_size);
+			ctrl |= BLS_CTRL_BLS_WIN2;
+		}
+
+		ctrl |= BLS_CTRL_BLS_MODE_MEASURED;
+	}
+
+	write(priv, mod->base + BLS_CTRL_REG, ctrl);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_bls_ops = {
 	.probe = rppx1_bls_probe,
+	.fill_params = rppx1_bls_fill_params,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 934e18731b08..0049977870ad 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -85,6 +85,8 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1: PRE1 pipe Histogram Measurement
  * @RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2: PRE2 pipe Histogram Measurement
  * @RPPX1_PARAMS_BLOCK_TYPE_HIST_POST: POST pipe Histogram Measurement
+ * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1: PRE1 pipe Black Level Subtraction
+ * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2: PRE2 pipe Black Level Subtraction
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -96,6 +98,8 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2,
 	RPPX1_PARAMS_BLOCK_TYPE_HIST_POST,
+	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1,
+	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2,
 };
 
 /**
@@ -330,6 +334,105 @@ struct rppx1_hist_params {
 	__u8 reserved;
 };
 
+/**
+ * struct rppx1_bls_fixed - BLS fixed subtraction values
+ *
+ * Fixed black level values subtracted from sensor data per Bayer channel.
+ * Negative values result in addition.
+ *
+ * The PRE1 pipe BLS module operates on a 24-bits input data and fixed black
+ * levels are stored as a signed 2's complement representation ranging from
+ * -2^24 to 2^24-1.
+ *
+ * The PRE2 pipe BLS module operates on a 12-bits input data and fixed black
+ * levels are stored as a signed 2's complement representation ranging from
+ * -2^12 to 2^12-1.
+ *
+ * Userspace is expected to provide fixed black level values with a bit-depth
+ * matching the one of pipe in use.
+ *
+ * These subtraction values are matched with the sensor native Bayer components
+ * ordering according to the cropping configuration on the input port.
+ *
+ * @a: subtraction value for channel A
+ * @b: subtraction value for channel B
+ * @c: subtraction value for channel C
+ * @d: subtraction value for channel D
+ */
+struct rppx1_bls_fixed {
+	__u32 a;
+	__u32 b;
+	__u32 c;
+	__u32 d;
+};
+
+/**
+ * enum rppx1_bls_mode - BLS subtraction mode
+ *
+ * Select if subtracted black level come from fixed or measured values.
+ *
+ * @RPPX1_BLS_MODE_FIXED: subtract fixed values
+ * @RPPX1_BLS_MODE_MEAS: subtract measured values
+ */
+enum rppx1_bls_mode {
+	RPPX1_BLS_MODE_FIXED,
+	RPPX1_BLS_MODE_MEAS,
+};
+
+/**
+ * enum rppx1_bls_win_en: BLS measurement configuration
+ *
+ * Select the measurement window to use for measured black level values.
+ *
+ * @RPPX1_BLS_WIN_EN_OFF: disable measurement
+ * @RPPX1_BLS_WIN_EN_WIN1: Enable measurement from window 1
+ * @RPPX1_BLS_WIN_EN_WIN2: enable measurement from window 2
+ * @RPPX1_BLS_WIN_EN_WIN12: enable measurement from window 1 and window 2
+ */
+enum rppx1_bls_win_en {
+	RPPX1_BLS_WIN_EN_OFF,
+	RPPX1_BLS_WIN_EN_WIN1,
+	RPPX1_BLS_WIN_EN_WIN2,
+	RPPX1_BLS_WIN_EN_WIN12,
+};
+
+/**
+ * struct rppx1_bls_params - RPP-X1 Black Level Subtraction Module
+ *
+ * The RPP-X1 Black Level Subtraction module is available on the PRE1 and PRE2
+ * pre-fusion pipes. Userspace selects which pipe to operate by setting the
+ * @header.type field to RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1 or
+ * RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2.
+ *
+ * The BLS module operates on fixed or measured data according to the setting of
+ * the @mode field. When RPPX1_BLS_MODE_FIXED is used userspace shall provide
+ * the per-channel black levels in @fixed. When RPPX1_BLS_MODE_MEAS is used
+ * userspace shall configure the measurement windows @window1 and optionally
+ * @window2 to select the optically black pixels region in the input frame. The
+ * @samples fields controls how many measure samples are used for averaging the
+ * measured black levels.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1 or
+ *	    type == RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2)
+ * @window1: BLS measurement window 1 (14 bits)
+ * @window2: BLS measurement window 2 (14 bits)
+ * @fixed: fixed subtraction values (see enum rppx1_bls_fixed)
+ * @mode: BLS subtraction mode (see enum rppx1_bls_mode)
+ * @en_windows: BLS measurement mode (see rppx1_bls_win_en)
+ * @samples: log2 of the number of measured pixels per Bayer position
+ * @reserved: padding
+ */
+struct rppx1_bls_params {
+	struct v4l2_isp_params_block_header header;
+	struct rppx1_window window1;
+	struct rppx1_window window2;
+	struct rppx1_bls_fixed fixed;
+	__u8 mode;
+	__u8 en_windows;
+	__u8 samples;
+	__u8 reserved[5];
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -345,7 +448,9 @@ struct rppx1_hist_params {
 	sizeof(struct rppx1_exm_params)				+	\
 	sizeof(struct rppx1_hist_params)			+	\
 	sizeof(struct rppx1_hist_params)			+	\
-	sizeof(struct rppx1_hist_params))
+	sizeof(struct rppx1_hist_params)			+	\
+	sizeof(struct rppx1_bls_params)				+	\
+	sizeof(struct rppx1_bls_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.55.0

