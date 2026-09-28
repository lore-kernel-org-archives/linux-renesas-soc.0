Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311EB4AB3AF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595497; cv=none; b=ghYuZhns2H/V5yFj5kwXjoWIyoWYegaXQS75vuRKv1l9Mh9guHBEicatzCiRb0QsBTvr0ikpZXNqGV7aXZxBBhOJURdpefhrTGJkX61PPIvaNgBUXZYjKcaNiqJftH1w54gBKffFFvRHaqIFLPeoOrhWOdPWK83lIu1ZamTWPwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595497; c=relaxed/simple;
	bh=tKvl59UVQolgo2gX344Tqkbysa6udLoFwYeW240vcog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSnuxSNb6L9+RWrk64bnqLJOzQTwwLp/pHq/o4z55dcwFYVgNVW4sfIgchG6vTuKXmTdK6SvfJDhs41BLT4sczLbTPEAlY4q8DSE7V3qOu2y/B0lVCEJoesa11Efe4H+pGRlfT7igJO5y+QYpS0xG5d02dRcf6vd9XHQPHOIJws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986dfb672d8so1289821241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 04:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595495; x=1791200295;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i6Axo3HGXtx4M0ZdgmZ+9VJvjH8NJrRWcx2B+NzBV5s=;
        b=ROYZWqoyqPwJm8chNGFw4YW3F+nTZdL9VKyBEBrGr6jJN+lF6yuBaK1dHUhuGby7Za
         WUvfg4hYR8VSZcatHx0LA9Y1/JRKcGyotmRQ4p/gb6vQoSRIMjo2Bj12Pr8XRgz4HRzV
         nEd01fgquTCQZpimIy23ArTM1fvX3LQB5T6nia9vfAYiy3oFGsNq0uUUY2G4WLZ2VXYl
         BLFfjG6DdJRhkjN+KO3MJTYeZ9qoFzyRVJCG0g5fqkkFOjFKbIPQa1Fyam9ZsO5eYGXy
         Em8sldEN/iO9UMzlp2uAiwF3EKLlGBKKixcAq45MP/Un2XIQznFPWYVZJShcbKSSCPav
         ENNg==
X-Forwarded-Encrypted: i=1; AKwUvBzYMAxDQhyCRJeuP59Y9kF+VszOdtJIgdHEQTItwleSo1HFu0kqapNeOkvtUMygghaWprJbp8Ml73vhZROCxLPtwQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJicCHKzpxXWRQ9mIFNlFHOJGAAt4NYs1tWWBPGO0krL/z6DBkd
	cQzewJxkBshuTPbNIbTIADMXqQwam/HxaFBiNgx3qYYTnDAMg1VI8APhs8BzpYAJ
X-Gm-Gg: AYBFou1g/q11baNFSfxl1rItH0e/8Lev4m0z26KYb+TkXcKzy1Do95493KInOMPn9J+
	LK4RDaqBOQTbYHw+ZP8tqB9Xzppxsbq6EsFxLbHKSi9qASVNCFETAzhs3TgjdByKazzMg9m5Yfv
	ErGwop90dDRGaxxcjnPDiyXGGgY5P2huiWtkF51j09G8bupWi95ja8OSfblMU+YJuh65ORF75oF
	p3d7jJVbBhwgtFvSg4sbsiZj4llqoA9gseLgvH92d9gvNVw1IrwvGLScw+o8XGOGO5/CEkxcoZQ
	fZjPYpyR+m2jhYwnYo996UgC3cwRVY5VAUe6sBy4o861UasiRET9YNEI8KSWDLkJ+sKvWAiVxen
	ZwaGtFFvh+I3+XKlqZyxTE0JbdzcvV7iYByOU2nafSGOhgU0xyBd21AFKn0C009v2ymtBy5MBc8
	A17CPJdku7QUmzltVigRbSXza/whXPmnBOGa0DcAQ9CeKSG0ckXYCqJsNyCLQ7JBP2KGfvYSkB3
	0av22eOJ4dOjRbmjHJ2YcpR1wAJdcq0y7kF21edp1jQocC8
X-Received: by 2002:a05:6102:2928:b0:7b2:f832:49bf with SMTP id ada2fe7eead31-7b2f8324f4dmr2303074137.14.1790595495033;
        Mon, 28 Sep 2026 04:38:15 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39c1a46a6sm8618153137.12.2026.09.28.04.38.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 04:38:11 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7b3so1607113241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 04:38:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz8PliHgcuiIkHqjfa/GOYTzGu8yW+DtKTd9N2GNWjccBThVGvaVOfww88222OnR9oOBcjB6Dhi6JmC9xlmeKrGEg==@vger.kernel.org
X-Received: by 2002:a05:6102:4422:b0:79e:373e:8216 with SMTP id
 ada2fe7eead31-7af1973fc40mr5035987137.0.1790595491034; Mon, 28 Sep 2026
 04:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790325809.git.geert+renesas@glider.be> <10e85f27b8ea4342f6f19a7c9e68fd641e58b54a.1790325809.git.geert+renesas@glider.be>
In-Reply-To: <10e85f27b8ea4342f6f19a7c9e68fd641e58b54a.1790325809.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 13:38:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJoy0pBHxfib-SmUf+2LCum3HAk1hftXyeV8CEwKWQ2A@mail.gmail.com>
X-Gm-Features: AclHuK_Ipn8bslrHX7mMK7Zs6CdI4c2l8ME7s7cvf6MpMmTS5OEzqaHYWA0OcRE
Message-ID: <CAMuHMdUJoy0pBHxfib-SmUf+2LCum3HAk1hftXyeV8CEwKWQ2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a78000: Add MSIOF nodes
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Sept 2026 at 10:53, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Add device nodes for the Clock-Synchronized Serial Interfaces with FIFO
> (MSIOF) on the Renesas R-Car X5H (R8A78000) SoC.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a78000.dtsi | 104 ++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> index 9a07753b221541ed..d75a9e43f772f871 100644
> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1000,6 +1000,110 @@ mdlc_aon: system-controller@c1338000 {
>                         bootph-all;
>                 };
>
> +               msiof0: spi@c1700000 {

[...[

>                 mdlc_cmnn: system-controller@ca410000 {

Hmm, something went wrong while rebasing.
Obviously I will fix the order while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
