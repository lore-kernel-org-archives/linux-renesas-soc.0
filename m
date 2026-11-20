Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181014;
	b=QOWFnXtRQGMn0zj9MtuCjmuXmF+b3ke/qZb/xB0trYxVn5PP97gjDTxyXmO/zzjrJQgk
	 QiTzSI5rKQc7IPipJ+yiBGBKhz1/BU+hLpTLJLjudQh+CiS3UTFMFRqDnZFWAiXES/1bG
	 kJXtiKkRCuf/ztUJVNoEhPGMab3hBw0Hs0X54nl61Tc5D2Ip7TjvJZb7EcnOAGJjJhtuq
	 MyNFrYroUBiuTzdwCtEJDwPsxSY+xfcrl0U0sGRI3T9tDkgjt0+uol97bSMZCTiw6+F/C
	 y60w0yskAL4U39ZJQeSgHNa2rccceSQwYCRKRtwN9K8lLqc5mYgxSrNDe8TjZDJTYnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181014;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=THZx2uVqsnNjN7chBboOD7x6p/ktvYcyg9pppHAmV9s=;
	b=z4mwx3F/NhcDk2tvKtNv5QyGG6ec7TX714gTWiYHvJzBKx+00bh3OcKkI1YsLeqbeeke
	 /yuV2tuE4/UzQU4FptrTVx8Xl2Gtk8uADqJJkjWml6i+CVTIvj56rVjTcyRNGUShqEIbp
	 PFZ76z24Abldzhx4FfDCEsgNXfr/RceQpl3PdX90SwzrsNguCLQ+HF2A1jqB2wFu7cipo
	 OlZH4i6nFxeUElpkD3G002nLL/s2DfSk0CP5eq52XtPhdGx0u9v795rF/5gXYMZXOz8kM
	 DGPdBC+mFZilcf3y9N5+SbXstm39PyagPVY2J94GIZ284etVL4deePctAAvuVL9Ec7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567C2606A331
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 13:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 567C2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ee3a3d281fso531173e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 05:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181013; x=1795785813;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=THZx2uVqsnNjN7chBboOD7x6p/ktvYcyg9pppHAmV9s=;
        b=jgz1D6WQ+Vrj8vIhSfk8OkJv17Hcgd6akad68Bkuzxwp+Wy3DNjzzPA5q7lP9dvQWb
         pj/nmeCHwBw/Gz22s1wVWCaYgMHchljFI8/sIWnLIJMTzJMJmTXkhHx0s6Rfn8MxM8lK
         bXVRv6sXCdk/g6CD33HmFbcF3+rrq/bjK5VU8yGsCUQhGdFgy8K+SIBjQibX/zbTyUjJ
         fIUnE0e3BGqb4piHxIkpINEXY4z1pChDA53lopuu3ODioq9kNtVNbx4zcHohzsH8IxeD
         j6fjnkX4S3PkR1axcWCoB9zP1FbSzCaP6uwHQlk3INOgsvwUIDU2exXBK8QPlVtkLtLe
         1ZPQ==
X-Forwarded-Encrypted: i=1; AL+hErHqb3RxtoG1DgkzWOi3gFtJAOxhb3JePuS6opIisFQJka3X/6/QBjnAuvXky/jK/zBAlOmiD5KkkYc/X8E8NQzxrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+kuNbpkIiZ6qwpwSWjxtuSJlpFRY1YH72yy0hkiPyhIsTQyEmS
	KSSxtvH8ZXWdPugYroJd0goNF2//FK5pk5s6QIA2PFlyIvhrmAHnbBlgkXl9nboG
X-Gm-Gg: AZFdTZdH9vEFAe41fiao697OVREMXjsAalAhh+4LJzjUS7ZfTT8vOSzBHlMVGgFfZ1J
	xGt7e4klCdBtifx4UuWCA3qgN6Izneoir00jbepB4kcDVWU9WFILOvsp9jJxNru+E+jY48HNgEY
	72xJEQd4tmCy2ZO75hEiyu9hVRzh+nuuiiLnJKYKxcC6KYzyW/AG8Xd3xKK6Q8zMn7Q0No9MFpV
	mgpxj4YUoEFOQDf0piXvM8TTGUbjJt97ijXrPuhgplCNXaDjCpjqonjIZn+MQM6fA3Y2eKLt1Cj
	HrraTEzh8xt7E5K1v9hTXv+PKj5NZpDxxDJduGXeSnNpXwP4J5f5IvMXbRwCsqqjy8oDQkOD1lq
	sZTQgP4Y+r8cjFZEDg8JXud5qQYeUsgKmzRMyOa6ku8fzXufnx0le0qeJl5MWX3l7qf0O8gMjkx
	xSfqGteLIyyOEHRet7/+XvXoArNTZgpRGfBLkWLfqYOVOzBsQ03mUcFF41xzI2OIgs9mvPF2i0u
	ip7UCNhNUvVnF/G1CoIuClhJFByGTD0lEsB/g1V9oZczmVtRmARKXDZmpqHKAPoAEzoz/nHxy7Y
	3mzpWsiuOSoQ8aAYJlZADsMFbN5HrSYwpfKzYoA/oqs3EZCdW2FbHTKxrWdTNgFLIBM=
X-Received: by 2002:a05:6122:3107:b0:5ea:ddfd:3e99 with SMTP id 71dfb90a1353d-5ee8af03e30mr1556315e0c.10.1795181013331;
        Fri, 20 Nov 2026 05:23:33 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b555147sm2435372e0c.6.2026.11.20.05.23.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:23:32 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-99e1408dc59so421969241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 05:23:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHcWzRpHyZKB6FU4K/eUu5IODxK+tsYVSWyjE5TahygrVfYNkKmGidP5a+dnqbHDT8yBvGlgb7nR/Y0Hs/sbzrCNw==@vger.kernel.org
X-Received: by 2002:a05:6102:6489:20b0:7cc:9a7:7b83 with SMTP id
 ada2fe7eead31-7d7393ff595mr1025562137.15.1795181012215; Fri, 20 Nov 2026
 05:23:32 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com> <CAMuHMdVepu0jANzDL552TKrFueydG3AHtd4v9MMXBsw6AK83kQ@mail.gmail.com>
 <TYYPR01MB660300EF63BBCDA82272C45C86782@TYYPR01MB6603.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB660300EF63BBCDA82272C45C86782@TYYPR01MB6603.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 14:23:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+Ny-0ehq=hCK--OM+5gzpf8+gNnbtHVr_Kxc9c5kYWQ@mail.gmail.com>
X-Gm-Features: Aa3M54qdna0I3eJOyWfJ3w7gw8KDkW8vBh5kvgBGjyn7BKPR4dhZV7bkK-pEADw
Message-ID: <CAMuHMdX+Ny-0ehq=hCK--OM+5gzpf8+gNnbtHVr_Kxc9c5kYWQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 20 Nov 2026 at 14:22, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 12 Nov 2026 at 19:48, Biju Das <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Enable SDHI2 on the RZ/G3L SMARC EVK platform using the internal
> > > voltage regulator for voltage switching. SDHI2 signals are muxed with
> > > I2S0; the selection is controlled by the SW_SD2_EN macro in the board
> > > DTS, which must match the position of switch SYS.4 on the SoM. By
> > > default, I2S0 is enabled.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > > --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > > @@ -42,6 +42,7 @@ aliases {
> > >                 ethernet1 = &eth1;
> > >                 i2c0 = &i2c0;
> > >                 mmc0 = &sdhi0;
> > > +               mmc2 = &sdhi2;
> > >         };
> > >
> > >         memory@48000000 {
> > > @@ -355,6 +356,74 @@ sd0-data {
> > >                         power-source = <1800>;
> > >                 };
> > >         };
> > > +
> > > +       sdhi2_pins: sd2 {
> >
> > > +               sd2-pwen {
> > > +                       pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
> > > +               };
> > > +       };
> >
> > Just wondering: why do you use the internal voltage regulator for SD2  and GPIO hogs for SD0 and SD1?
>
> Just to give an example for the customer usage. Either use GPIO or internal regulator
> both are supported in driver.

OK. Please clarify in a comment.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
