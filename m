Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674B437BE6B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 23:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417813; cv=none; b=ksj2nC3Ic0pRJVtbLYBId2ENSliQdeM9PSyThkorynvn0/2b5C3gRfc6pTTMYtal2RSlxt8Ozmk6w+EHqYvcW/NyvR0an62ALlYtSJNkbIk7fXC6QRyjoZFPppgxfrBXx3a5xEUG7ovovQ+KBGBklHVupvoJpqqCIuIOMkHtTM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417813; c=relaxed/simple;
	bh=EhmF3j+M4AduWGCg7EqLVWPIxAwmTTCxT2Gz0yXqaxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zse90nhvlfAMYXB3BnCewbegGIXzpWLETFP1sBEMvw+PyuSKl4jiO7Y9//pgY64/iGDMrq6JDB1CUSFB4TFhtoZDLBNIaqxdWehJUmgZLL19tB4kSeBS9kWafp4aByXWndNDVIO205uKHwFulE+J9mKN051h9J/VQKoCSCsLSZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSRNm0Un; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSRNm0Un"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954df200ddso7183115e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 16:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417810; x=1785022610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=DSRNm0UnpdKO1pbpdDw4uOVfg/zYafz0PCJCpAnsnhVZITB8v6XSABQodNL+sehwWy
         YLnDiSclQhajkd7cGIEz41d8cmCMOu1+XPZhPADxLvCewJWh6NRGgpSn967iPOlAbulh
         dJMpzyjwGN897E34nWoHX/cTyXRaYfWkj76tCsOCZpi5R3FhX5L7+eLgDW+R7ZgMgI8G
         B/efzJOhW0C81oH4Fl/FognDifTF6peZQKNbCyC8lEXl2mOCBQKTZQREnwjlyUDehHka
         QzJMGfdCePgjfR6ihNZVZMqbu0LYoT7IVTvOSvGrN4NVZCuQjRYCTU0VtNuAJtzGMUJf
         3rrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417810; x=1785022610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=CQB1ClSZSvKHb1aDDMM3RB6wZBmNa6lV4pNEB766uWKxOHOvCUwElabwWVEo6YYOpX
         4v8N70l4OgOjqDJAm2Mjl+Aq9SgsBz1FdN6xJn4ohCYibXp8in+qeRtMe+4Q0X5ztBL8
         l1kvvV11n45uutr0UlyecAGDrEFgNh9mjM4xeXlVoANaiYcxQ6pKahzhm3tA5UtGKFHX
         dSciXmMQCuXHqLGt9WfVLKaJBdcVqFeb3w8t534EWxcxrYNk1fUnARAPBpISoy8rlxXe
         Wcx8QVTFurCgj5JmGLQBidb/ouCMytRtUQ+uyimrfUuRsrNdkQTSO3j4ZX01lxZIqhrb
         jVqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBCczD/pGRtfriX+iqRKNZQ2Xm/5Lj6mf8Cb33G5VrLVEJ7HoSp4NWDooNOr3bSOdqlOIWdHuzXZ4VD2IlpXFhYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzntiICWSTpXLgAqUXntpAD8UOcqN8spS8Y2NFHuQ8pOjg6PkbN
	yhaQZACtljL83WTE2E+TVak/BBb2g9OJISNOyGt9zCFibQa4Vl4DFSmT
X-Gm-Gg: AfdE7ckEwC1FkqUQy9zRB1OHWNwX0btLnVwVtg4CCDY1tMkSX+eKIgj6z6HUO4TaJCx
	nT7oJYCC2r4q+v5ySoU+dTbhbL/d0cPxw5UgRxZ9bDiAdHAYDUCd76zzCt2n/qPnsX1uGgQdWBQ
	/s1z9n2PpE+GHtmb4VoavYHJtvAQOA3WyQgNweeCC20syhqTMz+zfjXYysNHpQu5oJIbzLLLjPF
	N2IlBPBlopxyFTBcq1lRgdSkhHNhU1xWQ37cFV4aHPw3qo5gFJSe/758QjitAUgcAnA2xsqF/p9
	HXZ5WCnaSb6ea4qhgvgFnUAv1JFkcKyisIUTjMWIIDuogrpLr8UDXcM8UziDx/pKy03l8k4uE6Y
	2/xTS3BrHxtL5jRGdI7ktFBqBrPt+EEJdwQ2aN906Xq9dqY6IY6DcJYPufQPx4+QbKhUfqHIPUC
	fjAsxFIipEwQ==
X-Received: by 2002:a05:600c:3b28:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-4954a3f36b6mr89247115e9.10.1784417809642;
        Sat, 18 Jul 2026 16:36:49 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:49 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:46 +0200
Subject: [PATCH 15/15] Documentation/gpu: remove completed
 drm_simple_encoder_init() todo
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-15-a78c509e3062@gmail.com>
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

All drm_simple_encoder_init() users have been removed, so drop the
completed todo item.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 Documentation/gpu/todo.rst | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 14cf37590fc7..b7351467dc74 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -29,21 +29,6 @@ refactorings already and are an expert in the specific area
 Subsystem-wide refactorings
 ===========================
 
-Open-code drm_simple_encoder_init()
------------------------------------
-
-The helper drm_simple_encoder_init() was supposed to simplify encoder
-initialization. Instead it only added an intermediate layer between atomic
-modesetting and the DRM driver.
-
-The task here is to remove drm_simple_encoder_init(). Search for a driver
-that calls drm_simple_encoder_init() and inline the helper. The driver will
-also need its own instance of drm_encoder_funcs.
-
-Contact: Thomas Zimmermann, respective driver maintainer
-
-Level: Easy
-
 Replace struct drm_simple_display_pipe with regular atomic helpers
 ------------------------------------------------------------------
 

-- 
2.54.0

