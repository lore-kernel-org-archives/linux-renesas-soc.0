Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180938;
	b=JLYXLe8sqPg992hkA1oQLamA3W1V0YQEez4szmp+lRn2Ugz00hP0WWdZ4z+EFQ/p2wpN
	 X+ym7FIOcOEpA7kNU/I2+PHQhB07Nm4SIfx/hLmD2xSdv6dC/OEET4NYZGuq7zdGYOloj
	 zrkvhfYf0A6CwT/fu5xrhWyzfs1WL9j83+a77747z0hvtBIAMIFWnqxZ0niOgFa7QVrK6
	 GgpbPdelr2TI48knYlNjrSC558Iaog6Ic+kh/CmkqvuMYXov9I24mWiutYCeHXB1a3kWq
	 yzYsm/y7DA3kKgh8vGkCjrjykRWuY8PMZ57OaP6qmyhaAVhU3DC0WNo3ufaSxOgO/EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180938;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=NWnIiKbpB4h5H6+7A2EeLgsdTZHto9WMJYZBt0yNauk=;
	b=Hdq0B0BdScDj4S62wU/8EodqcZ5ZFjcE2aRjXgdIShCvbhElw/c1EZa4Sq41sL3VNq+l
	 aYemLUqShLatZcyxPVgROoylBbKtzlXpyYyfMY9aKyPZI3BpiBFao+/1KjKCgFArzRGhH
	 jJdh73v/VEP8ZxHSwfxDrMk4nDPD8/P0UdSnhd0ZZhF7g7bbXE++Pb0QNjEwkQhZ9fv+d
	 UJck/RDy6aMaESJDfNqaJEhSDo2u5l0Or/u8ll0rjMk1nG0A9tnfBlfgnZx7eiFhumxwx
	 6z3nDM9FcSYigvsHAkWgdw93VcJU2zW/9UQoOMQvuhaMAGyIO/AdEIfxthn9kBIX+wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF58606A320
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 13:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF58606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7d2d95c5d81so595299137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 05:22:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180937; x=1795785737;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NWnIiKbpB4h5H6+7A2EeLgsdTZHto9WMJYZBt0yNauk=;
        b=ZiR09iVSYP1+7+B0APcR+k2Ia/ITaz9Z+mDQk2TjCviwnbT3fFs0qkKrop1WzL6gHj
         H+W6dWrsWtOv7RIKn1Oz5NLQEV90KbXXANyxQqYmmpzPzBys8gMaXBsTqQK41Ei5pNuq
         7UIbZ4YPSvnk0VfCWJkzROilvLj4S5ykqV8KkFmHtgqndaawYT7rxjiCBXQMxfazeqES
         wia5J3UGmpwgHEAeE6FXCo+4Mi8z55gCD4JZRQB0SeEgLKf3BpEHl61hbJPTDvcRWsMI
         KvuaXNUYmrOXHL+Tq3eSuZiH/qZD+P0MlIGZ04f3Nr0m3DrWqYf/TImskVHADl7XQuLY
         PMhw==
X-Forwarded-Encrypted: i=1; AL+hErHKUrQClpxB8MLx/qqg7TegwcxA40kce/amv3VN5azhuk8d0QZ8dxRIlltWcS51XTnx0Mb/jtrSf46JhRnyeQDlrQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z852jARE+TJ8VllAYYMAiyhJJ4AXMsUuhqF2AqUQjyimRXA8hXb
	QlUnF69D2S8kilsCt2AGbx1qiAakhsqmUMGvwK/95JPw6zov92Ga8zCFDP7wV/ea
X-Gm-Gg: AZFdTZdtac1VDZqYwYodvNlGfG8HDNwLXaPVRBznRpoHq7XTjBAzis9ElqaP3jfAJiH
	HfZCY0zWG5pJevEaJ0hYQNXSRLyz2qeeXbIEz1TTGLPSxoRGDa7XP84ryKTxCH90UqchE1JyEFK
	8CBIURS89BR/wIu9IYZcnnWJ2jWZJNfCHt7LDAh9Bx5PVf8YKzHkkUqbOM6XqSmSdlg75llpF9I
	0GEzDDRmzAZrGZNSN4aHgGTe32rcOa2dZY5WG0ozVD4Amou5a64P3tO3gh1I2yS+aTAl0fBugi6
	keVQYtUFY3vyry9qHIDdx42nFZ+NTvkcn7Ndo9By9leDcGmi0A2wvkQ99iENzZtiXe4XGfxeJzG
	Ae4r+dIJtbfd+X6W/LiznPjM3joaCAHH7gp3tBQvbaZAP8Mgk0Ujv9OQ0F7Gbey8OFB0L3GaJGu
	weKv32EpmSPxT8ctDz/dpqi5e+O/RDzNw9DZHuS0mlfLngNflu2sbjl9IV/e24GEOQZw0Kt4UVz
	YR0/L/2IaU29FS3bMepT0/OPT1aHStnVfv4M6B0wbksQ6QyR/scwNkqANc9ylA2g0XcYfjZJ6Dh
	Xh/w8qvupCUsRsQ9nwZ7dADWQMwCQOSuydX3hxKCr2G+9SI+RWBSeToY/Tdbb9+MmFeD529B9EO
	s12/xvUDLrlPW
X-Received: by 2002:a05:6102:688a:b0:7d2:9ed1:3773 with SMTP id ada2fe7eead31-7d6db9fd115mr1550622137.27.1795180936847;
        Fri, 20 Nov 2026 05:22:16 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a280sm3047457241.3.2026.11.20.05.22.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:22:16 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so1723743241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 05:22:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHAlrDjAeZwGbqa4/WXoe4YFz1HW6D0sXenP0+XUFfBszA7bK5Hi+RrdvZLFMh6vALK+2U17JlBQb6oPk/i7i+vwQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5126:b0:7c2:b741:2391 with SMTP id
 ada2fe7eead31-7d6dba096cbmr1501978137.30.1795180936383; Fri, 20 Nov 2026
 05:22:16 -0800 (PST)
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
 <20261112-sdhi_rzg3l-v1-1-ca30b209615d@bp.renesas.com> <CAMuHMdWk_0VT_UgaYoCW8c9zac2g88bL6niZF6aDu+UbWroFjw@mail.gmail.com>
 <TYYPR01MB6603B59F47E78CC7DDBF50B986782@TYYPR01MB6603.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB6603B59F47E78CC7DDBF50B986782@TYYPR01MB6603.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 14:22:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX670UgRM=tH1iVeCZhqtBvXQA8=Zp1BLHMSqkrf1Emuw@mail.gmail.com>
X-Gm-Features: Aa3M54rJ8nO7mFKGfpphYUxz52FFSlbHBA0u3_e6u9X18v9-00fZ-jlsVzihWbE
Message-ID: <CAMuHMdX670UgRM=tH1iVeCZhqtBvXQA8=Zp1BLHMSqkrf1Emuw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 20 Nov 2026 at 14:14, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 12 Nov 2026 at 19:48, Biju Das <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Add device tree nodes for the three SDHI controllers (SDHI{0,1,2}) on
> > > the RZ/G3L SoC (r9a08g046) and enable SDHI1 on the RZ/G3L SMARC EVK
> > > platform with pincontrol and GPIO-based voltage switching regulator
> > > support.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > > @@ -1062,9 +1062,80 @@ dmac: dma-controller@11820000 {
> > >                         dma-channels = <16>;
> > >                 };
> > >
> > > +               sdhi0: mmc@11c00000 {
> > > +                       compatible = "renesas,sdhi-r9a08g046";
> > > +                       reg = <0x0 0x11c00000 0 0x10000>;
> > > +                       interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                    <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI0_CLK_HS>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK2>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI0_IACLKM>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI0_IACLKS>;
> > > +                       clock-names = "core", "clkh", "cd", "aclkm", "aclks";
> > > +                       max-frequency = <150000000>;
> >
> > Given the bus clock can only run at 200, 100, 50, or 6.25 MHz,
> > 150 Mhz looks strange to me.
>
> Ref: RZG3L_clock_list_r1.10_ad.xlsx
> 400 MHz IMCL{K,K2} clock is prohibited for this SoC.
> 800 MHz HS clock is prohibited for this SoC.
>
> IMCLK = SD / 2
> HS = SD
>
> IMCLK clock sources
> 400 MHz:- Prohibited
> 300.000
> 250.000
> 133.333
>
>
> The next available max frequency = 300 / 2 = 150 MHz that goes to
> SD interface.
>
> >
> > > +                       resets = <&cpg R9A08G046_SDHI0_IXRST>,
> > > +                                <&cpg R9A08G046_SDHI0_IXRSTAXIM>,
> > > +                                <&cpg R9A08G046_SDHI0_IXRSTAXIS>;
> > > +                       reset-names = "rst", "axim", "axis";
> > > +                       power-domains = <&cpg>;
> > > +                       status = "disabled";
> > > +               };
> > > +
> > >                 sdhi1: mmc@11c10000 {
> > > +                       compatible = "renesas,sdhi-r9a08g046";
> > >                         reg = <0x0 0x11c10000 0 0x10000>;
> > > -                       /* placeholder */
> > > +                       interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                    <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI1_CLK_HS>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK2>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI1_IACLKM>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI1_IACLKS>;
> > > +                       clock-names = "core", "clkh", "cd", "aclkm", "aclks";
> > > +                       max-frequency = <150000000>;
> >
> > Likewise. This instance does not support HS400, but HS200 and HS400 use the same bus clock speed,
> > right?
>
> Yes that is correct, HS200 and HS400 use the same bus clock speed
>
> for HS200 it is 1:1 option, so 300MHz and with internal divider(2) = 150 MHz
>
> For HS400, Divider from SDctrl register=0, so 300MHz with SD_CTRL divider 2 =150 MHz.
>
> >
> > > +                       resets = <&cpg R9A08G046_SDHI1_IXRST>,
> > > +                                <&cpg R9A08G046_SDHI1_IXRSTAXIM>,
> > > +                                <&cpg R9A08G046_SDHI1_IXRSTAXIS>;
> > > +                       reset-names = "rst", "axim", "axis";
> > > +                       power-domains = <&cpg>;
> > > +                       status = "disabled";
> > > +
> > > +                       sdhi1_vqmmc: vqmmc-regulator {
> > > +                               regulator-name = "SDHI1-VQMMC";
> > > +                               regulator-min-microvolt = <1800000>;
> > > +                               regulator-max-microvolt = <3300000>;
> > > +                               regulator-ramp-delay = <1200>;
> > > +                               status = "disabled";
> > > +                       };
> > > +               };
> > > +
> > > +               sdhi2: mmc@11c20000 {
> > > +                       compatible = "renesas,sdhi-r9a08g046";
> > > +                       reg = <0x0 0x11c20000 0 0x10000>;
> > > +                       interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                    <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI2_CLK_HS>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK2>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI2_IACLKM>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI2_IACLKS>;
> > > +                       clock-names = "core", "clkh", "cd", "aclkm", "aclks";
> > > +                       max-frequency = <150000000>;
> >
> > This instance maxes out at SDR104, so max-frequency should be lower?
>
> SDR104 max frequency theoretical 208MHz.
>
> In our SoC, 200 MHz is prohibited, so the next maximum available is 150MHz.

OK.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
