Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C140C38B122
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 20:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781729389; cv=pass; b=paBKwuooa/Y6aSaghEUdxWebW3CzaPBvdEcw4EDFuu1BSGeI8sOuuebRVws7VpsL6d7nACC5h10ktHEWpymxKVuAcSCLNaLtLEovivfFfF3nMwhVemeFpRnqiM5l0XgdB/4n3mwUonzA3S6kIiN8zEY0ao7J6jpq+bt0OLHg29I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781729389; c=relaxed/simple;
	bh=8riQs28c5CEk2XTXUUBXYJHl6xc4h6FhZF3t0ruzM/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=plWCk1/HLIgzJavNXTNfPNC2m2BbVBw/GXjib36GKkIyN32PkwV4JcFtmegFagkPoZ5Ffg6TfjBtaWzCCJzdnxyZLvqvKPP8gvZl0P0H6pmFWzUslQqp26lfLEqwyMjtvq4DNcodmvgkgwjzg3EOmF7zjoACt88qzd18dNyL2L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QauogLM5; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QauogLM5"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so193834f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 13:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781729386; cv=none;
        d=google.com; s=arc-20240605;
        b=gydFt9hW77qjgAomGTs8pgs+ibgY67BLPfmAAoFINZN64BjWbt4U12REvrSKCjru8Q
         pX9l4TyiMpWmYzUNC3Je1dUj5WVK7glHsU3dej/ys1k2ZN73CuzgZd84WrrXFfqWfpjY
         sk6HhuBygomv+4Vmi+ahomhcS05wVNespbnWREOlM4HAfsmmWYaQ4CYp+PlpebvOFDJ4
         dFhjNrnkGUwirmZhaj84Rpy9tKg9aQKZgI+l7nGIvU2YCBdD6h0vszP/oQf3bP5uoCRV
         MF7oiSUVBlADSLeeIsw1Ts/ChWWTwit0L/SkyqgJFAmLX6w1yv7l825UnmdCPQyXpAZL
         feSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=StSvglLaxppt7VqPKeSB/sD5CeiYnjB2MJ3tpzdtgys=;
        fh=ReMkO0f/wt6JI7lzCrA4eARUHw1MUly9Qxm3nDiuIDE=;
        b=SUqc+3LGpY7OILdTkg+uDFNQjbcGGCArn2o9emroyBrP+U6WHfvNdzFJdOS/EE3WHK
         m50a0zExLqU+EArB3iZXI8EdhUlQqhY2tW8JwPpp9MXq1737ce30w5pjYmF/XwFotLdc
         G36o6xuagaCs4v407fqT3GwevNlbHktnqIbiXlA0KXslVVLghyH8PQVGvmPsAmRrzZ17
         kQUpfTJedgS3DuIJbOhznzRvHfsdeO3z5z7Bhkfent0hBnU2Ftx79khIB21r7fjoyPI6
         JJD4aHnx3WoZGbJm6XApfMqn/SdBwlAT3YvFWgt0cUsLAozTR8OyNdt3csliHDyh95Al
         80jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781729386; x=1782334186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StSvglLaxppt7VqPKeSB/sD5CeiYnjB2MJ3tpzdtgys=;
        b=QauogLM5z3vcR02KJOAwodPmp1SbhNgnfDTWwSGr7oBe4pneIR9CZ8z3g+VJGK7ZE3
         d2g9dP/mgrhiwsNGo4ZP309N9aHw+jDc+cUfcB7XsDgf9AdyHOCTC8h3pFJte1KrC6NV
         J2hFYEbOpAT6PxEr50+9Kxmx0SJ+cKo++bjGWmIUcDLy3GQLCgpcE/UirKjpUpOuuN9W
         E6rlDxUW0VNvoRqZtOj/Nma4Pz03KHqvlq3GjzNzoj3sLDzdK2V1rcp392js59/+pZuh
         Nv+0iGag7kqC6TLVULf38Gm6AR9zyxxCBy4njCjQVnb8bckv1HNh05DzXNF471OhzkPh
         yQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781729386; x=1782334186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=StSvglLaxppt7VqPKeSB/sD5CeiYnjB2MJ3tpzdtgys=;
        b=CTk9prS7jQEwRWZd5HregW3PQ/iOd4fQnhIOmwUNnRyNJ5UJtRplZl2w81nD47ni8i
         qoC+2qcyrtk35JjtdA8Qv1ZRO295nS3s0eo46Xr33XLEleHzXnWP0+22Qqnn/mbsIEU8
         jw0YQQM4lP6pJz0xthxWsv7jBTsdOgqqA5ae2MqtuWQJfLCX4SH2hcNiw3k96y6/a8hk
         nN4YfM5ByuqkcVzLoW8pIt/ESPGstuXiJ1abSx6B4xflYNzptx744i/yK+vEHpHlKbpo
         PqjPkkpRAOfLBv2TKROQqrZtyP78TIbcrV4Sd2pEoXPWt4eAQnD7Z11LJ1z+ErLgH9Fq
         V5pA==
X-Forwarded-Encrypted: i=1; AFNElJ+2D1+xvbJyeFxSp02I3ECbAho+r6dfBJlAYROF/B2aG2cBlyCp7sdLmCppoAPUO6UBV67HSs2mlSXIIIlAAAdrRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzcFfbU3+g7FrVipImV0NjwgvcvW5b5BLNMVeergKSCSQQ7/i0
	zfIE2dv+tOyb91bNOQGyhnuSkB55fGvqEGjkIAkGLNIsFxwJJI+vzTTQqAjbixT6HoJ3/U2GIOo
	XSFA4Bg5RM5UDFNRXaEeOyDir2zgksIg=
X-Gm-Gg: AfdE7cmYPju2x/V6Vh3QhYm0xP2ziSK/+MHQwGWYpfp9la7IVlHpXIv3Oi6OSfXRYL8
	97O3Cm6mzMNYOhzRt2EOV2mx3msNDDgr9Na7BbawuTj3nvR5NWhWo78yOAZgH17gel1OfP9Ker+
	kv64LuR6962scvfDmwByh+c9S2Wm9gdL3+DP9IkYcD2HWYBxd16njD1ejpXixVizp3XVeS8pF7R
	MFL3a+Tn5TpXl81VAI9Qw3aFZ4nhlYI0Gd9hy2bmERhB4mqz7FmKxl8z0W5+Mwrr8EJiI5UArOA
	6CPaZNJsQTIHxQ8612FNG26oJvEVlZWYWzZ/TAYxVYMQc86OQnejlN2C6tI=
X-Received: by 2002:a05:6000:1289:b0:45d:41e0:467b with SMTP id
 ffacd0b85a97d-46235e9acb4mr7940736f8f.3.1781729385759; Wed, 17 Jun 2026
 13:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXQ3S37L7JAJ42Bag0UPa15Q7n-nNCcbV9FXTtTs4aihQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXQ3S37L7JAJ42Bag0UPa15Q7n-nNCcbV9FXTtTs4aihQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 17 Jun 2026 21:49:19 +0100
X-Gm-Features: AVVi8CfEsllEJEwUR32cqZ4L1WJgMIiJ_74re8ZjTdVt3p2wYsrPrSguI2CW5nk
Message-ID: <CA+V-a8vdxgBUs4Z3GYJEtP82zAUA0gTKCCfu1Mj-O_1XabVD_g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add PCLKRTC
 clock ID
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Jun 17, 2026 at 11:19=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Mon, 15 Jun 2026 at 16:40, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the peripheral clock ID definition for the Real-Time Clock (PCLKRTC=
)
> > on the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
> >
> > Note that the LCDC_CLKD clock is utilized as the operating clock source
>
> PCLKRTC
>
Oops my bad!

> > for the RTC IP.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in a branch shared by renesas-clk and renesas-dts
> with the above fixed.
>
Thank you for taking care of this issue.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
