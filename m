Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785944D2EDB
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533985; cv=none; b=G0cr3ubMTdqD/QZyh+eatofv3Ki+gQf+YqyL7VO2beKema0j5iTtBHFoX9tqSYRSX+TskhkQ7V3dgq7PY8RUBBdDzywDTv29OD6N5wU5qRVxtrrMydPBTN4/+oQNxJpginSfkkm4wnq2U0iOoIqgTkBN8eh5JcJ8zOXiTRBjwUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533985; c=relaxed/simple;
	bh=ghXH2BJF4jduj/BjXt7Xua8zEA4xRov01HKEMrdgGlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ph661mWtaB/+ZdDAyJI8UKSWynOV1z60mH3bY8TOUXPnzs29SAcuthP/M8uMA712vnX4f8ZKwTKO7L1oDHvQFl9UuG2zxuAnBXxA+m7trznqKnKR3lHYPnwrojQ9gJdQ7o9VaKi9YEjpEXYxgtfIOiqSBIebbCJVLMv1D4++ToU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso495776e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 07:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533982; x=1789138782;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=inqGTZSC3u1CgB7ts6dRXUQ1Jo9pob/IqZxPyHHBxZ8=;
        b=R8W42z84hu8n4CKGoFhzVTT/eamnikR1Yw+nEF7gDZHRsLF02pud7rPkSdPuwjWzTx
         /t/OG2U9+vVma6Up4NWmNGyS0U1DEYPsW9JfKo2mnkRPCLfut+B/gFs6luvqq58Cis9g
         PeX2PBLZjbQCSC+Mw2tnpv7Rix95CqZ5MhWuJqAQpvWzvZfIALmsq8jc+WDgpNGKD9H0
         T8ja2nG69l/0Sqpwpm1BgDaQPrOHSwguF4PANLUoWhXU/LFqynLylwX9g0mPw8052536
         dce8+zpc+3cm8oBKG8nGJY6T8vKjJ0lu925lDm96rjn9UNhPk4LDI4RvxCYWklbxX+JA
         kjvw==
X-Forwarded-Encrypted: i=1; AKwUvBzzMH13yN+Jaj190ghGXilVLTSkzzxH3aJamKpmQMLHxS4BI7RFvBqdDtttPxXKjv/3OE1x9V7IxbUg/uxFVE2qJQ==@vger.kernel.org
X-Gm-Message-State: AFuF++napPFmZdyXOzO4WypHOVknrhrHAyoTkWbTnml79np+2doYNpC5
	jsip5PNCfYfBd1317a1lKSmaQ5om9qcbFtyAbWWfKnVVc4T/YdMPnCSRum3S/rhE
X-Gm-Gg: AYBFou3K1i9fYbCcZNyj/+Ygt9V6DNHi8niLQ2ZjjRmq1Jecsv8IBcqO4tR1JtOycwB
	8t3dNb23q56x9daQUl3KIuvVq5XNiTvnhj+5lKlU+nx2gZk95ynHcPUcB040bxSDR78DWfnCz3r
	+uTJNzqEAexgypTPzpLac/dnNAsOtK28xblmw7sOO/be3xBubV/vr7UV9KaDRnwti4FstUGvgeT
	+GnMcfsaBO9zgsS+3kH3LBnEq5/PIu2r+oX/Cv6bCw7V0ta7Lvr6yQbLaBpKmaw1NOn+/Ijd7Kj
	Mszo7ad236piCdvQ/kWimRmNwdi4VWre+9oRPhrclX0KlhGP/Kn7JS9PwRCeZz+UJzp2aSESu2J
	/J53s3iH4l2R80D1B6244c1wmTHBpB2f5QDWZ3Ei60iJHfPIbeVI29sZfTbPFLmUotN9Dm4jVfi
	VWv6NeS+U6/ebgSuxTtn7zSdWdxArZEZza/u6nWg+CPLfKa3dE/gu8X62YWBT58v6/VmmO3I4S2
	ee1X6sS6buGoFyhSMgKx2ugAA==
X-Received: by 2002:a05:6123:67:b0:5bf:b500:c4f4 with SMTP id 71dfb90a1353d-5c7ed285aefmr2910204e0c.2.1788533982098;
        Fri, 04 Sep 2026 07:59:42 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3874acsm2146002e0c.15.2026.09.04.07.59.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:59:41 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97e76cabd96so349167241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 07:59:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByLodUe1rJrNNGcKYBFuC0RlZMLQsUK5XLvSkL/tu6rrEMigdqwKVFuRCprOp64NPepH+UwQuGlJAd6zo3zMFZW6w==@vger.kernel.org
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id
 ada2fe7eead31-78a4a7186d7mr1918546137.7.1788533980738; Fri, 04 Sep 2026
 07:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com>
 <20260821150408.73829-3-ayman.chaudhry.kc@renesas.com> <b2f486b8-a391-41bc-8a7f-dc81c6752205@kernel.org>
 <TYCPR01MB11865BD2FC199EFC6BE613A5DA2A82@TYCPR01MB11865.jpnprd01.prod.outlook.com>
 <a7cc6bf8-706a-4b51-a0ce-d6246045d5da@kernel.org>
In-Reply-To: <a7cc6bf8-706a-4b51-a0ce-d6246045d5da@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 16:59:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWuhpaEjzoLowag=RUMah-LjtSkmkDSJu_ZaYYHAHHcSg@mail.gmail.com>
X-Gm-Features: AcwNN1XOIqok-XF1Ox7YMle_czDmXRTGGzFdPMRVImnv13pc2p3_Z9A1m7XbeZw
Message-ID: <CAMuHMdWuhpaEjzoLowag=RUMah-LjtSkmkDSJu_ZaYYHAHHcSg@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: power: Add r8a774a3 SYSC power domain definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 1 Sept 2026 at 16:15, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 01/09/2026 16:11, Ayman Chaudhry wrote:
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> On 21/08/2026 17:03, Ayman Chaudhry wrote:
> >>> This patch adds power domain indices for the Renesas RZ/G2M v3.0
> >>> (a.k.a. R8A774A3) SoC.
> >>>
> >>> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/power/r8a774a3-sysc.h
> >>> @@ -0,0 +1,30 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>> +/*
> >>> + * Copyright (C) 2026 Renesas Electronics Corp.
> >>> + */
> >>> +#ifndef __DT_BINDINGS_POWER_R8A774A3_SYSC_H__
> >>> +#define __DT_BINDINGS_POWER_R8A774A3_SYSC_H__
> >>> +
> >>> +/*
> >>> + * These power domain indices match the numbers of the interrupt bits
> >>> + * representing the power areas in the various Interrupt Registers
> >>> + * (e.g. SYSCISR, Interrupt Status Register) */
> >>> +
> >>> +#define R8A774A3_PD_CA57_CPU0               0
> >>> +#define R8A774A3_PD_CA57_CPU1               1
> >>> +#define R8A774A3_PD_CA53_CPU0               5
> >>
> >> No, value is 2. Or not a binding.
> >
> > The values are pulled directly from the R8A774A3 hardware manual and
> > as a result are not sequential.
>
> So not really a binding.
>
> > This is compliant with header files for similar devices, so if we were to change
> > the approach now it would probably make things more confusing for the
>
> No, it is not compliant. Maybe it is done the same way as old devices,
> but feedback was provided already for a few years, so plenty of time to
> accept it.
>
> > user and it would also require some special handling. Given that this is
> > compliant with the style for similar devices adopting the same bindings,
>
> It is not compliant.
>
> > it's easy to understand as the numbers come straight from the HW manual,
> > I would actually prefer if we could stick with this numbering scheme if
> > possible.
>
> Nope, as explained many times already for obvious reasons. Otherwise
> provide me clear pieces of code which you bind here (as in DT bindings
> header purpose).

I agree all numbers < 32 match a documented hardware bit, so technically
we could use the numbers directly in DTS.
Note that unlike e.g. interrupt numbers, the power domain numbers
appear multiple times in DTS, and are also present in driver code
(drivers/pmdomain/renesas/r8a774a3-sysc.c).  So having defines means
having less magical numbers in driver code.

BTW, due to similar pushbacks against offseted interrupt definitions,
we are now ending up with duplicated defines in .dtsi and .dtso files:

    arch/arm64/boot/dts/renesas/r9a09g077.dtsi:#define RZT2H_IRQ8   24
    arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso:#define
RZT2H_IRQ8  24

So please let us have our symbolic definitions ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
