Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC4244238B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 09:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156536; cv=none; b=JWeDEVJGa4A8QCAb7fBcMUdYouFapwerUTR66gTj1nMV+3XGaHPGW8xN9GqwDBZA/QEe4Np/PRshxX2B70DatAGdBdJHvMZK6tSA9APnIFBijUVeaOXKJj7PmF3zufxhl8vmyBN2kqaF311sVOVzrinLDDxhKb1JLyvKeokS4cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156536; c=relaxed/simple;
	bh=BujUuQDfVekCTjQYxnZ274Y/mBqoA8yucwSuWPHk9zQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXGo1TnQEKCk8HO7/tIHg8GCKSAFWBjKG4ccvTPkSaZE0p2DHULqHvfRY0SSjmbdfb1OkXRRSviU8fZ91a43U4eUfxL2usdqJ8J/Ylm1d4Tze5X17/upkHGIwfDfZBwLzYWhUhbHvSgCtUU21lJvcN5gi8OiiHu6LPGpPboIyyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97eaa1155b1so383458241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156534; x=1790761334;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ki/L6uAzwSlL4d976xkfrPadyRlvh6KDNvRFETqhN1o=;
        b=xVCCOITyP3V76WW3n1Cx+UAn+YBUrDhmtlLclgtdZmOAhcMZEvFIjx9udqgjPhPLkW
         O1SzBZZP5QYV8Q7G33W5KHCqda+G0TCBtzbHEs7j5ulz1NQ7S8fsghpoafjapkrK4mDJ
         DN9B6nkdfnlcp5WoUIlQ3V2hfGmA8XZkWY7F/htTaQ5bmzjflOWwS+ZNDh65f/6jXrdM
         F88ElNU31H09Le7wcxTX5CV+goWj7stQBxyprp7WnXp6CTKZnYkqeaxW1kA0EvFKdYoq
         7oBSblJCINDkENHBwcoq5v76r9mi56JcZxnFP8l37DKP/Q1Vn52I9hIM6viWZ5dEFwnx
         uXEA==
X-Forwarded-Encrypted: i=1; AKwUvBzxClUFYmBZVKK9KOh/x0rjPtv9gZtTKkVselmbbifJxqZUVGRj+35NUw/jBAwhfXQdTQryFlo5KXSa73IwqPcCjg==@vger.kernel.org
X-Gm-Message-State: AFuF++n3i5u33UvpxGIJr9cunx26y5QBsp8zXjafU5Uby0dZ9bBkZpo7
	giArTNfL7kY8Q7RgTKg0mSIeyylPkVyJeGQQGdGBuFWJCQl09htBv8hdDSULPfcukRU=
X-Gm-Gg: AYBFou1K5f3Qdr/8xEWz/b9FWUP5IaLUCD+k0q6tkBKOYIVJStoZ2BHB9TBqecn+LWm
	Y3x7aLY+40cd1nJ8c27XWliPNh2OKmuH+ZZ+KZADk7GZpOCizpXPKimtR/pHsb8sJLLCii/aahs
	0I8PuGEXJc09V26bF0/Xhl9rHafvupg2YicVx6//dq7fdiewvf3pBo9UgV1jo7/0SfDTDQQ+yoy
	nOdaH6xoauKzYLS+QbahdFFZ7qnJyuipICJBvfcJ4FpcNVwnzebu1DWjvZVPieWdYQj3A8xn4YI
	aD833BS7TVlKKHhKdodIiOBHOqNMrDLzhgkWrdA+Yljsd4V7ioUo+mYYc/MC7H0WkTw3klXye5L
	Pz9g7XBYgykWKtFFTw+iVsoFRs5kAYZh9xlkzneSwuo64MFTZdPXMe5oK04hKOO9ixW9M/OnztH
	XRmJO26x9qlugtmBMVRQ7FccEsd8qni239PnxhYuWqzKjfhgcnv71nvEDveTvvikwbtWUXNvG7q
	G83H3Opwk0oBmgi7SEnEtfLO3pqugyXKDLLyw==
X-Received: by 2002:a05:6102:3712:b0:7a7:198a:c2b8 with SMTP id ada2fe7eead31-7ac1d6ef71cmr2109538137.32.1790156533937;
        Wed, 23 Sep 2026 02:42:13 -0700 (PDT)
Received: from mail-ua2-f40.google.com (mail-ua2-f40.google.com. [74.125.226.232])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9851a07144dsm1940971241.9.2026.09.23.02.42.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:42:13 -0700 (PDT)
Received: by mail-ua2-f40.google.com with SMTP id a1e0cc1a2514c-97e7c7bab8eso399393241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:42:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzIU03P8nAUvg+95ugto5JpmOISYDUzp9Pxa2DIDI9b3PS8u3ioBxUObx7YygRj3UfGPCJ850z2LXgOli9FBCOkPg==@vger.kernel.org
X-Received: by 2002:a05:6102:26c5:b0:7a5:2427:ecc1 with SMTP id
 ada2fe7eead31-7ac1c998ff2mr1923273137.19.1790156533341; Wed, 23 Sep 2026
 02:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com> <d281677b5759f15ced1f59fdcb3eb7ca29c72dd5.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <d281677b5759f15ced1f59fdcb3eb7ca29c72dd5.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:42:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjaTJfe7P3+w7P40K0evj4SvdKtTS-QLqK7Rhd8c=3-A@mail.gmail.com>
X-Gm-Features: AclHuK9FXFIal8yiY-Qs9cVDiOssigpeQqL3VZL-ls6OCUB1RtSj6-ENt-hknTI
Message-ID: <CAMuHMdXjaTJfe7P3+w7P40K0evj4SvdKtTS-QLqK7Rhd8c=3-A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: renesas: r9a09g047: Add USB2.0 support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 00:27, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
> and 1x channel with host interface.
>
> Add the EHCI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
> in R9A09G047 SoC DTSI.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -1773,6 +1773,130 @@ usb3_phy: usb-phy@15870000 {
>                         status = "disabled";
>                 };
>
> +               ohci0: usb@15800000 {

Moving up to preserve sort order while queuing in renesas-devel
for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
