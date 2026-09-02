Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C9F3B3BE9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2026 07:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333060; cv=none; b=bupBXsZQp+qv238A8k/808xVmNWlgrcyfHTOzLx4A8HkbTDnhITqfN/LW+qXfGSwzHvla4l1t3/UtNENECU5rOACgtTvzEVEwNTNCkP61A6gPlsVbXOZubUb1BdqvXsw4B7OU4uamS1Xc/FxB5i4d+Vy19c0Nmj9njgYkq9cpWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333060; c=relaxed/simple;
	bh=fzWNt8m6dV7XJ26M3vj5sYnnsx+91P3uMd2jJYIJ1HU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lV3xNnbpRH2nAv+cx+sZQhJN+BWt6FNq4G2/PSPth7jpmQRe4BWD9Kiyd2uIHM/2wyHs9I64VPBljK4MzPin8H91RztlK1hdV8IYYYXYFqpgTadiVKgfTLqy8V0qAc35p0Uo8Z26eh0mlABFd6WBUrKBk4bnkqSdEXMFg5GglQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-96723c7151eso207314241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 00:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788333057; x=1788937857;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S6z6L7vVC/89R/jl0HvM4yW8bp8VIuMDT6yh78Uqavs=;
        b=G5NEzYEaaGWblhsdm6F8Co1+8/7OcDsJdSAQ1Svt3U/94INHtYSRTnAGlQ/WTdrEXt
         4b7JvdAWn0qD8jnZYd7OXad0PvllPBP+RkD7XYJNFLVe/SjZK6AJ3Itp3wueE3NapLtQ
         RxWpIBOnydrreMsBm566uaq22Od3jeRXAybSRw09cYzF7UAxTJvWkcoMxqFZmqq0ER0/
         KBNXhz38Ff16vurhBFIc4T6deCL1N1wME5HTAzvkyM63TL49Btyg1Rv27soK4La03Ymy
         OGs+eSnueHUoqL4Y8ACzJf29U6sqqbZ7Z/lebToz6/tkcYWGh+x8T5Yq2iyhhS7I4q7g
         Gbag==
X-Forwarded-Encrypted: i=1; AKwUvBykRW5Fc2WO7I8N2kUc2Blm8xmoDp5RpbFEbP2J1xkGtPSt2reO7uR96u9YJWCxSzlj5lviGSvfMRdVzo4t4RH2mA==@vger.kernel.org
X-Gm-Message-State: AFuF++lhWqAXOK1AmRWgi9Wi0m2tee2sLMh+bL52jSBvcsFaVVjweYRm
	18LQsHUB3JLOvQAkCFsgUzoPlu+xlKTEz/6cyZiByPhMc9oE4i7rDaymVsStinWa
X-Gm-Gg: AYBFou3ATZHKBKpsB4XOGA7Yo0Ymxk+JpwjEH+TERyJ7JFVa/qbMVVHHR2vu1Fy8ZXg
	aJzKtX40JXC2ZCaPhymjQ2URe6ny25vN2X3ZkmaqpPwne+685FV9SAl7EJ9RnDtaJckodeh+pgB
	L06vEsy/AHGm3OdiK0zEHbkdN5tztYZiboDKegYSsn3da209H06Dlz+qoFjvVgC6uzV4/KHRW+m
	qvMWFVyRQ2QkJXAfpOE2o26lASOeWHamf1aJj0ZLHw5beGf+TjZ0FvoXHZGr6Gmmvz0nFYmbkKH
	618V4e36PwYw7gAPqz5nsHeezQrpLy9I0PGxeklTyJI83napOh6b3oGbE0AVJ6g/bsD6n3Hz9F3
	PVgkpn4UGrlOGrOnEj5GYQ733W5ybJ5jZtpW+2kjx3xcYF98GGmaTNpAKSAu4ZGXj7lMFoQoD2x
	rW1rF85h9TWkeAhnHNni/PPmnsJFRsK4d7FkEi+yy6lvbhu1kBm16fzLwh22W/AecYioxxkeSqQ
	OHlPjRGvfVCePjroXy8kf/Bd5T60w==
X-Received: by 2002:a05:6102:4194:b0:779:e75e:63c6 with SMTP id ada2fe7eead31-78a1f39554cmr774654137.12.1788333057358;
        Wed, 02 Sep 2026 00:10:57 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a1fea5fsm1495771137.3.2026.09.02.00.10.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 00:10:56 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c67175d176so379258e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 00:10:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxl/tMOOkELEh5eNm/ZhM/GR8xK3tSEWKdOe9uUkGulcdWVrPTgM32zEmzdk5ONa3a/Xkk9eKuLZYrW/liZLF0hew==@vger.kernel.org
X-Received: by 2002:a05:6102:38c6:b0:785:3211:f5e4 with SMTP id
 ada2fe7eead31-78a1f1c3849mr970255137.4.1788333056097; Wed, 02 Sep 2026
 00:10:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
 <20260826122742.153643-4-biju.das.jz@bp.renesas.com> <CAMRc=MfAdTMb_4ii=up-ESwc322YYjzseyvAxshM6vUcEGfxcQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfAdTMb_4ii=up-ESwc322YYjzseyvAxshM6vUcEGfxcQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 09:10:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmn7B_UOb8f2j0_BOx3d55nA0-0Auay-HLFYWtziS+6Q@mail.gmail.com>
X-Gm-Features: AcwNN1Wg6VVOr5E8CpOD13jdheZdgLtuCw94APvhRsqrd_GzRtCymguaJxx7oSs
Message-ID: <CAMuHMdXmn7B_UOb8f2j0_BOx3d55nA0-0Auay-HLFYWtziS+6Q@mail.gmail.com>
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

On Tue, 1 Sept 2026 at 18:15, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Wed, 26 Aug 2026 14:27:25 +0200, Biju <biju.das.au@gmail.com> said:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add a power sequencing driver for the Renesas RZ/G3L PWRRDY module,
> > which signals power readiness for various IPs (USB, DSI, CSI etc.) on the
> > SoC. The driver binds as an auxiliary device to the parent SYSC driver,
> > using its regmap to toggle the SYS_PWRRDY_N register bits, and exposes
> > {usb,dsi,csi}-pwrrdy pwrseq targets.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> What is the merge strategy here? Are patches 2 and 3 independent from 1 and 4
> at build time?

I think so: one can safely select a non-existing symbol in Kconfig.

So once you're happy with this patch, I can take patches 1 and 4
through renesas-devel.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
