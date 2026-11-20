Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179155;
	b=4qEoFWzufpljUtF89hpN/j080ug9fWf4X57+VmsQqwiTa3NyS3YpLuZ3yCJ4bwp3XXv2
	 I1uGP38QRzI1oST3mwItVOcgGkFGHkYyFpLaE8FOntC6HCz1oPH+mCq2M8tTek8uTFZf7
	 AJQk2Dnof+/7w/Vc86mT3eC5CfAnxcdgla42pClh0nA2i9ENoPHxWPlnCQC2waqJY6zen
	 K29e4x/2lZYMSe427t1jjxQIXvi7ELankgVZ4ytA7U8mK4CBUIMK1kOASFcDSk3bx/aSz
	 yBJ8d7M1XJCeN9eJPkdjxfSNiTAWtFM2p++qmDKYPqRnAmPZZF8hksadePCEqVaexyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179155;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=9SjRna3ikFVF0kjvJgTvEWSAoXwpZaelLjTatjkSd8k=;
	b=4Xc+j4OacoTzI9v9eEoI5ubrVfdpfk/FlBGREbnaP5l47+IkapIIRPQX6QBympvhvq1U
	 VdinCpfMNGa6Dp21Sq4LdESpsOE9T4TNjSLee6Iux3C8rvuo0sFEAZ9o3CgDEHdgxiEtb
	 SNJoI727AoZSEpb1JrWpsrNLOH/vY+3+9948thYtcHWXRC3LfqX1pV3MMATb0KYMWB73v
	 Oh4tf69rpwNRTfvIwiVfxNWe1vQBW84YaK662OOROu7XjGw7VCPYp4ZlGnhX2RdlxOJJi
	 GJfy8a3tKdEiVBpxjzCvNy8kB8C9jrPHtyZ+QTST/cDEkAoYD5k84MYDRY4AswRBPCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A233606A320
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 12:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A233606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eadef147ffso641132e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 04:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179153; x=1795783953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9SjRna3ikFVF0kjvJgTvEWSAoXwpZaelLjTatjkSd8k=;
        b=ZRFgyIGhECtUWS7m8bNncm78EpgMA06dzTePupv+h1ji7s2YyU7SjcmgEm0Lype95Q
         InDnY57+zd8i3iUg8TCMt3klJJa8JFMafEOcAy0XNy9OkdXglVA/t+iX0M7kLzefYbPz
         d9k5teUDUC3YGeI6wKSI+6QMcZLJHcF24Jwqyartaur9ZG2RcolbpAK/9ydySmzV011I
         2EHWezHop+3Sdy0Muux4YhMLr0OqJSPdfbLj9l8FIJm/Yy7d0ATXNtvtsHfbpxaZLHI6
         2NZu3DMbvzTs1iz6tYg3Vr+hDwEeT1GKkBY2C6hyBJo+lvlRKwSG2zXDEMXLcZGcGjeO
         +sDA==
X-Forwarded-Encrypted: i=1; AL+hErGZ/alnGJKeMcRemSThLoQfJ8saOnCC+yPX8C46flWAke5SfqJK/ZII9EfrapneMzx6n1wR5mSiknl0UTEdyMSB3g==@vger.kernel.org
X-Gm-Message-State: APuU4Z89/pLGOh0YbMGGDF+rPconcNGx1a59ixDygcdHWUG4lzms2/3Y
	/AoSVBK53lgXq3Rdnv0HN3GyQL2fwXChYtnAy0iL8F09ZfMSQIOXUGvl6ZS/bdQx
X-Gm-Gg: AZFdTZeU7rxiBn6UKflflF4fB3oVifHP1TK3ApeXkWaEu+CAcARmBtgX+fzU1UyLfoi
	EQJKAuULDLKBiGNhc+t6w1QnMuWuYKNnKqesFRntXmjHNaOGKdKjMntNkUOOTolpVL4WtG5SDRv
	2LczwRaDXIRwgKJtCoTr2++hUuNJbsNtZsmBmIPFextF4Dg9PX0mx6Xl/zwyNQ6Cl0HGren03tT
	FrMkY7YwVsepq7+Fyy/hPMAVMlga9FHW2O5Yb0j70+wzVMDXq/cd6SSgrQ+HSWNaYmEHt5nGkZP
	Pl12UN2Zb9Uk/5FMLSjn4xR2VW5Mge0N+pj65+dQyaKaEQkaCtcqY3oYCLpGZwU4sJx9XmkB9xT
	iY0NVBRTvP9Rhf2r6agVvyqAUtJsfuFSc5rXukzNZBCJDQcfdD+DgH4wy6h53o++FghM/g0d8YL
	4PzMO2oeczBOEet8ArwepR77Aujw0Cj358XvCKdrC8yy3fAbXzTX/VDvo/i2NDl4cMrIXD0kqNE
	yFNviVz4eGutalHAn26JRukyDvPvsjTbMHs5cMDN+osQqqJWB3UtIm1wHFiETGce/+Fff3Kbc38
	tnvOiP9FeBQruYcbaHHR5UGKzbqr2KbA3yB2ny/aPFCKs8pYq5GPW0WfeLCN+xv5JtWa
X-Received: by 2002:a05:6122:e1aa:b0:5ea:e052:2ef0 with SMTP id 71dfb90a1353d-5ee8af38c92mr1397880e0c.9.1795179152879;
        Fri, 20 Nov 2026 04:52:32 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b59844csm2357806e0c.7.2026.11.20.04.52.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 04:52:32 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2bf046ceaso548291137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 04:52:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGFJ79biS5HbptNeF6gt8YPcU9EnaAgqaaWxB6JC2K5nZZNxDjjWxY2UCc4ojugt5G0Z3C0Gtqm7x95+RMpFqTmaw==@vger.kernel.org
X-Received: by 2002:a05:6102:3e8d:b0:7c3:fcb:180c with SMTP id
 ada2fe7eead31-7d739572406mr1186700137.20.1795179152283; Fri, 20 Nov 2026
 04:52:32 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com> <20261112-sdhi_rzg3l-v1-1-ca30b209615d@bp.renesas.com>
In-Reply-To: <20261112-sdhi_rzg3l-v1-1-ca30b209615d@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 13:52:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWk_0VT_UgaYoCW8c9zac2g88bL6niZF6aDu+UbWroFjw@mail.gmail.com>
X-Gm-Features: Aa3M54qyNQu_3mY0Gw0VIiuXO7cKeCCI_cdaF_qJo1F3yjQPV5KrJ3x92PPsDRE
Message-ID: <CAMuHMdWk_0VT_UgaYoCW8c9zac2g88bL6niZF6aDu+UbWroFjw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
To: Biju Das <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 12 Nov 2026 at 19:48, Biju Das <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add device tree nodes for the three SDHI controllers (SDHI{0,1,2})
> on the RZ/G3L SoC (r9a08g046) and enable SDHI1 on the RZ/G3L SMARC
> EVK platform with pincontrol and GPIO-based voltage switching
> regulator support.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -1062,9 +1062,80 @@ dmac: dma-controller@11820000 {
>                         dma-channels = <16>;
>                 };
>
> +               sdhi0: mmc@11c00000 {
> +                       compatible = "renesas,sdhi-r9a08g046";
> +                       reg = <0x0 0x11c00000 0 0x10000>;
> +                       interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI0_CLK_HS>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK2>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI0_IACLKM>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI0_IACLKS>;
> +                       clock-names = "core", "clkh", "cd", "aclkm", "aclks";
> +                       max-frequency = <150000000>;

Given the bus clock can only run at 200, 100, 50, or 6.25 MHz,
150 Mhz looks strange to me.

> +                       resets = <&cpg R9A08G046_SDHI0_IXRST>,
> +                                <&cpg R9A08G046_SDHI0_IXRSTAXIM>,
> +                                <&cpg R9A08G046_SDHI0_IXRSTAXIS>;
> +                       reset-names = "rst", "axim", "axis";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +               };
> +
>                 sdhi1: mmc@11c10000 {
> +                       compatible = "renesas,sdhi-r9a08g046";
>                         reg = <0x0 0x11c10000 0 0x10000>;
> -                       /* placeholder */
> +                       interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI1_CLK_HS>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK2>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI1_IACLKM>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI1_IACLKS>;
> +                       clock-names = "core", "clkh", "cd", "aclkm", "aclks";
> +                       max-frequency = <150000000>;

Likewise. This instance does not support HS400, but HS200 and HS400
use the same bus clock speed, right?

> +                       resets = <&cpg R9A08G046_SDHI1_IXRST>,
> +                                <&cpg R9A08G046_SDHI1_IXRSTAXIM>,
> +                                <&cpg R9A08G046_SDHI1_IXRSTAXIS>;
> +                       reset-names = "rst", "axim", "axis";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       sdhi1_vqmmc: vqmmc-regulator {
> +                               regulator-name = "SDHI1-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-ramp-delay = <1200>;
> +                               status = "disabled";
> +                       };
> +               };
> +
> +               sdhi2: mmc@11c20000 {
> +                       compatible = "renesas,sdhi-r9a08g046";
> +                       reg = <0x0 0x11c20000 0 0x10000>;
> +                       interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI2_CLK_HS>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK2>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI2_IACLKM>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI2_IACLKS>;
> +                       clock-names = "core", "clkh", "cd", "aclkm", "aclks";
> +                       max-frequency = <150000000>;

This instance maxes out at SDR104, so max-frequency should be lower?

> +                       resets = <&cpg R9A08G046_SDHI2_IXRST>,
> +                                <&cpg R9A08G046_SDHI2_IXRSTAXIM>,
> +                                <&cpg R9A08G046_SDHI2_IXRSTAXIS>;
> +                       reset-names = "rst", "axim", "axis";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       sdhi2_vqmmc: vqmmc-regulator {
> +                               regulator-name = "SDHI2-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-ramp-delay = <1200>;
> +                               status = "disabled";
> +                       };
>                 };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
