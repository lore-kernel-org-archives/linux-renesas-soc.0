Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B02431A3C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2026 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348859; cv=none; b=Jo3RsY1h7Ywubqng8xGY9tdfjwkKkoFSFJxz71NVHwhufTS2SdlnUKXqn0V1G+8kCCgQCnHUalfdgskF0TCVC1ixPVFp3+5Wgr4z4AhknAXcl652NtoOvDFXigeRlz9fUJQsW8AVaSPrP4Q2VKD3BQkC/zoW41TDOTMJfDTvF74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348859; c=relaxed/simple;
	bh=c8cVDH4+60eN9JY5piPPVSkAJg5r/Dt287R6xlSNjmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Az+rbYojD5KCrDvhCgyI7IL+xWijvi1EP+0VQs0EMUnK5HUR+BMMqmQjRi4rIooh/9E1NEFGGN6Ne2ca9t2mId8zAfOZK5ock1ul11Myzi7sPH2gjB1xXKFzBWCtPUvRJJ3u4r0FdDxnuXKOJIebg+IiMtjvIc2FxFEF+2pVUFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bf9506704fso468814e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 04:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348853; x=1788953653;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZX9X5hy8bWZKgZ28xeKzE387jyLfPdvXwed5OH+/3k8=;
        b=dyeSA1ksVSdkPAec65fL4PLP7Bmz/xW05venGomlL8r8Ndz62qLAGWym1LQ7GwOVKo
         inZ7fOvISzuTbJt9VrOVm0EYQBNaTArJ1pqs83JPN+jSRiWIpvs0vpr3guc5tpFXRCLY
         9n8cNf/mIWSAAm+iH00+EM5tdh/fE31rPypXYejlM53gThPgpwlRMW8rwod4qZjiiI6g
         Q5+N3IPhQDMZMcGhydDPaL1nwPlYjbz9l6ILBtbjAPy/x9mU98p9o9x6soGXkUMPApgN
         E2s5JWEPTpz+cd93L4qsBcDTvtH4rIq1PeMNGvGLjAEV6dBKvIlAtGDMxy92yTRZ8vgG
         YwPA==
X-Forwarded-Encrypted: i=1; AKwUvBymDiszSXDlt1XazKPwtuce+Lcig/xxAUdoOw9h6f87VAh21iWKzakdn42r/CCfK5xVcrSVwQdo7s1p/o85tGBsXw==@vger.kernel.org
X-Gm-Message-State: AFuF++mcteK8GRo2BCkxWGbmFZfFMlRbvmSP91zW0JTh26k6IOo/Sm9e
	g5ownTwrzJMP+qKb5fymOUMkk4r/rrhPgY2ps6gkzN3juDEOvEPsl26FnWN2dVzI
X-Gm-Gg: AYBFou0XHpFyUJktygKzpgmQc4zI8rUSOXUahfUbsHjP6z/ZzoFHjFtAxC95FK6Q7o7
	a0ZacPHNLMEHVvobJyFqAx1SpxgmKI6hpjPiVbAmt7SmY3e74xayYI1NItKtGidb/TtieT9RI3C
	Iz5xbOYSJUefvhVdJloCq3voAwJp0wJcv8PVzcLKBMxgw8CDa+/hnfHZDEayoPJ0PD3LgQgeKvI
	hxG20aHOxEOMvV0PqYyctAOFKp5zKpNKHVsfbN9w65tneLmGNqM2f6CZh8j6Car8eidUu4nIJ9R
	x9nUFTKu6cotVO3nrIQfyJ6c1CrLsMgDHnQB9rXl++aIOKUjcmHOB9anYTvxL7xhp93Ne+ADcJB
	VTEu97rsIQjahRjFmwZ+f+yPJ5TbseHHbX1cW5eLJdks8EDHaGwy1zdrp5nIbCcKgW7kKvQrapf
	jn4RiuHNVsa3YwKL0ngHXdm1FSTs2qwZ8ZzBU9s8/KXpWHhr7jyxv7JPlj8KT2U4/bGFG0RXpxA
	3a/J035yJ395ZNxP3QYAzhgpw==
X-Received: by 2002:a05:6122:f18:b0:5c7:a814:b987 with SMTP id 71dfb90a1353d-5c7d271fee6mr1658462e0c.2.1788348852744;
        Wed, 02 Sep 2026 04:34:12 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd94646csm1817630e0c.18.2026.09.02.04.34.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:34:12 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97ca74bd6e0so234740241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 04:34:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxHxZctqTD61ZCI6pVD+V9RU6ZflYa/5ylX4v5/43hd2B6dpxlMzd28Nn2oQCduJbcyuNPAAnyOgSk0/mupTsZ3aA==@vger.kernel.org
X-Received: by 2002:a05:6102:6d2:b0:77b:2881:580b with SMTP id
 ada2fe7eead31-78a1f1aff84mr1204735137.4.1788348851833; Wed, 02 Sep 2026
 04:34:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
 <20260826122742.153643-4-biju.das.jz@bp.renesas.com> <CAMRc=MfAdTMb_4ii=up-ESwc322YYjzseyvAxshM6vUcEGfxcQ@mail.gmail.com>
 <CAMuHMdXmn7B_UOb8f2j0_BOx3d55nA0-0Auay-HLFYWtziS+6Q@mail.gmail.com> <CAMRc=MewW5aLqY66i-uUor3ke6k25rjZh3z7Cn76e_KhHQWoJA@mail.gmail.com>
In-Reply-To: <CAMRc=MewW5aLqY66i-uUor3ke6k25rjZh3z7Cn76e_KhHQWoJA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 13:34:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWN_JUzcF-ueAABOsfvvYuZ6r8Zf_vcBwsrb5ArVXWriQ@mail.gmail.com>
X-Gm-Features: AcwNN1VKD0uOf2MvN-4alfN6qZQtlFaKLsibUAqjRFeDI3iaU25OL_kOcxy9-xY
Message-ID: <CAMuHMdWN_JUzcF-ueAABOsfvvYuZ6r8Zf_vcBwsrb5ArVXWriQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] power: sequencing: Add Renesas RZ/G3L Power Ready driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Biju <biju.das.au@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Wed, 2 Sept 2026 at 12:49, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Wed, 2 Sep 2026 09:10:45 +0200, Geert Uytterhoeven
> <geert@linux-m68k.org> said:
> > On Tue, 1 Sept 2026 at 18:15, Bartosz Golaszewski <brgl@kernel.org> wrote:
> >> On Wed, 26 Aug 2026 14:27:25 +0200, Biju <biju.das.au@gmail.com> said:
> >> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >> >
> >> > Add a power sequencing driver for the Renesas RZ/G3L PWRRDY module,
> >> > which signals power readiness for various IPs (USB, DSI, CSI etc.) on the
> >> > SoC. The driver binds as an auxiliary device to the parent SYSC driver,
> >> > using its regmap to toggle the SYS_PWRRDY_N register bits, and exposes
> >> > {usb,dsi,csi}-pwrrdy pwrseq targets.
> >> >
> >> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> >> What is the merge strategy here? Are patches 2 and 3 independent from 1 and 4
> >> at build time?
> >
> > I think so: one can safely select a non-existing symbol in Kconfig.
> >
> > So once you're happy with this patch, I can take patches 1 and 4
> > through renesas-devel.
>
> I picked up 2 and 3.

Thanks, I will pick up 1 and 4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
