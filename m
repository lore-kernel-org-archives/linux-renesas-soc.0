Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CC2370D54
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 17:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765374; cv=pass; b=rrk3JUm8lHo5ea+EQ8w8KUl5KWSmpy8MRInIFMH4ipbS5B78W65AFHuW3np2kMpGn36p+BK1QjdwgOgEjbfaABQ1AiBH0svohRWVQ8zktO39NVmmtYczivtnpI9zrm7tNjXatZS8ylzGfNsVj8I2XmNIj66sCvpcVa+r2ZCXD44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765374; c=relaxed/simple;
	bh=PIULD2sfSK88keFpIH5V5f8s/UfnOznWi0dgeAPq4gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7rY3eT10gxe8aGpUL1s34Xy7+D4jLUKedQCKJ2WnabPWea0BAFNHTywBe7AXg49WnDhkWOuk2N2tztAulztV76p54Fbi6aVzmvtPz1KX0mscvRGeJPSVRaizJ77wq8oOH2AM+tCnR5a84vgguduhYxgYWcpS44QN+gfiF9roVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E05CsRpE; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E05CsRpE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso4256385e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 10:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787765350; cv=none;
        d=google.com; s=arc-20260327;
        b=bdtGtglbz9MlONaGW8dS06Z+3SczyBoM4DF0YDMD8IAyjeqeSSHMTv5f4ccIX+8T7T
         0DHCRg9gAKu2DKJ/bMkIcEdWot03gZuN1Ri+N7AFDKgV5MoZkzUg6Ir6b02LmaSllS1a
         2QZa+5YgcQ4aY8uoitgcg/EI3v3suCjRAADqfVZ9IZj9wmwLXDqyhg8R7XGEvVx8aiim
         Nw7cgnKM9mtO+/WU2wrQWeIQd22UO2wbih1S/FtLlatJE3jCEknQwvIvI0QUsove6Ngr
         BQ3xcqAYIMQ5GVh3csP295PzP7NdmtyQHs1ab//VgnBzkUJl0bPOuzNcYyN7mAdex50/
         oknw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QXN0egExQUN8IBSJ2IqvNwpvhI9gdkWCNjlrCbNq1Z8=;
        fh=ecvwuuMCexg7iZFKK80wE0tByD16g3WeSWzGtk+MsSM=;
        b=QlfTy6/9X8EQ3NI0TEwNgAfuX1sEVoOSB5n/AZf/egl/SPfPL5quQJmjRVsXpXt6vO
         S8mDGsN/2sTC8MAgpN7G77GHdilZDVXXmirOvvXm07F0KdtTy3onixPkm5B4ADvDrFRn
         sufe+VqYrpMWHcoeV6KlgL8aWBcQZaXRs7xpIcswF3eKNi/ZKiA5h6ZOp2jO/iM6o99j
         ECdf8qgGyc2HW1Vd3627pCJ1S8DgYC2BlIB5CWTHaTOAc1d0N5LwGh23/ey94ic3o/FQ
         OZiyjHGxXqGB2jM2EHZRDBnVFoDLYRPST/HNRAbnbyZcs8NO5mA9GN5xY4huehgblk5V
         /PrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787765350; x=1788370150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QXN0egExQUN8IBSJ2IqvNwpvhI9gdkWCNjlrCbNq1Z8=;
        b=E05CsRpE02vTA5otmhUKSb0EWvky69+A+daxwQjuLewClNxTHdCzxP0AbZkpfPl56U
         Rgmtdi9UZDJrX4i+jALLAePZpRHUtuhBAASzJFpuuXQ8HoFAJH7W4pwFpZp02EeGzqfc
         XmFmpx+PAYWaIx09oXhE5U7beVbTqb4+Csa+sCo+C7LgXo6LByAAitmlSVNSLcvNEamI
         lKe3bzxaM6RxbZdbqJHaFLFIpaBDVZC27QjAGnV3f7HxuFlXPHmpZ2Gvp0VYjFFh9qFH
         UIVWgLyNrYq/ifJDDjDpgcisIN/EpvHipKcW2cwZ4O2JSu6pI+5Gpsl/rIBbmrUqnBJ3
         C3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787765350; x=1788370150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXN0egExQUN8IBSJ2IqvNwpvhI9gdkWCNjlrCbNq1Z8=;
        b=rwpu6reQ6MbSzzRQO2fB382Yg+HgvxVNy4CszmU2ZwKMTfClQFZHGrCrDcz8euXuKc
         ljOiq+Pao0Pz3ayM5r01ceDftHeRXWxH3eSy1tET6odv4TQ/kThA+myhm0n3WPksTsqe
         4+vaXUhR2YYcihoapZmaqT7VTfunO31FTCEcmgmDpnN/P5eI6MM8yxnaqidILvALyClp
         7TiP7vVymaHavBGXwJD8oUrA3uxzrKFiL2qjlfAdq1cdF+uehN2N68ldaKTzLdwxUwwb
         HL1O23Zl9nxL2Ly7XDj92E7dwyDY482UMoJc0ZGAuguXGYn4YmH9hE9ficrPX0XyZ1qW
         PtGg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8ZNTqytNpTgH+j4TPWE+HK33uuQLLU/bA3Mo74Gq5KGoZC0T+dmO5mdaNUnuH991quzZ/lnNASFGFRLEmX7J+lw==@vger.kernel.org
X-Gm-Message-State: AFuF++n5iKLv7dYMdq0QSmpWy27Y2A3qT+AAT+b03GB5GCaSDThdPUhf
	fhKpF94wfTw5ib4RMtEMMUIPMybF1Pc/A4Zp2uLpR2AavsA0Re/63YW3eiF0stipsksYhqeyNrN
	M9s5axNPYJivnWkBF6kuWzAz9tVxgPDg=
X-Gm-Gg: AR+sD11H5slrfwtMcctnD21m8uR90+AaCnGjP267dcadodL61nqGwAUtFepf345w1GE
	0ZeoT15IAeIAYe5pl/H3408TMDpl8a8bRhLwERtLR/3Heeog+Nq3mxw9OuT0YoU9teeLBiRQPSE
	8WERIln+upNhVXSHEQYDoAL6IpxN0IWI99zn2r80hriVzQA3MOw50BRfpTnHOEv/aPdHqdQINpe
	cf64RsfLcDPFP09vNn+AQWLzbynfSWv+IEYaYChMJA1VE9PVCHweJAazlz8v+Hsz/or+j2TRYeq
	5kbE473fOjDmeuracgsU3M4vi/u6Dm4oeHWwEUlymY/Up605h6FCUNqTgvMEydRaRJ3cDvOHQ5R
	RdCU0juVl/ahFqbsMSOCK+Yr2QXwyE7Z2wkrOSZZt5veYVbKGqaoec/WJPWv5N8uC5w==
X-Received: by 2002:a05:600c:1552:b0:490:e5c1:b8bf with SMTP id
 5b1f17b1804b1-499dc822d91mr79612305e9.13.1787765349355; Wed, 26 Aug 2026
 10:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWWxLXA+Y1sK-AFrx6Z0DkZ0xvrZbqCU_wcrfFyaKArAg@mail.gmail.com>
In-Reply-To: <CAMuHMdWWxLXA+Y1sK-AFrx6Z0DkZ0xvrZbqCU_wcrfFyaKArAg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Aug 2026 18:28:43 +0100
X-Gm-Features: AcwNN1XTZI4bYMbcU-2XeKqWyg1OIm4BXC0WXAgrgMa6hG5Leq-MAga-Sg1fRPY
Message-ID: <CA+V-a8vWaxPyhyBF3wHKrTj0WnimyjxmU7HCD+aD_BazZGdOgg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot
 partitions read-only
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hi Geert,

On Wed, Aug 26, 2026 at 2:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 26 Aug 2026 at 13:28, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Mark the BL2 and FIP partitions on XSPI1 as read-only to prevent them
> > from being modified through the MTD partition interface.
> >
> > The corresponding boot partitions on XSPI0 are already marked
> > read-only.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > @@ -825,11 +825,13 @@ partitions {
> >                         partition@0 {
> >                                 label =3D "bl2-1";
> >                                 reg =3D <0x00000000 0x00060000>;
> > +                               read-only;
> >                         };
> >
> >                         partition@60000 {
> >                                 label =3D "fip-1";
> >                                 reg =3D <0x00060000 0x007a0000>;
> > +                               read-only;
> >                         };
> >
> >                         partition@800000 {
>
> Makes sense. However, what is the recommended interface to update
> the bootloader in these partitions?
>
The BSP supports updates via the flashwriter tool; there is no
recommended way as such. Are you hinting to allow this to be done via
Linux?

Cheers,
Prabhakar


> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
