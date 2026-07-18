Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E803803C3
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 23:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417809; cv=none; b=FrxG/Cvj6RbX7J9vIjMdEYh/K11X/st3Qv9d5lfL/JtMrEI3zgL18bPwGenkZq2VuKST9r2Vi60ZGDau3AuIuymrFBuhUHAQYO9GVcaV1dkA+tN7kYdYplsKY1JdisuJS8M/5FowAdqtq74yhAK6yVtYPSd1nJDd74b38Qe80n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417809; c=relaxed/simple;
	bh=bMs/03E/pLT09J4z4UiyyuHjtplBVReDGtgMdQzn3hE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AgZWAfjoy9qKc+y/f3KCW8XCuGn6uqeGvKpayUewWkZ0mDLVvhmCs+v/UB470Xq67usl4PlkMH9OZbHED1IdA61GiFetXkOZMw97XX8/ZzYPmRE0ivnz6nT+ngvyx8TDXjflEoO+7O6+n0UKXgIxb3VguO65LKpun+jGLXQl04c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMIEQMLj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMIEQMLj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4953ddae026so28560615e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 16:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417806; x=1785022606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYdVSEJYSxlpPRyHCi7r5tN2RJPa+UFv81a3Ufh1joM=;
        b=sMIEQMLjQCVRM3KE3fRDECqJ7BJSeIYIFTtB+8Jd6rz4tcnQdyuF+eZ3/ODIExoQnG
         n0RxBtFxkCb/bMuAPWMFCKNKkHY3GX4uj9fAEZZGVbI966vwcfYai+8hN07k4IPjLfUY
         yKCLOpcBipWD8zy9/qpY74ZtLPtWkgV+/q0fnatdFdT/P/L4gAuUG3mpTCL3o61hwfnX
         UOE6Q4O4u0gnWufNbPZKnR2u34m1ru6MnDH1Iefxfku5mVG4typaSVd7bpPx07gJJ9bR
         F95VUvcs9TGmo5sMlqFvgvfoYIuf/GP1jyrhsY0Zs/mGpbHiUbwxvJUsE1eufaXUzkAV
         xMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417806; x=1785022606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYdVSEJYSxlpPRyHCi7r5tN2RJPa+UFv81a3Ufh1joM=;
        b=mspv9D98R54zXkSTivV/A/TYclSaNwsxJ7QflAEJo0SW3uArZAzZJ0giZRFNwqtNN4
         DBbsJK3dFHTzEG+/MQIqkT8O4Gja/gBZfaxvEuqCvGKjw88U41s9aTQZOyT4OrrKAAEd
         TDGrM1GTWPJ34LE0nKsuLg7WHdZbplYtmrCC6+Gwe4L8UZqyCTeW+J80Hcu6JRs2n7Up
         oadb/SSjnO79ac6w05rfDMqLRcRyxVNz2cJD/gA0ZsQKnd10/lcHiWiJSFm65h5Uck6e
         iVTUwOzvs7zdj3XEacqDlCq6gDweqbYUYoGW56WpXptGUE/V0tXvbcVr3oqQGq5CE4la
         VtoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/obw7SghB0jV6fnYTMIB0WE09wHw4CTeG9ucp0OIxy1u5LfJs271ad57xsVEk5OOddTxP+SXhayEPYASR6J1gQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5nMFAEcIcD0o3YWUCLS+S+fisbCfU67l7yOnSIRt5vDT+xpM/
	BaBtuZH/JOKZ4GBsJEksdWE8m7yQKUvHEburwz9TQmcGLtWiF155FoAO
X-Gm-Gg: AfdE7cmd0iZDQc0fV9957ML+Z41/ogBujDNZSJlR8JPw0WZaZiIFBRV1ywIKOBh53lT
	3iwHMElR1aPHxbeS8ht8ZmkzUNp6VOBsqyGDtSaZY9H5zXz2PeMR5ZV5PUo8dyEjTxrOHtOsDvF
	24fK8obnb0o3ZungLZ9ptHqlAes3jXS9GfvylOwz7QnxbEpOq+kn82+QWbQ8CqyGm+8Nt09al8k
	ypNDw9eu9oHLgtPtwRCWGW7XdPHCuHYH13XLSDw0sQ0VDpvwg/bCLkIf97sYkqhrUXFLah8ee/s
	044HOJLyxf0ElRflDXfE5CuJOgbPTb02MUC/5V62hQAdTHHvnEZZp1yHaU1N4l7VoxqjpezW/da
	RER+uIX5Cr++ohNMLKcL60/4oJma/FpnM/mbjiRnGbZmkqhUfQalst+Cy2JaWPm+KvzGlljz2X5
	MHLmkt2qValA==
X-Received: by 2002:a05:600c:1c28:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-4954a3d0be6mr96444645e9.3.1784417806328;
        Sat, 18 Jul 2026 16:36:46 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:45 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:45 +0200
Subject: [PATCH 14/15] drm/drm_simple: remove deprecated
 drm_simple_encoder_init function
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-14-a78c509e3062@gmail.com>
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

All driver users of drm_simple_encoder_init() have been converted to
drm_encoder_init(). Drop the helper and open-code its remaining internal
use in drm_simple_display_pipe_init() to prevent new users.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 13 ++-----------
 include/drm/drm_simple_kms_helper.h     |  4 ----
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 8e1d07b9f1e3..7878b9d7d524 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -20,16 +20,6 @@ static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
 	.destroy = drm_encoder_cleanup,
 };
 
-int drm_simple_encoder_init(struct drm_device *dev,
-			    struct drm_encoder *encoder,
-			    int encoder_type)
-{
-	return drm_encoder_init(dev, encoder,
-				&drm_simple_encoder_funcs_cleanup,
-				encoder_type, NULL);
-}
-EXPORT_SYMBOL(drm_simple_encoder_init);
-
 void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
 				  size_t offset, int encoder_type)
 {
@@ -363,7 +353,8 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 		return ret;
 
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(dev, encoder, &drm_simple_encoder_funcs_cleanup,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret || !connector)
 		return ret;
 
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index cb672ce0e856..c95f86ff355f 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -68,10 +68,6 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 			const uint64_t *format_modifiers,
 			struct drm_connector *connector);
 
-int drm_simple_encoder_init(struct drm_device *dev,
-			    struct drm_encoder *encoder,
-			    int encoder_type);
-
 void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
 				  size_t offset, int encoder_type);
 

-- 
2.54.0

