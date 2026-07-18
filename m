Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5107D37E5EF
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 23:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417803; cv=none; b=DEPqYGFng6L55yu9tyfgkooeoelioQ7/TG46K3FuzYvJ6U72AlPd+jM8HXMOf878z8dASGlntb2ELLfwFBPrZbO4z99Le4QxVh4VJuA/6pJsktT/8ZkgVaPFDmoAJDJ3Ut/b5VBbQBkb/Uob53aJjQ3eo8EFsnQrg8vn1luW4Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417803; c=relaxed/simple;
	bh=v9DwgKRLbmJruTxxwltkPfgfMQ/xrenPmg2doUmkQsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nsahSCWaLE58DjDMCyMWJEt7ZAtWeik6r2ZePVIE1EvOJOVNwcY1pPyY331pCQURCxGqrgP2rP0fzLECrEYTpYqwroO1Z3hyaDsMmcdnRjwdP52tJrZQ9QS4ievZQK14Ux3jDUUF193e65GhGhrU48S/iMQMGfDhLhO1WsakVcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsjuOq53; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsjuOq53"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49553515a8bso5203135e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 16:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417799; x=1785022599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glDDRAcdG2z8u1IQ6JIBLAUYK0TMezc+/0A/g0HZvjw=;
        b=HsjuOq532p1gPLWIsehb7B7x8D5i2wYHGU/GHZbSkS7rxvCrrqQMxAXsmdCNbEae59
         CS+/KWrSq9YGEqNchTJ2aG2jEBh6aqmAdm+emOemTCH2HZ25y+LWlj0Al5VbxsflwIyI
         NMQlGI2n7+vJBKtpC07f8oEQMjjJe6gzT7P910OaKPl5AKqGqsqZJZhg+Ez8ztYOtTS5
         bfPojmszmrvfVNGM/v+cn5/aYUsio8H2d2Ykn8nPxOeHey4lOKBqVyuivxjhfXHsaXA6
         /IdvZFebztE2W79BOTO5bKdoP1NtR98HMDNCuv90LllM5mDzqG02mTi/KwbzcKWYcXJ/
         Fk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417799; x=1785022599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glDDRAcdG2z8u1IQ6JIBLAUYK0TMezc+/0A/g0HZvjw=;
        b=R5os+52SxViQNIuPy4m2jpqMmjGFSPBJbxPt28lh0JWTj6Jm3VIRdqnRlU6i8mRlim
         BI2pCqkoQ4P9EtldqgPBDKRHaeR2EV1kLetQYg3KSB0rcct1+OzNlMQmWkWLhAG+xb2O
         GZ3SJabT7zrfPbsFOgdG76v/mFVRkgCVAmUJZ+xTNJnLc60iAZfFJZLdHvdyEtI8Thpf
         EjyXiTP8tt8WPWuILE2g+uEghxuz6qrRhLSh+JUUH2Hg4bJsWCLQYdWZ9Wv0VoAPlCuP
         osYDioIAFGXYZOwLQuFbiDG0bkVOwamNmaL/HzWJSUlAZOmG7GI4aqRBnQkH+FJbp2PE
         X5FA==
X-Forwarded-Encrypted: i=1; AHgh+Rpw1c1JVkSdwiGSPdWs6Rd21FcSE86Yvp2YlXa2t2K3iqQQ1SXXfed8zXx5/0E5JyQYVZt9Wx2YkXJ1d+nhbyyxAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXcVDm0m4zqBsEyAbqPz/f0GzISCj8r2ztyEdoo7rsDTZK6OhF
	j7UuXvr19/ZT4cjKZ7CFDB+CID5c9Hc5Mn5VD4ceDFGu1nN8+wrUrJGD
X-Gm-Gg: AfdE7ckpgNIR19XD2NN4iVcjAhz69BK6Eq6aoQcCGQPlBBIXfYgYSvu3bKMjiwX5Hq7
	7KASBwLVmf3Va/5rMmaxb+BH4KfKjwvDiHlNKc9yxrNjsPWWiIARSi/RmYhWRE5benP1KAHUtYD
	6UFQGQFMQpXnZKEzWRBcLNrAqgHVzvRpaGtKS+lw0r4VJ0q+DuxstedQhzNxcN+5QTvRmsnwqXh
	TlvouQUDOCDHFK8VpY/oqaNxBQilkDzptgBJgAQdNb2BxoQ9udodlMezdbOvrz06l76PJ2qNK3B
	TVA+GsPfwxXgC2bhkDLU+ihJdXp19jKQLIaMct8LLu562M+sdbueIanA0H/8uAXJtz9QpUSZzTE
	RM8+1GXobouaCT04gJ0G8phKm1P3XrH/PyE3el/ctViz5IIjPZ0y6HUfp+Pn+wiuCsPL81Mvo6H
	UqX7MK690Fog==
X-Received: by 2002:a05:600c:3b91:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-4954a3d0065mr111986515e9.3.1784417799407;
        Sat, 18 Jul 2026 16:36:39 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:39 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:43 +0200
Subject: [PATCH 12/15] drm/arm/komeda: remove dependency on DRM simple
 helpers
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-12-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
In-Reply-To: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
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
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index e8cb782a6f8e..719568d9f7c2 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -11,9 +11,9 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_bridge.h>
 
 #include "komeda_dev.h"
@@ -635,6 +635,10 @@ static int komeda_attach_bridge(struct device *dev,
 	return err;
 }
 
+static const struct drm_encoder_funcs komeda_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int komeda_crtc_add(struct komeda_kms_dev *kms,
 			   struct komeda_crtc *kcrtc)
 {
@@ -658,7 +662,8 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
 	 * bridge
 	 */
 	kcrtc->encoder.possible_crtcs = drm_crtc_mask(crtc);
-	err = drm_simple_encoder_init(base, encoder, DRM_MODE_ENCODER_TMDS);
+	err = drm_encoder_init(base, encoder, &komeda_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (err)
 		return err;
 

-- 
2.54.0

