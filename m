Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC92637C915
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 23:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417796; cv=none; b=ROj0Tkyvjgz9nRczVM41f+solwrq+f3y6RKbg8Dru99BbehoDHwfoOAuA7blTvXLYJKZ7FEqpqF2L+vg11l4CYV9YRCmymX5ZQ+iKdhIpKM2Mtsfws/lZ3qA7gZRPp78C1z3pgSFaGWc0b2rjJkycoft6f3ui4n6e1d61CUYSNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417796; c=relaxed/simple;
	bh=l+SJq54PDPW0D7z8ZwWtaXQW066KSgEiZsyj7f7pch8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozRphVp9w5Xovt+fCR3qBvpj0FbaP4Gst8wDWEsDhevtCfgE5cbJ5Okcg6jVvKO5D0CldLwiDlN+l8zd/0h0dC+c8zZ6SDfUmTEtlgie6o4hOKmdLAl2f7VZi6qs7bsv+vgosStdWzT5Iyj2h02viN/XMdCh1vnGMCdI4UesBDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EymL3PUi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EymL3PUi"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4955158f26aso4606475e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 16:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417793; x=1785022593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46qE/+7MkuQ3i6sxWImy8gxRhDtZKExvMlDvjet5bv4=;
        b=EymL3PUicdIqDXjX+fh5Mcdea9z6aG7REaFKfu5Z6FFbinGjxgAloGgkGo88zDu0pi
         RPkwS4UP98S8OSVg89Nr2wF0Yva2UafcAW2u07PMrZ+SuFlm3oEwlHzP7KbtbqgYGE1a
         xTA5FiG1VBPn8I6maz28n634LjQiUpPW6gKE5gmW/iT1kSgFWxdyvjcyhbM2MViT1B4t
         2159jydHLW5fLHfaxY9yElbfl0M3voj5W2TLtREWDMK+pLGS/23PCQ6j5QoyuQHnJfT9
         4q0v2PQKUUWIa5SIZOCJ9r8HXWgGCl+3JDovEdP02+MAJl9nWTaOBe/qUkhoUaVsCjmz
         KKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417793; x=1785022593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46qE/+7MkuQ3i6sxWImy8gxRhDtZKExvMlDvjet5bv4=;
        b=U7JU/nk8dgkTYXDdZ1zTixvRTuov1XDwvv3aAYU7dSyY/9JEJhljUZkBX/2S0wFWJ+
         E8CaYtWte2PlPDT4UJyGx39+rbrg6YEVkt0VHdy20OfKLIKKIpJgQqV4SGRpIJ7aaKjO
         uswgiK9GB6sxhnpCjInH8CnNG0c1kenZgCPFyDLc5Hmil/XDd28HWSoEy1CO63/Kk5Fy
         mjyv+NFG8Y4035+I2vwVJTJbRquDqnLxdvfx4bhsHb7bK1ql+b3v8d+reJdaME2EftJ2
         OkqySPU6JsclNjOPM2XQCurYm71/cgMBVbUrdJrldyKxozt5OszMJXBPINXS69sF9AMq
         epMg==
X-Forwarded-Encrypted: i=1; AHgh+RqECwj96rn4OCyxQBxutgFhWhFBrlgqIrY0mkbMHrbnjTbdxUvPtlISuHJYGupKAnc5BR7j9YCkE0fT8kvY9HHPhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgp/f5sxu11HbkdAcDmx0UG4sIAoaN+eWfHDGp8JKoBUQ/MKTl
	Qu8q9Sax8k/Ysp6hkGGKV7TaRWczxF82AcOjgA4chHzmmXIyi6hagx+p
X-Gm-Gg: AfdE7ckbhchM/FT0iG2ZsHsbGxl3F3Q88nVC8BI7AlJQpYxjT0Le1HzjqyI0xpio324
	j/asgt91PemT2lIXcARMFV5GrDUS+P4SMO+gxxd9fF191BoIoABnadutM6KTyvWF9A+gL6fElgf
	BQjWqRyV/WAMr+M+4M1wSooK40ywNlG8/ELvmihQHJJDquVV/PzA+fa9hwlTES1W4M3UYanHwz7
	YHDpjr1V5Skh6/8HyVgT99/Bqe/bsfSi3XSC7cOZQLxByUXSqlTKF9qczlG8kvBvyNJ+sx7IwOD
	cLTFlj2fz3hGDDDr1b7gIiMWqZfhGqXQKMb1H2yGYoTdcL2Nam+4Qj3jZi09FeI9iNOa2543ed2
	IJ5KinhoEaQBm+ZDTkyV2YMQHze+QpuEFuFQ4fPckY8J+tZ2sx3v2pmifr3RZRKA7+9aqqnIOkn
	lW+4zVTtl0Rw==
X-Received: by 2002:a05:600c:6287:b0:493:e79e:da63 with SMTP id 5b1f17b1804b1-4954a51319dmr90732155e9.34.1784417793083;
        Sat, 18 Jul 2026 16:36:33 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:32 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:41 +0200
Subject: [PATCH 10/15] drm/renesas/shmobile: remove dependency on DRM
 simple helpers
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-10-a78c509e3062@gmail.com>
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
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 1a2b9b68af6f..2dc477c7eda6 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -21,6 +21,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -29,7 +30,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include <video/videomode.h>
@@ -436,6 +436,10 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
 	.mode_fixup = shmob_drm_encoder_mode_fixup,
 };
 
+static const struct drm_encoder_funcs shmob_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 /* -----------------------------------------------------------------------------
  * Encoder
  */
@@ -448,8 +452,8 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
 
 	encoder->possible_crtcs = 1;
 
-	ret = drm_simple_encoder_init(&sdev->ddev, encoder,
-				      DRM_MODE_ENCODER_DPI);
+	ret = drm_encoder_init(&sdev->ddev, encoder, &shmob_encoder_funcs,
+			       DRM_MODE_ENCODER_DPI, NULL);
 	if (ret < 0)
 		return ret;
 

-- 
2.54.0

