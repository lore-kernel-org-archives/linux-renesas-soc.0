Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886750;
	b=BOnDfL7Dt8DFa1XjZnKbK1FJHUukp1Rigwt+MC7KZKm2pBUSeUvZf+YrzLLs4NG2oLFh
	 HR72Xgi3/x9Me9MIg8QDOtlmFpP/ojDFhRxBj1/f92S7ab7plRWEEk5rSeiJvhPBEcYns
	 CtrN0sqIKGxu0rbGOpTB13XGljmaCPFl8kYv4N45CO/rKWfb1hqj0Xh1cmr3zA3lyW5ak
	 Q9EXaTpbgcraUBoCpwsJj7iarStHP84UyUz1Vlb/rOvZzoFS59vmjFIkV6pUdxyguJOKF
	 WXXWP5nHSQwW+Y4JGrsgJ8ap+N1B9AvvrnRHpsm7DCtFAZH0C/qluJ/7q6LLVKZIQxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886750;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JeahCgBrqhQ8oPAtWJnblBFX1NrAxRVlymvspDmA96g=;
	b=jmwJ9ruyyb9XHgLYtxzoHADgofJHErZxFX36o4aTRh4HzpIsoIob703xyg1dORl7Yogg
	 4iWn0L/NXl2h9MN6dGIc7pCo7DR1HY4+FAWRz6XuZBGuWRAcnsb9l+ju7KwaiVW/rDOQk
	 qLGz1ggA3RPUNoE8525D8f6F6EVhepg1mqRPaOrFxWGry+5LstTpbZoj1QZ1Jfgytv6hB
	 WNzmBdhNzzs1JjTh2G3z3zQUiUQ7YYYRjN7XqsC4IS71n6BmJtounLuDJKjvzLQJK65T8
	 11GFG8wFVvdq72S8tbzh/Q/qN29hsBvTgQf2/HeqoFlT/ICgdzpBDhJD/sV2LGePJJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ys5A0nML;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBAC606A329
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Nov 2026 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ys5A0nML
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B004A1F00A1D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Nov 2026 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793886749;
	bh=JeahCgBrqhQ8oPAtWJnblBFX1NrAxRVlymvspDmA96g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ys5A0nMLDZtcc2L4EmxW5mFU4qrY0ip3kpiKLblrYSYJaq70vYZP5oERDrKuMwxnk
	 uJUxriEtqugBLdHD8i5MvFdIMUfvSrU68tpbl6bmfIlifR3ZqLtQ9X6CMra4KXRpNt
	 PlMAWdXOJ0Hla7ZUpwjGVvaR9k0TmY0n/gqV04gEDvna+HkADy1p5ZRaBgq1QgJZfp
	 6BlJ8sgOVzxs7RtKSofDyOm4CnGiEo4X/EiJXROq/ABYOozmwtKRViqcQ7WJAxyoNX
	 EuoP8TyEjZCECXWlPkcF5bcsks0D7RXDeBIgS9Xpqr88zPEX8TgHpt8RZ3uC7H7N4S
	 q+4AbZqy+r1xw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so1978292e87.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Nov 2026 05:52:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBweCwuKiToIzxVNZudSUrzOXNqrzgxZcd2MEV48dp+KINBzDFMr5rDWTuYQVLOjXcZy+3UQvbYjfWnZal6XavgEKA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Yl5jHzRQz4GxioR/MhzJhOfv5FdgbwmgRwer9KlcLANHwp0So
	YrnFHrNH3dNdPEndMXLaVEtShk1+YR5qpNDHOiUmseTsjFS/GywP+k7co2esZZ/RHhNBoXmb4Nf
	CojLRP8euvP/oZgu2Pa31ItR/k+5nKig=
X-Received: by 2002:a05:6512:4286:b0:5c0:165:16c3 with SMTP id
 2adb3069b0e04-5c001651b15mr124760e87.64.1793886748448; Thu, 05 Nov 2026
 05:52:28 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-mali-c55-renesas-dts-v5-0-51bbb43969c1@kernel.org>
 <20261027-mali-c55-renesas-dts-v5-7-51bbb43969c1@kernel.org>
 <CA+V-a8vEub2y2gvXp8jkjVHOGuj1Eqkbq75t8Nezz95iidtL3Q@mail.gmail.com>
 <CAD++jLn_3X65zu8q-DfWbn4xjyPrSfp5BVH4SO96XCxmegcvXg@mail.gmail.com> <auxUgg0PP9xXqA68@zed>
In-Reply-To: <auxUgg0PP9xXqA68@zed>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 14:52:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLnHymVvk1i1o0vC1PBguQ_-Cpc4tCH4P2ztn8cF7G-izw@mail.gmail.com>
X-Gm-Features: AclHuK9aWghSgGPgEAyeqdT4fh_Hp97d1wLRufm5X27_o_R8h01yfuAkz9ZEscE
Message-ID: <CAD++jLnHymVvk1i1o0vC1PBguQ_-Cpc4tCH4P2ztn8cF7G-izw@mail.gmail.com>
Subject: Re: [PATCH RFC v5 7/7] media: mali-c55: Sequence resets explicitly
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 11:10=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> On Thu, Nov 05, 2026 at 09:58:09AM +0100, Linus Walleij wrote:
> > Hi Prabhakar,
> >
> > thanks a lot for your help!
> >
> > On Tue, Nov 3, 2026 at 2:47=E2=80=AFPM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> >
> > > I tested on the RZ/V2H EVK with the clocks and DT left untouched,
> > > changing only the reset order.
> > >
> > > The hang comes from the reset assert order in __mali_c55_power_off().
> > > Asserting vresetn (the ISP core reset per the RZ/V2H manual) before
> > > hresetn/aresetn wedges the ISP. The next power-on then stalls on its
> > > first register access. The deassert order doesn't matter.
> >
> > OK I will drop the clock patch and keep this one.
> >
> > > Asserting h->a->v (deasserting v->a->h) passes repeated runtime-PM
> > > cycles and also works with the IVC enabled. So 7/7 gives the right
> > > reset sequence, 6/7 isn't needed for this, and the existing DT mappin=
g
> > > (0xd3 =3D vresetn =3D ISP core reset) is correct.
> >
> > So this is a Tested-by for this patch?
> >
> > > A smaller alternative keeps the bulk API and only reorders the names:
> >
> > I guess that works, but I'm not sure the reset bulk API in the
> > kernel guarantees any order, so we better keep this patch as-is if
>
> I was under the same impression as I have memories of quite some
> conversations around this and I recall a workqueue was used to
> schedule bulk reset operations.
>
> Now that I re-looked at the implementation of
> reset_control_bulk_deassert() and its history I don't see any trace of
> it and the documentation says
>
>  * Deassert the reset lines for all provided reset controls, in reverse o=
rder.
>
> Was I hallucinating when I first suggested no ordering was guaranteed ?

No idea... Lad showed me it is guaranteed so I sent a considerably
less intrusive patch now, check it out!

Yours,
Linus Walleij
