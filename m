Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FAB4446E9;
	Thu, 30 Jul 2026 17:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431623; cv=none; b=pCdwXehgGVEm8Zd7E5Qdp0t5JmXCIV6Y2+yVpkqiOeI8d9nM2KbSBoQMMzPaY6g5HnVb7+LOhi2M1zY9rbxWMH4wgQDcsXuMvCnt3TbN2a6S0QosBEidwtkUTr/WLz5ZHl3E+Bw3tICDSQ4PNCyCjrNqVeDc1Hx8Vx5xPJna+n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431623; c=relaxed/simple;
	bh=PlTc0A9phq2ITHNg2yqvfN6F4Tn0RRiN183zN6BjJtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ehnzteum/2bsch0P9lNYYdJMPJlod1IwJQvhm7PhQ1YVat03791HGNLVWmD8Ygblxfc/E/BO1hb8p4TqDwh7Lj9LZz+f60ZCVbW3LtHY26wrn8LfDFl3Ar7iY4beIiadgcHZWOnD5KcNIE9Rh2NGXvnz6nWuyEa1lnIqLD8VEKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=0hwRmxLB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=otxTp6lT; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="0hwRmxLB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="otxTp6lT"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AE6501400144;
	Thu, 30 Jul 2026 13:13:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 30 Jul 2026 13:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785431620;
	 x=1785518020; bh=IukYuqHH7bl/GA3jSzczbXWorMlOschPhzIEpKqn6rI=; b=
	0hwRmxLB645168pL3Hb9T6um5jvT+pQCuWvOf0o6DbqI5eZIERCh6YkVjXU1Jz6N
	UhfN2smo0LqWAnfrU0E8/Thop/u7jefBGZzPy/elTAozolc/0NnAa+EAFlKRh/Bg
	dxg9WNy7BAnXNDlktJhxqDrS1rh5X0DHrn61mm8Vy1Szlf19hS+IlGDGJsL1a/Ru
	o/nIHEMjgijJI+w83l+RBVlpbKSFywpSkMglJud7Ewqbq07iZVMWXOiFw5tYrRj2
	1bt3tgczUNsOZinhmPDPIcSIuY7qRMktSL5ia8QPSHkY8bDMMcleCLqBwNBtSTpW
	Pgkqub1FyJIgkSoAQHw+GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785431620; x=
	1785518020; bh=IukYuqHH7bl/GA3jSzczbXWorMlOschPhzIEpKqn6rI=; b=o
	txTp6lTHuRVJtbfurBW1ScL1Obj9WxpFv2Vj676KoHQhDkONZuLK80/FJ9jzcGBH
	d8YjPN/CSfo4e2sv3uawB5Iy4dNTGpIaoAUeMDPJOvbzjERWcKqnMjbhApj0PFnl
	XVzIWQMmNt7mjBy19DfonIiMZi0GZasAbC3ZDjbqKxuLgd8mhjxkWrY7CH+/RbPO
	Wf0nn6J52XE4yJN39AvWI1tVDt8x/sa9Dx4pgZC/rkbkNanUht6l1RPwFmuQBlDw
	plncCvCSD7w4EiICGcxK992etlMRm2E8ft8TEPDsP92ji6luEQGpfK38DNkxeVNV
	SfTBy4DyF0lAZiKv2on4g==
X-ME-Sender: <xms:RIZras8Yyjo38fXHoxG3tI9niPIbdYYwh0b77Ggi1spQzLL0h7cVNg>
    <xme:RIZragldD_ILWcKAJqLjzSTJ4FQ0ROSb887F7nYshhN6rx6CdPqxP9bWfgmCemtwI
    zEestMyYUoxQK0QHGRtxq2AmbOyBhPSlsF8AkjaYK4dFHXufYEQ_dXp>
X-ME-Received: <xmr:RIZravDNN0Dam_8bjFdm8CIJXmTIXxI0dibCufOm_s8R54XXhdQ0E-P6PUdKQ8geArY12XiXJM2-GFulbJhSwlkhKgpmk6M>
X-ME-Proxy-Cause: dmFkZTF07znR1cOvOBQn+EZER5ns3tmiMy5NUHQvdd5Z0fNrdMM9h7MbP7+GksfPtS7/1U
    pbvEAtzOYwe/VUfXgLXiTlfU5t/R1iCU6ZJEOsty3ubB5ehJqcum9OE7oGRRQDL9xfDRIK
    IJPzjqxA4ZdkREQiPshBlbxzbL60DrO4L2/LXxHcX43hG02n/xFutuZwyrFoUVQAOk2lSb
    UbuqpyeNpEtK89wcsLj4NzSX6CKqzD/RVhTRJVxLQiHW/zEDjblEQ73f+/OqAP/iQrvQhs
    4FsCqFhhBY6AH14Nv6+K2625maneF7QxlMpmX5gX9dknU7Q7/gZ7JLfYbad0TmjRWiCjTa
    Jg/IaeVnbGqFpTnyW5atHkA4FcuGi4ql7MqxEl7JRjjvX6+tLwg2UaIaT6c0624PE+SR60
    OU06WLmrFw/8/lbLpGzPoGiQdRlNA6ogrNUoxiS/G1DWfCiNF4gk1ETgCtWnfp/razm7o8
    jbxruyiQInlGVgjA7T2DgxffrvqKjHliLfRSexTsGXI6M9xWYARD8B7R5GU1PCWVZNOJqT
    G5ANiMHLUg5J2aFY5Qn2JbsoB6vGpc2yJajcNdhbxRHv8ReMWTbMWxv1tRGRzUxVoRJ23O
    VlPDvh3d8tmOX9HwjnkxOb7pLUvZfE+ktC91HRJAvDdeHtsACDLRZ33R73UQ
X-ME-Proxy: <xmx:RIZrahW6OTEaSoVv1Cha0HraNtSRQfyIXtBxgbtKc7wy9WQqdC-tZg>
    <xmx:RIZral9ScFyLi934yPdMo1maXJT7NFEtM7oBtCmtHZo_ed3hG3FqPA>
    <xmx:RIZrarSpFsqJrTgoyg46-PLIcVU-DCJdcMK_oTV8BPvprxKsBcJiNA>
    <xmx:RIZraiSQmDhWLOO8HZhkkdbjGK-VULJHKFyzokEHvcFpHJGDjfxBkg>
    <xmx:RIZrarLPTkBq5l7AwswwIqFnTYsv5NhQKdqkMv0SFSkbH7vWk8w0Iwa2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 13:13:39 -0400 (EDT)
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
Subject: [PATCH v11 06/13] media: rppx1: awbg: Add support for white balance gain settings
Date: Thu, 30 Jul 2026 19:12:34 +0200
Message-ID: <20260730171241.483870-7-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the white balance gain
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
 .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |  5 +++
 .../platform/dreamchip/rppx1/rppx1_awbg.c     | 32 +++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 40 ++++++++++++++++++-
 4 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 64a1b848f1ea..0e36b717b4ef 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -47,6 +47,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 
 union rppx1_params_block {
 	struct v4l2_isp_block_header header;
+	struct rppx1_awbg_params awbg;
 	struct rppx1_wbmeas_params wbmeas;
 };
 
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 7325abeba92a..17bbcf366970 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -17,6 +17,8 @@
 
 static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
+	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
+	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
 };
 
@@ -51,6 +53,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
+			module = &rpp->pre1.awbg;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
index 4a242b41142b..f30e12d6f880 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
@@ -26,6 +26,38 @@ static int rppx1_awbg_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_awbg_fill_params(struct rpp_module *mod,
+		       const union rppx1_params_block *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_awbg_params *cfg = &block->awbg;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + AWB_ENABLE_REG, 0);
+		return 0;
+	}
+
+	/*
+	 * RPP gains are 18-bit with 12 bit fractional part and 0x1000 = 1.0,
+	 * giving a possible range of 0.0 to 64.0. NOTE: RPP documentation is
+	 * contradictory this is the register definition, the function
+	 * description states 0x400 = 1.0 AND 18-bit with 12 fractional bits,
+	 * which is not possible...
+	 */
+
+	write(priv, mod->base + AWB_GAIN_GR_REG, cfg->gain_green_r);
+	write(priv, mod->base + AWB_GAIN_GB_REG, cfg->gain_green_b);
+	write(priv, mod->base + AWB_GAIN_R_REG, cfg->gain_red);
+	write(priv, mod->base + AWB_GAIN_B_REG, cfg->gain_blue);
+
+	write(priv, mod->base + AWB_ENABLE_REG, AWB_ENABLE_AWB_GAIN_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_awbg_ops = {
 	.probe = rppx1_awbg_probe,
+	.fill_params = rppx1_awbg_fill_params,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index f674b041664e..b388a9003d8b 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -47,9 +47,15 @@ struct rppx1_window {
  * NOTE: Only append to the enumeration as the numbers are uAPI.
  *
  * @RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST: AWB Measurement Configuration
+ * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1: PRE1 pipe White Balance Gains
+ * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2: PRE2 White Balance Gains
+ * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST: MAIN_POST White Balance Gains
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
+	RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1,
+	RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST,
 };
 
 /**
@@ -114,6 +120,35 @@ struct rppx1_wbmeas_params {
 	__u32 reserved3;
 };
 
+/**
+ * struct rppx1_awbg_params  - WB gain configuration
+ *
+ * The RPP-X1 White Balance Gain module is available in the PRE1 and PRE2
+ * pre-fusion pipes and in the MAIN_POST post-fusion pipe. Userspace selects
+ * which pipe to operate by setting the @header.type field to
+ * RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1, RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2
+ * or RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST.
+ *
+ * The White Balance module allows to specify per-color channel gains, expressed
+ * as unsigned fixed-point values as 18 bits unsigned integers in Q6.12 format
+ * with a maximum of 63.999.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1 or
+ *	    type = RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2 or
+ *	    type = RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST)
+ * @gain_red: gain for red component, 18-bit (unsigned Q6.12)
+ * @gain_green_r: gain for green component in red lines, 18-bit (unsigned Q6.12)
+ * @gain_blue: gain for blue component, 18-bit (unsigned Q6.12)
+ * @gain_green_b: gain for green component in blue lines, 18-bit (unsigned Q6.12)
+ */
+struct rppx1_awbg_params {
+	struct v4l2_isp_params_block_header header;
+	__u32 gain_red;
+	__u32 gain_green_r;
+	__u32 gain_blue;
+	__u32 gain_green_b;
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -121,7 +156,10 @@ struct rppx1_wbmeas_params {
  * multiple pipes.
  */
 #define RPPX1_PARAMS_MAX_SIZE						\
-	(sizeof(struct rppx1_wbmeas_params))
+	(sizeof(struct rppx1_wbmeas_params)			+	\
+	sizeof(struct rppx1_awbg_params)			+	\
+	sizeof(struct rppx1_awbg_params)			+	\
+	sizeof(struct rppx1_awbg_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.55.0

