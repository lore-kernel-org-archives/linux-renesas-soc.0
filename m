Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795321;
	b=nVaeRdcNcsbXPctDiGNm4NQuMwz3vm1rjBTWZADT38YnSeNpQF4nFXpbGVRJIMnQ9Pab
	 hX4qP6KaVoCm5D9Yh2SdAhuVu4vV6MhSmCqZ6/HC6o6UOcGZAcF8n/jr03f4Na/+0COP+
	 WEKks8ObXiAY6FlZIK8o88rqk2H2LEx4RzzC5ol5T2oUs2FWEsYEHAGqV1X2NSRMt/XbQ
	 QlZXuf8aUqS6mwuFFb7iTwqNlnsq7sqAYlyabYxkFZjxdoXRJ8nYqMBS/Yx8zCQW/8Q27
	 8ys6NcC3NhbPc2yyNsN/gWftkuJDLVEFcMKBvmL3bVU55xv8+dPs7Pvs+y+IxHkF06A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795321;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tmcHG6iHSRfTtxGrjBta3XLELPPUpyHHe56W9gejRh8=;
	b=SyLTSl33oIlAznpF+FumPk1dHbQY1v1F0TDgMKh3IfxralNDGUjDmes1i0JamG6TghfK
	 WZadxn1wFzo58L4bRNQk2/9BbBgkbpuOlTtJ0DOGFA6IEqO5TT2pIxFgu0a47YeDZRgCW
	 a1nLacAVtxwVBwMrmy306juM2FTYTf+9+hWKR9DgmoOnK5G1ctYFgiuq20XoejjK21FpR
	 3m8MNaNynJYSQ7VN7h0Fj3wpSAITYac1FMFtzssEONNdw5sl7kIK3SO4pKLZ+H3yUt7z/
	 m0gFn40RAsDrW2HK44Qnx4BFaMGSxdKA3lOWkjVwcR39YoQXjiTorubaHEKvFejYVQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=J1CLJ6Ti;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F36606A328;
	Wed,  4 Nov 2026 12:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8F36606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=J1CLJ6Ti
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91F0C227A;
	Wed,  4 Nov 2026 13:26:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793795178;
	bh=QKxOWMq2mrO+ZhX/hXtXscWz3CQJ2HSJtKRaOqECBb0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J1CLJ6TirU+vsZ5bDdYdSgexqG48LdM2RMzZIIGmjlXTM7poz8gJhd5AyLtuv3sl1
	 PClaw+jLyaXuIYhlgKRQmaWv0ny0W9hzBjYfx4S6eou8YyBWiPYz2iiTDFLV4WzB85
	 /ncyQQkw9JVt9+dNhR5rMvPuVVm96JFUNd580MMM=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 04 Nov 2026 12:28:19 +0000
Subject: [PATCH 4/7] media: v4l2-isp: Use centrally-held data in framework
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
Message-Id: <20261104-v4l2-isp-resume-v1-4-06aeb8cf2940@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10498;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=QKxOWMq2mrO+ZhX/hXtXscWz3CQJ2HSJtKRaOqECBb0=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6yTvS3ZhGmpjYItq83kuk8gql7DUC5in5AVtz
 nA1Sbc9DbeJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCausk7wAKCRDISVd6bEV1
 MoJLD/9FEjlxeciFVUqRQEBtXUJbkhEQbi8TgyiqD23l8BCcrAKTzRCGcEjhdFq9DTleMHDAAW0
 eeT3umnQV4GNeakYq/HFIAFBt8mxYkTF+ug3Yw77jpYrPPf6E03NCOMfX22UrV+QYsAqpLiabLf
 nVqyDwfw2ntixl067nrTgJbomjvoBvDU0Efp/bXA/20xDwnI2xLEyArxZWZy0FL4b2kR84tbBaX
 WATSzYtz3EiPhfzVyvOi2x7PieD6FRgNPvi0a/KqHlw74rhcQAivaaIpGW1sUySMMUVjqvH+qoO
 vx1emPURRvkUSlxhVFQbsUA8IXTVnlEVd9yfYMlI+YAymFjU8h/O4AOFxT5XuTnQSioUYY2zU8j
 cTpDzum/882RCzkzftqxuy4+3600LTFsGOZEWnz/1KCLS+88sDrASa8EIvLMOBmihbV6qUtQBW2
 NiRXV+1HnhZ+CwvP0tGTK6IbGOJPzd7lAIJQKtWHSQonJgNWZ+XfUVMNrt8KfMRNw3NzlL6vy6m
 kMsVnVUbVTXp+ZPSZunjd6mj1SezUw+2fRRd9L/e52EGL50U+QlxCLb+xpoqTD/VOY4xoiXlPBl
 30BwkQ3QxRrhlboGnvcC2REv3YKn8fnH1ZSCgvRzq5SyChfI8fegHM8beny109Q2egCZmn/U/Rs
 C/tUtFNeUP4QJQw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Update the framework's APIs to use the centrally held data rather
than require users to pass data in to each function call.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c |  9 +++------
 drivers/media/platform/arm/mali-c55/mali-c55-params.c |  8 ++------
 drivers/media/platform/dreamchip/rppx1/rpp_params.c   |  7 ++-----
 .../media/platform/rockchip/rkisp1/rkisp1-params.c    |  9 +++------
 drivers/media/v4l2-core/v4l2-isp.c                    | 19 +++++++++----------
 include/media/v4l2-isp.h                              | 18 ++++++------------
 6 files changed, 25 insertions(+), 45 deletions(-)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index 25f6a7d9bad9d61d641690f43faceaae0f938da5..f0b330520f97ad3bb701de3aed35670158508829 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -809,8 +809,7 @@ static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
 	struct c3_isp_params_cfg *cfg = buf->cfg;
 	int ret;
 
-	ret = v4l2_isp_params_validate_buffer_size(params->isp->dev, vb,
-						   params->vfmt.fmt.meta.buffersize);
+	ret = v4l2_isp_params_validate_buffer_size(&params->v4l2_isp, vb);
 	if (ret)
 		return ret;
 
@@ -820,10 +819,8 @@ static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
 	 */
 	memcpy(cfg, usr_cfg, payload_size);
 
-	return v4l2_isp_params_validate_buffer(params->isp->dev, vb,
-					(struct v4l2_isp_params_buffer *)cfg,
-					c3_isp_params_block_types_info,
-					ARRAY_SIZE(c3_isp_params_block_types_info));
+	return v4l2_isp_params_validate_buffer(&params->v4l2_isp, vb,
+					(struct v4l2_isp_params_buffer *)cfg);
 }
 
 static int c3_isp_params_vb2_buf_init(struct vb2_buffer *vb)
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 06509152a51a1d47355d3c7c9985112ce3c20450..7b9d2650ce8730ccc05eee0c9dc33a88d022acf1 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -707,14 +707,12 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
 	struct v4l2_isp_params_buffer *config = vb2_plane_vaddr(vb, 0);
-	struct mali_c55 *mali_c55 = params->mali_c55;
 	int ret;
 
 	if (!config)
 		return -EFAULT;
 
-	ret = v4l2_isp_params_validate_buffer_size(mali_c55->dev, vb,
-			v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
+	ret = v4l2_isp_params_validate_buffer_size(&params->v4l2_isp, vb);
 	if (ret)
 		return ret;
 
@@ -726,9 +724,7 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
 
 	memcpy(buf->config, config, v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
 
-	return v4l2_isp_params_validate_buffer(mali_c55->dev, vb, buf->config,
-					       mali_c55_params_block_types_info,
-					       ARRAY_SIZE(mali_c55_params_block_types_info));
+	return v4l2_isp_params_validate_buffer(&params->v4l2_isp, vb, buf->config);
 }
 
 static void mali_c55_params_buf_queue(struct vb2_buffer *vb)
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 5b8b471198ec1d540f31c0ac1b15d0d54bd808fc..aff3f3a997b4134b753fd1e1faf2058216f4b939 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -57,16 +57,13 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb,
 	size_t block_offset;
 	int ret;
 
-	ret = v4l2_isp_params_validate_buffer_size(rpp->dev, vb,
-				v4l2_isp_buffer_size(RPPX1_PARAMS_MAX_SIZE));
+	ret = v4l2_isp_params_validate_buffer_size(&rpp->isp, vb);
 	if (ret)
 		return ret;
 
 	cfg = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
 
-	ret = v4l2_isp_params_validate_buffer(rpp->dev, vb, cfg,
-					      rppx1_ext_params_blocks_info,
-					      ARRAY_SIZE(rppx1_ext_params_blocks_info));
+	ret = v4l2_isp_params_validate_buffer(&rpp->isp, vb, cfg);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 756332d8bd154c3175ad5d563f6e5cf615f42499..8974c520d1879f3f0f642819a41984f6ac3ee01d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2735,8 +2735,7 @@ static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
 		vb2_plane_vaddr(&vbuf->vb2_buf, 0);
 	int ret;
 
-	ret = v4l2_isp_params_validate_buffer_size(params->rkisp1->dev, vb,
-						   params->metafmt->buffersize);
+	ret = v4l2_isp_params_validate_buffer_size(&params->v4l2_isp, vb);
 	if (ret)
 		return ret;
 
@@ -2746,10 +2745,8 @@ static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
 	 */
 	memcpy(cfg, usr_cfg, payload_size);
 
-	return v4l2_isp_params_validate_buffer(params->rkisp1->dev, vb,
-				(struct v4l2_isp_params_buffer *)cfg,
-				rkisp1_ext_params_block_types_info,
-				ARRAY_SIZE(rkisp1_ext_params_block_types_info));
+	return v4l2_isp_params_validate_buffer(&params->v4l2_isp, vb,
+				(struct v4l2_isp_params_buffer *)cfg);
 }
 
 static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
index a979c0690d19d9956a45657561b510546b3aa8c2..925632e1037db18f0948ceb0ce7c652e167516c9 100644
--- a/drivers/media/v4l2-core/v4l2-isp.c
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -54,15 +54,15 @@ int v4l2_isp_validate(struct v4l2_isp *isp)
 }
 EXPORT_SYMBOL_GPL(v4l2_isp_validate);
 
-int v4l2_isp_params_validate_buffer_size(struct device *dev,
-					 struct vb2_buffer *vb,
-					 size_t max_size)
+int v4l2_isp_params_validate_buffer_size(struct v4l2_isp *isp,
+					 struct vb2_buffer *vb)
 {
 	size_t header_size = offsetof(struct v4l2_isp_params_buffer, data);
 	size_t payload_size = vb2_get_plane_payload(vb, 0);
+	struct device *dev = isp->dev;
 
 	/* Payload size can't be greater than the destination buffer size */
-	if (payload_size > max_size) {
+	if (payload_size > isp->params.max_size) {
 		dev_dbg(dev, "Payload size is too large: %zu\n", payload_size);
 		return -EINVAL;
 	}
@@ -77,13 +77,12 @@ int v4l2_isp_params_validate_buffer_size(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(v4l2_isp_params_validate_buffer_size);
 
-int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
-				    const struct v4l2_isp_params_buffer *buffer,
-				    const struct v4l2_isp_params_block_type_info *type_info,
-				    size_t num_block_types)
+int v4l2_isp_params_validate_buffer(struct v4l2_isp *isp, struct vb2_buffer *vb,
+				    const struct v4l2_isp_params_buffer *buffer)
 {
 	size_t header_size = offsetof(struct v4l2_isp_params_buffer, data);
 	size_t payload_size = vb2_get_plane_payload(vb, 0);
+	struct device *dev = isp->dev;
 	size_t block_offset = 0;
 	size_t buffer_size;
 
@@ -118,7 +117,7 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 		block = (const struct v4l2_isp_params_block_header *)
 			(buffer->data + block_offset);
 
-		if (block->type >= num_block_types) {
+		if (block->type >= isp->params.num_block_types) {
 			dev_dbg(dev,
 				"Invalid block type %u at offset %zu\n",
 				block->type, block_offset);
@@ -147,7 +146,7 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 		 * with data that a later kernel, once it implements the type,
 		 * would validate and possibly reject.
 		 */
-		info = &type_info[block->type];
+		info = &isp->params.types_info[block->type];
 		if (!info->size) {
 			dev_dbg(dev, "Unsupported block type %u at offset %zu\n",
 				block->type, block_offset);
diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
index dc3e612ef79ea510ec1535f483fc16c6ec3d4569..b758d9b0e7f5c29cd8c4197f4a4a86cf3e5334fc 100644
--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -91,9 +91,8 @@ int v4l2_isp_validate(struct v4l2_isp *isp);
 
 /**
  * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
- * @dev: the driver's device pointer
+ * @isp: the driver's &struct v4l2_isp pointer
  * @vb: the videobuf2 buffer
- * @max_size: the maximum allowed buffer size
  *
  * This function performs validation of the size of a V4L2 ISP parameters buffer
  * before the driver can access the actual data buffer content.
@@ -106,17 +105,14 @@ int v4l2_isp_validate(struct v4l2_isp *isp);
  * against @max_size and it's validated to be large enough to accommodate at
  * least one ISP configuration block.
  */
-int v4l2_isp_params_validate_buffer_size(struct device *dev,
-					 struct vb2_buffer *vb,
-					 size_t max_size);
+int v4l2_isp_params_validate_buffer_size(struct v4l2_isp *isp,
+					 struct vb2_buffer *vb);
 
 /**
  * v4l2_isp_params_validate_buffer - Validate a V4L2 ISP parameters buffer
- * @dev: the driver's device pointer
+ * @isp: the driver's &struct v4l2_isp pointer
  * @vb: the videobuf2 buffer
  * @buffer: the V4L2 ISP parameters buffer
- * @type_info: the array of per-block-type validation info
- * @num_block_types: the number of block types in the type_info array
  *
  * This function completes the validation of a V4L2 ISP parameters buffer,
  * verifying each configuration block correctness before the driver can use
@@ -129,10 +125,8 @@ int v4l2_isp_params_validate_buffer_size(struct device *dev,
  * to prevent userspace from modifying its content after it has been submitted
  * to the driver, and then call this function to complete validation.
  */
-int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
-				    const struct v4l2_isp_params_buffer *buffer,
-				    const struct v4l2_isp_params_block_type_info *type_info,
-				    size_t num_block_types);
+int v4l2_isp_params_validate_buffer(struct v4l2_isp *isp, struct vb2_buffer *vb,
+				    const struct v4l2_isp_params_buffer *buffer);
 
 /**
  * struct v4l2_isp_stats_block_type_info - V4L2 ISP stats per-block-type info

-- 
2.43.0

