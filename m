Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE647442B33
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661305; cv=none; b=DWsGblkYlKiI/nAFPlQN+vfOQVhPyNNA7sOXF0jXo4YaXBfvov33uG9ncm0ufFPw1zumRVUHpb3jdSwiYaQ2WxKOilnR4DOsEHaGBkiYymBGS7+eKK9G4x8yTPKmgI1lgO74Ng0r1WqDilSiNBRAcx5wJeGbozvpN/MxdmvpbYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661305; c=relaxed/simple;
	bh=4nRcMnRQV+AnDLfqURNbts14rQ+nBGEFB4Rm66x9S30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZMZFp/VzFb8wbIOf9vgNvWFFv0I4ivzeLYVZ8+GcbTEQA++d5s+KHxfWdomrxvOU2X2yP7wOZ48F10haVUhxrGKgIrXN77fHZIMO2/gKT3f4qS3s0RtimapuT06U7t3ee7dE0zJ9s8q/Kh9t4g/fYxWbCetr6at6MwlEkLnY04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81f3b227a4aso73557637b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661289; x=1788266089;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9/HktJJBeHHkHA6w8idbfeQ0ukYM1XFsMvOe4prisg8=;
        b=nvaG0UiEoIX71PIcph8hnrwjANsvae1z8w3qHNeTSlNPON8nlChYA7t9PGUyzQYpmD
         T4CGvWP6k5gZ2zyshGjkpxdKF3ffe4kj+UAE+7BRiXO6vWI/zaSlQlIJV8qcM7ITMuVu
         vqqdhM8x8lam3FIbSomiolRb1QzdEOzzBhEDAPfmc3byAreQsjNa7Rd1tbNZoxPYgDfH
         9Jhm2ykHBSgLRxCijFsm67tIogt5NSKTXaBW8rXOnMZPHIkxXTn46WOqk2zwzZPRRwcz
         T/qWy5nwsx6uBNxPAuH81HeHY841TQ7cLdM1JUq+tPtlO+YXcvqwOJ4YMecQzUNFymlJ
         ki8g==
X-Forwarded-Encrypted: i=1; AHgh+RrVqzXe8NowbR5Dq6EF4Pu88BZb91OQdbRdAK1V1oBNCTFBK2+yortwmBlPQ2ltO86B4bRVr4miBtg+dp0leHcUpw==@vger.kernel.org
X-Gm-Message-State: AFuF++lcAWMZhjPhbNJhVJO0cQsul5qJuAdIxjWsdVM32ZNi3ogeRVqC
	Bm0uz8Zk7HCbvneRDYvsJ5u2xqRJMD7LtE0NfewV3RpFWkozBivMV9gXPKOM3E1is1U=
X-Gm-Gg: AR+sD10n5t0DIwj8XZQ0zJGA9R5jpL5nEbSW04aoWrYNhgav2IGYwQYQQVdfb3ZvZTJ
	5z2zeDKGLHDDc4Y42SB7ebKVjwvd4CdheLf/1ek1LZqjSKwBgEO3bV0/9jF/XV2XLoERGxU/YXM
	b2fPTlXyF9zHv3ouPDltWDSxo6Gn/1uyLqRNDCxBz591G8vlmY/O+d2HgNwBwWnu8YFKGjlSi5v
	ZuSZpUDmjo6RG537u4aX3O8bl+a+sHTcyIN1kdq/okxLcrf+HZfrvvlyxo34bs3p9XBt+8gmWc2
	6rqfCJhmIG8AdGeSC3uOpj85sLDNVnWIHSIc+aVOaEVs/BUQ6D7Tener9i86kQufczkrJiMsmbx
	F/2AFDQhSzGRTnWSkLwezaznPi6JyxBAwUWLMkGgfNzh4x87ji5IQWcQ1udoS7Gi+jkngniDkGN
	ab1gcuUt5bMvcb+BBB7yIAlaKZcq9HuWNPlKwsyjYONmLYrlOWmsFahZLLEckGAPq2ZrpvFOMfq
	MQAnn9irTOb2T53N3AiIvmv/KbQXw==
X-Received: by 2002:a05:690c:e3ce:b0:81e:89b2:91ae with SMTP id 00721157ae682-8547696e743mr28784507b3.21.1787661288852;
        Tue, 25 Aug 2026 05:34:48 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84cacac521asm48472887b3.48.2026.08.25.05.34.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:34:48 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81ee6b2da98so65836337b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:34:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpHJpLt/a/B/gCVtBWJgKJ7mBEVk2BgmHurc041MhmNWfeswPh8ptPO97QbN/cvTG7yrsiclGF/Fp7d6AxiaGzQPA==@vger.kernel.org
X-Received: by 2002:a05:6102:f0a:b0:779:aedc:88c6 with SMTP id
 ada2fe7eead31-77fe357cf7dmr2091702137.0.1787660845781; Tue, 25 Aug 2026
 05:27:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:27:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxeZ7gQiqE6VzDEF6NqgQyqO9bSnGkyyOxmT8zg62QqA@mail.gmail.com>
X-Gm-Features: AcwNN1WRL_UGP8kr-vdoVNnxkPPKW_sCIe6xHhiuRgRsERD9dSDy4YtRIX0EpTw
Message-ID: <CAMuHMdUxeZ7gQiqE6VzDEF6NqgQyqO9bSnGkyyOxmT8zg62QqA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] arm64: dts: renesas: r9a09g077: Adjust CPG
 register region sizes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Increase the size of both CPG register regions from 64 KiB to 128 KiB.
>
> On the RZ/T2H SoC, the CPG/MSSR block is a multi-function block where,
> apart from clock and reset handling, it supports other features including
> clock monitoring, write protection, and peripheral configuration registers.
> Expand the mapped register regions to cover the entire register space of
> this block so these additional features can be utilized.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
