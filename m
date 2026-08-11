Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A023AE1BC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 07:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433009; cv=none; b=Io0UO/1WJm5V0EeyziyUtJDIGU8V/NtDpeiHfVr0hWna5AJdGbXn5JwXUHYnDkr/IFLi9tw0de6G1J0bO4yNwa4mxfZ+fBurUvohdmsf1xMT8aaCjfdFHgah9u17/ZSkpobWqZNDVslDPf/m/LGLvWAfGY/EhFUr1y7AEYGiAWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433009; c=relaxed/simple;
	bh=lc4HrNegAVn+cVHVfRGJNvIzktb87HMbTgygZ+nGNxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eju5LGRJcVCFfutuAoGv5IqeN5rAyDt5Ux66cO0BlM1hE8yO1b3cc3K5VXntvQeUR7YrKF2ZLDgKZhsJAYvSd7oN2+la9/sTeLPc8YxsLJ/V+xBN9lgOjfIU6356s08pBdo1ZLtGcvWGEoQGwS8JUXdG1Bk2ocKHGMwToS9Paqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c39cb2115cso465312e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 00:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786433007; x=1787037807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnjcaaPzjsobxbYAFHFZobbcb9vJTJhmtn4W0to+5XQ=;
        b=f5lsnJP9rxgF9rCuBBXui/kCz8sOsnKV/Hqsop+niGDAeX9ykKnr3Zmuwf0kgOqTIT
         uC5kfpVAYL8XEglWKDASnsl/ulve8m6mH+wbayl8v3cd/VisdK5xQzvXWDZh3qboq+Ps
         1qG+19dbVQ10xF+BT7qriIf1XlPNlEQ1dVIGmlpG1c5WazxuqGgqdkyBnKkaDddTHgUO
         ERb/Xwg29veAOjwMv2nApDurgc+q0iDDID/A5Jakwx/x4WZtFf0ZLkpLj7+dKWU/BYnc
         8Hy/drAeu7CjvGADtH8gWaMMkbCVFd0BiEwzjmO6mC4Ms0HwODEJCNFEO4ZfJ7Tqv/oo
         unPg==
X-Gm-Message-State: AOJu0YwDVjYHzvrhdDEQ7tY6rXTc+LO6cQEc2Eb3nMh/BpXOm+5+mwf4
	CKIBYWsbe9E04lsqv9WFOHm2KcKack5MKleA+bc8Orn3MYJXwzLkrOODHWFWcOxb
X-Gm-Gg: AR+sD124PSRETewpy5sdqwFQ0S4DtPESHjMGCUeGom0GL2e/ovhUwMgP+9lRa5DP0wn
	OX03gbkbCnjSjmsqQD5z/ezBuXiEeKLhbIKnqWc/kiKMkiR8KPUKAwgJyApdgmFuLKCnGH/zgt2
	xcBeppXsLAitb7r/V/dyBreuBjAD5CbRNA6ifbopHjRvoo3QcwAirv9FDEjORDqwJPuml+Maj/t
	DD/EF4aBjmlXrj4oQp+g7NquFBBtxqIYy41RMW23yHx/pRUbZuEpQB8lP78nGmAUQryRi/y0OAi
	i3lP+EN0pP+UzqQd9jTXZiIxN1Xhmpp8eNHETswUl/O70DTPvUL7Z6hzWfdDKWiN5ykDmjpyLS9
	YFber8aJCZWJ/YFsmjZ3XZvV0TAYCQGeKaLa8Rbl/W/sCc0ANC68gw3A/NfEANaPiaJ2zu4BuJQ
	Z2KTgrmk9o/plUYtbxy6mixLcmqFccRG+xYMmvvcFtd/SWbLZAcqx9vsHMW04/ff0sgQT8Wz0j/
	yHb+H0tu++sNxGaMu5UeT+t3Q==
X-Received: by 2002:a05:6122:d18:b0:5bd:8dd8:146e with SMTP id 71dfb90a1353d-5c4524bac41mr127363e0c.4.1786433007105;
        Tue, 11 Aug 2026 00:23:27 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c451df917bsm139363e0c.11.2026.08.11.00.23.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 00:23:26 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-75609e844faso417877137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 00:23:26 -0700 (PDT)
X-Received: by 2002:a05:6102:6b87:b0:6cb:b3db:c31c with SMTP id
 ada2fe7eead31-76b6fdba80cmr74412137.0.1786433005986; Tue, 11 Aug 2026
 00:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716095935.13329-4-wsa+renesas@sang-engineering.com>
 <20260716095935.13329-6-wsa+renesas@sang-engineering.com> <CAMuHMdWCWvfFqBAQ40E+czhYHSG_ZuCqMobku6B2iEA8ezF5Cg@mail.gmail.com>
 <anqAKtaFCxADeLqM@shikoro>
In-Reply-To: <anqAKtaFCxADeLqM@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 09:23:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXU4MDX3uqJDR+nXp8zuWZxwvNVM1EN6QSNSY8_BJ8hMw@mail.gmail.com>
X-Gm-Features: AUfX_mx_SQQwb9gvkl5UrpTLcwsLbWwtX-NcZ8tSPCGwe-lGYUP1629cOEsPzrA
Message-ID: <CAMuHMdXU4MDX3uqJDR+nXp8zuWZxwvNVM1EN6QSNSY8_BJ8hMw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable
 GPIOs on CN12
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Tue, 11 Aug 2026 at 03:51, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +       pins_gpio2b: pins-gpio2b {
> >
> > pins-cn12?
>
> Okay.
>
> > > +               pinmux =3D <RZN1_PINMUX(164, RZN1_FUNC_GPIO)>,
> > > +                        <RZN1_PINMUX(165, RZN1_FUNC_GPIO)>,
> > > +                        <RZN1_PINMUX(166, RZN1_FUNC_GPIO)>,
> > > +                        <RZN1_PINMUX(167, RZN1_FUNC_GPIO)>,
> > > +                        <RZN1_PINMUX(168, RZN1_FUNC_GPIO)>,
> > > +                        <RZN1_PINMUX(169, RZN1_FUNC_GPIO)>;
> > > +               drive-strength =3D <6>;
> > > +               bias-disable;
> >
> > These pins don't have any external pull-ups, so disabling bias will
> > make them pick-up random EM noise when left unconnected.
>
> Can fix, but is this bad? I'd assume the connected pins will handle it.
> And if not, the DT needs to be adapted to that use case. Otherwise, a
> default pull-up needs to be disabled for another use case.

Currently, nothing is connected to these pins. Unconnected CMOS
inputs must never be left floating, as that can cause oscillations
and increased power consumption.

Default I/O configuration is "2=E2=80=99b01: Pull up (default value)" for b=
ias.

While at it, why did you lower drive strength from the "2=E2=80=99b10: 8 mA
(default value)" 6 mA?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
