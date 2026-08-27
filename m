Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D652362152
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Aug 2026 07:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816806; cv=none; b=eXqNwCZefSGTsRWzRgOCzFAf2OwtNrELt3piCUlCeQnRsRomCI0FndwFnw2G/MGe/Q+glMcUpqY8jT0WLypDsbxdgYqvojiinxv1tS0NRJRa2esG3Y+g8SdY2TycKJ2t9tGa2k9ZHnjB5eMiO/FM6pWBadQWz9N6n1a1CcADG/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816806; c=relaxed/simple;
	bh=xjGOQAyeG+sLGtpTLpoNkkVbqJYjiP02GBkiprEbtwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOtmTjQyL6NJgLU2kdpNJgROE2E+wF6tvjWhmx29lOU7BstYFyuSAZjzHETWn9xxzSM+aI/W937db/Uw059jxpyK1jbtGw/M68GbCeDx3G+W0HgjaZS5VUCFVn8d6tJHWxrGLjXcYhSZByDnmaRTknywfPU9DFTPVwMg9xLNuJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97ccfeeeb11so127088241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Aug 2026 00:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787816804; x=1788421604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvUM4c5tWmaF+uSmQU/koXzbQA9wo3PXrWuljtwS+9I=;
        b=IBt7k6SXUKT5/X8IhePZDyFQU2XbD4jTfVIN0fw7GG0lqXYNiOLe8wYLzL8RsWNNm3
         HgDiBDQ2NBuIQgx924u03OBNRU9BBtuMUE8RkrnJdHXskMfO+MdXuYt2y1rlU7AyUnAD
         tek1xBQKhCp3Hommb1hVi5UevmgaTr0S+f65pRdt/SRCUA5QLpYD/Kk423xpoVte9ogX
         b46V+n7iaG8XfFqZYWeC0oroAgenWCP9mJ6j7E2mXTjSh4//vns52+t63cDJLDakdzKR
         2+Ed0anK3Obd2vNpTEW0yj5aCFmrRBx4OTzqm4F6bn5gcIreC6z7mezDEurhXN8GDm0k
         mIyA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8qz64jfg3G8WFBgqsS/GX6m8owhVAelANYaN8h1D83PcMvAKRxg8zSdtN7ErnrFDcmIjC0bt4Y7IL6pgWi/txQw==@vger.kernel.org
X-Gm-Message-State: AFuF++lIIYIveoOs/oaFbUW6hQM5RZgIZYfF6RdysHzBEs+S5g7CLcEJ
	w2nfusUhyxSLRpLdqaK8oMGYQzqy4cHIoa0u7Z+MxqK0mm0r85rfU6Nk6gCi3Ln/
X-Gm-Gg: AR+sD10s2gxrFb8W0l5DH3LUq6gDTu8wRLGQfaw1rF16ZSzTGW/+zKQYxFJvqvhw8W5
	i3HieG60F5RS/gHv0AooR9HkwLeCYAdtCxQ5HmsGOW8Yn150sYJZ+c0Lq2dHz/X1bPbghryTdB6
	oXckhswtYD8PPv0Hlu1SOIDAI7oY7wRzRggcC1W06b4Vn19sN1SHQAc06cLm+8gqOukt1C434rg
	AV3q9c/xlTpvhSmpxlbaKBERcGY0p/yCLTol3a03UDMypdjy9+Zderb40DrE/gy+ZOlN/OYUOeV
	e0fCxagZTCz4S2MwQIjvk4wKlbeIAKbQEQqoM/m3DRUjkLK+JOgNJ8+LmQ6CwDDK4Bjyi+LMfAc
	BjVq7+dUYM7qDv+rhRY5NhtZqajDM/YX2l7ht9OV51YkHmloHkHcrtR0tJZjHw6nFsVaoDjdHMa
	OjOdv7FZdnZ61g+ij+i/QfCoWtiYMmw4gOfWmwF3d++uiinFKBmzaiPAw5b5RKJqOTo2HMoXwES
	SXFx7FJfdjzuhNW1TvXmtFc5A==
X-Received: by 2002:a05:6102:36cb:b0:783:79ac:9dc3 with SMTP id ada2fe7eead31-78379bbf916mr2284647137.10.1787816803841;
        Thu, 27 Aug 2026 00:46:43 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cbde09650sm4237661241.0.2026.08.27.00.46.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 00:46:42 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97cbbdfc2e0so373794241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Aug 2026 00:46:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqtbDi+ps1uDy4by8pOcVgfKC9UoqHYgUcQhDjggAoYaTSDog7cnDw3F1VKEsAn6zvXzhBgkzSmrcToxUYx3lUfmA==@vger.kernel.org
X-Received: by 2002:a05:6102:e0f:b0:77a:3431:669f with SMTP id
 ada2fe7eead31-782c09fedc3mr3945222137.7.1787816802245; Thu, 27 Aug 2026
 00:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWWxLXA+Y1sK-AFrx6Z0DkZ0xvrZbqCU_wcrfFyaKArAg@mail.gmail.com> <CA+V-a8vWaxPyhyBF3wHKrTj0WnimyjxmU7HCD+aD_BazZGdOgg@mail.gmail.com>
In-Reply-To: <CA+V-a8vWaxPyhyBF3wHKrTj0WnimyjxmU7HCD+aD_BazZGdOgg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Aug 2026 09:46:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfeXq7yNH4n-cMyefHfj_x3u-GbQfzv55h1EX9SfTR_Q@mail.gmail.com>
X-Gm-Features: AcwNN1WD2c4xDDI2BYSA5G3mLqbJIjczt7SqcefQ9gZ9AETqqwoYkM7EIcUyqns
Message-ID: <CAMuHMdXfeXq7yNH4n-cMyefHfj_x3u-GbQfzv55h1EX9SfTR_Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot
 partitions read-only
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, 26 Aug 2026 at 19:29, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Wed, Aug 26, 2026 at 2:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Wed, 26 Aug 2026 at 13:28, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Mark the BL2 and FIP partitions on XSPI1 as read-only to prevent them
> > > from being modified through the MTD partition interface.
> > >
> > > The corresponding boot partitions on XSPI0 are already marked
> > > read-only.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > > @@ -825,11 +825,13 @@ partitions {
> > >                         partition@0 {
> > >                                 label =3D "bl2-1";
> > >                                 reg =3D <0x00000000 0x00060000>;
> > > +                               read-only;
> > >                         };
> > >
> > >                         partition@60000 {
> > >                                 label =3D "fip-1";
> > >                                 reg =3D <0x00060000 0x007a0000>;
> > > +                               read-only;
> > >                         };
> > >
> > >                         partition@800000 {
> >
> > Makes sense. However, what is the recommended interface to update
> > the bootloader in these partitions?
> >
> The BSP supports updates via the flashwriter tool; there is no
> recommended way as such. Are you hinting to allow this to be done via
> Linux?

Exactly. But as you recommend flashwriter, and the two XSPI instances
should be consistent, I'll just take the patch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

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
