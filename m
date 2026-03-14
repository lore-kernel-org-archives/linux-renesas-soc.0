Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2519C38758E;
	Sat, 14 Mar 2026 22:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773526260; cv=none; b=CavA9xfDB6Z/YfVqaJdXqk49TsNlh8arq0bvkGFQkSImCQuYdbfsCFHdt+hyGSGIpRnqcqE1/fbC2CppnLz5/aHInFHoQerWKPgB3khYjCzX49rs5GL29/F4YvFv3kTFWvLx8pQarrBxnFCHsMaOT0gGRWcu+rrqiPRQ7zXoO4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773526260; c=relaxed/simple;
	bh=neWfBp/Tygjwze/C7SqP3mP6N6tLbxAHVrLkU0RdepY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Je1Dz5UTtnTjeSheGroLH58UM1CSYYsgvI+AVqzOGjjnXlI4glZ33HjSescnaS46tFy9uCQgRnhSrRwEXeJeECMEXndTEsQEatj6hpQ1SbODMN4ANnY58i5z+ES1setbRVAq1aucV5OSx676A9JvQ20nytNTRS/HeBe22SajK1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=hKKuvkQK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QBesmPEx; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="hKKuvkQK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QBesmPEx"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 6C25FEC0AEA;
	Sat, 14 Mar 2026 18:10:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 14 Mar 2026 18:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773526258;
	 x=1773612658; bh=vZEP4sdIqo4/yjprnNfk2K7m20ok84h0buYWMjlPk0E=; b=
	hKKuvkQKpcq8YPXqhapFnEXeB4VPuQCiqMKw+c6q5iGhsViI0hed1VxGwSpHvl6z
	SxPFeuuWrlxCMHTQ/6knRpIVvMOLk80BvnVvCwJ/Nx9gD12DS1GypL+APl/E+Ep9
	AOQnh1ewCewUie/ed16ub8C60D14/cSH1L8EbNZkI+CxjByUVIgytgTYRtbL1uAo
	sslaYwL1WIYRxL2z3x4X0AZ9QDp/JoE5rU5j0e30F/jpP16A8T1jBpDWheaPkZIC
	fsHX4uyQHYfBOKVB/edlPWXJvDU+26VZ3zBNBHVmX9RFaIZKQdLR0W83PB4dfaC6
	b1mjm6deHJbuhRjSnAH//Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773526258; x=
	1773612658; bh=vZEP4sdIqo4/yjprnNfk2K7m20ok84h0buYWMjlPk0E=; b=Q
	BesmPExeUq2TIYn7uWVtIn1+CvvgvxoCjHtTAMuCMB50usvwkaxl1bimngFs7VhJ
	w3T+AC9Nx35mwcYfzLxGCC/ipUIqDTPWLgbH6wkrwwFUKdUPcwsFnLCtgJQG7OZX
	L0WcQ7Amy+g951VdgRQaqwk50YEGq1a9ogzUKQ0YBEEn3w6Z0zAYxGQmQlRA8Q0p
	RmNu+TcG0YJrIpSHi+hx5wfl1Nu3kGNObJiP+Ozk9+nRtrI7nLdJs5m2Q66ByHq2
	iiWRveW/QPyqJFEEI7hoQnGyZyaIT3xwY7Jmu7y1AHV6Ae8U1vpltq0PiBntvj/v
	z3O4mlg7J6ZCK4+pPNQhA==
X-ME-Sender: <xms:8ty1aZWiH-sR2e91bMn_Oz7WxeahT1QrghHlqVLpB-hWfA_ACAUlOw>
    <xme:8ty1aaDNh7ET05fjypJsdsFVyKf2qxT2oWj7lGZ3Hnj_bkLC-NBIXEn28FLlrHo-2
    C9Xp_fsUeFM5OlMXLmrXRxSsLT2ODadWQWoOz7j64DF9i5aCN2coj0>
X-ME-Received: <xmr:8ty1aWFJF7JTyXzXyEdusyCsEvzLreSxRv5CiejNC3a2BvObKD5qRR0bs_TxRyPNT4CzkQzI1L89eaSCMVuzUGiz4knttKOoU7vn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleefjeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehkuhhnihhnohhrihdrmhhorhhimhhothhordhggiesrhgvnhgvshgrshdrtg
    homhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgu
    rdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsoh
    hnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhrtghpthhtohep
    mhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmhgrihhlsghogidrohhrgh
X-ME-Proxy: <xmx:8ty1aT5LD_vptIigSgSUWFNzAu1gRPV3oyZY7PDVmVyxb7vK9gf2iw>
    <xmx:8ty1aUn26jfCTlYMSmrprL_dlcXVSsYIrsWJt3b4B23373GHipqD5w>
    <xmx:8ty1aW50EXJjFLk_UvjVMXyJFXJfH14K6EMdJqqhvTpHSDywvuLMBw>
    <xmx:8ty1adQ-j1Um6l7VUk256DzIdc7dQSUrCPk3zuSxh4URyAlFcBf6kA>
    <xmx:8ty1aTaonW_MN78oForHD0qA8H0lzujOnYDMLV_HczDhxauZ8KLniMmC>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Mar 2026 18:10:57 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: [PATCH v6 04/12] media: rppx1: Add support for AWB gain settings
Date: Sat, 14 Mar 2026 22:59:36 +0100
Message-ID: <20260314215944.3674865-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314215944.3674865-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260314215944.3674865-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the RPPX1 driver to allow setting the AWB gains using the RkISP1
parameter buffer format. This is the second function block inside the
RPPX1 to be enabled and it uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how (and when)
configuration is applied to the RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |  4 ++
 .../platform/dreamchip/rppx1/rppx1_awbg.c     | 37 +++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index bc1ade8821cc..92f16e139ee4 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -16,6 +16,7 @@
 
 static const struct v4l2_isp_params_block_type_info
 rkisp1_ext_params_blocks_info[] = {
+	RKISP1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
 	RKISP1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
 };
 
@@ -51,6 +52,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN:
+			module = &rpp->pre1.awbg;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
index e20bc369ca8c..da5ae3cfadb8 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
@@ -25,6 +25,43 @@ static int rppx1_awbg_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_awbg_param_rkisp1(struct rpp_module *mod,
+			const union rppx1_params_rkisp1_config *block,
+			rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_awb_gain_config *cfg = &block->awbg;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + AWB_ENABLE_REG, 0);
+		return 0;
+	}
+
+	/*
+	 * RkISP1 gains are 10-bit with 8 bit fractional part and 0x100 = 1.0,
+	 * giving a possible range of 0.0 to 4.0.
+	 *
+	 * RPP gains are 18-bit with 12 bit fractional part and 0x1000 = 1.0,
+	 * giving a possible range of 0.0 to 64.0. NOTE: RPP documentation is
+	 * contradictory this is the register definition, the function
+	 * description states 0x400 = 1.0 AND 18-bit with 12 fractional bits,
+	 * which is not possible...
+	 *
+	 * Map the RkISP1 value range (0.0 - 4.0) by left shifting by 4.
+	 */
+
+	write(priv, mod->base + AWB_GAIN_GR_REG, cfg->config.gain_green_r << 4);
+	write(priv, mod->base + AWB_GAIN_GB_REG, cfg->config.gain_green_b << 4);
+	write(priv, mod->base + AWB_GAIN_R_REG, cfg->config.gain_red << 4);
+	write(priv, mod->base + AWB_GAIN_B_REG, cfg->config.gain_blue << 4);
+
+	write(priv, mod->base + AWB_ENABLE_REG, AWB_ENABLE_AWB_GAIN_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_awbg_ops = {
 	.probe = rppx1_awbg_probe,
+	.param_rkisp1 = rppx1_awbg_param_rkisp1,
 };
-- 
2.53.0

