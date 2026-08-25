Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F54E478E58
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665874; cv=none; b=bdwd0f4DhkIYoXEnft/F5P1rndrXLlF4x1Jq+3iIIZ4GgELpRfD9CoD3JzwEUDBHP6MTgcmolR0lVBLSSUICQXkC+spGj/uNb8BokXtwnGlRmsvFSmeLPKlh+9QV9pxsnZw+fTZm8ML//bC75fZb18WyCSDAY2y8IadMrXNmSJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665874; c=relaxed/simple;
	bh=4Nhf7wYr5y5kOmehF2+mwwOUzZfIYgBl4L8KXVm9JcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkdbVTlil8zN+1njp8Fqih1dSWDUJRGLrfDr4cufnDJSO9qFwa7/y4UWm7U4gz2aL0fGi9zpv1DWV3unm6GQDwLa29jtrQIqr2DFgKITyV0hyuvpk8BwgajTsmxpZn+Mi38eLtSaYvFfcjbQGnfPtZGN1jsFJj+ITb2ZnGTTn6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-77bf892b496so912358137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 06:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787665872; x=1788270672;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r3HqpL4LRyR8Q1Zvn+1cvkTShpZ++E7BIg5onQopH7Y=;
        b=DxfvVueFyxg8cmZp2HleitvpMl1NBx6PXynIC7BFyHpZSM/mWUAfiywikP4258Gjw2
         ekN/l//RnTAy8XF/kxZSltJwpfPkiYzgYi8KnYw4wR1ka6/d/nDzOvbLxkKbXAkRWIrd
         b30bNhfK9RlNs1rmAnTccRQOoR2Ag9wXf3+gO7FLgPOi1rmc0LGtklAzFm8JrlW1xrC/
         +DCAmltYAvvRyzlxnbq4RCOFyTlXqGSrzNtgBStYHxHmESEQO56y0DAIsLejvjJJBN2r
         rMj5bHobFJtriimKI2FuPkkv+XmbYwSReEB7qUiTFg4re96H/YU7l4FhGd+dWcIr69B4
         qGEA==
X-Forwarded-Encrypted: i=1; AHgh+Rp89ov40jqtGM4clontMLudDBdty3yeDgV8xToct+q4yUSsOessAEvgXNOwThi7z2NsmNSc9BP5W3DY5wv4X7wi9g==@vger.kernel.org
X-Gm-Message-State: AFuF++nfhXAsZIzet+0nsbFrNl2xG59ZoNaUdHErDAsERgxYLuQnUGVJ
	o2lTJwpBjqufsp6ci9y52JvzkoydbH+JYR4qwE4jDozaFhWT/wGDnf4KG+D1hM+bDp4=
X-Gm-Gg: AR+sD13XZscNL21dhJwslPMmQA06OcNbSosQ02++GumoTzLiZYQlu+Bbq+xRpqjVeEo
	FFAgpgeFQs/CA/KdLTfTvO1Eq9V0FyE1cdPw3Oq/bJAvPcJjsxzGF5KKnurx8fP4ak3yYW2v4P0
	Ln6U1NpWSmK7JuSlS7a86zyXPY07ZnFkR6sXzQybg8q+BnWPs8+sQ42zetv/aWoQlc6RirV9Ffm
	0g9J81mHEB6BY3PS1QQ6n+eQRG+w7gyAkOqIsQ/kY6Dbp2sahnaJUZN6oz2NOJBCPIboZAdb4Qd
	f5Lw2JW1tGLUUd43yh08E3j73dpaxmr6XXI5wE75AfATB7+oF6dxlA26CQiQ2zKAhPwCyNnsUlr
	3VRMYeUOwSMwSVEADOH5o5CTSbc1blj2hkEO6AdU8BIq9oePbKCif0hOlI+cmSKuQBm20ieC2yb
	qfUeKGYphMDIUhRpiPRFxGlyll5X9hokktCcfdPR+uhlxM2EFFDL3NzdsjWYHj3RK7qfTHHmAqX
	cLcH4I2bezz8Go9WpxLLeFpJg==
X-Received: by 2002:a05:6102:8511:10b0:781:9922:78f8 with SMTP id ada2fe7eead31-7819922afcdmr364138137.13.1787665872134;
        Tue, 25 Aug 2026 06:51:12 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-77d85bedbe0sm5577195137.11.2026.08.25.06.51.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:51:11 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-74dce749cc5so1001669137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 06:51:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoFjCsOSHZX5/YIbKA6s6rCYMQp9SqZpY0jQFlvvJ6kqj5MkZU9gktwMh60FWZWPyeyjf6HhV7MgzJHBB8KjUGXAg==@vger.kernel.org
X-Received: by 2002:a05:6102:3ecd:b0:74a:b1ee:e034 with SMTP id
 ada2fe7eead31-77a63f3f870mr10636886137.8.1787665871110; Tue, 25 Aug 2026
 06:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-4-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-4-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 15:50:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBL30LN-+9e5LAVFCaK1y2BEr+VBs=sDgjLCgpc=kgyg@mail.gmail.com>
X-Gm-Features: AcwNN1VGPHnBk0TXWTegWV3RPljNeX5vHxO1DRox-RPTqr-v1ZX5lP4j3I-XFNY
Message-ID: <CAMuHMdVBL30LN-+9e5LAVFCaK1y2BEr+VBs=sDgjLCgpc=kgyg@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] can: rcar_canfd: Fix typos in macro names
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The bits 1..0 of the Channel n Control Register are named CHMDC (Channel
> Mode select). Fix typos in macro names by replacing DMC with MDC.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
