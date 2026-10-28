Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181214;
	b=jh6WSFtfFDPCPECH07hpKEMKhrUZ3vRW27GO6sbOq5qu/zePxkybTlUhrGoMoirA86hc
	 TbikJqFB4uCjpElBKv4KfJ/XCs8SNvFmsYY7WR4GdllPGlAcK9dqIln20ND8tCeuLGO9C
	 UAzeZd+rlOTlx1cpkm37TsxJVZShTHtKvQIr6Gyz+6usHAykBdmFngF6fTkJgURbLa9e7
	 MNlUyjvK/ACWeCkKMRa2IB4fJ6vC7vZilVrO8G+Hx9u7575aAFu8p2KlN9EoFcIX9cnTS
	 Ihxdif0HttpUKt5ecciDkrB8Q3QYPlOo3RyYlUl0WoXfWz1Zwxs+lfpKPYKzqKfTGzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181214;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LaKKgg7JsBllMMsQkIPVI3Ax0Bcgu+KbcncA6nhcHSA=;
	b=iSsN6rTbk83TYryInIXgAiZPlp4UNMuKg7aGo3wLZxXAVZ244pL5dMuAQacVg/OnY7JN
	 l13mBsULVLm6Bfjr5icGIGmSf9QWAdsO+NzAldk1pqfRJ0VVyZo2PhiBOX6ciiq6fwO5r
	 6xLrKi9FBbAWi+sw3W4ibIurtCgqm8kX/NwT++NrXmJgeG5UY7oSXZIICFm2mE2TV2XN5
	 OuRLlRI/tJq79vw9RVAHwyMJvtYIoQCaPivhdnd/Ff41yKkmsdufD8piwnsGMOGZr4cW1
	 HK5/ocBhdI2nvRPD83LQoPKLGHVABedqhyG9WPTRQITfCenhnBHTcPRF2pecw8w+eog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36F4606A31D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 09:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C36F4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc53938a8fso455900137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 02:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181213; x=1793786013;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LaKKgg7JsBllMMsQkIPVI3Ax0Bcgu+KbcncA6nhcHSA=;
        b=bhz/mfIQO762DYNeNM1zY/MJmcuRzC1RWur0DzCfUuZR9ZBLKKNp7bwVdfx7R9lvBN
         7/kJizVuci+/qiwk8IOnl9VjQun50OkrCfnBs7Hoq7u3/8fFPQPvXi7yzsgoN+eqYtVi
         802vB0ptke4FEsC32PrPRB9E92C0W//ZB6y9ALCuMraw090I9ErA0RwRN51MXPRwKqDV
         mh1+6DkbkaUaWWo/WIJaEyVAavZdT+PIyN6IBPruM9+6S9giFvqNAMuVzgQG8zWvP7f5
         8SBb2PuS4HyHfDvrcCOr0Y4nBYYOXqd5Gbde1YTibivLeGz7bQnIPT9O8PKtGLZXoiXY
         j2aA==
X-Forwarded-Encrypted: i=1; AKwUvByBenW9Bz0YVWJJjR5wx3CVQ6TUjuNCQ/woFXdUeQwvgzGCsRhVu91TWfw1kcIzx5EqwQU3TUImXi8dFZWKK2sJpw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+JNqPBlGSSB4i3GhdNo1w3BXyW1AxIV0hTZ0Hwy/igiqakq2e
	W+9uI4udxsPEatGjbsjnNofLcJCAYySDHy0MLL1SsWO4PzNquz9EMpBjxoz5uX1p
X-Gm-Gg: AYBFou0HwUl30w7aXLLaqYVgXChb5HluuKNBW9ySarfqgaN46/tLz+8h1Lnw4VLd43W
	X6/VeWPftZLAKei+XzGmYFMhzjHhG9CmVP6tUQq6qQbU/ouLqrEqlouXbhFJPQZPUooPQ7Eb4kc
	cbXdC6nx2uBaXUsWYFI1n9M8CInl3J+cQKJh0YXcjcI4xY2+HWkXbylTgJ/VhIh8GnOlA2pEMha
	NFebHkdtuolRLBnnKmjCfiyWDP55RFr4avPDZhcOvJa0FM8+XKbr823v3ZM9RQzewUCUz48Aykx
	2E4L05mu5LPbXWVklbg9c3A3MhuZR/zeKlRbC4v6EYu5eDu/MM7ohUY5Ic2tuVPrIhxEKiQiysS
	2eZmpiRx3wY4VY6FzfzcKVXqu7LXWWIWYszlUt5w2VjsWXTdxw/MywVZTWBCGX7J/m0zV2fH3Ym
	4K5RD7DdXdC2DCxGlLHpiZAisD8peKEa9MEwGZRk7BCdjQIPtbicZP6WCDjrTFnGqfVrL1Zp7jG
	SlM88ytl0oo3Aw/cW0pEF8SEibGNutzkbXNwrh1w4STf+pCga6VPHW2Kfjh7D7JGpp3SJ5yyDWa
	nqClaoGEpfaAwrrKIqUXLGnQyxQbCr3wHZbF3JHD5ZxdP4UNgiKeSaGjSGN8Ky60ANtGP7M9KfZ
	cWxCWiqlXWhFH
X-Received: by 2002:a05:6102:1613:b0:7be:3766:9062 with SMTP id ada2fe7eead31-7d03a526ab2mr837336137.27.1793181212720;
        Wed, 28 Oct 2026 02:53:32 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99125a07478sm5399958241.12.2026.10.28.02.53.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:53:31 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7c03a445cb8so483617137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 02:53:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwUJ3K2Zj2yRuwHPnaoLPxsmqLNbUmHVD8XR5/dGrkGsSkoDHGs29AfR5GJSrTkpw3JG+c8W7suYnLfATxCdF0uNw==@vger.kernel.org
X-Received: by 2002:a05:6102:5244:b0:7cc:2fd1:7122 with SMTP id
 ada2fe7eead31-7d03a47e768mr803872137.18.1793181210633; Wed, 28 Oct 2026
 02:53:30 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
 <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Oct 2026 10:53:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU=ZkOsjG_FF-raMJWEUtj0VkD=9Gs0SsWKWLwyhG5H_A@mail.gmail.com>
X-Gm-Features: AclHuK9BGkRKGrsUq56mu96OMIK1DMZBGsGDXPyfwPmkMrcZVroZETBYHJfP3k4
Message-ID: <CAMuHMdU=ZkOsjG_FF-raMJWEUtj0VkD=9Gs0SsWKWLwyhG5H_A@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Wed, 28 Oct 2026 at 10:47, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Fri, 23 Oct 2026 19:50:39 +0200, Geert Uytterhoeven
> <geert+renesas@glider.be> said:
> > When a gpio device node has no gpio-ranges property,
> > pinctrl_gpio_request() returns -EPROBE_DEFER and its GPIOs are unusable.
> >
> > Restore the ability to use GPIOs before pin control support is added by
> > using the gpiolib helpers instead, which cater for this use case.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This sound like a fix? Can you add the Fixes tag? Is this patch independent

Sort of, but no upstream system needs it, so I don't think it is worth
adding a Fixes tag.
ISTR we used to have GPIO nodes without gpio-ranges on other R-Car
platforms before, when pin control was not yet available, but DTS
history doesn't provide any evidence of that...

> from the rest?

Yes, it can be applied independently.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
