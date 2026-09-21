Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7503A9018
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974820; cv=none; b=B8jCgC83FHfSM1U09dvjqBeA8uxQj9cb5x8TKOg3NBBol3obbwI9iYWGxmKar9bdf+F22zdssslqiUvOGbdwwr7N2DCwNBXV3b4/ANQR8TeIg03cGoMFFbvoF+adcqp/dbW+2Q3a/skXi0+DmyjD/SaJfZKQqSv1EJbMlXAYBHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974820; c=relaxed/simple;
	bh=IWy4s88MhDwNpHOdGe3jP1qXGMxg1e08ypz8dpiL9Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwskasKB+Op2zRrYynVL0NNGc2nvw28bg1Z88YhgzRIlxk3iDIW21eqfTv2e6+/uTi36ziuD54f3VQz1ygaG6GXxZ5Vt/1va/uNChaWkCMuLu6tzkr0+RCtc5puKLDH4KIpUgDA1EZ/p/upXi0NGS1IEjWrryxIcDNVqGVnvl0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91059280d58so24075626d6.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 00:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974816; x=1790579616;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kOgPfCklfblv+g6nVV8jDyWvhZtKrbscHFmS476/ss4=;
        b=goZJmf8iuRXMckwBKNrRoAd+TvtedgwUPUh4KKujiFvJCwvDNvx7swNCm2ENcudbre
         ihTj/MqyvRC0pA3FVtkIoy7+B92RThWd+A7YFDoRfXzfB3Zg+s8MyEd+sYtr9UBQ0ChI
         j9WsvgCLO1va6ki/tFiYHRFxayMYWecdpXhJpAf9GDpzlWKsjioWyTEsiv2MIOLlNuMI
         ptASUDBosxyDfZyfC6SC+KUiAdJOx/0yfYN+yNUCk5v6wmYSzk66He9dT5KJsoALjFxN
         b8m0kChdmI5D2UuKnY6o+4XzF/35AfD78gjKfaNsAnjkMfTX28t4i/g56Uq3rfBd6R3p
         9OKQ==
X-Forwarded-Encrypted: i=1; AKwUvBynMOWjyk+RYq5tC5xdbuARYiwtQepuoSjU9aNCBzXewzgU/Iz+g0c72w3diP9xuVKP0tzMvm0wmVTpO97JmFKJEw==@vger.kernel.org
X-Gm-Message-State: AFuF++kogXMd5k5JJsFzu/+q/SB9B/SbAVAbkTo9dg0K2v0H3+YW5GWw
	t6XeWhO3mjG0z8/gwXbXJ8eZgWQx/G65mCtkgnb9cf396B4J8t8yLWZAGtMcibiL
X-Gm-Gg: AYBFou0Bau1eV601gDl8TOQ0YnDQf2NdKOOezqvVvuKUMaVXo1Xjz/AZ2roxOSs8oZd
	0pOOpsrgil1u5oAzAgu2kw7mK8HOzObRZgE5YXi2nmd0JuLht7UTg0yys1xYOUp/W+Hwhqlibnc
	QnmUli2HnLLo4PZJoqAinPExYPeMZNFi1uLHWM/Bw1Bprp6VVsTCAoY5mcDIDPcie6sKBOb+eB4
	GKkfHWKanh6KrNON/P3TU5eZb6080jvQasvpmKB6cKoVd3euUzp3ml4NlO5I69QTiq7VtUsxeKi
	yZAJuVwS1n8bU8YTeLao6BP2WtfEN0awg8Q9s3YpNAs0IkndDKQqOenTCOwJV/UnVwVsYCb6wyg
	Crfj8v8WIz5sM++VeAzQczNWKbWt+tYnEv/Lhsnz5rfoHTkvgLTL89dNjaGIRwF2HITHrADUfVV
	ob4QIKQ57GYzm8l9GqKz+RyCf2mE/ZSZkXY0EBJ7AMUdE+pjaQ7/S2svskywRsoezbS9efh7FTZ
	8jsm1v7fEzxbpzyu85nf/PNxkeWbuBDZGYvNA==
X-Received: by 2002:a05:6214:ca8:b0:912:517b:7bcd with SMTP id 6a1803df08f44-912a80178acmr95347506d6.44.1789974816283;
        Mon, 21 Sep 2026 00:13:36 -0700 (PDT)
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com. [74.125.230.205])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260962cddsm63276486d6.3.2026.09.21.00.13.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:13:36 -0700 (PDT)
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910a0cefaso240631285a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 00:13:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzgLJPsp9PbziqrVNWiDR/uWN009J9Qn3pdcQ0dj/atjjmSW4637aBOYCyqYqi+Bbas3c+HOqc2hYBEtJ5dcwPKXA==@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:7a7:198b:674e with SMTP id
 ada2fe7eead31-7a7198b70eemr2080779137.35.1789974354429; Mon, 21 Sep 2026
 00:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:05:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
X-Gm-Features: AcwNN1WjYVMR8LtQc9Hk29H2mvcKQfYOy_09b_XHHWkw76vwCkEFuElZphsH01o
Message-ID: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
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

Hi Kieran,

On Fri, 18 Sept 2026 at 12:55, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Add a new dt-bindings/media/video-interface-devices.h header that
> initially supports the Orientation types and convert existing users
> throughout the code base.

Just noticed these are already in since commit 6ab5acfb8dd38729
("dt-bindings: media: Add macros for video interface devices") in
media/master (next-20260903 and later)?

> v3 collects tags, and fixes the typo, but drops all hunks that do not

[...]

> v2:

Interesting changelog order ;-)

[...]

> v3:

[...]

> -v4:

[...]


> -v5:
>  - Definitions now accepted in linux-media, rebased to get conversions in.

Oh, you say so here ;-)

>       arm64: dts: renesas: Convert to new media orientation definitions

So it's been safe for me to pick this up since v5?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
