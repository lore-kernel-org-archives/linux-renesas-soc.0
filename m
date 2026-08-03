Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A97406805
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Aug 2026 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761631; cv=none; b=oVMvEDOf8UtSYlQpLVCBrZlnxNYT2LE+MG2x9MGLKZCn4kxsHX0qKE+1vhwpkEBKKg9pkr3VesZI6i8RuEgYLK+tbiVhPMZfPv+WdnD3LFawrcoLSnBDpLta3iCABqGCiFFlBIETOoGA61pOg7Y3FvinTnQdjk3clZCIdpbPGgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761631; c=relaxed/simple;
	bh=Ir8txI41duHjjdUa1tYJv/Mb4slAcXRYTZiQjfKa4u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lsXR168SBTFO2M2oBXvL0J3iqKWL31UOVToDCbRBYgMZ8z9JiU/5/ZO7qTV/wVjNCjfcNMiT1hQtuydTbAZY0gIkcL02Q+Isdc3hqCGT4ABTWf4dfXQcmcexigybaXh9N+H5pPvGrlGNwlMmJ6LjGbTwhm1o6Y+gM5HXor7if5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bfb5e20a90so2291805e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Aug 2026 05:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761629; x=1786366429;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WGVqxVKLC2Gks94xayPEyUqyvnJiYIaVHNXa8plDaec=;
        b=eAGlRznNdWdkMy5vVGUK9c7DihFA/ygi0rDi5xQBxUd99SPNLI2+fY23d/cey6ePlE
         l0zehMk/ze1hewR3Vsay0v3TuD2n3VMGVeNJZ8JKs2FqoL/u5lVIodQRcaIpDcxvKol8
         hiVck5Bz4sMVBUDIY8hnljcrIX4hT1WLswb6jD9/yVVyyL6oKB0NqTi4lrSGOcG8PK7g
         JxT7JhzgHMYxGoko7rOpmFjbpMj7grEsq2YeCyaZXrFC4ENfmec+3dgiP0EIXN2gHlkL
         pzxV9Dm/gEqQa78uJPAHB8TxlY3CB3S1q72MBuSEUMMKhkuOZh3vV7ZW6qgmBYuDApPl
         MR/g==
X-Forwarded-Encrypted: i=1; AHgh+Rrk7Q3Zu3z8wsFHkQ9p/rSGiELC8/adfkCSNvUHfrk2DOc8Xi9DEEtzzmRj1u+JiU7fQ/7PAU+vp4mtsu1IfEEJUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFKvGnDQN9LiRKUiebpA6dz8GdQ6Q9yW1NQTZuahzbuMeQmw5W
	zncqHgYy8txREMCMBAO86u1wld/6Fdr7c2N3/cybqR8KWJMtAVcaCBEvWSD6hB8M
X-Gm-Gg: AR+sD12oylNUZN1w8IbNvA+kZRUFkoa/1h64B8z7IO05vVm3u+8k0sqPU6VN28h4wHD
	wzcQ5mlGnKmsMhlm4y5qbVuw3H8c+ScplKVGBX2tKbJ6d+u4kC0/wcu1rQYJSMiHaVrBUBI8fVW
	/B1z2tY9yrkK3xh6xUMb0zm+GsOAUf/AT0i4mFow6VgsI385Jzpj5HtpjT3ddYA9bQaXmxYEHcx
	4BIb07kxJ7zoXMqu/MEnQ8oVwvnj757l4e2tH147WXCwipXekz74TTO8/5ITrMf2JVWo2LPKZb7
	N4QF7KRH5v23uAtVxjINPkp2mcknHfRCfByFh7zSaUBY4boa7jMhSthAr+RaroaWoICXTRMGVTu
	mWzv+l2+Y3607nDGsd7Bg9m0/VHbadMQuppcBnwzj/YRq8EN0Yj2oFOFeHiAIM9BpkG4oaBXaR1
	gZueRLDCX/D09doS8e6HKo1I1t7DyeECIA7ccn81xmw6/jy0YYIuKkY6nYy2TcgtVDC2m4dCaUg
	lcJZItYJbE4cUfYm8QABNKw0A==
X-Received: by 2002:a05:6123:122:b0:5c3:2f5c:55b3 with SMTP id 71dfb90a1353d-5c3876e6019mr3149865e0c.3.1785761629382;
        Mon, 03 Aug 2026 05:53:49 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c37eac085bsm8554491e0c.4.2026.08.03.05.53.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:53:49 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-74dceb46291so1331283137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Aug 2026 05:53:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqhAc5cSO68rYMoSaJK0JTnCVBm+na0ut94tyHhr7YXYds1/xd9zHN/rcQkmqZ8kGjYEj+3XZxn0MSONX/ZD6A5hA==@vger.kernel.org
X-Received: by 2002:a05:6102:6a83:b0:729:affa:70fd with SMTP id
 ada2fe7eead31-75b2295c6d6mr7103654137.8.1785761305110; Mon, 03 Aug 2026
 05:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com> <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2026 14:48:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUe0F06RE4ahWb9ERFq0_pnNy-qGZ5ewod+59x-RtU_FQ@mail.gmail.com>
X-Gm-Features: AUfX_mz7dUNKx_CkXmX2bBiqeRWfQJXaKympC5b4Q722_mZANMq2M_rTZsMnNYo
Message-ID: <CAMuHMdUe0F06RE4ahWb9ERFq0_pnNy-qGZ5ewod+59x-RtU_FQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] drm/renesas/shmobile: remove dependency on DRM
 simple helpers
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Michal Simek <michal.simek@amd.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Diogo,

On Mon, 20 Jul 2026 at 17:41, Diogo Silva <diogompaissilva@gmail.com> wrote:
> The simple KMS helpers are deprecated because they only add an
> intermediate layer between drivers and atomic modesetting.
>
> Open-code drm_simple_encoder_init() by calling drm_encoder_init()
> directly and providing driver-local drm_encoder_funcs.
>
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c

> @@ -29,7 +30,6 @@
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>
>
>  #include <video/videomode.h>
> @@ -436,6 +436,10 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
>         .mode_fixup = shmob_drm_encoder_mode_fixup,
>  };
>
> +static const struct drm_encoder_funcs shmob_encoder_funcs = {

Nit: shmob_drm_encoder_funcs?

> +       .destroy = drm_encoder_cleanup,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Encoder
>   */

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
