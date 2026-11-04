Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795321;
	b=tKYfMx3JqJSe4HrBclpHtnRtpJ2KEJhqktPTqKfXhP0xvxx/ydQVKmQnRdUU7NSo1o+j
	 W5Ofka18AmALYJQeVed82rHm+265zxh5hXbzT+MBHQgfiMS1o+XaElal35Bj5+AVcuWsn
	 UoJc5bdNTEdxt8vEa0bcf4JWby41TTEXWdJB8aD8Uru49YEuXj2/mtJTgEiF+y9QIy9KJ
	 KmnOaRvrwlcsx6U6F9f/7EPvwitKtZNSQSDADu18jC3EfYiVSqpZbExuprZnRoXDD9i43
	 X1fT7KTvQ9PZ5xGhudOAfXNqo20ofTqbGFI5B4EWwMnwsZsjqSFwsz5RWec+Ya9UaCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795321;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=kM2SMyspeahVuUUX/fotL58v0RXNq/hWyadwMGqM/Vw=;
	b=R9VL8KEPRWogx9Yw3xeeHCtqn0lLopXgZzV7f8KNPX7W4RHDJzQt3QPs4QvVe+SMs7qb
	 ++DsMqoBV0+JzKdSmUvo1q0iMfOdGuWEACKOiNnThWC2UMRtH1Xvk1Zuiktp2Yrb/jlmq
	 c4pWAUEmNBVX70Ak0RI19QQ/nTaiqQtPpo4U7vNq+2CQYJdC8Bp7s0VhbOlH4iY16+hTk
	 A0oOKVL0ERe1MGHGgDs/lt+WC9kZFkwG5xCOWjLoMiR8Gh/p5Ynv9sO5/r2ey6GQ+2FaK
	 WTxiALal+73Os5w7un+1QvJUAjH5+DFDaO6kso5f8H0QQuPtLxTusOA0Imvhr1IHqWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=eR8n2VYj;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296DB606A331;
	Wed,  4 Nov 2026 12:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 296DB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=eR8n2VYj
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E317229D;
	Wed,  4 Nov 2026 13:26:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793795178;
	bh=ltdCNDPrIvBZM1IXM5E37lxQxzRiVtCeqvIPJqSwsYE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eR8n2VYjheaFHJWj5L766p7y7K3Tak+jDoYnD900zVghfjc+TY+46f0WHc90h2LTm
	 RR+BM+tvf95NwAwyFEI8Ouiq7xfdOe2LFYBn9mqJUVOfWstbhMVDaG9OXQ/z5/nyLD
	 KoGCdkUtOLtEKO+Pgiyi/C7sLOJN7NtpunVZRER8=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 04 Nov 2026 12:28:20 +0000
Subject: [PATCH 5/7] media: v4l2-isp: Add v4l2_isp_params_for_each_block()
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-v4l2-isp-resume-v1-5-06aeb8cf2940@ideasonboard.com>
References: <20261104-v4l2-isp-resume-v1-0-06aeb8cf2940@ideasonboard.com>
In-Reply-To: <20261104-v4l2-isp-resume-v1-0-06aeb8cf2940@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7302;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=ltdCNDPrIvBZM1IXM5E37lxQxzRiVtCeqvIPJqSwsYE=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6yTvnl4A37Ghp44Hmr1y2W//6eDyPqfblWa6D
 SoBRRJZ3qWJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCausk7wAKCRDISVd6bEV1
 MiymD/9J6qc+bXEerd6BO/Co4hlbWXkFQI3j2oAfwtWmnrG2W7VWW0PUfxZo9xKbV+GRtRxh/VW
 RB4siAkS82Pup+WxS8KPYCzrPmJjD/iMnts53/l4YAA7Yjcw0fvcpxltGnGt85NwQ0MAqsP9hWY
 ojqyXcBSXec3N5BNRSVvnxoUY78hrfRdgmdlpWc8TzsX+9nZA7FryNBk52HCwsNWc3sEMMf1/tz
 Dx/WG38Lz2IWgxFGb1SW1T46SjNGk823UH2qiE4KrNg/ZES0D0lmpy69XXHiPt5YJPrg0fzAGka
 pVARCsCG7N2RVI8T1MzEpkYtAk4rU5RE1P2BvmSmlBG4PxD/6BUBfuWftwgMb1Cu/lQGxJLm2LU
 xbpgqznigS4H35sk6Ecde7bAliB0R1mppFzsrQ4UYy5y4FIWVH95jzAIG705z7dSWGM+NqrZqO6
 feOOMMW/eq8Y+sF0BrLN8yQFL5FZuArMBjHUqYWbPI1XakVXtG3Flq42CK8lWScF28SkrT9+b4k
 3Zf+T2y5dXz+bPnZTGlXKbA9S4eVYrLdz2XtTBDM09tt7UamGr8b0suXBAdP1VfBxOmFugw0S6d
 dMLLMu3Rn2sMQzVGdOhoRrPjuts9ssdxqHeKE4TBZxhgPx2QgQIossPYil+vqjboBxTFOdMgtcj
 CXQcyKX1UD+p6JQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

ISP drivers using the V4L2 extensible parameters need to iterate
through parameter blocks in a buffer. Currently they all open code
this operation. Add a macro that can be used instead.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c  |  9 +++------
 drivers/media/platform/arm/mali-c55/mali-c55-params.c  | 11 +++--------
 drivers/media/platform/dreamchip/rppx1/rpp_params.c    | 10 ++++------
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c |  8 +++-----
 include/media/v4l2-isp.h                               | 15 +++++++++++++++
 5 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index f0b330520f97ad3bb701de3aed35670158508829..8ef8df7c033219eb11e7e9d8838c37a817153eb6 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -594,23 +594,20 @@ static_assert(ARRAY_SIZE(c3_isp_params_handlers) ==
 static void c3_isp_params_cfg_blocks(struct c3_isp_params *params)
 {
 	struct c3_isp_params_cfg *config = params->buff->cfg;
-	size_t block_offset = 0;
+	struct v4l2_isp_params_block_header *header;
 
 	if (WARN_ON(!config))
 		return;
 
 	/* Walk the list of parameter blocks and process them */
-	while (block_offset < config->data_size) {
+	v4l2_isp_params_for_each_block(config, header) {
 		const union c3_isp_params_block *block;
 		c3_isp_block_handler block_handler;
 
-		block = (const union c3_isp_params_block *)
-			 &config->data[block_offset];
+		block = (const union c3_isp_params_block *)header;
 
 		block_handler = c3_isp_params_handlers[block->header.type];
 		block_handler(params->isp, block);
-
-		block_offset += block->header.size;
 	}
 }
 
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 7b9d2650ce8730ccc05eee0c9dc33a88d022acf1..809a3587a5eee4d9817e720ae24e37f5f54397c0 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -817,10 +817,9 @@ static const struct vb2_ops mali_c55_params_vb2_ops = {
 void mali_c55_params_write_config(struct mali_c55 *mali_c55)
 {
 	struct mali_c55_params *params = &mali_c55->params;
+	struct v4l2_isp_params_block_header *header;
 	struct v4l2_isp_params_buffer *config;
 	struct mali_c55_params_buf *buf;
-	size_t block_offset = 0;
-	size_t max_offset;
 
 	spin_lock(&params->buffers.lock);
 
@@ -836,24 +835,20 @@ void mali_c55_params_write_config(struct mali_c55 *mali_c55)
 	buf->vb.sequence = mali_c55->isp.frame_sequence;
 	config = buf->config;
 
-	max_offset = config->data_size;
-
 	/*
 	 * Walk the list of parameter blocks and process them. No validation is
 	 * done here, as the contents of the config buffer are already checked
 	 * when the buffer is queued.
 	 */
-	while (max_offset && block_offset < max_offset) {
+	v4l2_isp_params_for_each_block(config, header) {
 		union mali_c55_params_block block;
 		mali_c55_params_handler handler;
 
-		block.data = &config->data[block_offset];
+		block.header = header;
 
 		/* We checked the array index already in .buf_queue() */
 		handler = mali_c55_params_handlers[block.header->type];
 		handler(mali_c55, block);
-
-		block_offset += block.header->size;
 	}
 
 	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index aff3f3a997b4134b753fd1e1faf2058216f4b939..b8468d5c0fe1c783216567fab3366024fd9fcc63 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -53,8 +53,8 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb,
 		 rppx1_reg_write write, void *priv)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct v4l2_isp_params_block_header *header;
 	struct v4l2_isp_buffer *cfg;
-	size_t block_offset;
 	int ret;
 
 	ret = v4l2_isp_params_validate_buffer_size(&rpp->isp, vb);
@@ -68,14 +68,12 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb,
 		return ret;
 
 	/* Walk the list of parameter blocks and process them. */
-	block_offset = 0;
-	while (block_offset < cfg->data_size) {
-		const union rppx1_params_block *block =
-			(const union rppx1_params_block *)&cfg->data[block_offset];
+	v4l2_isp_params_for_each_block(cfg, header) {
+		const union rppx1_params_block *block;
 		struct rpp_module *module;
 		int ret;
 
-		block_offset += block->header.size;
+		block = (const union rppx1_params_block *)header;
 
 		switch (block->header.type) {
 		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 8974c520d1879f3f0f642819a41984f6ac3ee01d..178da1f648869b7b963f634f29f5653cfb16dd77 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2291,19 +2291,17 @@ static void rkisp1_ext_params_config(struct rkisp1_params *params,
 				     struct rkisp1_ext_params_cfg *cfg,
 				     u32 block_group_mask)
 {
-	size_t block_offset = 0;
+	struct v4l2_isp_params_block_header *header;
 
 	if (WARN_ON(!cfg))
 		return;
 
 	/* Walk the list of parameter blocks and process them. */
-	while (block_offset < cfg->data_size) {
+	v4l2_isp_params_for_each_block(cfg, header) {
 		const struct rkisp1_ext_params_handler *block_handler;
 		const union rkisp1_ext_params_config *block;
 
-		block = (const union rkisp1_ext_params_config *)
-			&cfg->data[block_offset];
-		block_offset += block->header.size;
+		block = (const union rkisp1_ext_params_config *)header;
 
 		/*
 		 * Make sure the block is supported by the platform and in the
diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
index b758d9b0e7f5c29cd8c4197f4a4a86cf3e5334fc..5f13651b53d3c06fc676b32826daa68ad77b5cf6 100644
--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -31,6 +31,21 @@ struct vb2_buffer;
 #define v4l2_isp_buffer_size(max_size)			\
 	(offsetof(struct v4l2_isp_buffer, data) + (max_size))
 
+/**
+ * v4l2_isp_params_for_each_block - Iterate through parameter blocks in a buffer
+ * @buffer: Pointer to the &struct v4l2_isp_buffer to iterate over
+ * @header: Pointer to the &struct v4l2_isp_block_header to store each block in
+ *
+ * Users of the V4L2 extensible parameters will need to iterate over the blocks
+ * within a buffer. Rather than allow each driver to do that in a bespoke manner
+ * this helper should be used to ensure commonality.
+ */
+#define v4l2_isp_params_for_each_block(buffer, header)			\
+	for (size_t offset = 0;						\
+	     offset < (buffer)->data_size &&				\
+	     (header = (void *)&(buffer)->data[offset], true);		\
+	     offset += header->size)					\
+
 /**
  * struct v4l2_isp_params_block_type_info - V4L2 ISP params per-block-type info
  * @size: the block type expected size

-- 
2.43.0

