Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795316;
	b=rBSY+GMq0IelyDzJyAxoB7lj6RW+olQ95ceczJXBGSQTIik9lQyDN+j0L6I+zd2tSP5J
	 sNV/OqOfG0yt7NUDYOJvZFn1fHqvcnbWnrvOU7+Tf5MJegUUZpAoDwCgev2CQRItxK16u
	 IXbM21S2ERvVrnHOoiGdUCJUuoNiYAqU8eWc5WQQDWwFlZ6+ukRKxbTk0XF27hrjGsbqp
	 8RPtx/NDqzkd83iYnF8XA+75ZOdgy9WshoytZBNoViqMiT4DHihHWNu1gPYyhXxhzllcS
	 CQDC7Qkkc6w0nz8SvVZrVseafXoZsJJ+Usb5v0rxJjhT2Kz3a3y0w9YcqQVSUWKz2ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795316;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hufmohrUl2umBF7WoRKip2ueAkvPh+cHsJtiDyBr6Zs=;
	b=HA4dDc86vP7Dx/aXxcUx95s0PM1LYphtFuuuCcqxnhELEx84m0hEL1quXvy4JxClR2xC
	 6NGxpS7NTDbvx8fPSOi72vJfOnHN8JFPUaa4tJqesc01jTVwbHhnEV8tQZ1596zTG7ioM
	 PpXo8fyryhkNh/DMmKyIhAFyhuWc2fCGXBtymFUIMttMFFS/kYRlz53GSYo6WmxH4vAPy
	 AWymhjuXA3iAvOTkw5Fsn2/GEGGPLuUs+3X6h9ap9oM0xQftSMo5iJlSI9wyxYjclhlX2
	 c8ZUVtHDk3SZidMR19FbXyNqZE4+4XUwj9+wj3xCtXSdZltaTgHZBYY+TUI3QQeN+yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Q8p9qfDt;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3673A606A326;
	Wed,  4 Nov 2026 12:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3673A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Q8p9qfDt
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62A251CFB;
	Wed,  4 Nov 2026 13:26:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793795176;
	bh=QjLequEK73SpgKJqn9CohuqAzjqL/n/qfN/T526vjfA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q8p9qfDtEYoyjKl+tk/cWfl3BsoD8XvdvLO+fhytg9hG/o3OwwYJzlxfGJWX301+J
	 ypZrhwcO7iNRTnqI8jt/o9rSsIcuSp4YQn5vUU+BsrlMt9uREebk3PxfoWIeXlwB3S
	 T7Gl/UURkDR57f4XZs55Ddx1I+blUpgVJnl0p9GU=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 04 Nov 2026 12:28:16 +0000
Subject: [PATCH 1/7] media: rppx1: Drop max_size param from rppx1_params()
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
Message-Id: <20261104-v4l2-isp-resume-v1-1-06aeb8cf2940@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3246;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=QjLequEK73SpgKJqn9CohuqAzjqL/n/qfN/T526vjfA=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6yTunKvIl63/+wDUtzGSnMqGRSnNuM8Gtm03S
 W8/V2db8QeJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCausk7gAKCRDISVd6bEV1
 Mom7D/46hPkA/L7tASpu9jHhgEmlkqWC6WwK5poMOnzvMhZ7x+UUnByjqbQR8a0GNmpfnMlQ76J
 syOME74BJVWil9HGLOTIqYAkKOFfxAuvJqJODRa8txgM8Y1TZeZa4qS7NxzF1gMqWvoimgLMh87
 uqIOxsK0A52iYwxrWVcdx76NIjJEhW3vBkiEwEKfVI8WFUqkjzueGFDZPGmDT566payhyNraG/v
 0bNMDOgwYvm9shS+imev2XpJ3iW3WS2/gvQh4Uk99acKslHP4NDdNDM5gwYdcqNFs96CG7arkOV
 M12KwN8SsFxohf5r511eOvQkd7ih0t8h/TB4W6To6bPja/VceW/yTxDi/NPKgrtbBKqi3JfGd7X
 WSGBymTMz/R81SMYFc7Mlkfb+vrZFW3l8u7tDNuIVH6PIrYVnczka0uWBqgnKUJcKFDUkP0XVHJ
 96TmQ81UJx6H3IX1uYJa0bp7fcMbJSCDOaSvtnqCFv+NbPtof8cZBeM94HKxasdlshQly3c4pAC
 WS8NYv+zHZTJ0ocJjB/RF8gWH0DlXMD30WhkrCfa4GWVjN32v1Spm9LLPrLmhqgIzf0+GJDS/Ar
 56Erjr9nqrsGQysF2FfLuwRR8BtgutTQhyZbq6FSftNIcgB24jMN4M441unsqbmn1Yw1qbSNq1N
 Yi5oHywutvqm8FA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The maximum size of the buffer is currently passed in from the caller
but is available in rppx1-config.h. Include the header and drop the
parameter from the function.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---

I hope this change is ok; I'm not familiar with future plans for the
library driver, but it looks like the parameters max size should be
the same for any user of the library and that not parametising it is
ok.
---
 drivers/media/platform/dreamchip/rppx1/rpp_params.c | 7 +++++--
 drivers/media/platform/renesas/rcar-isp/core-io.c   | 3 +--
 include/media/rppx1.h                               | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 5e6727d58946405322a8dae3c8d5727fe07135e0..e804440f369b7bd6d85cc1a23a2610c1cca307fa 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2026 Ragnatech AB
  */
 
+#include <linux/media/dreamchip/rppx1-config.h>
+
 #include <media/v4l2-isp.h>
 #include <media/videobuf2-v4l2.h>
 
@@ -37,7 +39,7 @@ rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(GA_MV, ga),
 };
 
-int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
+int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb,
 		 rppx1_reg_write write, void *priv)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -45,7 +47,8 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 	size_t block_offset;
 	int ret;
 
-	ret = v4l2_isp_params_validate_buffer_size(rpp->dev, vb, max_size);
+	ret = v4l2_isp_params_validate_buffer_size(rpp->dev, vb,
+				v4l2_isp_buffer_size(RPPX1_PARAMS_MAX_SIZE));
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
index b60b91f43d42deed16c8feb3526bbb77a43b5b96..5eea8c721a25a01cc6c01ab49fef001ae2065a6b 100644
--- a/drivers/media/platform/renesas/rcar-isp/core-io.c
+++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
@@ -536,8 +536,7 @@ static int risp_io_params_buffer_prepare(struct vb2_buffer *vb)
 	desc.count = 0;
 
 	/* Fill params body. */
-	ret = rppx1_params(io->core->rpp, vb, io->format.fmt.meta.buffersize,
-			   risp_conf_dma_prepare, &desc);
+	ret = rppx1_params(io->core->rpp, vb, risp_conf_dma_prepare, &desc);
 	if (ret)
 		return ret;
 
diff --git a/include/media/rppx1.h b/include/media/rppx1.h
index 2e761046db384a8dd17b1c66bb62c5ac14dec9a9..bb5f91f3174df5e29988a4ec3fb1d29f9db01ca6 100644
--- a/include/media/rppx1.h
+++ b/include/media/rppx1.h
@@ -28,7 +28,7 @@ int rppx1_stop(struct rppx1 *rpp);
 bool rppx1_interrupt(struct rppx1 *rpp, u32 *isc);
 
 typedef int (*rppx1_reg_write)(void *priv, u32 offset, u32 value);
-int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
+int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb,
 		 rppx1_reg_write write, void *priv);
 
 void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf);

-- 
2.43.0

