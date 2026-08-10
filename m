Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF43D9535
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365129; cv=none; b=aSw0GK/hzQpEvfSKfKCspTNgx+6gysZwVCMg/iTQKun+Ri4LSVmLnMRBF1vZolHiFn4oXCpMAjJ9EDdwdct2b8HWvfm8mrGVfJ1Ghmmaf+0IS90MJVqzxW7IyUp6wtNwLpGi36TPUPSA0zrw4oO2nURxL5qw3HQz3h1eydSmsCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365129; c=relaxed/simple;
	bh=lThMu1u+hE8LbmETZNNwkcOM2Ulkxrm5HMou1DVHji0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BAaqmSsKRjjhyVJ4iVVmvCQbjqtY54ok220bXuHE/rr3xgnwxHY+ffubH0mFy784tUE23ONg6RrQjij2pw9GBpMciORDd1xT6T3Wf2Y5ADL8BoVHqLeCPE6rOgZJC1m4KKhb1Pgkql5QHxiDqva6orCb/sEqDwRa+OgYftP1jQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-967327a0c7dso542817241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 05:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786365127; x=1786969927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x3yNCiQ2xZIUlAriiD3kuROtqejdF4LbO3lrN5CP0pM=;
        b=D4pzjUCFyH+SEFsHSIi/m5iMlcLvYj3Q4SS+S4qfQQmwB54cF+BJCgYgoa1lJFrcW+
         XyQu6RblFhWO2oMSjOo9g0LvvyKbzRGo2uHUW22o63YihDeOanRpZReZs8ml16V6nEJg
         mH8IYyOcyiR+pgfqpLH+7YMO07WQ3ECdpx6qaqQADq5+9/aLAyTUEVtOCABsJsWED/UX
         fejjDb7TS7U7mpoSTxLQTeN8sx/YP/mlHmlBt4/KlL820DuyMeUHLKsTS0B8cAtwgdc5
         rmRNzOdrEUhuR89nKncp6pcC6NuOu7gXu7Hr2TTGFFNb7Gp218M1vjspZ2QTAkaKbGbw
         61rA==
X-Forwarded-Encrypted: i=1; AHgh+Rrog4YuPMT8gQPxjZSHYPLXUdQLh/xdMK6ui5l5SkhJa/Ukden18isjkfIVRio8o6TnSf992IobU1oi1IB7T13ZdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBS2qnndIoBdlLisQXPsGLqjb7MYV507ZvuWkRWwbZvULPePMf
	RG2zifxJNJXfJorzElzUP4Hax2JpmPf9HqRKt4zM2oohQuW7sRSdv3NnQ3Qa6RTK
X-Gm-Gg: AR+sD10nLKSpsu0IO3GQw0vPWQKQIF6cydyc3UeuSIFLEFbSXwgaKKmnImWuWEoU48J
	zAaHvvNKAtN6rQ4aPTtjIQc/5waVdOxAT+2ReFI7kgD5845jxxCNnzhEIxGBaK1qXOUb4lnyUsZ
	td5keoYpi4cShSfRKAjQ+/tU9n9ffeA9jh6efJqS4lQTyZivhrVwdRc9bCBZxorc7sJ9J9iIoDS
	8E9b6tdBixPTVULvbG0DuSyL6VSgWxneYSx0bA6koofeastZgnZ1t3ay6ffqRDyYNs6M+Dtqtcl
	JA01UbPO3pjkv16zCt1GRZHd/8vzYJ4ZVuzgy6TEDgCC951yaRFWrEEFi4Lmu4rf4NkaOBcC6FP
	TqhhFty7riiv5+aj5Rxy34Xtip7ixphjnQMZl2CtrBx6XhiGwCTUunmYxUCbrNvO3f7rZqtlLsL
	bqw9wJLbVpjUyBAKS1Ci6of8N9NVC2Bm7/I1aH2Syd5mj+ZgF5I2SHvQ/Nm+FwNh4lxHtaTcExN
	LlgiPpk1iQunIBl+UuimW6HPw==
X-Received: by 2002:a05:6102:4bc6:b0:740:2664:801b with SMTP id ada2fe7eead31-760e851e3e5mr9338916137.11.1786365126628;
        Mon, 10 Aug 2026 05:32:06 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76400dfdfe1sm4280250137.7.2026.08.10.05.32.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 05:32:06 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-75738fcb0d9so115995137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 05:32:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrUce9mM5XVLJS8LJfGUkYQlnsXZCQMh28FJfxAvGzs7ok/h+vJu4T9S6NbH2vyufpXIt3YQGemkcYeEEmouwHJLA==@vger.kernel.org
X-Received: by 2002:a05:6102:2926:b0:747:4d96:dbb5 with SMTP id
 ada2fe7eead31-760e8b29c2amr8941171137.12.1786365126138; Mon, 10 Aug 2026
 05:32:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705125324.13519-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260705125324.13519-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 14:31:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtt6tNDRo3J1VRwx3Upsa2UWGkK9qqGXr7232AyY864g@mail.gmail.com>
X-Gm-Features: AUfX_my8_Kr3bd6yUN_SBO3fPdh69-mPfxOjVFEEVS03N_MOz4fZs0mAtI_-CGI
Message-ID: <CAMuHMdVtt6tNDRo3J1VRwx3Upsa2UWGkK9qqGXr7232AyY864g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Always enable edge
 connector I2C busses
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 Jul 2026 at 14:53, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The interfaces on the edge connector of Retronix R-Car V4H Sparrow Hawk
> board may be controlled from userspace using matching userspace tooling
> that includes e.g. i2c-tools. Enable the edge connector I2C busses I2C3
> and I2C4 to allow userspace applications to use those busses and access
> peripherals attached to those busses.
>
> Co-developed-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
> Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
