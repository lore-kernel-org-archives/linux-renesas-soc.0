Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580184D7D3F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 10:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061333; cv=pass; b=E8676kXmZarfZJvq3P6+6/FdKC9wyqO6+kHtv3oOkX3U/ssdrGjcSbahffnL/2idIxA4XxYBXpO0OcW23SRe4MvKzRPqv6GRQdn3k3sVVkd0yTv6oeLAqsEYB7/ZuMDZUkYfy+ctQCEq7lJSRdHtJ0UEo+Hm72tvL16b4xnRKlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061333; c=relaxed/simple;
	bh=FmmRZ608D4C2zUwqRQSrC5bNE6F6es2uQjBujj5jDeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YaqKoCLwutp348GWIoA6ZJlgJuuPZAVjPN3lDRwre1oeCzh6B+OZ10mEzsuSx/sAlzkwM5a4fe7cElgIlOXfLZdwRzlInLkMa9qO2OjvEhE672GgC8wAPrfD8qmwN2030GfH+RttTBHFuxuRPkqZjpT7E2IOus2GeIxEqh9+NHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGHY4KRj; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGHY4KRj"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c6955a7c3so1460953f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 03:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792061328; cv=none;
        d=google.com; s=arc-20260327;
        b=gB5O3n8/JeAglKHis6sJEMzrlUtbDA6uH5IB1fkPMd+XxTPoHeo5MsfoflbwUlsBzq
         i3tUNrLlc4iOX7wlJp22F/Hgea5qe54nLzjZ7AMlYeqdlreoV83c51el0htSnIlR1PDZ
         iAZfboctrMKynwHjwf9W1OxkBQRzzpCL0THnipZKO/qsQAH7XO/Tv8t9lF8L3G2aK90Y
         ah9Qc0dx12Yh2ckxAJbQ6CnkEZTKBFGdRfYJlJcHUAtDOMS7PfZGCmd4L7qOVknugp6W
         N+5MrzWxdpU8NMhhsQ1fT4aFHW1YXJpc4BOtyA/70mp1ek3CrvVKAyKbkAelO/N5Ginc
         EIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p8Bpe0WzfKNt750+YudJl1Zs2RvA8+Qnb6B1KoIdGiE=;
        fh=qGyy0US2u9htlGo9kR8TQ6U9njrMUC18AyZ26vgB9u0=;
        b=sJ2pZdqWGQ4XmH4CnOP4+fw/nzGfz0bsYmsqvRAd1Ujwlq+H3kOcVtt3mqYTFrrkv3
         Q4JuK9QtNjG7dcneVZzvUnz6r+DQyU237RBXIoWHjS48PXuJy8XPfVYSuqKnpqEhIjPs
         7qGyovW9O860Q4mI7eFAkTMo6DJecK7Kfy5Zm/6fUy+9mXV1W55oxBLPQncX2RaeHAQd
         bEqeHOXEI2yF6/xwG1euYpPJLKSZPrrufzEn4HyakC6dPByf0jU1f+HLUYW13FZpCqEz
         gc2Fu9Z35MOAhmmgK7t8u4R/5wKyUcj3ji5/oieAwVShRIAmYe2RTr8fM818/DkCUSFM
         FuFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792061328; x=1792666128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p8Bpe0WzfKNt750+YudJl1Zs2RvA8+Qnb6B1KoIdGiE=;
        b=HGHY4KRjFFixMp8LxPY4W3sl6Fm2iSsRXws7p5amThHrS1bIMSDbzUcJsNhVHSSSkc
         vpnNNCGYFQbntsLd1GE47O4adACIyeRq2DalBo3fGycYeghLHa3mtfdd3qsuyz0nFAaW
         2vPK87O6CwFiW3efiCeV6a4apP+vsoIe2IbsQ3D4FTIf4NUUQkZa4kuwJVQddzSUlDJJ
         lCRMqyX1xuV5bJQl5pSFtMD2GbL0inp/SlPPmbq08jAJmjCbMIayUjGZWeDrjGeLiU3q
         uMMyguf1Ewiy3k94edtnPsZrMx+7Th1M635N8HKSf1SJkhMr4Tc3ntl5kNofpTjMnxil
         9UNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061328; x=1792666128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8Bpe0WzfKNt750+YudJl1Zs2RvA8+Qnb6B1KoIdGiE=;
        b=kzK0ASsAE8QKZQ7qWACqBOvv+q82VMtcuf5uANATqdnpuEsHGUSDP+Od16UJ5UBWAx
         dD21r32V0rjDl5tbY3FoCXLJ16Prdk4zWtBWPlG/JoMxWcVZbI1TnOb9l9cDKLKTSqSU
         c6x4gv5OYr/fgdAj+PVt4zwZeh/AMneT5CWSviJVuKyWBWGoOWua/+tmM55amFSa1C2s
         rhbhWexi6zpAAA/GaWYKRoWFmMg2D5hCofwoazrNp2SquWSD6lfEo/8kuc3PoCEib9sF
         Uh44WpB4jVdIg+fydgnsm6Aq/f2NjRqbatvOZn+TcivdlDL3ppEy+yWjSp3pR0CdHumT
         tzuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIsau6lf0YPJoR1FIuG7HMvYvjLMhrrRY+vzlRTnnPsjLxib5z6NPLFP9Nag+1//py9OdxMAwC/OoNIeJHtx/fcA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ7AUjXhVzodIcVvcgTqj76hQoykxblQYjn0NYfw7V7mJY28RQ
	FhENcunmsSJw0PqHolHfn9YhhBaWQOgXKdolY+PN6NX4Y/HOVQBzV+iaR9rG2fyczstwc2KtokR
	v8Nrwm0mX2j6HH6KcaN3Sa8EWPp/n974=
X-Gm-Gg: AYBFou1vRWuZ6L1Gbq6gQ0TO0QzkBP4WVUkSDNmcEpUk22Aw8Q9VGn0YyIy6biI7Sab
	r5P+9CXrYlXlByC4TbaWCasJwU/BpAwm8Vjd6oNLtI4q8bkTUb4V8VF0AzJ4H4NfmqLCytcZ7XL
	IRlt2v9qKjAGHD9M9fs2eh6U/GrCxqZ5CpIBZVFTloVFAE5r0hdI1vm+1I/ZmhmK8rlW/6dSRpz
	hwL6kj3dskTuSahby7XaJ6Ikej7yLoQcqo3JPSkXS/MoI43183oIAM4gCXGurZCH04XRL6KvWuk
	zghZ7jXtmKtKSoWell0RNmrORLY+Nxmw019dAb8cF/9RtE3nkDBXcg/UCTX7uJ+EMuzBbzOi9z3
	XvlGrVu+5MY652b9lMltxOQgWfBLsjzm0t/MOM5GjdcEqU9waW8j5bqZo7ULp/hjW4rzKcJ/fgV
	DqPgpGktOT
X-Received: by 2002:a05:6000:4305:b0:48d:f2a3:3a4 with SMTP id
 ffacd0b85a97d-48df2a3048amr4041591f8f.16.1792061328335; Thu, 15 Oct 2026
 03:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261009165710.1320233-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMRc=Met2DuvMz4fZjSn4as56uaKaN4K3Nt_ub=4BjaLQe5nmw@mail.gmail.com>
In-Reply-To: <CAMRc=Met2DuvMz4fZjSn4as56uaKaN4K3Nt_ub=4BjaLQe5nmw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 Oct 2026 11:48:21 +0100
X-Gm-Features: AclHuK9GL7dcegAHXj9a4i5LIQhbxiG32N7YkVxCBuH5SJV_-Wy1REjdRCS5iRg
Message-ID: <CA+V-a8toBu8SkOft-LHxgR0OEy0pz8sMGMze3GCG5z6n-YuZgQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY
 for RZ/V2H and RZ/V2N
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

Thank you for the review.

On Thu, Oct 15, 2026 at 10:45=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Fri, 9 Oct 2026 18:57:10 +0200, Prabhakar <prabhakar.csengg@gmail.com>=
 said:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/V2H and RZ/V2N SYSC drivers register auxiliary devices for
> > power sequencing, which require the pwrseq-renesas-pwrrdy driver to bin=
d
> > to them.
> >
> > Select POWER_SEQUENCING and POWER_SEQUENCING_RENESAS_PWRRDY from the
> > RZ/V2H and RZ/V2N SYSC configurations so the power sequencer driver is
> > built whenever SYSC support for these SoCs is enabled.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - No change
> > ---
> >  drivers/soc/renesas/Kconfig | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> > index b7abca4559df..32cd0d9c8758 100644
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -517,9 +517,13 @@ config SYS_R9A09G047
> >  config SYS_R9A09G056
> >       bool "Renesas System controller support for R9A09G056 (RZ/V2N)" i=
f COMPILE_TEST
> >       select SYSC_RZ
> > +     select POWER_SEQUENCING
>
> That's implied by the symbol below though?
>
POWER_SEQUENCING_RENESAS_PWRRDY will only be visible when
POWER_SEQUENCING is enabled. If dropped, randconfig might generate the
following warning:

$ make menuconfig

WARNING: unmet direct dependencies detected for POWER_SEQUENCING_RENESAS_PW=
RRDY
  Depends on [n]: POWER_SEQUENCING [=3Dn] && (SYSC_RZ [=3Dy] || COMPILE_TES=
T [=3Dy])
  Selected by [y]:
  - SYS_R9A09G056 [=3Dy] && SOC_RENESAS [=3Dy]

Cheers,
Prabhakar

> Bart
>
> > +     select POWER_SEQUENCING_RENESAS_PWRRDY
> >
> >  config SYS_R9A09G057
> >       bool "Renesas System controller support for R9A09G057 (RZ/V2H)" i=
f COMPILE_TEST
> >       select SYSC_RZ
> > +     select POWER_SEQUENCING
> > +     select POWER_SEQUENCING_RENESAS_PWRRDY
> >
> >  endif # SOC_RENESAS
> > --
> > 2.55.0
> >
> >
