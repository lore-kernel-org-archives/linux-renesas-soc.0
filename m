Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953299;
	b=zCv5c5II1SD2ervkkfXSFZ4ZlSQWl6ZL6kX446w/3ehM17tHPaT4+Ged5VN6ODf7BSJF
	 dYU8/H+dpgARPEEUAO8VFG4Wb3uSYYv3vj1EL/ydUDH643asMaSTvJnZvPuLGnzwxZwYX
	 ic1fnMMarIItmlsF7iGdzdbv+EKXq0w//EMT7hvTYgaN7ywqPMCdon+ShMwRbwDf78/sD
	 9rstywh5jMTza4D/zUslbq6kHsj7j6+D96Wvl7uMZTRbYRAx7oDqPhllSUwgbpDEx/Aaa
	 3YBpLC42Lp7NjJoB3GyNnwzwQuNT7WAmHB2VMZUAt0JQQmFHNx6MdiwJ3v28OG7NmLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953299;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=B5U6R28eASu1V9FcblqPPOgTL19VFOQ1nMFsFJSdCXU=;
	b=td5VnoBS4wnjOSl3sktUseYifJzfGe3pgeTVz4Gr8Q8bMQYNECU9KFSusTEgKV7CtgHC
	 t52z0Sl1rXvVIERKyRfjgt/6AZQEYTBi/gMBylSh+Li2pBHmVgWiYeSoWCAufcFqHXOWz
	 i5M3/WSTRlnRorXXKECBjbchS1KbN9AAqYlkNQ99zLWwU6+CT5sMn837YRljkxmP9nnpo
	 mv7lJCv8CLjMtqJIpBUY8ghOMEAZyAiaZ6h89TVDwv/NmS7WvaSz6LLpyGlE03ZsSs6V/
	 0bwOnPmtW7rculTszVf1iqzxHB/U3JxmGF4UwiM05JXU8FlBmKYEzpHZ7LqDC2aTKSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34C5606A32E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Nov 2026 08:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E34C5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7ccb2ffe333so281614137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Nov 2026 00:21:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953298; x=1794558098;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B5U6R28eASu1V9FcblqPPOgTL19VFOQ1nMFsFJSdCXU=;
        b=Do6noIGqFwiQlM8LZ5H0kx/63oy7FFdKtFtRxMOL/1bID/ex42V+1Xi7DP4ggORp+C
         qQHs4vQa7S9pjbpx5YaU+QNwv7JWV24Gy6kpkOi+Mebt648rR/AIicL52satXIG2VPMP
         3fyU1vvCkTy60NSSbh8QlUB9qz7T2zAmTmPXVnb5ukPBVszN2VgZykxA77OxQvMXdXio
         dCIHEVyWm499/+K+GNNTfFOB/i6MjXsFRwKNwULhM0w27LKJYNN1t+CqqOSJs6LQMfmC
         rIa1umvZGbnHvowWajCDF+MmWHlLGd+/feAPe/3U4ZHHjZjnvSzv5oAWEWajUJb2ldy7
         FqDg==
X-Forwarded-Encrypted: i=1; AKwUvBxGAgEsdROFODWQ7NMmve4kdPrkSM856BlE8hvSCHfCvoGR0mOrPD5Q1TY/OTrA1mxm9sXNp3u/7dxTLnv0VAX1ig==@vger.kernel.org
X-Gm-Message-State: APuU4Z+CrV2/5CmowQVwnlNp0W4SzQ2yGLi7YWC14QXL8GEg7XKK1aZT
	qg727MPkh5MR2+q7wdYotrnvPO8thH2Ayyx0xOGBtGKHvjATsjU7/OtCtbiamq4WRlg=
X-Gm-Gg: AYBFou24a6Ik4Aj7ApJoSpejL/alMZqGq1XfEuqJD+As4eNpeSQISvx+F59HcZhLNBu
	6eUln1epV8harVa2+EAfNUOGgtqjeLJHX+PFvDK+nmzk/wMNl9y4E456E/cY9bf7WyPRfhcxZxK
	DhmEWLTS7AAgGek+jDpiLwTd04qpF/XkrdFtIn9EnsKAk91aKIA7mU5QkJaE0Ht2v7AHg7a46RN
	DPnYjtuCwpwQe5O550Mfr6X/SNfhI+lJPJqTQ54RbbX7UEfh4+oDB3HqiuoPSZi4Y2fOWrFOGah
	LOVkeAgGyW/LYxKv80XvCJ3e1tHriWBJvL+nC9R7iDZ0sv4+tD1WSdkrfulMcP1wH7/pemGoI+6
	+Fr8rLsX1zeIX5LPIpshaD0MlPP56TofwZ+j5Npfx0C1TXMWvQh2S4BPKYprEH8LrlXAopiS5LT
	vH8pQcJxWM3Bz9YmmupttlfG2oPsOvczovda+zS2CdemfhFcfGHdViWUDDT6suHWmRnB31Ukopo
	dlBGYhWPCkGeJiegPvJgwcnSMMajrvirVpuFILX+8SVHkw+mwRuYc94NUE15vCWlC8VABQFgWQk
	I2kHUyTHyMgZxuJuD/3ZVnqPRbtT5hrzrjNJkdBTC8vA5gYYqwTlN50eXcmS0RcS71ZBmi8=
X-Received: by 2002:a05:6102:2923:b0:7b4:879c:bb76 with SMTP id ada2fe7eead31-7d2a158358fmr1117897137.21.1793953297959;
        Fri, 06 Nov 2026 00:21:37 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2a8bbac51sm784678137.11.2026.11.06.00.21.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 00:21:37 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eafb65e163so293883e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Nov 2026 00:21:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxLj51figmk3FpxanF8flBKhNxJA3mZ3K29/mb2wBEIYguC7Xyteykp9Uoox5+Fe8MZGV7rBNPd6tM8l4gN0JLFlA==@vger.kernel.org
X-Received: by 2002:a05:6102:4188:b0:7c1:7ca9:94bf with SMTP id
 ada2fe7eead31-7d2a157ad1bmr1177241137.19.1793953296374; Fri, 06 Nov 2026
 00:21:36 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793278754.git.geert+renesas@glider.be> <415c8b26718e2e5d53f74e65daedf9986c76dcfe.1793278754.git.geert+renesas@glider.be>
 <TY3PR01MB113465CCAA88F962CA6BA2E7186762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113465CCAA88F962CA6BA2E7186762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Nov 2026 09:21:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXObreJN74sFpqmorWFHQ+uuYQ8E8z53YLy83QWzOhSmA@mail.gmail.com>
X-Gm-Features: AclHuK-V7fgcHmuwvDEyfPRfTLsQvNGxgbL-okuZ_HotpWdWbAS1JxTmpUbfEsQ
Message-ID: <CAMuHMdXObreJN74sFpqmorWFHQ+uuYQ8E8z53YLy83QWzOhSmA@mail.gmail.com>
Subject: Re: [PATCH 3/9] can: rcar_canfd: Make clkp local
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, "biju.das.au" <biju.das.au@gmail.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 6 Nov 2026 at 09:17, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert+renesas@glider.be>
> > Sent: 29 October 2026 13:11
> > Subject: [PATCH 3/9] can: rcar_canfd: Make clkp local
> >
> > The peripheral clock is only used in rcar_canfd_probe(), so convert clkp to a local variable.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/net/can/rcar/rcar_canfd.c
> > +++ b/drivers/net/can/rcar/rcar_canfd.c
> > @@ -467,7 +467,6 @@ struct rcar_canfd_global {
> >       void __iomem *base;             /* Register base address */
> >       struct rcar_canfd_f_c __iomem *fcbase;
> >       struct platform_device *pdev;   /* Respective platform device */
> > -     struct clk *clkp;               /* Peripheral clock */
>
> Unless I am missing something, I get build error
>
> drivers/net/can/rcar/rcar_canfd.c: In function 'rcar_canfd_probe':
> drivers/net/can/rcar/rcar_canfd.c:2250:55: error: 'struct rcar_canfd_global' has no member named 'clkp'
>  2250 |                         fcan_freq = clk_get_rate(gpriv->clkp);

If your tree has Claudiu's "[PATCH v4 3/7] can: rcar_canfd: Allow the
CAN FD clock to be sourced from fck", you have to update the new user
of gpriv->clkp.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
