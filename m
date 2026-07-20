Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684DD3F825C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 11:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546059; cv=pass; b=MPSQuVkadmPJYYfY3FAjfnJo+utxNqcLdVrAz71qpFj3mofx5Aw0LRbrGob6znrDTPwzbIiVBnEwyslzxjZ/jUoR58kPjECQDym0HRTuOOtCit7V9nemNPIxKLCzwMbXQy5Czupxt4ucphZ60r03TTurj8rOnMu5fmKo38Q9plY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546059; c=relaxed/simple;
	bh=lN5CgOEVOZ+tQXbZyCc0JqrYccxDAnhxj3hOkyWwzFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2gSC06SN6yTZ6oG0YHUMBwssI7x2AnNxYroF6PeF6W2mDffk/WQlZgfRDLoUGNgKdg7KP6DhdckuAOxMBScYCzZz9xUFaAbnCW2xxi8+AIRFJphvE+SkVzQ8Gm4+0U2giX7WxJcQ73/NzZ8lCk/XxxH9b/K3h98L2C2edyBX7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/SxvIXK; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/SxvIXK"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so4661691f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 04:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784546055; cv=none;
        d=google.com; s=arc-20260327;
        b=AfK+urLK3nzRjbc8eV1tjUR2cX6MywMBJwC5lNfe7QGK58RW0bExwahO1YDiqvfnPl
         tgaqWtphi7u53i/nUysN8ZvVk/X/XmduTtnBWVwFDKbOuCs8jjEVkpA+UDusG6bI0cos
         hijV20OcH5HPyNCrONLU3guaCi8J1sXftLeNdNZU0yq4sCr2WWVljbisXzplywHp97pQ
         vtU6PxUhkAl+yFc1UfA7ewdi1QrWtBiboYFtsVCYYHvDs4u1JJl1YxV07detmDaf1866
         xL2Mp6CHMeBpVJuME7uOEqfx70K+MnK3sV5wu0x0/+xLHEGBkCgUP8lbava0w1CvGI1x
         PGPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lN5CgOEVOZ+tQXbZyCc0JqrYccxDAnhxj3hOkyWwzFk=;
        fh=Yu0mNHts5S5djFPkDL1ITtNudQ8LAfLAiXXnUbCVzfc=;
        b=lPzPLXjNt2RaXxq14qxEAJIPKpw+QtY1vE0kBXkNhTzUwBN34aDnEsJKKgzSS6fO+o
         +8RuVENBUHc3jtz61nLJKMkgS2Ooh5ORyUniCbVSDCK63R6S/YUMOt4DiG9RFaLPU6NU
         EtZoJwXaqv/7vez16+AeApRqrnP86Bbgkj1bRUVzJZGwc7zaJGpvlxwcIDXAVc+Oea/6
         PzALckWFwdZ29t4kM5TB6PTty17GJcRj0JRBnH6FREp/+dU6bw7wQQ/41FtzvtlnWcQi
         txM9tjFUvXst4VTeuqjMvRx9wKEYKSt61l3W4UEuBvWK1mVaOVfCAGtRVz44iNe61XCI
         4HqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784546055; x=1785150855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lN5CgOEVOZ+tQXbZyCc0JqrYccxDAnhxj3hOkyWwzFk=;
        b=E/SxvIXKg5c8UoFAOev4ivn2y5aMFjX1UTvNBHABgd/ZATRyBfslWYKaqIbhPmvov4
         4NGbLWHAWVVDhxW26j9hE5bSVUdmE7YT1Ax8DQBvKTY58PYXmhwSgaWuxt1SnVbv0/Lz
         TPDHz0r94JdcnEBOh9qmJO++3n5X3uX6q8PTSO1ZAvt7Ib/cqmuDRfAbLeFEIbKbeqbi
         aRDFykKylQNtbOAbCOkjI2CJRu+p5slbh1xjRcdufryZ5vVZb05yW+kr4L866K93jrtz
         Mg/3RamfvagCadlRlXlNzcnffgz+n21/5N44YJMutj8dBZ2segJFX/M34e6sW+BeoZ3e
         qF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546055; x=1785150855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lN5CgOEVOZ+tQXbZyCc0JqrYccxDAnhxj3hOkyWwzFk=;
        b=SZFBBo1LsUmWTvdf50qSE2UnsYzFmFKdlILtZ3JwUsZw5kghVgx7U5LPZlgy0Ivsma
         XAN/AzUi/IRBJXlNODKPBr7q1HGXWgv3taw8qmK4HV+NGsP/btV1N87U6AWvgI+Aj3Jp
         k3RxqBSZw2Jxm/5NMvJad8CdGcHd9TsJubhxqPYeyZfXqv/9TbUkOysXNuWeX7vCvIzC
         MqzLEeIzzMlu+b3Qh0yJaHveNws7PmESkufVKITDsfKZHaE/t3VSFRqAngySiUn0Tfvm
         az6IFR1cANoDR0o9MOCqWl+GMpL7bZhAg2CKu5Kj2qqfuobVUckRw9+qVtDrwG0kJ85O
         zJxA==
X-Forwarded-Encrypted: i=1; AHgh+Ro53i/BL7Yk0tZBHYVmzGleagsDfz7P34+ucWXWeBI0UWaV0v/YbxCB9B9fHrG85mDTcOSTWNu+cJD4CoAiHE7rXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa8b42oRxVTTIqtQ+70p0ShlvIBfeInnO9mUXkp+815spAzGy3
	wbQ0rR9LhffS7ZWdaOg6JKXpzPxdYOov+UZNhxGMiaXBsyBxc5XLVdkmIZkiiz4q+RvNBgxPm15
	jjDuKKhshRCGN1TryrmsNjvl9wmA7TY0=
X-Gm-Gg: AR+sD13FwbJN2lzMPHoypVJhj2Cv3SKc9sIKHjdjEJAIbeaRzS3UsHgWkeoLI8PihnH
	h1b+yjCyjyJH0V6hiRrKb88XT/ScGmHmcwKVfSLYXlWjRxf1EXVBNINkWuVCVFuApCIjLvZZ1vb
	Rx/tqesjV/uNtwpoXUWycz0KTAfOHjx0EBO4DDTSUayGK8hGzTthf1sp8bcTWEJmy9YODssErB1
	1FKhSmj2YV6tsMZPwdfSR24AB0aQLuvTgUw73YNanAazn2sITxXOopMoHCSQk9PYJ3xjGPa8tPv
	hl1wHC72rTB3AZqh1cNcyN/GsJo9Hnn7RaVWl+rNYnFyliM=
X-Received: by 2002:a05:6000:4912:b0:473:1ccc:15c9 with SMTP id
 ffacd0b85a97d-47f6232249fmr14608346f8f.40.1784546055157; Mon, 20 Jul 2026
 04:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260716123434.2576253-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260720-fractal-prodigious-spoonbill-86f534@quoll> <CA+V-a8tfCL58j2TvoO1VhhDAZf=8LB89R4O0SycLghYGf7Rr4w@mail.gmail.com>
 <2323f9bd-0b1e-41be-8c8d-6906b66b625f@kernel.org>
In-Reply-To: <2323f9bd-0b1e-41be-8c8d-6906b66b625f@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 20 Jul 2026 12:13:48 +0100
X-Gm-Features: AUfX_my8cjMqflKYyG4hZniXQBlddlP-o7E0L6c407-AbtgLj1LdUoaSU0sykN0
Message-ID: <CA+V-a8sHbc9WSqmzrONjWbLY1+SSEhK3kGOjL9zmVmhSttD31g@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: renesas: Split out RZ/T2H CPG binding
To: Krzysztof Kozlowski <krzk@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, Jul 20, 2026 at 11:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 20/07/2026 12:50, Lad, Prabhakar wrote:
> > Hi Krzysztof,
> >
> > On Mon, Jul 20, 2026 at 6:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Thu, Jul 16, 2026 at 01:34:27PM +0100, Prabhakar wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Move the RZ/T2H and RZ/N2H clock controller bindings from the generic
> >>> renesas,cpg-mssr.yaml schema into a dedicated binding.
> >>>
> >>> Unlike the traditional Renesas CPG/MSSR block, the RZ/T2H and RZ/N2H
> >>> system controller integrates additional functionality beyond clock an=
d
> >>> module-stop control, including reset control, clock monitor support,
> >>> write-protection registers and other system management features.
> >>
> >> Nothing of above differences got reflected in the code, so I do not
> >> understand this reasoning. Binding is exactly the same as the old one.
> >>
> > A syscon regmap is implemented [0] as part of the RZ/T2H CPG driver.
> > Since the RZ/T2H clock driver uses this syscon wrapper, a function
> > pointer is implemented to handle the RZ/T2H-specific configuration.
> >
> > Also, as the initial implementation used separate device tree nodes,
> > Geert suggested splitting this binding schema off into a dedicated
> > file [1].
> >
>
> I still miss the difference. Can you point me (can be short diff) to
> actual difference in this binding?
>
Fair enough! You're right that the schema text itself doesn't differ.
I'll drop this patch in v4 and leave the bindings in
renesas,cpg-mssr.yaml (unless Geert has a different opinion).

Cheers,
Prabhakar
