Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233458;
	b=uGej/QNc7DI9O8QSq/Of3nLxLwoq07xQVmrpRJo7NVIE3z0ELmAjFxPSfwKR4dxixbI4
	 0K+NK8MJwZBAlHu+AUK2XR8tCPPsXyJ3bRVCOmW2jILjKJpB2F4sel+KR1GNbfZGfkyKp
	 s1Zar9LtAf39sgg7P13OsVAK6tMDyTlHSdeAEl35CGJ+QsU/YxtQeWVSKFQ/dwl31ry1J
	 7n1BJkh69eKIgRjP9ORYIzpEn6R2qFlhjYLh5yzjx2tdg8+E4G2CbhG919SAenZTNUtfx
	 2z1KQAtT2Jg+mdyzzKXIPIqZ0yhpHCB/x4RlWvBhjZfbYyCyqTPZ0achxMX6+56gvSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233458;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Tz1cDpa5AepSCwsliEOBWV2ZbIXpdMUmAVTrHLbgBBk=;
	b=nSr/YzJFQTnGxdWt4zBJVqux2xb3PChzdjQtTU9rjAAbiVZD5Oc0VoK+XglaJ0OVKiYT
	 1tQ/bMzNcp6WVGnRAeHenoDnzlVPjzJFgreyF1z9NQcM3Hcyh+4p1i4+2Gf7k0HxiOLAh
	 cXvwgev6cvCMTNzHbJyy87l/MBTNIUKV2zu2fOKJ3VbPgyeENQgUSuCP6oV2plBh9PHr2
	 wajn152+JYfDyjvaJ35dovthcHhkVhc/zeFWvZphlSV/ZHt9ebIp6TZ8u1HI0Rg3Qw6lp
	 kQByUQcF1UH3hDLite6fE4LLv9iNPFK2E7XzfRJA3PTSBR3g8rOvEVcmQJbSU5at/Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC1B606A31C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Nov 2026 14:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC1B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c247f6687dcso156360466b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 06:10:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233456; x=1794838256;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tz1cDpa5AepSCwsliEOBWV2ZbIXpdMUmAVTrHLbgBBk=;
        b=YqqbnAhZ7VXuR60MtSZHYXAhcDlNXuLjibD9IegGJQHbl81MSd141bdo/s9LBmqq0d
         YU3A6HiUm7YwyJkiJ285K0pka/LGCYgLqJMhcK14FCU9TUv/bObWd5bGE177ItYg0u+y
         Iqe1K3GzJ9EP0JNUK8PlULVj6a80z3t5BSDl5Qtw25KxbvsFwAmuLpS8kIcvsHJ3Ndfi
         oTbdwBSYZc4P3X0eMNJLYQqNRov6p/xHMmsKWcH/uNK0+3XR2z6ENdT9rnXZaap3Itch
         SQiOqS3rvq0ZOByuQhlqINI/gFOZShoN35086MbSwjoyjn8O2KL6V1ihaBtBlncxDpg7
         E7qg==
X-Forwarded-Encrypted: i=1; AL+hErFZQdcPFLavRxIzo0VjSxogPhIUefoX+c4e4+mi5WgVqwELEtHxmbQH2L1wq+aQel9CdP/ZGYH64J+rZFk2m/fG3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+a5tLr00M+aHqsTpx1MfXZ9aygOwRODknRC6TTlFUt7Oxwh3+4
	DEM0gfdgWpO2Y6hjhwnYEagMrnqk2myQT0ge8XUcf/9G/DL6d1PKOAVydhVDO0BOHTU=
X-Gm-Gg: AYBFou1/KRz92FIUBlpdT7mK2mll2dbZsF8Z3VFIjTZVZRsN78s5eYWhbndH+1iWsa8
	fGRs1wdbox3k6NKQQ8SpTxhpSsYCZ8YvhvalfJycnZJ2HL9vfjIYmmDYFxU/eel5oBsEt2Alnu8
	hMTUpXRqlZEpeT4JTtyqGfiwVJ//T5Ks0LZn1rvlYxrTlJijBYm9USjREjTusBigEVanZYFk4yl
	oUeMaO2VfxTVt/kuXvAdIUZexHxXvIiDKAtTvU4FvTakHfarvnkIPnTldDx7wkIUyKlVugnEtZY
	p/Wl0k28llcRazU25n5t/s8QJJ2d80KH+TXr0onE0bA33MSgoCy+2a7ZOHhNtzJVw+LsjpeQ0u5
	SMsZR3VcNtss6fxqbjANbwyyBA/S1EYDyi5qxhnbrsCDl3RPfqy47WkkKhQX68SOsDbkl4FDfFI
	wVRXGHYIYWqRkLJYGm6wugrGS8aKf6vHfC7p0fLWXmDjTP8KlsZEs2jhIjJXw9t1Bts9Brvjjiv
	weOxJ1Anow+8vSJc4H5UekZc5iNWQxtIZbIKSOStOCiLKvqCgXyTWlNwnSRopG/YHlFrOzVR8Sw
	DR6UfuiKeSlKP+OkRM+KYwMCCaxbVLRjqH7V+hziuagHh80CKoZjWsjzvEP/V3Qv6g==
X-Received: by 2002:a17:907:3f8f:b0:c46:7ec3:fdfb with SMTP id a640c23a62f3a-c4d6d1af6fbmr270377566b.7.1794233456446;
        Mon, 09 Nov 2026 06:10:56 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f94420sm172143866b.29.2026.11.09.06.10.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:10:54 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so1227835a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 06:10:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEA2cjkPmVUJo8uswj0UVu4opWCDKWQ/IxhuGWZ3TpoJiCE657XQ3sT226AVAzrf8jptO2VIy/3sXKOouR5gJF+wQ==@vger.kernel.org
X-Received: by 2002:a05:6402:51d0:b0:6af:9a96:5324 with SMTP id
 4fb4d7f45d1cf-6b722473406mr2715103a12.33.1794233454340; Mon, 09 Nov 2026
 06:10:54 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-13-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-13-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Nov 2026 15:10:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVh2RiRhBHmuYupK5H81njgaqNCuFWVUiHjTN17+8a+dQ@mail.gmail.com>
X-Gm-Features: AclHuK_UOMGJNMSt7XpVPImhuSlb374iqFlByrKa5-w4LBZZoP4MvZOgp7Ag9nE
Message-ID: <CAMuHMdVh2RiRhBHmuYupK5H81njgaqNCuFWVUiHjTN17+8a+dQ@mail.gmail.com>
Subject: Re: [PATCH DNI v4 13/13] media: rcar-fcp: Check device revision at
 probe time
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:36, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Verify that the device revision register reports a valid value,
> otherwise reject the device.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

Thanks for the update!

> ---
> Changes since v2:

You missed the changes since v3...

> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c
> @@ -14,28 +14,80 @@

>
> -#define RCAR_FCP_REG_RST               0x0010
> -#define RCAR_FCP_REG_RST_SOFTRST       BIT(0)
> -#define RCAR_FCP_REG_STA               0x0018
> -#define RCAR_FCP_REG_STA_ACT           BIT(0)
> +#define RCAR_FCP_REG_VCR                       0x0000
> +#define RCAR_FCP_REG_VCR_CATEGORY              (1 << 8)
> +#define RCAR_FCP_REG_VCR_REVISION_H3_ES1       (1 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_M3W          (2 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_V3M          (3 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_H3           (4 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_D3           (5 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_M3N          (6 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_V3H          (7 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_E3           (8 << 0)

For R-Car V3U, the revision number is 9 (according to the documentation,
I haven't boot-verified this), which is missing.

> +#define RCAR_FCP_REG_VCR_REVISION_V4H          (10 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_V4M          (11 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_X5H_V1       (12 << 0)

"git grep -l renesas,fcp -- arch/arm64/boot/dts/renesas/*dtsi"
shows a few more SoCs having FCP blocks.

Interestingly, the documentation for all of the recent RZ parts (G2UL,
G2L, V2L, G3L, G3E, V2N, V2H, T2H, N2H) claims they use 9, just like
R-Car V3U.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
