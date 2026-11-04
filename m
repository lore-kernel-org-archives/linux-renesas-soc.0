Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795319;
	b=U+esUGK5PpFL0kiW2Ox3R2qhEWKK8RqLRYMgD67PNewB+uZZHJn6DV9KdFUZqlyeJ9IO
	 0PGtdQJTaPXH0V4R45KTnsAhYG/pWZ6c1P2+AbhKhj5NT/xHhjc38Z6DmHqYTrCqG/NDO
	 Zc7V73ozZ05XzVo2VC/gNx2yIfA7AtHeY7st0695+j3ev6BbDYcuu90i8WxbRgw8b/QTi
	 oHH6PvvK2wXbjOd/ypkC1r1jRWhn6VtYHcf5nD7dAymET5qsISb21BkdxeY9A4xxeF16s
	 7LTAEcWVqNuHmjfycm7W3wMXxZWpP3q4z2iE14URKXMHfIAwVX8nVL/KETSrpK+ovjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795319;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2E8XUHjyqULQIG85LgYO9aUS/MIcn0tuh3Or6DLKvbs=;
	b=B5CXagoXez1fjvODoCE3XAuICU7hEjbexw4q/uW5jTIq2j97RTqAliyMrsEuExJMCZFl
	 wGImCqCL+jgOW1tPLHThoPnGM6uBeRX/xzNN5Jx8neSCpu4fTO5nQxt/t2suCCs6GYKfC
	 HBKzGBWNL1tZbVOYlIrbdwEG8a2szF6g/78povgFLW+kdp43M2aV+QG8KHzhsThancAaZ
	 Joal2A/my0+7e4jLaa9ilRCcpfjwDDve6mppsQMSCdgTul9pGeJjiWqzFjmetO5Gj2Qmp
	 NAM+rX9mSZ5PYEDaqGtfFZGFzQMEzFY+DuqiIYZcq/OsNnZhlE2GR8fNLeuOcXQ1png==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=nuiDZfaT;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E0C606A328;
	Wed,  4 Nov 2026 12:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E0C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=nuiDZfaT
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21ACB21DD;
	Wed,  4 Nov 2026 13:26:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793795176;
	bh=ColIUmM7I3sT9uPmNQaPsLO56q+grpRm8G7iqR/OKGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nuiDZfaTalhaw3meF/FOIjfbzoUZkXLQZPjg29L5aHMet91nq4JQbzmBSBWXXzyiP
	 P7PDo9/HGtOCq6bRRxokG7f4IoEc8OOMneWH2l9O5y+Rog6tF1l5RG4IUbOPrMaFmc
	 uFBvVCe4Pz3ztKBIgnhmmK74ZIpTgJ6ph9DgYfzI=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 04 Nov 2026 12:28:17 +0000
Subject: [PATCH 2/7] media: v4l2-isp: Hold v4l2-isp data in central struct
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
Message-Id: <20261104-v4l2-isp-resume-v1-2-06aeb8cf2940@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6123;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=ColIUmM7I3sT9uPmNQaPsLO56q+grpRm8G7iqR/OKGo=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6yTu9d6EUjNEym7soRx6mqhLCXzWYNHNI5nus
 odeox5+jm6JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCausk7gAKCRDISVd6bEV1
 MtL5D/4velDuSlPaF8gdXkdMwQkV1J5k+lyNQHW9HITYCgo2XpPOAWnY2tdHY5CUtQuDZSSgzii
 TSV6a2s2zjJeB11nVgeG9Epthsdd5wVVNQKJtzNY2GzYZeTqwf2LcZSzNPrmgAJxDMWqzGMbELD
 EJKUMjeCHncTyFcnmqoH1Hs7aESEBvCgSjN+y4wrC77ZQc+5LCbbxAplMMsDX36vG8x00sOwyPn
 u5vvwqce7pULSLRwmWu6GGY/gryNlemjDkHMkAP+MJbbhG+lpKrNBlFlJlKi1vCesLjg3Wd//LF
 k9hbOJOV1sgE5Qsd8JtlNyN61+m3ri1O/vDpdmKIZfFoyKr3CIImuZM9bQdmWN/cSf1jK1mTsty
 V9GNtk4KSzYAVg2Yz0yx37iloycFa+2UdlkGmund81jXAQoly5sX/OSARG6Bm+hdmwwb/uMcMpU
 M7eHz6cyP350CJcGZWvVJWDD0wANcQSKsoU/ui7M1dxfMkm6T+A6mrqLP3YhBgG47FXsUD5YQ/G
 2scsD4Z2tGRlj+Odt+S0zbWUzAYEZ6DzFTpvx1RVQSQ2tOMOSmEKbscdf/XInOZOLtD67OgwvmA
 Bfn1Ut0CxoTiWzyv0XQmiMzOzfvqih8QhSiKmiIBRs+ucgDQicb+zYPJxsVAWu+X3/WxYHi5KHb
 cVElSH9jUbVfBvQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Hold v4l2-isp related data in a new struct v4l2_isp to facilitate the
easier use of driver-defined data in v4l2-isp itself. Provide a
function to validate the driver's definition of data to make sure that
we have everything that we need.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-isp.c | 41 ++++++++++++++++++++
 include/media/v4l2-isp.h           | 79 ++++++++++++++++++++++++++++----------
 2 files changed, 99 insertions(+), 21 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
index 8e6c2ef326aaa63e00332bcdac8ebdf6da059f44..a979c0690d19d9956a45657561b510546b3aa8c2 100644
--- a/drivers/media/v4l2-core/v4l2-isp.c
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -13,6 +13,47 @@
 
 #include <media/videobuf2-core.h>
 
+int v4l2_isp_validate(struct v4l2_isp *isp)
+{
+	/* We require a device pointer for debugging purposes */
+	if (!isp->dev)
+		return -EINVAL;
+
+	/*
+	 * We need to know how big the data member of the params buffer can get
+	 */
+	if (!isp->params.max_size) {
+		dev_err(isp->dev, "Missing parameters buffer size data\n");
+		return -EINVAL;
+	}
+
+	/* We need to know how many block types there are */
+	if (!isp->params.num_block_types) {
+		dev_err(isp->dev, "Missing number of block types\n");
+		return -EINVAL;
+	}
+
+	/* We need a pointer to some &struct v4l2_isp_params_block_type_info */
+	if (!isp->params.types_info) {
+		dev_err(isp->dev, "Missing block types info pointer\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * A block type with a size of zero is inherently invalid, so let's
+	 * catch that early.
+	 */
+	for (unsigned int i = 0; i < isp->params.num_block_types; i++) {
+		if (!isp->params.types_info[i].size) {
+			dev_err(isp->dev, "Found block type info with 0 size\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_isp_validate);
+
 int v4l2_isp_params_validate_buffer_size(struct device *dev,
 					 struct vb2_buffer *vb,
 					 size_t max_size)
diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
index 7a54cf98c79af7a621fdc1f7098690ec7ccaa267..dc3e612ef79ea510ec1535f483fc16c6ec3d4569 100644
--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -31,27 +31,6 @@ struct vb2_buffer;
 #define v4l2_isp_buffer_size(max_size)			\
 	(offsetof(struct v4l2_isp_buffer, data) + (max_size))
 
-/**
- * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
- * @dev: the driver's device pointer
- * @vb: the videobuf2 buffer
- * @max_size: the maximum allowed buffer size
- *
- * This function performs validation of the size of a V4L2 ISP parameters buffer
- * before the driver can access the actual data buffer content.
- *
- * After the sizes validation, drivers should copy the buffer content to a
- * kernel-only memory area to prevent userspace from modifying it,
- * before completing validation using v4l2_isp_params_validate_buffer().
- *
- * The @vb buffer as received from the vb2 .buf_prepare() operation is checked
- * against @max_size and it's validated to be large enough to accommodate at
- * least one ISP configuration block.
- */
-int v4l2_isp_params_validate_buffer_size(struct device *dev,
-					 struct vb2_buffer *vb,
-					 size_t max_size);
-
 /**
  * struct v4l2_isp_params_block_type_info - V4L2 ISP params per-block-type info
  * @size: the block type expected size
@@ -73,6 +52,64 @@ struct v4l2_isp_params_block_type_info {
 			      const struct v4l2_isp_block_header *block);
 };
 
+/**
+ * struct v4l2_isp - V4L2 ISP processing structure
+ * @dev: pointer to the &struct device associated with the ISP
+ * @params: sub-struct holding data related to the V4L2 ISP parameters
+ * @params.types_info: pointer to array of params block information structs
+ * @params.num_block_types: number of possible params block types
+ * @params.max_size: maximum size in bytes of the data member of
+ *		     &struct v4l2_isp_params_buffer
+ *
+ * The V4L2 ISP framework is designed to ease validation of parameter and
+ * statistic buffers queued to ISP device drivers. This struct holds references
+ * to driver-defined information designed to facilitate easy validation in a
+ * central source file. The intention is for an instance of the struct to be
+ * embedded within a driver specific struct and populated before validation and
+ * use through the v4l2-isp framework.
+ */
+struct v4l2_isp {
+	struct device *dev;
+
+	struct {
+		const struct v4l2_isp_params_block_type_info *types_info;
+		size_t num_block_types;
+		size_t max_size;
+	} params;
+};
+
+/**
+ * v4l2_isp_validate - Set up a &struct v4l2_isp properly
+ * @isp: pointer to the &struct v4l2_isp to initialise
+ *
+ * This function validates that the members of @isp have been populated with
+ * information sufficient to allow it to be used with the v4l2-isp framework.
+ *
+ * @return int
+ */
+int v4l2_isp_validate(struct v4l2_isp *isp);
+
+/**
+ * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
+ * @dev: the driver's device pointer
+ * @vb: the videobuf2 buffer
+ * @max_size: the maximum allowed buffer size
+ *
+ * This function performs validation of the size of a V4L2 ISP parameters buffer
+ * before the driver can access the actual data buffer content.
+ *
+ * After the sizes validation, drivers should copy the buffer content to a
+ * kernel-only memory area to prevent userspace from modifying it,
+ * before completing validation using v4l2_isp_params_validate_buffer().
+ *
+ * The @vb buffer as received from the vb2 .buf_prepare() operation is checked
+ * against @max_size and it's validated to be large enough to accommodate at
+ * least one ISP configuration block.
+ */
+int v4l2_isp_params_validate_buffer_size(struct device *dev,
+					 struct vb2_buffer *vb,
+					 size_t max_size);
+
 /**
  * v4l2_isp_params_validate_buffer - Validate a V4L2 ISP parameters buffer
  * @dev: the driver's device pointer

-- 
2.43.0

