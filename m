Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B713BF692
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528959; cv=none; b=UPfo7ioL/1aJyjdIBB1s1byKzrkcQn3hdflbU9ebWNS7YI4x3CBazrp5+b9KF/t4OpLcI2wJv8uL+RZvvGXXwX+FZIKXVUnVkLZhFWhbLlC9VAAUPdBlmCaNOcU2+Omnhk4m6ihW0DktuclUcfw+wrS7qSG7tlZKxgj27Ecj2nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528959; c=relaxed/simple;
	bh=wokLofWxv7vLrWb75WZJGxZonifi+3z274aDMO/O3SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMnWZRmeMlitnOX6occgaHn4gdP+OpULDsXnXAZWVb0WZB7FpzmopAGL9P5tpyyyht8HBJ2kwKDeU/+z+0xpQlD/s5l/yedJb3G1h4nMSv8nMD05iXYWy+P1RVNpNmizxgVz9mStAE7F4lEmxVh4msYOvrrsAIJGBfhU8MxDx8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-738a5cc517eso474793137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 03:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528957; x=1787133757;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CR60h/fVXoId0NfC1qox1rIsZX7Vdp8o1eA32koeHU0=;
        b=s5h28Mz5a1OY7fRb6VBrWeyYvMoTROh7i+v3sNNmyHhiEfSk31L0qDUdPlTjHDlAPJ
         uodlkpGWi/6tAjMFgsMneIELpBgsZaVl9hivdxNrlTpoVGWpuhYSzKeb/1IZGiCqFWvB
         hs9i7S85zLuSMLd/C28OCNPYl/OTzLbvENIPleFI4zF9XpjfmOsxbvMX8JSKUd/mP9UN
         cA3iZcy055wmA8MN5JjTMFKmnFOcpLtwOuuOhS72aXg+XJHkkHXvgVV9Yi8JjchLEvIj
         cQlQBzXiLLPKecm6Ps9vnZEiTnTh4JFU0CAt5dHz8E0ETJnA4VCyXaNbcLrWND25Y12x
         +FVA==
X-Forwarded-Encrypted: i=1; AHgh+RpDyQ1r/pBIJQeJJEfFs6dwk6kqqMbf25uh31Fm8qabbcB5Lpq7aMHC8m8lIR53mBjl+FPaQxNH1V6o2J1N7rdSNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVVy3DmzvFEP6gkmsecaRKkDlAC4zzqOq9fsNO3WfkYbXxkjLO
	5acNyqvElWsUjtETXAgHUKUY5Wa+xkocqNqcan5H5jGrtFqC7cKTHmZ7V7SwTN0i
X-Gm-Gg: AR+sD135ops3cP3RVGiWVihJ3vbxHi/9I4b8alvXebnMipBHJUM+hL3bSWiIP2g6twB
	dusF3pcga48ELsZGu2oBAJgdEVE1y6nY7/2XomFYopUvCClah2hZQFLCwMRVAqhYoOJ/ezl+Wm4
	q8NajCm+iCDOkHtDAiqCMSoKXbcvhSKKwsPWRUhoaGSQDz1BC96y11iQ9k6kGQ7/kX1mkCkyLaB
	cdpLloyjFyfkew9OfOvoMm7Boui+7r8yuSm2jLY4HGsNUFsyeRS5/O3LbujiHPuwRHp7xV3NiHp
	A8qiaAxWNHCMktz7EgFCcvYSabOGhHuhtXcyyIfGCEK6A9Cth/TE3su8NA3Uf5UqrfEbUmdMvp6
	uGMda8Tai9Dp/YJGRTYliGQotgvEEhrT+iAciHYgwC5tUhtEX4j4brS3me7kZgISyT3BdVF0xjz
	b9uei8yBGfqLTvWpp/hShS6GlLTWXRNEHtE5kFWKSaokdgmagwBH52sY9ST+J+J9KwPgpGjPGeP
	dIE8c0NugSDYhlgw5HEj35XGw==
X-Received: by 2002:a05:6102:5110:b0:74a:9ac9:792c with SMTP id ada2fe7eead31-76c9071b577mr860252137.12.1786528956895;
        Wed, 12 Aug 2026 03:02:36 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97a3cc0da87sm1240238241.7.2026.08.12.03.02.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 03:02:36 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-73720e58dafso429854137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 03:02:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqTO+Fz7t+TwbAv2MMvk7A84O8E57o8bzxGwMNZG4bUQQuUgisNUR4RLG3Yh1SP9ZK2Xr1X++dWnuVJK9I7PDYAdQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3fa3:b0:738:531e:a43e with SMTP id
 ada2fe7eead31-76c8e62eb86mr823119137.7.1786528956520; Wed, 12 Aug 2026
 03:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org> <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
 <20260811163334.GA2354701-robh@kernel.org> <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
 <45dfd858-9d59-47e6-91e0-ef9e6e909af6@kernel.org>
In-Reply-To: <45dfd858-9d59-47e6-91e0-ef9e6e909af6@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 12:02:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJFdJQP1GVXrOWRuYO8Si_WF5X+vpzmAgTZY+tQstR1A@mail.gmail.com>
X-Gm-Features: AUfX_myt-2ep2N9UFFpinQmtMeTX8Y6aB554SNFoItehXn5f25ET5eoahbFPK1U
Message-ID: <CAMuHMdXJFdJQP1GVXrOWRuYO8Si_WF5X+vpzmAgTZY+tQstR1A@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 12 Aug 2026 at 11:51, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 12/08/2026 11:47, Geert Uytterhoeven wrote:
> >>>>>>> +  firmware:
> >>>>>>
> >>>>>> RPi is doing similar, but I have doubts. It looks way too close to
> >>>>>> generic "syscon" which is disallowed.
> >>>>>>
> >>>>>> I think this should be vendor+purpose specific, e.g.:
> >>>>>> "renesas,scmi-transport" or "renesas,scmi-firmware"
> >>>>
> >>>> If you can tell me the resource that a 'firmware' provider provides then
> >>>> it is fine, but you can't.
> >>>
> >>> It provides a firmware API, which is not available until the firmware
> >>> provider is initialized.
> >>
> >> I don't know what "a firmware API" is. What does it provide? I know what
> >
> > It can provide lots of things (everything we are no longer allowed to
> > touch directly from Linux ;-)
> >
> >> a clock, GPIO, reset, interrupt, etc. provider is.
> >
> > A clock is an object you can access through the clock API.
> > (s/clock/.../ for the other cases).
> > Firmware is a service (virtual object) you can access through a
> > firmware API.
> >
> > In all cases, the consumer of the object or service needs to know
> > which object or service to use (there can be multiple).
> >
> > In all cases you cannot access the object or service until it is
> > available (initialized and registered), for which we have -EPROBE_DEFER,
> > and/or "[PATCH v2 02/10] of: property: fw_devlink: Add support for
> > firmware".
> >
> > Thanks for your understanding ;-)
>
> I think that's the difference here. Clock is not an object, but a signal
> on a wire or within IC coming from one device (provider) to another
> (consumer). Firmware is not a signal, not a wire, not anything which can
> be provided from one to another.

Oh yes, it is a service provided by the secure world or a different
CPU core to the application core running Linux.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
