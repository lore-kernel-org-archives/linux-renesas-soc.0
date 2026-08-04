Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F813DF002
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2026 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848226; cv=none; b=DXIxl5UBnewWgGEsmNimuOPR8TFt6H3eXtN3PjipSi3fzOSYXUoZ+NvxNwbYt9siBFzwl1FBeqnf6VfhfXFTi+Owyrt8XMtZ0fy1pK0NwRSBMIIFFyf3xCNUN2mCk/dA4BrY2jhB0Gi1SScdBgOEwgh/J8IKgYmPrd1rTBvkJTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848226; c=relaxed/simple;
	bh=fQ4W0KEfbC8N63G60/7q1UZXWY1PDGu4SJ5By4uKlUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXAe/X+fJrNNGXLwYBtKRdYSpH12xpr9Sb3cgDil3fiD0PDAfq0ZIbk35ezoNL7+wbLbmd5G1UrUwpZeYy4iiZdFaZUJwynO23L59LgjRfIeFZ2X5jOAMf6TZTJJJrJo/I4/SHub/gcKtC53VAQmz2M1LZ/+/BU3eFSIH2zcb/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c27e38ee18so2588668e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Aug 2026 05:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785848224; x=1786453024;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JBGPEMXGhnDdgHfHxVUKfwNAKxtFiEiLS7I0AAldjOk=;
        b=KF1Zfju4sdnon4kXxe4YOBNJNhVL3r/x1cMfS6Bj7NIFWkBa8XbfVd+ac6egbaeKp3
         aUQB0aMin+G5FLuPcA0d+vXilzhjTC+WzuszsOubeTobOKYyq/qmYJ3HQvyqiocXSxAd
         G5Tixd9VSVJJmcDWfmrrKfyJ5i7nXtSroWV0Pr+5Np8rpRA+GLgNyyIIHBh+XbxDMouU
         vBeFuqhj9dnDONfDquIBgc8/BI/kjFkS5AS8fKf9MyqgKo5C9Ltl7VhLCKERl3VqCqs/
         lnwTGsHL+zp//ExGx/7LrB8wQXYbW3gxsyA0v1EiyN8pSkG/jeGL/5S2XJBOyv2FG0n3
         JdZg==
X-Forwarded-Encrypted: i=1; AHgh+RrJGDB9ftOaca0hM6U4RjrlTeSBmigMtD2tUrU4PNMrh/JocaZcujbF9cQK/VIQ4Yf2VCVilK6TtfoE3ya4KaprTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI5DOOtgFBlt4TLc7nOpMzsjOHriINC63Qg9PlqXs6Tva1VpTb
	34sGYv6plYLXf27fVRKHYXXqa+a9Pb/jJeSuWt7x+mTzcLukaOVOY7tndZdOnZ0W
X-Gm-Gg: AR+sD119KbQz2BD40AqF3NZNexQesiGrsOeRDkc/uurT5O8Fc8xyk6e0WS60TK/xRpn
	T1ZJaC2QFLrtoTa6HY57OZiuPRdnEPFiZ1k93zTkmE4wtHcZ/2sjecMGugiRuYs/76rtuTzRsEL
	GSS4FNnF3vqOJqZ0Sg+RfO8E4eetS20n/JdvQJV0ZcU8Es3VD1N/GZ2i4WRaSvM5fFrLBxcTNAH
	RU/bvW13bpTE+eypSUEIHaL1cguDsD3e0HQMimZZ3an1qxxY643rvYMVBUK2VK7d6fpmg8BSzQ7
	kgb/qbn9VvH/RW2GhBbuXC1APVkeh1Z7BOzmGmzZUGhxzwK5WROvs/u9kCQvXOpN3qD2riId8GY
	fHd9cYKy2PaPNEo9YN2MM512hIBXQys/qH6M/G2NANe21XjXpq3WVgf3foCkBcWSMoR7S41ThPq
	GVRu94ZEpqOODr52gdXUiEc+/6RepHcIKIdNXE0vOSFC0UCL0g1x0sOkvLq/rI5eLp85RbMIDC7
	j2orwSaZU7XqANGqf5og1uO7YxlvfB5Va+3QoNk
X-Received: by 2002:a05:6122:4696:b0:5bd:89bd:3559 with SMTP id 71dfb90a1353d-5c387898d23mr4686595e0c.9.1785848223663;
        Tue, 04 Aug 2026 05:57:03 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c3d01eab3asm313091e0c.0.2026.08.04.05.57.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 05:57:03 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bfa6766cf6so2453244e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Aug 2026 05:57:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrszX2IibGAioJpm9xWe0NyRVjSJzW+bDNMNUAbO2dq3Cb6MXKSQ++FCVSIzzQbBGDC0hErL1X3uOV59YBaNDfgDQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2c86:b0:745:1c72:cf72 with SMTP id
 ada2fe7eead31-75b2406f27bmr10567769137.13.1785847794532; Tue, 04 Aug 2026
 05:49:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526181700.25310-1-leandro.ribeiro@collabora.com>
 <20260526181700.25310-3-leandro.ribeiro@collabora.com> <20260721234802.GA439272@ax162>
 <126e8bdb-9c39-4fbd-ae8a-26a61dd4f3d6@nvidia.com> <CAMuHMdXXbPUkyOy0R0s58ayBK0mFFjZa4BKMUBwsnwr-oCQ08Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXXbPUkyOy0R0s58ayBK0mFFjZa4BKMUBwsnwr-oCQ08Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Aug 2026 14:49:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW3dno+-XD8kHG=vQSue9oZe+H1uAWF0v9ZhqUqrzHF6w@mail.gmail.com>
X-Gm-Features: AUfX_my1DFORQUxVgV1ttAGOeGGrmxibdLdSpELwdogkwifIufYpPCOG_LYxVNs
Message-ID: <CAMuHMdW3dno+-XD8kHG=vQSue9oZe+H1uAWF0v9ZhqUqrzHF6w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm: ensure blend mode supported if pixel format
 with alpha exposed
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Leandro Ribeiro <leandro.ribeiro@collabora.com>, 
	Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org, airlied@gmail.com, 
	daniels@collabora.com, jani.nikula@linux.intel.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	pekka.paalanen@collabora.com, simona@ffwll.ch, ville.syrjala@linux.intel.com, 
	linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Aug 2026 at 11:07, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, 22 Jul 2026 at 14:08, Jon Hunter <jonathanh@nvidia.com> wrote:
> > On 22/07/2026 00:48, Nathan Chancellor wrote:
> > > On Tue, May 26, 2026 at 03:17:00PM -0300, Leandro Ribeiro wrote:
> > >> Before "drm/drm_blend: allow blend mode property without PREMULTI",
> > >> userspace would have to assume that only PREMULTI was supported by
> > >> drivers that didn't expose the blend mode property. But now userspace
> > >> shouldn't rely on that, as they can't count with drivers always
> > >> supporting PREMULTI.
> > >>
> > >> Warn if a driver exposes pixel formats with alpha but doesn't expose the
> > >> blend mode property. This way userspace doesn't have to guess. Drivers
> > >> triggering this warning must be fixed.
> > >>
> > >> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> > >> ---
> > >>   drivers/gpu/drm/drm_mode_config.c | 21 +++++++++++++++++++++
> > >>   1 file changed, 21 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > >> index 66f7dc37b597..8cca1dea3b3d 100644
> > >> --- a/drivers/gpu/drm/drm_mode_config.c
> > >> +++ b/drivers/gpu/drm/drm_mode_config.c
> > >> @@ -674,6 +674,25 @@ static void validate_encoder_possible_crtcs(struct drm_encoder *encoder)
> > >>           encoder->possible_crtcs, crtc_mask);
> > >>   }
> > >>
> > >> +static void validate_blend_mode_for_alpha_formats(struct drm_plane *plane)
> > >> +{
> > >> +    const struct drm_format_info *fmt;
> > >> +    u32 i;
> > >> +
> > >> +    /* blend mode property supported, no need to check anything */
> > >> +    if (plane->blend_mode_property)
> > >> +            return;
> > >> +
> > >> +    for (i = 0; i < plane->format_count; i++) {
> > >> +            fmt = drm_format_info(plane->format_types[i]);
> > >> +            if (fmt->has_alpha) {
> > >> +                    WARN(1, "[PLANE:%d:%s] pixel format with alpha exposed but "
> > >> +                         "blend mode not setup", plane->base.id, plane->name);
> > >
> > > I am seeing this warning trigger on a few of my machines in -next. A
> > > couple of those use amdgpu, which I see has already been reported in a
> > > separate thread. Another one uses ast, which I do not see reported
> > > (apologies if I missed it).
> > >
> > >    [  +0.000137] ------------[ cut here ]------------
> > >    [  +0.000004] [PLANE:37:plane-1] pixel format with alpha exposed but blend mode not setup

> Same on R-Car Gen2 (R-Car DU without VSP).

And on R-Mobile A1 (shmob_drm).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
