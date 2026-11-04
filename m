Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810570;
	b=2KsenLz+iP4/p5xMTefXpfsyfH4AmVmV1u78DFjMwGtWIIW4HsyFLfT0cc/la7GLndyq
	 OIrK9j0vZ5+D37IoeZYINKxJSLn9ldBuLN+o1+Wqg176TbD29HVuHo61ph24+Z0hMpg1i
	 RjtSqmbMFX0LibMx8Vp031ayaZO4CWO6LPLSYWrYzQpJAtGNgoqWKwAw8DnrxOc6870l5
	 mXbjDHFC+VtuFChEjj6oyqz5MOc3GBP7GyFNaOicxNOjEC0dn/wdAu8binqGMvgXr0xRB
	 dhDNa9JdMp0cWU7qd56Aqkysj7AsDJyPvgBB2cn4tTK6Ay62tXwvNdCbI5XT4PDQgqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810570;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=KJ+1oCAIH39mLuoRRIwRDFkQlDS7B45Vb+3W30Jd5To=;
	b=UZ0otdykv2iphfT+t8cC6i7OVK86Zqfw9J1t9SGgENzBQKRxKKLgbNExanp5SHvymfIJ
	 nfsuURrXy+kqMAyhRxXDxVfKDHfofJ66aP/plMcMCZOM8djGdJhm2xuNNMbyCYG2JgkHn
	 4DpVuTgm6qfvD0fkDb49vJJ+3PMlndGrfgaQw5dXu9soAYQYp0DS3myQuQtEpok3Wy1oS
	 Pr9xOl8eZdfsJhOYdJgaIwlfjPQS55vvg9lKSfY8vP5xQhyecodEzxYuiJIZD/RqzHZJg
	 QcqPS/M6AyzOelsxxZ0k2MjOKS5PqcM4Yba8gIIWJRWSauYy4uZ7CicBq7nGF7EPMVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B0C606A326
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 16:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15B0C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ec3561ad43so457668e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 08:42:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810569; x=1794415369;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KJ+1oCAIH39mLuoRRIwRDFkQlDS7B45Vb+3W30Jd5To=;
        b=AEf9+owfLVn/F7ryJQg4TFP8VSId0p7jAuZkHo7HeDiUgQFfnKMs25zZJ94yQkoPTk
         rd76YMQlXmtwkr+yFoYIEos9NyiEhfsyLiktiHbkbohZTB6sk5IhICBOCgzLJEEETCt3
         vnKnzMcoa/BBl9mKCsmFaTVXhGBgD18wU1kugnWyaTU64kU9UGubG/43rx+Nml9lpsls
         80t0L2OR1Qpo34G4cI+d4fnpZL6ULsR/RYKK0v8Q4UYLRORv/LUHboK9z8r9dwZNuLRq
         v7ct+OVp8f0Jw3P2TLoVf15UB//ojDKi1gze1HZpaRknrkMLP5v99XQRNhBtebG2QSWB
         NeTA==
X-Forwarded-Encrypted: i=1; AKwUvBzT1LP3xpO0SX9928f3sqNBfAkplO8M0w9Zmzx9Bh8G4MruM5LVPN0BhdRZDDphzp8IUrpTMkTlSJNx5NCUdotHRw==@vger.kernel.org
X-Gm-Message-State: APuU4Z++JCv+2BaUfwCZX1lqDt7aSIrOd3HqviJpCKVdXWDwz66sigex
	byIF7cpT+5Qj+9zqGsilg+r+6C76T2scISGGJiAkkFUekSeTdyV80jwMauz4dpoyKLE=
X-Gm-Gg: AYBFou226B1mn6fIA0KjH76b/ytOhyaO5qDeNVra/SCWN4OC9A9+lMxnqI5t18DgK+e
	Uh5X1X4GqAAUThsmJKKFtX7zLGZX1+EK2j3tvBSyAZM8Y77ic+JqDrZxO4rW8/k+bwK+K0uhLbx
	WYw6cHAOs+R5dHyGt+Y2ZuxCyJAcrY8Z0fpeM0ld09q1xrJBkRAiPHxEwYg1sWgmKQJepvv6U50
	+D0IDzaJ2nBXHO38ZlWf2Xeo1qRw2FiXdMAbP98Sr1deOwS3LzSbHDcfzMMpLd8A8fCBti/gN42
	/niIYw92OCBEf8PwnzvVNOosmMCboceLTCimAMkd740Ytp1iVOm+nNTZpuX7B2euHzbQK/7vEi2
	0l3TWXnS0V4DT/o7wLv7PKm86QHzydKH10cwZKsQr6NjxLzFIEDaA9blLZjjCUDya4SPVVQjL3L
	3/K+ep9/ozJ1flM9cjITWj1421iay3rVAXL3+L7JAa6l1qg9kAHOVrx8bDaW2Yx7/gk/QXWcJjx
	01901qvhe2A6auFB8ycJ/Pi66ZHsOUSHKNcVezHdk9hOU1NGuBo60X2ImeeONhHeoQ4eLiKEic3
	PKm58GZmqIKcpyfWlm/xAc6EdwBjFAfelpRGEMFi1MPs7gsWKag8rKD9yIy8cu5PscqbDfg1jcJ
	6UVr4oqrYmMA=
X-Received: by 2002:a05:6122:1798:b0:5ea:c330:7802 with SMTP id 71dfb90a1353d-5ec6852ee6cmr7959541e0c.2.1793810569136;
        Wed, 04 Nov 2026 08:42:49 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9fe6dsm2045690e0c.9.2026.11.04.08.42.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:42:48 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7ce645a1c6aso518370137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 08:42:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByxSrU/tVCADPW+mQ90HOVBf3tgSYEaRV351w593JS2mmy2PcGuVt83fWIDbdGQHzXJkNGjJeULpGu8rD6QfAZG/w==@vger.kernel.org
X-Received: by 2002:a05:6102:290c:b0:7a8:10eb:96ce with SMTP id
 ada2fe7eead31-7d07277c1d1mr6700629137.4.1793810568003; Wed, 04 Nov 2026
 08:42:48 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260929113921.119489-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260929113921.119489-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 17:42:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV5Sn9FaMNEaxQKF7_rm5hvM-pfC2-KU14=96DFGp85jg@mail.gmail.com>
X-Gm-Features: AclHuK-yEEtBzpAX8urnUe9YWbbPPxJguJG6y14QRK8iWGHBOGMP4whb2TqDpDg
Message-ID: <CAMuHMdV5Sn9FaMNEaxQKF7_rm5hvM-pfC2-KU14=96DFGp85jg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r9a09g057: Add ADC clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 29 Sept 2026 at 13:39, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clocks and reset entries for the ADC controller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c

> @@ -173,11 +183,18 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
>         DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
>
>         /* Internal Core Clocks */
> +       DEF_FIXED(".pllcm33_div2", CLK_PLLCM33_DIV2, CLK_PLLCM33, 1, 2),
>         DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
>         DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
>         DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
>         DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
>         DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
> +       DEF_CSDIV(".adc_pclk_gear", CLK_PLLCM33_ADC_PCLK_GEAR, CLK_PLLCM33_DIV2,

".pllcm33_adc_pclk_gear"?

> +                 CSDIV1_DIVCTL0, dtable_8_10),
> +       DEF_FIXED(".adc_pclk_gear_div2", CLK_PLLCM33_ADC_PCLK_DIV2,

".pllcm33_adc_pclk_gear_div2"?

> +                 CLK_PLLCM33_ADC_PCLK_GEAR, 1, 2),
> +       DEF_CSDIV(".adc_adclk_gear", CLK_PLLCM33_ADC_ADCLK_GEAR, CLK_PLLCM33_ADC_PCLK_GEAR,

".pllcm33_adc_adclk_gear"?

> +                 CSDIV1_DIVCTL1, dtable_2_16),

>         DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
>         DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
>         DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,

> @@ -669,6 +690,7 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
>         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
>         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
>         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */

ADC_0_ADRST_N?

>         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
>         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
