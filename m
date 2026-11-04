Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795319;
	b=ElncrZT7VmP9/01/yGZsnJeRRtYzdGF4656qgHRd/FHUsZVxrL7xpZrVu9TtdqRvAW1+
	 pIBdf/rqntD7f4taVEh1+Jqvht/41Uc2XDHuW8OuXdSi/WQ63aOsyVs8lJsPMsmbaAH8j
	 MFkGpbHVAB81oUbijDu/0w9y4UVJ7+rDULxK5CRfaTkT+CHyyEFk7iFT9eObA/bpz2fqw
	 EUXnZyVnOiuMOBSVKzb+wX59Xi8KjuvOora1Cs1IGVYcHS5FLXhGTNxbO3+V4U+SQAFHq
	 YDPuj/1mx67AZ7mxGr4wTRce9aRTO18U/BTD5rPFeAxX0mlEkkQQTdNbUwhvc7g7ITA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795319;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=OTbCiPQ4dZbTGBLxF3UeVrBvJE5VluPnol5WOqiEdFQ=;
	b=DwDKaD+W4Ot8ANGt6jxw0PqhFCiNA3pGw7onDKUTIn4Lyqi7bsc/r0rFaJ9X4Dt1lVQZ
	 P2PvHfBJlxlARE7XVzw7Nn+2vK449h0qUVr3ecf6mQKPyP2UCn4HQPD2iGf4/dp3irUh3
	 Ok6CoPmqN4j5yQ1b9mv33X8be9CVpXD5KO5zf3A5OiRFhkal/Pk0dDpPOJE4I1yya3W4O
	 pxg+CpgF6dB7Py49QaSyEUdU3TXQrMCyLs6wbcHPPuAvcMhP6LJ0sfWiF163eBOJPEGvm
	 BoR3qBpA6XBjkNCtqbIykI+qT1IznxW7MegQrgmbGplszZrFdQ4Fg/5E5/QhSt5ZuCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="o/yOT1JD";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A021606A32C;
	Wed,  4 Nov 2026 12:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A021606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=o/yOT1JD
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D28A62266;
	Wed,  4 Nov 2026 13:26:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793795177;
	bh=32Y5ZnjFOLpsDmzptQnVuxHVQ0NvvlnqL2bZZMIfgPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o/yOT1JDoXpMbinYGL481Rxf2NifMGB+f5ocSke8E6NSoGpCmOF8JhH/81FSnzrOF
	 cbgvAhbwJfYcRO84SXt/SsE++1kOezSy0j/nbh/xcdneiMgariq9lMUSM75F3rJFAp
	 8PzQza98mso+5Jn2OHCdECZnZ17J1OMYf+eRl6N4=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 04 Nov 2026 12:28:18 +0000
Subject: [PATCH 3/7] media: v4l2-isp: Update users to initialise and
 validate new struct
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
Message-Id: <20261104-v4l2-isp-resume-v1-3-06aeb8cf2940@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9034;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=32Y5ZnjFOLpsDmzptQnVuxHVQ0NvvlnqL2bZZMIfgPI=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6yTvuwTHgyuVyc5b9Zuw10qM27MVHhHHj6vHg
 tLqK1qIorqJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCausk7wAKCRDISVd6bEV1
 MsLYEACg7U7xAdLU3ifWloyNB/VIzKyaO5HUlmPz+E6os5BD9fMXprEeB5B5ki5EdioHs4MO+/O
 AxcwPNVC1ocEOspLGVT/AjFO7X72+TOG/4a+vHXRH3IrkscLPFNhlZ41FeyPvDL0pw6WQi3CzUg
 hNkYsC9tJXN2bVVWc58HzURdZKOZvUI3+OQ6rJ+AYGgyPu1vUrbJ5fRTpfXzg03oYV5VGVdFNRA
 BcKDflWlw1JOZbISCHScGFYJ4YBSDd2xy+Mt/giDQRdEgc3VgbtYeLiHwJ1DvSu1D5npOFPRk2f
 5vml1hKj0c3Ocm7G8jmodvoCWSpSOO3nQGFNxrMJ6vtrqbLPCMEzIyzNQcuXXvHuPzr5P8bCRv9
 k0RLlu6nhiv7IexjvIbYD8Fs0k8al4+KQQDxpdXr+DAtG/34/fSAWhtizH4VDpw1DwUngXhiKi5
 YWWzBKyZYs7R07trhFKDqJUDPAvKyflhgdSM7kA36pJNTBgH9iHUsOX9VFCLJGW6mibB8TIm3v9
 9M5mwC07LZEUaOxpW7dhROf0mQym6IKoRSEk53Sn8EoJyWYIyGWqpRrXStJIFrD5B+L+iEZwN17
 mtANRhAgot5wBYfnMmwD0b4r6xX+Yk0dlUUw0e4BfL7hchnMFVZJosc+xXoUnxv54kZ7h2FKQKs
 sbpZJpbUcV+YKlA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Update users of the v4l2-isp framework to initialise and validate the
new struct v4l2_isp. This has no practical effect for now, but will
reduce the churn in follow-on patches.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/platform/amlogic/c3/isp/c3-isp-common.h  |  2 ++
 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c  | 10 ++++++++++
 drivers/media/platform/arm/mali-c55/mali-c55-common.h  |  1 +
 drivers/media/platform/arm/mali-c55/mali-c55-params.c  |  9 +++++++++
 drivers/media/platform/dreamchip/rppx1/rpp_params.c    | 10 ++++++++++
 drivers/media/platform/dreamchip/rppx1/rppx1.c         |  8 ++++++++
 drivers/media/platform/dreamchip/rppx1/rppx1.h         |  5 +++++
 drivers/media/platform/rockchip/rkisp1/rkisp1-common.h |  3 +++
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c |  9 +++++++++
 9 files changed, 57 insertions(+)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-common.h b/drivers/media/platform/amlogic/c3/isp/c3-isp-common.h
index cb470802e61e85426c5a41150372753a405a2d32..222c2e91ce429904a50a702a9d38f286dfd7c5a6 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-common.h
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-common.h
@@ -11,6 +11,7 @@
 #include <media/media-device.h>
 #include <media/videobuf2-core.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-isp.h>
 #include <media/v4l2-subdev.h>
 #include <media/videobuf2-v4l2.h>
 
@@ -222,6 +223,7 @@ struct c3_isp_params {
 	struct video_device vdev;
 	struct v4l2_format vfmt;
 	struct media_pad pad;
+	struct v4l2_isp v4l2_isp;
 
 	struct mutex lock; /* Protects vb2_q, vdev */
 	struct c3_isp_device *isp;
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index ae0777a20bdaff822657c310e20b2011fc1e8ff2..25f6a7d9bad9d61d641690f43faceaae0f938da5 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -883,6 +883,16 @@ int c3_isp_params_register(struct c3_isp_device *isp)
 	params->vfmt.fmt.meta.dataformat = V4L2_META_FMT_C3ISP_PARAMS;
 	params->vfmt.fmt.meta.buffersize = sizeof(struct c3_isp_params_cfg);
 	params->isp = isp;
+
+	params->v4l2_isp.dev = isp->dev;
+	params->v4l2_isp.params.max_size = sizeof(struct c3_isp_params_cfg);
+	params->v4l2_isp.params.num_block_types = ARRAY_SIZE(c3_isp_params_block_types_info);
+	params->v4l2_isp.params.types_info = c3_isp_params_block_types_info;
+
+	ret = v4l2_isp_validate(&params->v4l2_isp);
+	if (ret)
+		return ret;
+
 	INIT_LIST_HEAD(&params->pending);
 	spin_lock_init(&params->buff_lock);
 	mutex_init(&params->lock);
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-common.h b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
index 13a3e9dc424311869af581061190bf38c08fb469..c4cd200b89d12a539adb55a02a936280490dfca3 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
@@ -196,6 +196,7 @@ struct mali_c55_stats {
 
 struct mali_c55_params {
 	struct mali_c55 *mali_c55;
+	struct v4l2_isp v4l2_isp;
 	struct video_device vdev;
 	struct vb2_queue queue;
 	struct media_pad pad;
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 16e895e3488ecc3ddb3808281a309901fd44103d..06509152a51a1d47355d3c7c9985112ce3c20450 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -1010,6 +1010,15 @@ int mali_c55_register_params(struct mali_c55 *mali_c55)
 	struct vb2_queue *vb2q = &params->queue;
 	int ret;
 
+	params->v4l2_isp.dev = mali_c55->dev;
+	params->v4l2_isp.params.max_size = v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE);
+	params->v4l2_isp.params.num_block_types = ARRAY_SIZE(mali_c55_params_block_types_info);
+	params->v4l2_isp.params.types_info = mali_c55_params_block_types_info;
+
+	ret = v4l2_isp_validate(&params->v4l2_isp);
+	if (ret)
+		return ret;
+
 	mutex_init(&params->lock);
 	INIT_LIST_HEAD(&params->buffers.queue);
 	spin_lock_init(&params->buffers.lock);
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index e804440f369b7bd6d85cc1a23a2610c1cca307fa..5b8b471198ec1d540f31c0ac1b15d0d54bd808fc 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -39,6 +39,16 @@ rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(GA_MV, ga),
 };
 
+int rppx1_params_init(struct rppx1 *rpp)
+{
+	rpp->isp.dev = rpp->dev;
+	rpp->isp.params.max_size = v4l2_isp_buffer_size(RPPX1_PARAMS_MAX_SIZE);
+	rpp->isp.params.num_block_types = ARRAY_SIZE(rppx1_ext_params_blocks_info);
+	rpp->isp.params.types_info = rppx1_ext_params_blocks_info;
+
+	return v4l2_isp_validate(&rpp->isp);
+}
+
 int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb,
 		 rppx1_reg_write write, void *priv)
 {
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.c b/drivers/media/platform/dreamchip/rppx1/rppx1.c
index c502be797914653d1fe6e69d6065995742255d6b..bbeb94099395edffc4b7a0ce741523a05e23b858 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1.c
@@ -153,6 +153,7 @@ EXPORT_SYMBOL_GPL(rppx1_destroy);
 struct rppx1 *rppx1_create(void __iomem *base, struct device *dev)
 {
 	struct rppx1 *rpp;
+	int ret;
 	u32 reg;
 
 	/* Allocate library structure */
@@ -163,6 +164,13 @@ struct rppx1 *rppx1_create(void __iomem *base, struct device *dev)
 	rpp->base = base;
 	rpp->dev = dev;
 
+	ret = rppx1_params_init(rpp);
+	if (ret) {
+		dev_err(dev, "failed to initialise V4L2 ISP\n");
+		rppx1_destroy(rpp);
+		return NULL;
+	}
+
 	/* Check communication with RPP and verify it truly is a X1. */
 	reg = rppx1_read(rpp, RPPX1_RPP_HDRREGS_VERSION_REG);
 	if (reg != 3) {
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.h b/drivers/media/platform/dreamchip/rppx1/rppx1.h
index 3bf3955afbaedeaaacdf83802d8f7af7368f039f..28dc2740509d9d89fad321ea2461368685ca154c 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1.h
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1.h
@@ -11,6 +11,8 @@
 #include <linux/device.h>
 #include <linux/types.h>
 
+#include <media/v4l2-isp.h>
+
 #include "rpp_module.h"
 
 #define RPPX1_IRQ_ID_256HIST			BIT(27)
@@ -97,9 +99,12 @@ struct rppx1 {
 
 	struct rpp_module rmap;
 	struct rpp_module rmapmeas;
+
+	struct v4l2_isp isp;
 };
 
 void rppx1_write(struct rppx1 *rpp, u32 offset, u32 value);
 u32 rppx1_read(struct rppx1 *rpp, u32 offset);
+int rppx1_params_init(struct rppx1 *rpp);
 
 #endif /* __MEDIA_RPPX1_H__ */
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 94f03310e92f110062313bf2a34afb0692d9122c..2e75372727a86dbffcfaa0666e02e201ef260395 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -19,6 +19,7 @@
 #include <media/media-entity.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-isp.h>
 #include <media/videobuf2-v4l2.h>
 
 #include "rkisp1-regs.h"
@@ -410,6 +411,7 @@ struct rkisp1_params_ops {
  * @buf.curr:		pointer to the current rkisp1_params_buffer
  * @config_lock:	locks the buffer list 'params'
  * @params:		queue of rkisp1_buffer
+ * @v4l2_isp:		pointer to the v4l2-isp central struct
  * @metafmt		the currently enabled metadata format
  * @quantization:	the quantization configured on the isp's src pad
  * @ycbcr_encoding	the YCbCr encoding
@@ -428,6 +430,7 @@ struct rkisp1_params {
 	} buf;
 
 	struct v4l2_ctrl_handler ctrls;
+	struct v4l2_isp v4l2_isp;
 
 	const struct v4l2_meta_format *metafmt;
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index f440e15afc74c029510e0777a9ec2f6ea4d5be88..756332d8bd154c3175ad5d563f6e5cf615f42499 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2887,6 +2887,15 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	int ret;
 
 	params->rkisp1 = rkisp1;
+	params->v4l2_isp.dev = rkisp1->dev;
+	params->v4l2_isp.params.max_size = sizeof(struct rkisp1_ext_params_cfg);
+	params->v4l2_isp.params.num_block_types = ARRAY_SIZE(rkisp1_ext_params_block_types_info);
+	params->v4l2_isp.params.types_info = rkisp1_ext_params_block_types_info;
+
+	ret = v4l2_isp_validate(&params->v4l2_isp);
+	if (ret)
+		return ret;
+
 	mutex_init(&node->vlock);
 	INIT_LIST_HEAD(&params->buf.queue);
 	spin_lock_init(&params->buf.lock);

-- 
2.43.0

