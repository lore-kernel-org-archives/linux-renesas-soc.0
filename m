Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DB6353A8F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797619; cv=none; b=I7CNyXgKMMp6HrdEUFZLBSqpgXjuRXYT77m9TfY/h9WmW4Ro931eSAunAvwolxefyigDHhbft7coroa2+JmN+nBPG8uZXPNawG64zpunbV4L4m2SkqvOErHWCjFNsFmfWq+rPPisJQMlcA5ZOToZ9RPUOAnyr6RnjYjHz0tLU0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797619; c=relaxed/simple;
	bh=6OEDWCRMBhUQwuYN96z0QclZTB5fdpiw/4HbCIL4mzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRknZEBwwr+T3MWucUbmEkL6MuOTZj9vpaloTKxyjR6p2YzM03ArVcmRj+XD1dhq2JEuOL0rZJP7auahJhO7gYQ4OPciThydqGQ0DROL0/iyrmqJiJZZ7c/+ZKFCCwV02eKls2kfYR/0CzCuDsto3E2draC8HDkxDY4hnBRKxCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5e507e778e4so534212e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 02:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797617; x=1792402417;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oEYfT2se9mQPZq99mjf04mY4Ov62RIWvkBSPqPyDyD0=;
        b=SHeyyTOVAAno2Jz5z0Qnhzax6ocgdHgaYbh8H1SV6POwgjUAYTXCrcoSTW7ELkYd16
         3MgIlTnUAJFTu9zTTvlbgVCKc0kf/jfqLKVOjdb/bLSwY453SC7kbH1ofD9MVnoTvAF+
         3AvJS3HHot5m9JAdIAQswt9hyrEJqc8CZa9CaW1ZcA8U1+Fmd8y4vQsRcvMh8JybxKR9
         zU+x6NBbNBncqli22un8hsC26KHDblCfhhtu0RVVBUPndaW7RElV6Mkv6ePp2zz/maZM
         4rejfasWu/dPKAij2/4k27mwP8Il5lujL2FvuVskyS50odZauRlIw6OPnhBYvB9G+ycK
         rGhw==
X-Forwarded-Encrypted: i=1; AKwUvBz2tSGznoDwyPqSuSPgz0rNXFLSHWBP4M4CSL7weEzSTTRoG8KZqEWHu6yKHVMv6O9MTC2YDdLTQk/DGJ3JP3nBTA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJkNEsbHEvAstilVcC/sdF4C2u9+8rWpkqVH7kicuQ8W8rRO/Ya
	vc2Nj66Mue4FpR4U5TIZlXO8K1j96Mq/d/WmcpHWrzW5C1927x9JgJig/tWQSHfT
X-Gm-Gg: AYBFou2SQIfYG+Wjjcs3u1BJr1kHeOmXVmyV+CFBDTA6ggKHyvllh9cf5DTYdZXKOvi
	0UbkutPotB2JquEsVUydCKepBaw5pZprZouWskkAID/3XKeW9+FkcA0zJ1A4Ii5FV0dyglcMBtg
	C1UPxGB+MCeenLNalBsK0ehV8fbXzJwuzWe4KBvfxzcXq5Ky/KCQoZC+aFO6l8SM/Uwgkyw4GXq
	+Cm+Q3MpElesHS+BMXL1TdDSeagXMdHaKvPApzkhBS2v386NLsqeybZ+Iw50ZD9TBpuWEkODFzT
	PEp9/V8Pme5Jj3tJMSz0Gizm4br0QrJ/u7z8c5BFRJ8atAbbtyRg51rarEBNhnkY0LI8ob5IedR
	A0Z2PkJzUHZpM1txzCoMgbRD52B7VP50WVxapoc0Gia4vyFK/4aeY7gtet7p12f/dvPFku6UHp1
	NUxhF6+Rv1vIAhD0h7fTHhEyktFSKiB4RB832MmvY1e5JwwKyCk9KTYTbFb7b7r+8FQWG//cw2I
	B/0lahU5g4SRXb9V27MCqlR9fdidv/HSsD2Zo/lJ81Bmlo=
X-Received: by 2002:a05:6122:83d3:b0:5c8:4831:1539 with SMTP id 71dfb90a1353d-5e91f4515c3mr2245230e0c.5.1791797617456;
        Mon, 12 Oct 2026 02:33:37 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cab8c40sm6927827e0c.3.2026.10.12.02.33.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:33:35 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-989a4cab97dso137277241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 02:33:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwUh4V/dOfO7oCtiWFoPjtUAbuTfuCtXOxoccCvvct+To5Y0LtQUSqrGFLUll0lC6Lh0dpq+QxLhMog6DALJAt/3A==@vger.kernel.org
X-Received: by 2002:a05:6102:e0f:b0:7a7:198a:c2bf with SMTP id
 ada2fe7eead31-7cb373c9305mr2142364137.29.1791797614854; Mon, 12 Oct 2026
 02:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008201953.34307-2-wsa+renesas@sang-engineering.com> <20261009-7b4b54034fafb7ad60ea917d@squawk>
In-Reply-To: <20261009-7b4b54034fafb7ad60ea917d@squawk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Oct 2026 11:33:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWFsg72nQ+EYYYwLUYvQBULa5Xz=RL3O3pwCECo9H81Ow@mail.gmail.com>
X-Gm-Features: AclHuK-zPgcfuS_w3EiTe92ek8871OrLWJ4iGuAnS9nipI978vqESTCZAqRzLsI
Message-ID: <CAMuHMdWFsg72nQ+EYYYwLUYvQBULa5Xz=RL3O3pwCECo9H81Ow@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rtc: rzn1: add resets property
To: Conor Dooley <conor@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Oct 2026 at 17:36, Conor Dooley <conor@kernel.org> wrote:
> On Thu, Oct 08, 2026 at 10:16:53PM +0200, Wolfram Sang wrote:
> > The RTC on R-Car X5H does have a reset unlike the other versions.
> >
> > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>

s/Suggested/Reported/?

Closes: https://lore.kernel.org/CAMuHMdWy6ksspwvj8jRxf6_OATU5rS5p92KyG4+sEF+ag7S9NA@mail.gmail.com
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Passes both DT checks. Kind of fixes 3b3fdc9fd40d ("dt-bindings: rtc:
> > rzn1: add R-Car X5H support") in -next, but we don't use Fixes: for
> > bindings, or?
>
> If you want, make it more obvious IMO that this is a correction.

Yep.  And without Fixes, it might never end up in the BSP ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
