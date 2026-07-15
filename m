Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F693E5A0E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 09:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106179; cv=none; b=O9tBRhUavILGawyFH/cD3u0iPorlaH1FCleunoHsHytNv2pFoWO+kcW7qOoEtWNx6ySnbkjLmiXJretSgJxiua18HWVilrj5zSWJrTFBrtHN3/+g2GYSQAqADG99emGQWAtbEU+iVdrZF0C+8aOymuEq6VKMX7yWS/vpSTx02lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106179; c=relaxed/simple;
	bh=4p7JA6EZMNI8+iBrijHrUHNSvFWoAG8Fnu6BsUPc+bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8czu12QhWrbij6K613tSwSz0Vuyhk5TxxvCi7Pf7dNapHTYzCEtSebZNCsgblX8X4GTa860ef8wzrHNqIL/gUsIWTS/TquJemz3lMdgU3U09ynbHt/9hoHQgqGYiLSFlhKLwzS/z0wTW3xF27kTx08saMoZDCbIAi7AioQHQEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bfd1df4835so2064097e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 02:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784106169; x=1784710969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByrjGjRxl6chD7mBfQkVFOKBnkOxHgRz/c3eqExfhhU=;
        b=KY/tmEI0X+S8yxQkdxoezLpUMlYRuf4MfVxlLW3jVoz0NaaQtgIWssWpRb9Ah4mJVV
         BQk4nCPzcjOewoJQ2olkKqiKR9CkIxnjy49ufGWWVRhN7HeT7pGBmqwj0uJX8iul4IEW
         aVGwdgRKZN5duNaKJQDupiE1bYkNC65GnRqSDMQeehar01DxHQpCj4NaULPHbfY6WaMy
         whxLecRvUUm2pfSZlgj0DMWzQsBCC7qTu2i4n64Ai8CgNPw5g/PCwe5x4iGeq4ZCw6C/
         EOUWHdgnyAEwzZ0xZ6nx3bTBpUL1nOsgu9+dgjTx+DTD1TNlKP4svdoZ77zHCVV9bCqz
         j+5g==
X-Forwarded-Encrypted: i=1; AHgh+RrEAQt7wBmCFkYf2ugLPLChJ10JhXPx674Mjh15mI8qJ4qnT02TnMm8ZA9W8VVJRvWPfoyc2j6dlDaXT4XWn2Z3RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv8Ni2maAv+GOYLJ+1wDZfFwT5F7jeCtRf6zJVViKeZAy9xtSG
	/TaGZZ1q89RZyN47i6OcOrBtFzbBAz7VSkVH64iu08aNTf/oTlSF1tENM42xaSh7fog=
X-Gm-Gg: AfdE7cm7AJN99utL5HJj3ZkzKwYyRZ6bbuzIlJBUk0Co+7CkBZ6UrbsJefIEqNAxX+k
	hUsDQmh+fgVYB7XGoMdqsIA5Ei75sJkIjXZHAHMTvoTwfHnkQgMz4aA9he7UweaBVzHJhkNS1LR
	tPdp0o0waUwXzeR2MHF2shAJIT+KRcByGqgy+9T9yhv/q9frR09RB9qXYkdhG1OBUJXJB8RNLWV
	1SpodK91MvcEUJYGiz/y+Ocs0IwNQKNQu53AjuPFWWZKF11Grfoj7MeP2b8Zc9v9irAfjPILGp3
	M5/gk20j4jGdzaQak1P34x5u0hvDdVVgJ3jBWpyQ58eBxAihUs3aLhwAFWE+DS7DiiYmlbnSkNf
	hcpHXwafivUWwdpi3qwRLX6aZcsjmInNltv7TvQ/6wemiaZlBfnYUWcPxMXEotHMgU1mdhbUPVw
	+dHS/zIHh938K1hekNA0DLWg4YQ6R6lf/LaLECmG0eDBbaJSXXtw==
X-Received: by 2002:a05:6122:d0f:b0:567:4e8a:fb13 with SMTP id 71dfb90a1353d-5c1162ab9demr3090227e0c.8.1784106169370;
        Wed, 15 Jul 2026 02:02:49 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf8bc8e082sm10055585e0c.1.2026.07.15.02.02.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:02:49 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so1971160241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 02:02:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RojXlDBcuxyM+6c8tyrdpzOJBW+1NWWumC9k7uyqRWXcLIpTwsD6jkUuFVjWO6wSrhclUgyCDvIGpzA3cuRdWrWTQ==@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:738:fd01:5b60 with SMTP id
 ada2fe7eead31-74587311ce1mr3372984137.3.1784105677124; Wed, 15 Jul 2026
 01:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com> <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
In-Reply-To: <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 10:54:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQWnp3ipR8xLv3PBVax3sDrZeoH6uw6Cjygf7EZT8EgQ@mail.gmail.com>
X-Gm-Features: AUfX_mxDHx3n63ocxRYS-KeudKm3TNmAE-PyMFFvcB9KNeYvoVs9ROnUvj_T4n0
Message-ID: <CAMuHMdVQWnp3ipR8xLv3PBVax3sDrZeoH6uw6Cjygf7EZT8EgQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/9] Add System Controller support for RZ/T2H and
 RZ/N2H SoCs
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, 14 Jul 2026 at 15:27, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > This series adds support for the System Controller (SYSC) blocks foun=
d on
> > > the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical low-=
power
> > > management and access control functions.
> > >
> > > Hardware Architecture & Dependency Challenges:
> > > ----------------------------------------------
> > > The SYSC in these SoCs is a multi-functional block responsible for:
> > >     - Clock & Reset Control
> > >     - Low Power Management
> > >     - Clock Monitor (CLMA)
> > >     - Access Control
> > >
> > > A key architectural detail is that these SYSC blocks are physically l=
ocated
> > > within the CPG/MSSR (Clock Pulse Generator / Module Standby Software =
Reset)
> > > address space. While the CPG/MSSR driver is already implemented and
> > > functional for these SoCs, the integration of SYSC adds a layer of
> > > complexity due to a cyclic dependency:
> > >     - SYSC requires CPG: The system controller needs a clock to opera=
te.
> > >     - CPG requires SYSC: Access control registers within the SYSC con=
tain
> > >       bits necessary to control the PLLs managed by the CPG.
> > >
> > > If implemented as a completely separate top-level system controller n=
ode, we
> > > would face a cyclic dependency between the CPG and SYSC drivers durin=
g the
> > > boot process.
> > >
> > > Proposed Implementation
> > > ----------------------------
> > > To resolve this, the SYSC blocks are represented as child nodes of th=
e
> > > CPG/MSSR controller in the device tree. The SYSC regmap is registered
> > > directly against the CPG device node. This hierarchy correctly models=
 the
> > > hardware address space while allowing the drivers to share resources
> > > without deadlock.
> > >
> > > I am sending this as an RFC specifically to get feedback on the
> > > implementation of the SYSC as child nodes of the CPG to resolve the
> > > dependency cycle.
> >
> > Personally, I am not a big fan of subnodes.  I assume you are using
> > subnodes because you can register only a single regmap per syscon node?
> Yes so that the consumers don't have to specify it by indexing.
>
> > Would it be possible to just extend the existing clock-controller
> > node with two more reg entries, and expose them through a single
> > combined regmap?
> >
> That should be possible. Or would you prefer just to extend the sizes
> and create a single regmap for it?
>
>                cpg: clock-controller@80280000 {
>                         compatible =3D "renesas,r9a09g077-cpg-mssr";
> -                       reg =3D <0 0x80280000 0 0x10000>,
> -                             <0 0x81280000 0 0x10000>;
> +                       reg =3D <0 0x80280000 0 0x20000>,
> +                             <0 0x81280000 0 0x20000>;

Yes, as they are contiguous.
These registers are not accessed unless there's a user specified in
the DTB, right? So there is no issue when booting an old DTB that has
the short reg blocks.

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
