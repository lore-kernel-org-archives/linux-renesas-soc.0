Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855913403EA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 07:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974440; cv=none; b=aCv+fQ46WFlKIXQCP/duXs0JqLOTwF1zSiVuV3IPjVU7PCc0x8vPbac0M/jqC7Zg3BIlrYoQfd5NKLg/UQ+JSTnsV7G+0R9M5Oe06sYSUnTA4Oel17nle1GoaZlGepusu//BoRfK9GdxYUfFttAc9ZZAyff9AB+Gdgcs8pcec5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974440; c=relaxed/simple;
	bh=mlXvSVm/Lq7qa7w+AV7HA/L3OjWuvTwojTve2NS37ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NC45XTWY6INtWyUWmClykl4jRsaO239bZp5cBorO0iIZO/Vjm/1xl7Om1mQpBrzhsdctC3tkV+vV7sqsjuIJgVO9QOPsv8Ofkzux9q06Yq/V+g80p16odaADGd8B+Br/Xmb5mZqq2byL26Ve+3Xdk1Me9ypZecOxi+GPsazfMRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e53002bso1523259e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 00:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974437; x=1790579237;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HB8j5/kP2XPOkdK+SCbhJLf9Uj+WB32C7OC3D9kNjGQ=;
        b=mgFf7qNkp3m2HocB306L0DzMDY5p2fGXDPCxa8JK72abzm7YFh0/1VMzNKccqYWJD0
         saUWzQjRMxhZDDAELV+KxfwvpFKg/SOxaMb/fIohb6e3R53HOsd4EjkOgzz0bSIdIfME
         zftdfD1CFywk4hGpzr8YshdTHa1JDpPJDOym5wNZ7XY6vXjZ8hm/N9aTMdp+9EnGnx1K
         r39FgyPS/pSY0vp5eAv72YAoRGK91i7ypDdnUH5K60N0tEREPHsH6WLIrSfZhJCE3phs
         r96K0aaRAWmEITfuVJLsip8TXvOZ0yfBVE4MESxgJbhSvd5RYX8/9sz+U9VzEKYoWoq3
         7Biw==
X-Forwarded-Encrypted: i=1; AKwUvBwe2qnixhCrmNzHCM1+C+ZnvNxXzn2kT+uWMm4gB/tmqzc6gLZgIXAWUucq/7XxGpVqbaZYoHRR/Zt+PvfY27vaog==@vger.kernel.org
X-Gm-Message-State: AFuF++kW2SWFeIvxf7Zs4aifopj4GZY3jyLAUc0DXU7SKAtLrimumzx4
	PjWM3PWhVP33isXeI4io/wsrSdqCCWHvMISIeuB8Y5dh6oovM86EoGcgB5hcKHlS
X-Gm-Gg: AYBFou0vDb2a46AQ8LvqsyqEP3mGbfvmvYb9i1znJycjUBNs+d8M0Jd7hR+Ot74ED67
	zR0e1Obf6dhtl5e3UcGkDcSJBd5qxWOxw1gKh+k76GNYfnixe+RO90ih0ebXsxMdPZhITh/JdQ3
	C5QPgLwdW8JwDxRG/UfcpPeC04Kp7FBzkToWHkmaaowrtdvxbh75nUJrACz2CMx/MPSV7WJm8J1
	4k762XGxOMQfzYHbMEBLEhH4W+3FK5ja5ycFOvIv6wosnEKjpQrrel8TiG0dA2rbwiOtHeM18wY
	ZQwrQ2sSBRxpMbtXa8LYhACH302BBj3bNuqxXuzFwENAIFEEyDOXI4An0BpRSzPilWgzKgXRwtc
	FvlCw2Q82ON1AEY3CNRB6zIXW4vIcIrAgDra+4qnkCwXooyEoSUIyuDk3fNKNvYiGl9LEdzWL7o
	8cWNfE8mIUZ+wzVyzTLcFRK4HlPJsUtQJ70WkGU5MI6iEN/RDPMNiAEmPFHwiHx+2fSZaa0oEXp
	rWRkPIBTBGGGyCtFRxGNQMWci00DcIiqavapg==
X-Received: by 2002:a05:6122:180d:b0:5c9:c60e:3a3c with SMTP id 71dfb90a1353d-5c9c60e3d4cmr2213556e0c.20.1789974437433;
        Mon, 21 Sep 2026 00:07:17 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9c190d99asm6386179e0c.8.2026.09.21.00.07.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:07:13 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7b3so1403138241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 00:07:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz2k0DBZswlcnPmgvuSRKpcHlgKxOI7CWE2KvMvcNnKhYeK/Z0TWXwYnTxwzHtJH2Yj4TNEnReTS3ABEE5+aDI+4w==@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:7a4:da60:acfb with SMTP id
 ada2fe7eead31-7a55af3177fmr4503081137.8.1789974432591; Mon, 21 Sep 2026
 00:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
In-Reply-To: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:07:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
X-Gm-Features: AcwNN1XBDwh6z17IsaQFiDrYFydSgUDFMGU_5lJeAdoD724Pjbvrq8QmlAe59_g
Message-ID: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, David Heidelberg <david@ixit.cz>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 09:05, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Kieran,
>
> On Fri, 18 Sept 2026 at 12:55, Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> > Add a new dt-bindings/media/video-interface-devices.h header that
> > initially supports the Orientation types and convert existing users
> > throughout the code base.
>
> Just noticed these are already in since commit 6ab5acfb8dd38729
> ("dt-bindings: media: Add macros for video interface devices") in
> media/master (next-20260903 and later)?
>
> > v3 collects tags, and fixes the typo, but drops all hunks that do not
>
> [...]
>
> > v2:
>
> Interesting changelog order ;-)
>
> [...]
>
> > v3:
>
> [...]
>
> > -v4:
>
> [...]
>
>
> > -v5:
> >  - Definitions now accepted in linux-media, rebased to get conversions in.
>
> Oh, you say so here ;-)
>
> >       arm64: dts: renesas: Convert to new media orientation definitions
>
> So it's been safe for me to pick this up since v5?

No it's not, there is a hard dependency.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
