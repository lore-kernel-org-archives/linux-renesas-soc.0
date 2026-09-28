Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACB726FA4B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614826; cv=none; b=IYIjRCblnngnv1MvzEu4i4/Z62P8/FGVMH5C7LH082ybxIvleQVjITCHiHNCzquJ7HDXeSocQaI6/YgRP/eD6POZxRMd5pACUUBHQgRBC4ABykhThQVSPrQOgS5yfncwpW3glyS8AKhDc2m7RkEPTVFHfLwJ+GFk/TtEd/wPuZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614826; c=relaxed/simple;
	bh=+hIOk59b2H3pTCZgJaBTE5mJHtyR19kXkDBOZEQc6yM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=da80rZdqy2+J/0S8BB9xpxcCqj+2yPKtOZu+Hfq+tv8/SQ/pjFPj41mTsKsIyvSEhXOkOvIXPXm0Ga5smvvlPZPAKYIlFFRHo1eLxumRJD6Tx9Km7gFcn1GQE9tOzV0LFFGEdMUSa3nlGuLwr++Gi7ncMY21ikNyxwAsd+XZ6H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b37ccc2c4bso496384137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 10:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614823; x=1791219623;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pwLC5W4u+V0GTSh2RZtGBKpKQq0r57Jm6ZwK/nvUP6s=;
        b=wjDMWV1HU/oD0YA/sTdmNv+Xt8Qhd75LlCFqv7dlu+ygwSKERWEN+00ExnfelbkAK/
         v5oThw3NZrSI47yledEQx0kjNKZ3mxF9n0qPai86vyh7H1YCCps9x8NIYOclrN9MsAMe
         GW6B/D5wzXNhtNEthiaI8ndvqMFOoel+WSDXqMCHJG0BmfJguwCd+s+CtX3ZOH+KWrpp
         jWBev7PRZtlI2t1u8S7tKrvkcHCvONU6jplZoZXn34+J5OIyig/ThM6JF1oluu2rSoCG
         gAfrPmivtnXNg9pzeaoRf5c05WzO3kWs3Twu9gQklCEZgovfNE5xH5CHv+uROvN9rQXa
         BPuA==
X-Forwarded-Encrypted: i=1; AKwUvBy627NpArT1nPuKuzrYIvDx7fHum+ys+NVnR/Qto/dW0e77RoEwQC/uOne+0TGQv3qRrL97EFccENSPWjpT7mN5HA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIK45aZTcTX4FctwyuR3EX75ujW1QInYeOqyLVSeW6N6aKJdv3g
	A0GMy2TPeza2/L3PKhP+AGOUo7oUdJgZwYHugWXdvGtaWkRjnEx1S0EEDaGJ1hIsTec=
X-Gm-Gg: AYBFou3te1K31GGI5fufUR1ZVXdlWiicJblEURvpo+t7XLXQO3wvMJdSYzx26SRPNfF
	9HwYVE30eIeGpf7ieTeke9zXERSzaJSPIuxuowerSwxDnCpqOQUSLzhMD2dqQEAxWkzK89DI5CB
	Kedw1AyHoNi+2HDTZV6/Siv79h1jG9bcw99s8T9KJ9WIu/hZJI8iN7GVxbZKEN3AxyrccwfpJMh
	W9kCldAF28JqRGr8fN0SzBcVYwU/i+/GhRwNpg2ps7wCWV3xzN49mS+Zjx1bn97eVq564F08lle
	zAAc7yQCZEAgvwu0mmopROq1itaLhPAc0hB9lWb78AGhpN2Kd/9RFQAx69Kr9RA3tsvC6Rs2v53
	MyHxoTHNZOHyPi9A7ZQy+XJKpHoN0dVr0jggX2lvy/VmmI0Rv08HxulrCFWfKzKBjGLygDiu98L
	oaz44+7RTBe6VWYJwe0+bhETUo89ogt5ATg4nOw0+PhWcz9IpgJEl8KdbNSxBy4h4kde1CCgUV3
	9yadxAmwyVzFyWThBObmT71NniGrPjbWC9R
X-Received: by 2002:a05:6102:fa0:b0:7b3:3b4e:f0 with SMTP id ada2fe7eead31-7b33b4e2a24mr1918862137.4.1790614822933;
        Mon, 28 Sep 2026 10:00:22 -0700 (PDT)
Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com. [74.125.227.39])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-988a5453f79sm4919088241.12.2026.09.28.10.00.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:00:19 -0700 (PDT)
Received: by mail-vs2-f39.google.com with SMTP id ada2fe7eead31-7b2c2be2633so439969137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 10:00:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxvZ0/cNxRFz3F//o1k703KvPZvGJjlqDay3ZVvUZlIpOAkwQdAuTnXOz2mI0oCJ6NNmgIO1cI0umyCBxxj8IvYDA==@vger.kernel.org
X-Received: by 2002:a05:6102:1627:b0:7b3:67d6:4d7f with SMTP id
 ada2fe7eead31-7b367d65363mr1527719137.17.1790614816969; Mon, 28 Sep 2026
 10:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
 <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com> <CAMuHMdUEC9YoZySP3+-UMP0s9XHg4OOsS1Lh65ew2zka=5RC+Q@mail.gmail.com>
 <1a208595-6442-43d3-b1e8-c4f93856a7ea@solid-run.com>
In-Reply-To: <1a208595-6442-43d3-b1e8-c4f93856a7ea@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 19:00:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAe7U1u69L-O5bvErXN6V3L-=59ewYezcEHcoDodjQpg@mail.gmail.com>
X-Gm-Features: AclHuK_mHVsKKXBL6m4Sk57vt_PCy6cF4ftlcvUQYkzUcI9-oEgY3mVcHJJ2ndQ
Message-ID: <CAMuHMdXAe7U1u69L-O5bvErXN6V3L-=59ewYezcEHcoDodjQpg@mail.gmail.com>
Subject: Re: [PATCH v9 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 18:21, Josua Mayer <josua@solid-run.com> wrote:
> Am 28.09.26 um 18:10 schrieb Geert Uytterhoeven:
> > On Mon, 28 Sept 2026 at 16:40, Josua Mayer <josua@solid-run.com> wrote:
> >> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2L
> >> SoM [1].
> >>
> >> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> >> featuring:
> >> - 2x USB-2.0 Type-A connector
> >> - 1x 1Gbps RJ45 Ethernet
> >> - micro-HDMI connector
> >> - microSD connector
> >> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> >> - MIPI-CSI Camera Connector (not described without specific camera)
> >> - RTC with backup battery
> >>
> >> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> >> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
> >>
> >> While the variant being supported here is named "Ripple", shared include
> >> files are still named according to the full board for consistency with
> >> schematics, silk screen labels and other SoMs on same board.
> >>
> >> Description for microSD is shared with HummingBoard IIoT.
> >>
> >> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> >> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Thanks for the update!
> >
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> >> @@ -0,0 +1,17 @@
> >> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +/*
> >> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> >> + */
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include "r9a07g044l2.dtsi"
> >> +#include "rzg2l-sr-som.dtsi"
> >> +#include "rzg2l-hummingboard-ripple.dtsi"
> >> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> > This new include is not needed, as rzg2l-hummingboard-ripple.dtsi
> > already includes it:
> >
> >
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> >> @@ -0,0 +1,125 @@
> >> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +/*
> >> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> >> + */
> >> +
> >> +#include "rzg2l-hummingboard-pulse-common.dtsi"
> >> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> > Same for patch [09/11].
> >
> > Patch [10/11] is fine, as that one does not share
> > rzg2l-hummingboard-ripple.dtsi.
> >
> > As the rest LGTM, I can fix that while applying, so no need to send
> > a v10.
>
> Thanks!
>
> Since Sashiko also found a small issue in patch 11/11 ... v10 can still
> be considered.

OK.

> To the includes, I would actually suggest a different solution for the
> duplicate include,
> considering that I got confused about it:
>
> diff --git
> a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> index 493a2b9b51d25..95a36f8804b55 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> @@ -7,8 +7,9 @@
>
>   #include "r9a07g044l2.dtsi"
>   #include "rzg2l-sr-som.dtsi"
> -#include "rzg2l-hummingboard-ripple.dtsi"
> +#include "rzg2l-hummingboard-pulse-common.dtsi"
>   #include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> +#include "rzg2l-hummingboard-ripple.dtsi"
>
>   / {
>       compatible = "solidrun,rzg2l-hummingboard-ripple",
> "solidrun,rzg2l-sr-som",
> diff --git
> a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> index 3df7c67d75a25..0c73871524541 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> @@ -7,8 +7,9 @@
>
>   #include "r9a07g054l2.dtsi"
>   #include "rzg2l-sr-som.dtsi"
> -#include "rzg2l-hummingboard-ripple.dtsi"
> +#include "rzg2l-hummingboard-pulse-common.dtsi"
>   #include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> +#include "rzg2l-hummingboard-ripple.dtsi"
>
>   / {
>       compatible = "solidrun,rzv2l-hummingboard-ripple",
> "solidrun,rzv2l-sr-som",
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> index d5bd9b7de4282..aeb92630f4c6b 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> @@ -3,9 +3,6 @@
>    * Copyright 2025 Josua Mayer <josua@solid-run.com>
>    */
>
> -#include "rzg2l-hummingboard-pulse-common.dtsi"
> -#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> -
>   / {
>       aliases {
>           /* this board does not use second phy / ethernet on SoM */

That sounds good to me, too.

BTW, there seem to be more commonalities that can be factored out of
rzg2l-hummingboard-ripple.dtsi and r9a07g044c2-hummingboard-ripple.dts.
Of course that can be done later, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
