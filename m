Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199071;
	b=KnhNTsSaZY7ofR+2QjyEf2SrlT09FUkAgZj0RbnQ2pduGG8fl/9T2KWPbCevXdm3xmIQ
	 y/X/Xc6TA2Xg7os4gCswiof946VnLuhm6jn5phTJuIBgkx+SRFFJFt88PBoVsp4bLPX98
	 uGMuVdGXfKtqTwtP6fQLUSpqV1zh5Kwzr6KWG0Is4Ya7hTKQDbTHy5sxOQ3MM7NZd+abA
	 K/BHxzwos+x5Pa0yZnrdPVQcxHKIhHVPYAaqBc4uKKw7kXefMaRY6KSAhlxPfMcql42YC
	 7PCJsR1NOH0Takoyp5rNE2/l8ZWsOXpyVRsNYJCkI4Fdf0LcaftscNmg9DylQAUFfYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199071;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=gvbpjObWezyuObEIw7vWCioNUAtttLKw08sbbnbJ9pw=;
	b=pBVAG3xPicLqLyfCZDSrzk3HRu3fYomA4yp0sO2GexVhNTP1esOzpHy7ihDlwXHHGL41
	 eawWsT3HYFWSOFBvavQHUysd/ZSLCJYFFuBGD0W93FFjDVNxfagyxqGcXwXXmyMXriFEx
	 mtZO0XFfXDtxvAEl4gHjkYgrkoyhN0j0RIjeT+J8Y8VgbR+CEiNalLZpH+ITK9kDHIhtM
	 EygDPNdDT6Z3srK37AomoHfQ8bRRz82HuNQY/atpzD/lKHNCfFT1HQKnVLbtCO/WAn2pJ
	 JlCRwuYhRMu4r+JRP6ekPRmqONXCkOxCBCG6DVyUANiOcA4M14otQP9sHwqAruxv+oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C92F606A31F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 14:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C92F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd623dfe420so817518a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 07:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199070; x=1793803870;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gvbpjObWezyuObEIw7vWCioNUAtttLKw08sbbnbJ9pw=;
        b=o5e5tJ4/4YOJtMKIp0zGQgEQGcYpRyH2n+DXOAzd7j47FY6UJsyiVdJRydaMJp+Ps5
         BdoDOMB2yde/kqW2Z7nq8m+lPIcFWkn3IYtd6cjUFntSp5Yha74N6N0R6K7xJrUips97
         Hix6/s3KEzU2rAEI31jHnPaqFRPH8sgd9II5/zwKdm2HbG+pmxKwvTZhpOBC5Wv64YhX
         REFEjqG8h19wXWJEif47xwZGBakq+Vc3uK+zvdZkaY49oCGcc2h2qEMAKKXOrjzGyO1m
         +JDWcqmbFdJL8NS6TTgQKMlQ1yIIpUo6Az20+/wuM2InoCvMeuX4ww2RT5Mi5+ZPZ/Jl
         Cjlw==
X-Forwarded-Encrypted: i=1; AKwUvBz8kKGgrGom9XfRpGt5d3UtKqJ5ZvKyunAR9/CJas8BEArBSa1nk2y3wzf12TKHD0t6RgEoM0oRJ4h0wGj4uEMwEw==@vger.kernel.org
X-Gm-Message-State: AFq9FYItetTl+xi0PWYW4u8nzdbDHcVQjeu1lP1+Dui6y3IOzZhAQvV/
	s0R49RCGPJj3TvEgcUO9Q4utI4gNsJ0hM2liaR0VMud3ol0w5GUjPfG28B5s53ps
X-Gm-Gg: AYBFou10/nWpukePgYqo76IDd05YBdiJFqokRXnNSIlAp4z3AzRnPeqgJWikO9r4oCz
	QblMsIaQkRrzgXzAEXEYHe2/w/PeDTFKh6gAlGDAPrGLNWtX8jHBw16XdBcfDaWz96WY3XPe9L5
	h/gw2KL1tNnqcZBG4kOFEU1fAAA+NWWndeU40h7Ypr7Dv9LNZsaKG5jcmz7lVaKMH661rI+LVVo
	crOUQgxg0A2y2xqy7v5kgjsC+rM6KltNT8XFixUGMnATVMwD5eMG79+ebBxq3a2GfK8QKN0/+Mv
	EA/YFtmiVp/OOmPp0zSOo0iGTMN60lR/u+iTC9yKXEDbN03DoLEzOB56qbpdQV5kL0qNKjlkAfW
	JTxz/W/884ReLt7QZxTpwL2Wx3rdfnCBrQEDqbQhzw24SsJmwYlnL93V9fPL1F1SFvz7mPTfTL7
	bzS7qRi77nB+oH7bSgzYhyqyixY2teENASzsqOutiyWJSyXc+ojXHvCmoqv7aIGz1hMGYitDRUW
	4zzfhC0bW8H+yBmdI656HbYRxqBqMZ1yoMg7FJrgzH3FCTQjMV/0j1X0RyrVBBlP10wJlbrWBii
	cfeWNeD+bcl7sW+W63aRUeZTRTrBNpZl+3QKW9i2ybhviMMUSlWUBvD3KzE/UDjnAxSjGg0=
X-Received: by 2002:a17:90b:528d:b0:3a8:c0cd:57fa with SMTP id 98e67ed59e1d1-3ae57f65a72mr2035061a91.11.1793199070301;
        Wed, 28 Oct 2026 07:51:10 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a900c22sm3397308a91.4.2026.10.28.07.51.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:51:10 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso712011a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 07:51:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByspZuahVlmJLEhVwg3AfL+ClpOUJv+TiHuquQ2SmlRbezqpeH8YjalJ8vvKQtQFox4CbElESGfurUF1qNvfOuAQg==@vger.kernel.org
X-Received: by 2002:a05:6102:6f07:b0:7c3:1d7:f234 with SMTP id
 ada2fe7eead31-7d03a294a6dmr903761137.2.1793198633657; Wed, 28 Oct 2026
 07:43:53 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793026273.git.geert+renesas@glider.be> <e723696e02cfb34fb808e2ae3ccb6faf68528c00.1793026273.git.geert+renesas@glider.be>
 <20261028132937.GL15441@killaraus.ideasonboard.com>
In-Reply-To: <20261028132937.GL15441@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Oct 2026 15:43:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
X-Gm-Features: AclHuK8gWV6NxtQKAEUrEm-e_rgKbr7fNh5k6QXPge3G8NVSao5SAOErcvAPoSI
Message-ID: <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] dt-bindings: clock: renesas,r8a78000-cpg: Add PWM clocks
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Wed, 28 Oct 2026 at 14:29, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 26, 2026 at 03:55:23PM +0100, Geert Uytterhoeven wrote:
> > Add definitions for the clocks used by the PWM modules on R-Car X5H:
> >  - R8A78000_CPG_SGASYNCD16_PERW_MAIN,
> >  - R8A78000_CPG_S0ASYNCD8_PERW_MAIN.
> > Include R8A78000_CPG_SGASYNCD8_PERW_MAIN for ordering consistency.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > +++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > @@ -28,5 +28,8 @@
> >  #define R8A78000_CPG_SGD8_PERW_BUS           18
> >  #define R8A78000_CPG_SGD32_PERW_BUS          19
> >  #define R8A78000_CPG_S0D24_HSCN_OTHER                20
> > +#define R8A78000_CPG_SGASYNCD8_PERW_MAIN     21
> > +#define R8A78000_CPG_SGASYNCD16_PERW_MAIN    22
>
> Could you also add R8A78000_CPG_SGASYNCD4_PERW_MAIN and
> R8A78000_CPG_SGASYNCD32_PERW_MAIN for ordering consistency ? The
> dependency patch should then also include R8A78000_CPG_SGD4_PERW_BUS and
> R8A78000_CPG_SGD16_PERW_BUS, as well as
> R8A78000_CPG_S0D{1,2,4,8,12,16}_HSCN_OTHER.

I could add them, but do you have any need to refer to them from DT?
So far I only added clocks that are listed as clock supplies of on-SoC
modules, e.g. R8A78000_CPG_SGASYNCD8_PERW_MAIN is supplied to the
Timer Unit (TMU)).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
