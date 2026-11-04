Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795323;
	b=XWFciUffBoUPXviPnqOLBcmo3lFmsSseXIAhnw85nkG/1kAelj+FHrCHI5Mqn5HrGOcZ
	 uKlWwUMofWJ7ZwXkAcIkdmDxpZGh00MU+/shbb8qmDSLBkbDccphL0xYWekERDjT8SgZR
	 5qYbGeT9pLu3HudYSWNFUk0MImmrhDOEL2OlYmDZu4Q01zysB9JylvPqpvCYgbfQdWl7q
	 L9/NenOKoc0nOpfSTXtDpItNrfaTojZH9dZ1JGPypckKic/frjIG4532PDRGlxJW0nvJu
	 os+ep/205g3ful1txhxvWxKlpK6EeKCyxE7CcQey82XeZEhoLP1B4MPPn03o+zz3L+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795323;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PaYz+8zXO9ujogHakqrSWss0FJ/AVkkg/0HPhoXx4ng=;
	b=dRxbHtM03/flIX6L03+WkpjMuPV6zcQ1k6kSS9ROTVETgr4vUJ4ZMvsDKXgVhOEtZ76j
	 WZuDG/j1+Yb1mTmAQjrO+qB+jcMRwH6szTRuGQRVDjdwhE+o1e6OEqQPaCQlTijELbN2b
	 QEZ5DNunMmZxDYbYNDXa7zbNsQpYyw/kTiNWSFCVNofvHrZygugOnR8IKRLMAbdzdadw+
	 3DccPW8TkxhT9kAnhvxUptRCZ9HX2heJMZaOSYl0SymkVEBLT9XmA3x0n/3SdPULVAkPA
	 SkpZjYFgHdfSG0cr1OSpSPUVpEmSTqbzn5eVJ7ra6z0fex4jDVraarjAZwPt5EH4nSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=WrE3Eg7t;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F01606A336;
	Wed,  4 Nov 2026 12:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F01606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=WrE3Eg7t
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4D292336;
	Wed,  4 Nov 2026 13:26:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793795180;
	bh=/KgvK7KKTO9K6EReqGFFUe9cgP7T3ggr+Oh0Hli0D+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WrE3Eg7tu05mbUPJfbSn7qiWz9fCg+eQvd5j+ntdtiWdhhYUYR+wT8KBAdCOBP0kL
	 v3Et+sHOQvxK++9cQNc6NvBN6V76GzuZ0Oy6wblSzfg3yHRzGaTYLuOUd7P79XHaNZ
	 2WuO1JKW22S+kL8pOsjuqkD6B3+UjxP+7Kfs4jcY=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 04 Nov 2026 12:28:22 +0000
Subject: [PATCH 7/7] media: rkisp1: Re-apply v4l2-isp reset buffer on
 resume
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
Message-Id: <20261104-v4l2-isp-resume-v1-7-06aeb8cf2940@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2936;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=/KgvK7KKTO9K6EReqGFFUe9cgP7T3ggr+Oh0Hli0D+E=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6yTv9E+f/HyYSMlzPK364U2jD1zhVCo/VXc5g
 j0gjbbuKT2JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCausk7wAKCRDISVd6bEV1
 MhosD/9QOIDvNLn4Zm14QQjjpvXfp+XO3nvoAtoii/VEUB96XunSKi2Dp8FQcxtYTz5gTpfH/WG
 D3ibtb57qPtSIPpaFen3ERDhvZb1vCkPi38JkJPtUoVIzdP+DlVygk7EuNQUkLCnEkRmIWWtSvF
 hGKD/y4OnNhDbwY6aGVt6RrlhrdsZQv4CcGSs5PF52+fioThJGhjheRHldWoj0dmQZRHG2IkAbi
 ApJQhAyc8kFOJytcsRH6Ao4kFxuVOIOOyxCXQr2kPIGYcG3RMFKBf3HPNHYnUaC/O2GovIOoIQC
 q7S8/k+XwyvhOiPhvDkfZpIhqrCA9g5WPBlMJ0TjVbrSihtpuajhTxPj1Z9g9uEwW1k60RKL4/R
 NQ+JpC4oA1bIj1wJ4NX6ARKAgstg4GZwBmmR/KaRkVmw2uHMnRl0C/Y5B59tTWTw+EnfJo9KfjV
 yW0zfTQFUEzozBfLTofPUfJ1kDP0TFz4LkKp76J5pzdJcvQwuONaz+FHmwCjt/d3nex7upv1EkL
 7UxrZ2lgNPGOxYvRVoBtT/pjJgXKr+ptPLSJMeCIexSbFp212cIGO4NAI2TKMv+UTrvEFY6MxsI
 ppmrlwji/0nH+9s66taEQJ3paMBnT2js1SDXV8J9aTjiHcmqs1yrggsgVrXaWxtHgZPqSSHB9Py
 wBvRnt7VoUNvntw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

When resuming from suspension or hibernation with an active stream
the hardware will have lost all settings. The v4l2_isp framework
defines a configuration buffer format that is extensible, meaning
userspace does not need to pass in a full set of parameters for each
frame. As userspace is unaware of suspend / resume it's very unlikely
to pass a full reconfiguration.

Use the v4l2-isp reset buffer to re-apply configuration blocks marked
as needing to be reapplied.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 35 +++++++++++++++-------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 178da1f648869b7b963f634f29f5653cfb16dd77..952c4246ccefa81aa4853a18c941a6f10f456902 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2326,20 +2326,31 @@ static void rkisp1_ext_params_config(struct rkisp1_params *params,
 
 void rkisp1_params_reapply_config(struct rkisp1_params *params)
 {
+	struct v4l2_isp_params_buffer *buffer = params->v4l2_isp.params.reset_buf;
+	struct rkisp1_ext_params_cfg *cfg;
+
 	guard(spinlock)(&params->buf.lock);
 
-	if (!params->buf.curr)
+	if (params->buf.curr) {
+		if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
+			rkisp1_isp_isr_other_config(params, params->buf.curr->cfg);
+			rkisp1_isp_isr_lsc_config(params, params->buf.curr->cfg);
+			rkisp1_isp_isr_meas_config(params, params->buf.curr->cfg);
+		} else {
+			rkisp1_ext_params_config(params, params->buf.curr->cfg,
+						RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
+						RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
+		}
+	}
+
+	buffer = params->v4l2_isp.params.reset_buf;
+	if (!buffer)
 		return;
 
-	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
-		rkisp1_isp_isr_other_config(params, params->buf.curr->cfg);
-		rkisp1_isp_isr_lsc_config(params, params->buf.curr->cfg);
-		rkisp1_isp_isr_meas_config(params, params->buf.curr->cfg);
-	} else {
-		rkisp1_ext_params_config(params, params->buf.curr->cfg,
-					 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
-					 RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
-	}
+	cfg = (struct rkisp1_ext_params_cfg *)buffer;
+	rkisp1_ext_params_config(params, cfg,
+				 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
+				 RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
 }
 
 static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
@@ -2891,6 +2902,10 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	if (ret)
 		return ret;
 
+	ret = v4l2_isp_params_init_reset_buf(&params->v4l2_isp);
+	if (ret)
+		return ret;
+
 	mutex_init(&node->vlock);
 	INIT_LIST_HEAD(&params->buf.queue);
 	spin_lock_init(&params->buf.lock);

-- 
2.43.0

