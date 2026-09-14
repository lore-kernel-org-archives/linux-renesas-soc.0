Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2BD491592
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 16:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404761; cv=none; b=l+Fsc+UYLTJUQaQ4c1U0Ks4AboOTF3+fC7H1gvk9do45nxK7wLY4U7BmRPMhyIkJ1PVEeh43xO1qGvnWY/JzV5+/5mfdBQKc4xphOvmtHYzZ8dxQvsDec1XTXJ+aObIjEml+dElKROsPSj4QjytYDAekQ7FUxt+fnG9xyVVWTiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404761; c=relaxed/simple;
	bh=Fd2S2NXGFBalIowiEWphlMNoSm/GpBg0YH4nqBrZ3ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVuMheTbBPQx+abdoyplmlOFJVOlVPugkkhoznLD/rxbJx/BuqRp4HkBAXXFycctBPzD7S57/aVtHgJaC94WuUWqjoLdAbsRVjt1enYeD0cOkZumv7aQgLVOpiFvVNJW3suNUrT3iKlq/rcjulfzLeYow8u1CnwXGoRnJX3cQ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78564319a92so572078137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404758; x=1790009558;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W3a3IBWWzJToy5a1Wctoyn07sbyxrLzeKnit0JiQFO8=;
        b=Ys9RTe5DsYp7XvO+oSl/EtR/wx8AcIS3uUTEjHBRn2TLpTtYWwFgUVKKeUb4siyAw2
         4a58fcNkTsum81A0GKAZBlGIc9T/lQjImZgDQyVHbHAYGGLsS6/O2UXINIhsMcwly4/E
         391brOVtUzCL1iIS6mA0pGhl5DKG6IJb92Y8kGGRT7nn3DRYzKyv8JIq5zJhk7f/eyrN
         /P2oi9vOSfysH1nfRK96fOmV/ir+QKlsyPQLcFsACvtm8rrpgkxym96s4PdQxImnVQug
         4ly130ihJ+LzTcjPFf8DPC+0mxWyy+bllUHy6ZmT2uc2RuHFgK1K/HS6iQfh98aZ0RIM
         bZgg==
X-Forwarded-Encrypted: i=1; AKwUvBwDIu+Lbs9ywEm0lyMY+9+0AlcDC8NfecOfeLlMLHDlqoZ0Q0KEWgyhYzyb8WBSDbrzL3efxiW6LC5YKGErAmygRg==@vger.kernel.org
X-Gm-Message-State: AFuF++lBPsJnA+k3D83znGJO0ywixzFD1CgU5AnW0DgkN5tHBAAxZ4Ma
	hm8JrUUYH7ms89iruOt0DjK1Prddl+xVMooWsbFx10LmAbj0vx0joMkHdWEyAGgE
X-Gm-Gg: AYBFou1iFKssSgy3X2BSm2jOj+Hluov1zyjDi3qCDBhwQyInsthA9guxHZYBQfdZQIR
	OHETvC06fv/HCAPvEAsd+TNCxZHsJdovXggP29gHWQbaScVMbNfCK37pSDOkdEbmoLRj8Il6nZd
	tbo6PMsOjOzwc2wLAAohmcdDio/8TrFkb04oH09uxbdhumJ8l+sX4rsmFBL9AcMXPdwJnseUH1M
	IFOL/bwMVReuB0/A6Zy6TAJyG5beSZWCfAl/BlUY/BE3tdkw7inoatfnm699NsvBQZ24bQ5WFl2
	1Vyfx9R3nel9ouUueOVRBh1J2uI9ND8zq8ysFlSCk7JhBSaaksTDLJqJtdeHcFX4RV090PxsyvJ
	ZI1UKZ60QdZBumrmD42ZbvMFllhfiUUdxx7y/V8UK9vozzLU+pOG42iAfMCn/Of2cWoJ8xt4QJp
	vaHbK06svUPcKBcfYZQjBYnCGUbJMg4HUu9U9ZeF8ifprMeUamjDl63GSPnoWTdc6YNtyeMXW/t
	iioRdx5W9TteEwrVf7IiCr6BZCnqU2QwXM6Mw==
X-Received: by 2002:a05:6102:3e85:b0:797:fcf6:822 with SMTP id ada2fe7eead31-79b5c032058mr3053803137.13.1789404758599;
        Mon, 14 Sep 2026 09:52:38 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-795a03d341dsm7355574137.10.2026.09.14.09.52.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:52:38 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97ea5bd53b4so742687241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:52:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzCZLVcVD7Vd8cTnBHO4wnNXc7TA17/TmqAqZYpmnxBYDVgtMEwGfoCv9cMw9P/vTGyfUycL6DQ6xlT+w75fzgFyQ==@vger.kernel.org
X-Received: by 2002:a05:6102:e0f:b0:799:b918:687b with SMTP id
 ada2fe7eead31-79b5878ab25mr4331172137.7.1789404757823; Mon, 14 Sep 2026
 09:52:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260913195654.3371385-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260913195654.3371385-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:52:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWi8Jz6GVGJj0VsXOEiOw4ghJgz895m36m2hDvVCkxpxA@mail.gmail.com>
X-Gm-Features: AcwNN1Unuk-LkzOotScnYJj-MKknR-KC4le6kfYxk1N80HhcIpZu4mg1zP5BRtg
Message-ID: <CAMuHMdWi8Jz6GVGJj0VsXOEiOw4ghJgz895m36m2hDvVCkxpxA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] pinctrl: renesas: rzt2h: fix reading pin value in
 IRQ function
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 21:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> rzt2h_gpio_get() only reports a level for pins in input or output mode
> and returns -EINVAL otherwise. When a pin is requested as an interrupt
> it is switched to IRQ function and its I/O mode is set to Hi-Z, so its
> value can no longer be read.
>
> gpiolib calls gpiod_get_value_cansleep() to determine the edge's
> direction when a line is watched with GPIO_V2_LINE_FLAG_EDGE_BOTH.
> Non-zero values are translated to a rising edge, zero to a falling edge.
>
> Since gpiod_get_value_cansleep() ends up calling rzt2h_gpio_get() which
> returns -EINVAL when the pin is in IRQ function, every edge is reported
> as rising.
>
> When using the IRQ function, the input buffers are enabled and the PINm
> registers reflect the live state of the input.
>
> Report the input level even when the pin is used as an IRQ.
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V3:
>  * move leftover unused function to a later patch
>
> V2:
>  * remove the PFC_FUNC_INTERRUPT check in rzt2h_gpio_get()

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
