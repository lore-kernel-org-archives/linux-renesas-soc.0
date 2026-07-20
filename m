Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7D2436351
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562091; cv=none; b=bpUTtvWWI2Mvvvdqyf8yd2jdoWSf68x2rwUXQJeStZCuz7r8eoq5MledgZEZVKe6mNZGwds/K4mDHxYL0m3/LUnc/IyOo1hHG48fxg45CeP9GeMSx6SHqMSVPFWlb6uSfjdS+M6yai3elN2GO7JE4xk+SGm2IBuv0547GdG05F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562091; c=relaxed/simple;
	bh=b45v6y+LLUGyopM335rc2RHdtrcJI8ZwsczKTNDgp+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onwZAFZMKgBZhOzkyWvIlyYesBDo34ciF99h35XxS0rzdN37vF0/0BCMtGUUDF6yqX40DVDrTKFDv432Ri1mnI946HET7JV9rguX1nH2HeTtEpgxK9zp0iR4WMCKdnkJO6dFyygxnAxUjBFU5hRO6QAlKXVUr5TkyCD+qZ0hGV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QayUpF17; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QayUpF17"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954df200ddso17132685e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 08:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562088; x=1785166888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCTzuFV7eFCGxIzO9ORcmzHtSM3Ggk/jrKBR0xDgYaA=;
        b=QayUpF17xIC1mlZkqF3QKUN6AM+/crGZ0xwMgLfy3ONaUrLJmX12m6lI9XDD/unC2Y
         EyDFhOqFK874VxTI4ITJiy2uYySi5pSQNXKY5/gbPdkZX8cs3v/+dN7fTN2UF9eQ3qZ3
         zAdHvqMRANCeZXiJm5zzc+JKOVzYCi6gPe3Z8nEBK48j+uDbJ+VCCAXdR45sY8AhXv3Q
         hlHpInJOu4cU1NyUM/OdZD7+58dWDLPL99oEihxGVyzFj1XJvd0ziCJU+Vy27EFroJma
         g6BHlQx5rdpmpuMozXwKwI74FNDcFksAgk7i9PY0YLrehWStdimk0F925NoWLZQlCVzY
         chHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562088; x=1785166888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCTzuFV7eFCGxIzO9ORcmzHtSM3Ggk/jrKBR0xDgYaA=;
        b=n4h6sjaJN8HiVQgK89/oTBNh4VHtqpcmWNu0dlaFGMp9NF3UQP5NVYDpAuoN/sCpss
         21tf0AHJ4j1dRqrhoSvHv49zBoLxWRhstw0mpDPQYc7Z/C1vyx1li8T7JuDdve1Fyikg
         uwjA9C2HeaqNUh+pjai/FhpxZQzx+lbUEnhKSv1xKyVMubZw482TJg7FXAVq1+QMxYiA
         0GNe3fp73pUnG4tZUvuXrEHDfPFuPOxVVo3i87HDNUY6HMZAenL0j+U/+pWOiEH1zOht
         SzTc1r/N2wQAx6eCI/NtMlyeV8FP+XjUNm/AMmIsTqcZ38ODCl1znue3DwuIZpIwRSdu
         s4MQ==
X-Forwarded-Encrypted: i=1; AHgh+RquAL63Nq7Q8Z9JpuJNQdvTwYmBrtjZ8YOSj0lhA12Qn80QBnWfvVoOTd9z/dLa8aGJJxkO7ckE5SZL5ynSMPa3Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyo9anMYxnaDlgc3stpXhq8+eRqMEQ1B7WOrOTTV/COYUFbVEl
	MSV9Jyxe2qXvsPnnL9u8qGErcgYnY3pJwxowXh6IVvI4xR/wN1tNL1GD
X-Gm-Gg: AfdE7clTGpUZHYTpQu5aHDaYJxVTWwBorx/LDWwb4KCkCe1UeYNrtIsqso5nb0LsL+j
	u7YVZL0Rt7x4YH+aRI55/QsMoRzPHxbZyuZRFrFkVebTZglOWd3XcxrRKSrYIx/yD+2gR5slFbb
	Mk0gX/8UkKGn4ddKkLlJCaDit3S67F5bg6Pkaye7qXPubj/X8YzhUlSwO18Cw8yZ2/IoX3EUyc7
	CYm7ap7Bfes6gqmJCra9IdEHgKMMHA51AIkraK7w7quDm+R5a4OfEbDSGW33mb2tCBsVI8h7hJR
	v8mDzesOU6oWVtXyELBzkDWZyiZJYYXe81VOWec0SE/cYzHAbscdTCW8xAP6LsklNfiC0gSAlIJ
	0OoHyVanFYvdNsQdX7TbfuTzwrJJLdyPemas/o6bU+LlCgxx/tKeXDnyTA9omjhqR1V5wzYHCdJ
	pliJIGM7gO06SEA+of0CMw
X-Received: by 2002:a05:600c:1d1e:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-4954a3f39ffmr153406895e9.14.1784562088052;
        Mon, 20 Jul 2026 08:41:28 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:27 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:43 +0200
Subject: [PATCH v2 11/15] drm/hisilicon/kirin: remove dependency on DRM
 simple helpers
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-11-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-doc@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.15.2

The simple KMS helpers are deprecated because they only add an
intermediate layer between drivers and atomic modesetting.

Open-code drm_simple_encoder_init() by calling drm_encoder_init()
directly and providing driver-local drm_encoder_funcs.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 15042365dec0..62c5bd3277da 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -20,11 +20,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "dw_dsi_reg.h"
 
@@ -687,6 +687,10 @@ static int dsi_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static const struct drm_encoder_funcs dw_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs dw_encoder_helper_funcs = {
 	.atomic_check	= dsi_encoder_atomic_check,
 	.mode_valid	= dsi_encoder_mode_valid,
@@ -708,7 +712,8 @@ static int dw_drm_encoder_init(struct device *dev,
 	}
 
 	encoder->possible_crtcs = crtc_mask;
-	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(drm_dev, encoder, &dw_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		DRM_ERROR("failed to init dsi encoder\n");
 		return ret;

-- 
2.54.0

