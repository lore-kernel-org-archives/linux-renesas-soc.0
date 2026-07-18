Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01CE373BF3
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 23:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417786; cv=none; b=JzVRHbQMPGN7sGJtuMOGYN2CAzl2AKYmmzZ2ubKhG9wDGfKLzKRLgA8qnGhHVKnMSgD7rxvHOz8+KRTJ6bo6nVfIw5QGcTmjS6hUO8eajATT3esFIoKywQ4GNm25xL8ydYwAzpOY2LV+Zk1W2x6cw6S4NYCl3rfu0eju2HfOeuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417786; c=relaxed/simple;
	bh=HdxpWSHVTZnagqWd9UGqEZtDSs8wJ971uoSLZwkj04A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sL+myAxeSGJsSCY9vFANbInb5RO2sLD1Mwyoo2W1uYq7PImq8nugNldqmuSIOwa6PgZfTBc442I8ipJfw4EDCXo8zWiAaDOho81sTK+4pdqBFXA2kD3ukCspcKZlZ32xSsj64v77F8Z4/tnmpyY9wYm9hzP9ydFTbPewjESqJz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCBHPNTc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCBHPNTc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b966dd74so36649405e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 16:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417782; x=1785022582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=iCBHPNTcmL2rah7W12QJ5bx8SROL5KuvmYbegOMFlT8oz3sMXFzkVJEoqZAM7iPuCC
         GsPgVt0aX6Qq6HPQlvIa/g9qV3WmVJGAhVO6n8PXNvsH4EVmZkSYWw+IkDkrzgUFRwDH
         fDyTuZpo4Wz9FLsgNsUiWt2CFk+4m90Id76zwg/tAWn0thM2llgPAkBWiwf06B5o2vBS
         Y9b6JZFhlJ0jWmNnTJTTz9drKmYhyfIF/rVseUYiWb8Cshn9NRDceqdoGq4Z9Eiq6Gtv
         xyln555qmks2oIa9dLsZPQfvHioVpl+EzehQ+65b/3LAYMsXApfkEJ5L4yY6raxrRwWf
         yhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417782; x=1785022582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=oS1PJCrmDG6guu0xhwEWyZ1N8sAs/kmk5QXvveQYOcoO4ehfpAY3wDyiUvsjVcgGOs
         ll6QV21x2CRWt0Hqo+iJ8AtuwPZw6naux00hPABVp2iMsRoPnoC0iA1hVM+O/cUed4sC
         jucg5RkCbr8Fzyz1/g0jGjrIOiFo/38mxI/Xt82pK69LWoB++DjNf7Jo0uKgtTR6qc6q
         ucQBqIWZMs1Ks/DohTbpO5SeIap82hByAObZtKYDXUv9xHk7p02t9/AD1qqM2xBy+m6d
         whD0BTwpTdAk4AjBk+QdxrKJ8KfvbmAR8VrfEFlfKkR88WaXPEm/022zcouv3oVKxo78
         aYHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVpuVfhSiIk0pDIv4kG1uDAgDZPCqXvlHGG2DuoXhIasN8htko0Rhoqmaypu+zg7mnSiDKwzk6wzecfF/h2s8tBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE99DM0RZc3llALop1JqO4ycIE6wNNQa+ei9rmYhQyykClI9Bt
	PcYXhE/akuDyhDEHKsWlu4puVIB0BPTrHK/UGh3l/0kXJImmOTtKJhm+
X-Gm-Gg: AfdE7cmhYu50nx5i68N+1x4M/yKGQ08V1GDLZHY+KLmIhUqE6at+HuniIzczqKuqWq3
	Nz7NwfHNKEiWNgFhRZupl/rTwsCLNwchQVMiclYYkdVeDQsIyJj4PTfDDee5BWfmWNp/DkGDse4
	H52VsSOtTBekeETYxxJdkaVjVHrbtV4zCdHi8hIjNryKHjQHXqUciQA319oqv4Y0c4MH56mQwZo
	yb3kDOweeK6mdhTOEIPxPH91Q7dhMLGR9Si7i2AkBuLjbuehP/mwP26yWG31pBVE1ao6pqlFGCQ
	Aum+id22WbRfec9fBGm4jOByfVyY3ugGjMmgjE9pFw9VpJL+mMJDFaDFghE3gcBcBsB41XHcjWY
	u2yCmfPVbsca92XTHXQlu5nyBbV+uWCi/ECQgPvWb3npfgG0vC2vbVpF0zDMI+C2i3e23Gl6z8K
	dF6ETuLFwRwg==
X-Received: by 2002:a05:600c:4746:b0:495:4d07:4fcb with SMTP id 5b1f17b1804b1-4954d0784c6mr79013155e9.36.1784417782504;
        Sat, 18 Jul 2026 16:36:22 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:21 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:38 +0200
Subject: [PATCH 07/15] drm/tidss: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-7-a78c509e3062@gmail.com>
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
 drivers/gpu/drm/tidss/tidss_encoder.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 698f8d964ca0..10dbcc6cdf6a 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -9,11 +9,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_of.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "tidss_crtc.h"
 #include "tidss_drv.h"
@@ -81,6 +81,10 @@ static const struct drm_bridge_funcs tidss_bridge_funcs = {
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 };
 
+static const struct drm_encoder_funcs tidss_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int tidss_encoder_create(struct tidss_device *tidss,
 			 struct drm_bridge *next_bridge,
 			 u32 encoder_type, u32 possible_crtcs)
@@ -95,8 +99,8 @@ int tidss_encoder_create(struct tidss_device *tidss,
 	if (IS_ERR(t_enc))
 		return PTR_ERR(t_enc);
 
-	ret = drm_simple_encoder_init(&tidss->ddev, &t_enc->encoder,
-				      encoder_type);
+	ret = drm_encoder_init(&tidss->ddev, &t_enc->encoder,
+			       &tidss_encoder_funcs, encoder_type, NULL);
 	if (ret)
 		return ret;
 

-- 
2.54.0

