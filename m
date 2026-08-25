Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629ED37CD29
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 18:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683203; cv=pass; b=kqJdbDHv65jd2h0atw7p2v3NRXB2ZbvUmWgQDwdQ65asCRtUUEb52M9xMr1UVdng2YXICom3aUv36SgH93uRFPgw62B36QvvzEQCMi38nxL/sLWFVrWa7/ql9IWQfu2op4UXk7GVnrFLbrOhZl6VkJx/tZ8zzL+n1N+fnWfPfI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683203; c=relaxed/simple;
	bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJRNvw1ta0SMid9Ow5nkcpcbodb7ySyCwVJDmvVMTMgUi3mR77r+3gPpKlSX+QYGEBENvCkoJL1GnuvTsgiuUL/Uej9p1vA++XodNBRnb774ZYPQeX6Spm5RkeQaKNgFR2u9LV+Ybf08cDPYqLpL35RUxwCxJ26fKZmLnuBskeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/WMQGl2; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/WMQGl2"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-448b69cfc6dso189417fac.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 11:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787683200; cv=none;
        d=google.com; s=arc-20260327;
        b=hDt5Aj7lBNFrMXOucRFIjHOJtTLCV5WfYeS9ebSzoY7JOHj2DisgDGH1nnQDNku79q
         xJPHxiFiWi2pU3h5ywHoEghg0SDOlhKhTAmcGNOkNkYlrR2XSw/58mIMtnx0HIRhEs/5
         nWYJI0yn/wgkdHspo52C43t65mGHsSHH71C/dmJTILYDBrqJGgzHQHAgPs9F97JaVf92
         LBmtrewoJwRhrMaXsqS5R8l0x7GqnQEGmt3onweQkW3RxjbVHmCooZRgMQSiRMnkBW0O
         SzHHpL5gWaVKOLU6KdWSqzat4O+0d+1ztIcHEXn/VyYwGLCW5cPCcdZtqrnuO7/Pupn9
         tgiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        fh=iu1ndyUjIoo79Mw/HBScsBBH29zhmao6YkC88m+QhvM=;
        b=IVefBPC4h85pKtkf0GNnHjl/Oz3uFk/UyrWuLFWY+FUztXWmEvm+naotZBl6FtzVsT
         c/gHNBeGLQE1faocGujs/goDgihHibGKGH8rvorFWzeO+L72nDqlhkX3LaZ91wBhHG5n
         D749KP8ZYTpsUJeYNy3aH8/w/Xcicfabjfej7bXVyWQkSV6kdq25sXi37BiGcGwnFWDC
         wn+1CnDQwRU9lyR5xMJPHvCEY1OG0CiTJcWOtEcx1ZBJADLExKkDAM2WA3mGY9s+/bd/
         q7M9l2MgkzZOWOt/3eyMJR5oQAP2SRiL29M0rWRPHS6agAQMGq84rzVmLn7EUdMKbCnC
         KFnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787683200; x=1788288000; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        b=K/WMQGl2ZdGLQuaSQqD9iQu02BHFLpl/p3H3OZdZxR/bBDGQp5KNu2iVpg36hNlfhg
         WoQEFDr8krOgQIpMU0V3j280JREazubY2O2YsEF6z+07m5w9CIaqAAjBnkdEYRlQu+y+
         pD/XRWpuHfeGLjDfmy9Ig9pH50RXIICyAOcdw9XFFVtDZZriIcDMJqBqzBEo78Yg+k9E
         MhhuGygE6O/X7SL+/HsL9VQ6F6OsRGK/97YA9rz8erSo/DNvgtudBgbpEEnZlI/8GUMX
         21CmXKNzOwECkSY1y9d0pN1/DCKPfXzELHF+QyZeBKWFEePIAzj6Y9UzjhBWJQkC+VKU
         eAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683200; x=1788288000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        b=EAg/+wa5INO4pznLVBqja9vkBUA1o8QrqNXMdAaBVdYq5SRsw+t/IgpLmWZ/ebGm9N
         iW6h7I4Q2a1rbErbUJHz269dGSwNDzBj7NY/mb1AgbObl5IiIoBCwq0ImHke4bDSWOZN
         XUNkpzVh/R9uROFlJ2S3fM+W/wp9tEAB64l9VRiGuPIASitUB/AoGpAgP9a2TM6X3o20
         2qalElJSVUi1F4JnCkBPEWnfWcCb2fO4q8KzzEnxtuH4eIK/S6Z100Oj/ZRxPgZFVji3
         m/C57G0pvolJ73IcghdZ/wc2cMV+9xuHjXpwV6qIysZr4A0XQTByb13HvXZREV+hf80t
         nwRA==
X-Forwarded-Encrypted: i=1; AHgh+Rosvj6qB4uSeAv5UIQueFdgzF0hu9QzJIFOMO6GUkEHyaif9kzOyt2fRENanNTzokv5kKKsgf54vOEsJj8I8WF9Ew==@vger.kernel.org
X-Gm-Message-State: AFuF++l+RSoq5UQIF0me1IIH463o9KTbU7COS0VIMkLONZWeGXBXAbTO
	Vh0mmHlY2ym7D+eLnDtMSROh3wNZH86WUnqg2ZQ8ZcThddtO9iFn/QEr0fzjABi6UW8rCFiSZh8
	4u7PkcNNWvDP5R36QAtMfC3BnJHVuYXU=
X-Gm-Gg: AR+sD109KFY82oskzsQMXtcN0CnRz0w0puKMNrNF6D1Hzzk27v7dGlMc61HLBv+PAO8
	bfa+8/CIQqmNhJSmbIodQRzlCykdv5tfgygKHkx4CTPRGKSuNITSVzgxhXpaBDQ+SPAZOICt7hy
	GnT0KpTvGtiIgOsQZ3razSi5tWVtoqNjlsncWuWsMRh7QKoANEhAiyBQEnDbjZqFVcbWa3oW41m
	v1AMk6QNpKNSOPVTwKB5UULK9lVKyjql/qErpa7FoI/IJhP6n/truM0PgNQVwXQkvUsZ86hXeNs
	B76obzt7JVWSRaSadkN+Zu8ucdBh5zAhizf/juvjxPlNaw==
X-Received: by 2002:a05:6870:f623:b0:435:16e9:f288 with SMTP id
 586e51a60fabf-4659bb24b93mr1602806fac.20.1787683200126; Tue, 25 Aug 2026
 11:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com> <e393996a-3ef1-4c43-b762-af8cd0f2a4b6@suse.de>
In-Reply-To: <e393996a-3ef1-4c43-b762-af8cd0f2a4b6@suse.de>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 25 Aug 2026 20:39:49 +0200
X-Gm-Features: AcwNN1Va3aTr02pKhzBqoinFUkwxjfSbh2WQ-EpZwUvKwCIdS5rdnwq9NOj-ZWw
Message-ID: <CAJpoHp56yo+eQAYjvR3ez=HTSzapCd3dYppo=MdPx-Lm4J4DQg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] drm/drm_simple: remove drm_simple_encoder_init
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, David Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
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

Hey,

> Diogo, do you want to send out another revision? Otherwise it's time to
> get these patches merged.

I would keep them as is, unless you see anything that should really be
improved before merging.

Best regards,
Diogo
