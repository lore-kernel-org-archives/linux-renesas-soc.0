Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355570;
	b=rDg2u9yg4rj6RGnXnoC2NpkUv5wWpSWNrHtpYlIGygvPTBw6F5qKJ54RF+WWPeDFAjUy
	 bJ6+lCUWQ08p7VGQY8g1Om1+uuwVgSXrrnUfY4ewdT+YxpWHDJez4qSkKqULafSLB35o3
	 zNRpvYMGE1eypi9gjWwi5OW+r9Z6IoMZN8Sg9R8TzNh8OsJVSAE2FJuKRwbjOJd7gUNbo
	 LOJ9ik/fE9LS69MiBHyyJ6nUTlP9oMUf/WDlQL2NS7Mkjwbo4pKUrCa+Ib6S6hKCPQdPu
	 v8l3eQT3u+UndmkhIYRPsgMhrd0BTV+df33JCOHtvUfuK3wRABIEvYDsPeZ3jSJQomw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355570;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=N/lKB/c9Lq//6NoMXUd+nQ4qRj1zdlYJ2/JdgAh063M=;
	b=MCtMeUnAWKMIg7BS6EG03h1lo86LILANhGRDA6/Dc3U7JHNrAC44RalU/nWsNmVizFWd
	 lZ953rKiNLtZZjsALHN+JAJRoF5GH/kxOTRgru/I0Djd0ttXH0AeHQW+izI0GAvYofYQF
	 esEHUc+KzAVtVwqJvD4IUFb2d2FQ7JraevRlTYUmAi3DS/Y8tBhWZmDIujFvZ23bEmPg7
	 oLc1O+HlsvNW3e6r5Gxf0u4RDiUUDShraftk/PtLlvpI/+BZF4HM9oPzSUZLyGDx4B+5C
	 Fp201QWsySoA06Frd0mPNHc4ToHBqQG2O95eeBVeSUA6Q1D8D75ak+l/eXnp0AMSbQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9093606A326
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Oct 2026 10:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9093606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-99059bdcdeaso132019241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Oct 2026 03:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355568; x=1793960368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N/lKB/c9Lq//6NoMXUd+nQ4qRj1zdlYJ2/JdgAh063M=;
        b=qbUApNiNRKT7smw4RRzuer2k2hnXyS8yS/TBJXOzzvpRJeDbAnbq+o/Ya3uW0ic9oX
         jaEmBi1mP0rxOQ0PoiAeimMpNOGqaQbgQXR/NiXQpxYWASdWCz+HOm+0n2SQFe/2w1us
         D1mkosZFgteYzvAYiVLQb5kFHYOnAPX8qVjpBLCj/RE1KEmCi4Cc8D7sDjLVv3zl3Zsp
         vAKIZuT1iurawqlq3CDXteAbVuNrq6LOq0cBAh5y7O/1e6g155MFPXjQiUySNvRCSQlU
         bS+My17Vr7/9Rma2cHLYBHTIlo6mmWD4lRH2SXcWo3PR0bf6amA32fm5woWSbhZ3s4/N
         b1ag==
X-Forwarded-Encrypted: i=1; AKwUvBz1eHKf/46JOdOqN1g9ZuCktcJsiGb1iB4HxPTzPc0uPzWj82iUJjOQq8W61uHTiyVfMThct67QmDGgWl6BJKQ/5w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4vz2mU4RjYP8BorsVRXg3+8rqxUCxWLSaT63dXASeh6x/Faxu
	qkXxvX7EnqZkqAYa73uMZsaQ/eAGhCce49h2aljEXvjyMo10uE1f8BFfHz9p0dzi
X-Gm-Gg: AYBFou1fgAHvD3wu4vyRiqLpbZ/Cs2iWbTpv3hrHKEwoC1JH/rUoOsPpwxxjS7TK6D9
	9yApVs/gHcSPn9IA77ocPf0u43Nj+tdH+rlayRod926/+bayRWIYijvIu+a00E/MJgdQmb9baUx
	Nhi8J0FO0iWxoCO9Gdz5ybKZLVt94Hhp+6RtWFSuLfmfH7ABBrBdDWBkOqe3qsMI2Zmi38yaHyl
	ohYre4OmXBCtS5iFWju6npbxk9fNkcIKs/B6PX15DawjnB7bot8nyW0b/6SGkIs9nVxa0J0u5jB
	1eKXRzLDdZbpCvsLAa1ZnOGfdSp0h/ajZC26hUeNGsM9X41DUGQYg3SGSEEyKSwyU+mlFMCaHcQ
	xJ8cHZSyNAg1nYh65/seumtSFMfAWU0p2Pi7F/BPA7cUyulpHsGTrWc9d888oVlEgTsRAGfbJ0v
	TkTus4Y+oYqU8ch8poyoldumPaG4vrrKxMit9DY8t7MMzgzs8TB0DmsEwqGFhVi9Ng62edJ8AkR
	XhoEO9sTRYuphJs+7xKLJJUN74Mnb7O2j0veqMiW6zzVO3hRza4+eNYIzcE9Eccw+FBgyYbWxGA
	iIMDvfkRbJlx2J+E9tIV7MsulJ3fzB0eV/5YStK5MjCTJ7rUiO8t74n9tJ9PVIc3vJM=
X-Received: by 2002:a05:6102:4194:b0:7c0:1d48:b2a2 with SMTP id ada2fe7eead31-7d07278d8eamr674730137.31.1793355568571;
        Fri, 30 Oct 2026 03:19:28 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69803be7sm1959708e0c.0.2026.10.30.03.19.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:19:27 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc81984fceso146328137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Oct 2026 03:19:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwcBSDjZwLzS8rfaXR7DFh5MLI/R5L4bF+fLojXRFcoEzE5t8HMcBgMExMe41DLFwg7BcIJHdT1QstP5AfWxKQ5wQ==@vger.kernel.org
X-Received: by 2002:a05:6102:9d4:b0:7ce:5952:125d with SMTP id
 ada2fe7eead31-7d0728d38cemr726412137.36.1793355567237; Fri, 30 Oct 2026
 03:19:27 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793278754.git.geert+renesas@glider.be> <2f986484ade3f3ab7785a088b476b4bc6f53c157.1793278754.git.geert+renesas@glider.be>
In-Reply-To: <2f986484ade3f3ab7785a088b476b4bc6f53c157.1793278754.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Oct 2026 11:19:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVDs38CWQv+-1d6iMa5Et-w53iVbjSTyQS5uVcvq+E8Ag@mail.gmail.com>
X-Gm-Features: AclHuK8TLIiJXfBZEbZO-sDHcOFpgPhdmma0xCzHFZfNFDpVgGdGYD9NeIfWwIY
Message-ID: <CAMuHMdVDs38CWQv+-1d6iMa5Et-w53iVbjSTyQS5uVcvq+E8Ag@mail.gmail.com>
Subject: Re: [PATCH 4/9] can: rcar_canfd: Add support for R-Car Gen5
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Biju Das <biju.das.au@gmail.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 14:11, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The CAN-FD block on R-Car Gen5 is similar to the variant on R-Car Gen4,
> but uses split global and per-channel interrupts, like on RZ/G2L.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/net/can/rcar/rcar_canfd.c
> +++ b/drivers/net/can/rcar/rcar_canfd.c
> @@ -636,6 +636,23 @@ static const struct rcar_canfd_hw_info rcar_gen4_hw_info = {
>         .external_clk = 1,
>  };
>
> +static const struct rcar_canfd_hw_info rcar_gen5_hw_info = {
> +       .nom_bittiming = &rcar_canfd_gen4_nom_bittiming_const,
> +       .data_bittiming = &rcar_canfd_gen4_data_bittiming_const,
> +       .tdc_const = &rcar_canfd_gen4_tdc_const,
> +       .regs = &rcar_gen4_regs,
> +       .sh = &rcar_gen4_shift_data,
> +       .rnc_field_width = 16,
> +       .max_aflpn = 127,
> +       .max_cftml = 31,
> +       .max_channels = 8,
> +       .postdiv = 2,

R-Car X5H does not have the /2 postdivider, so this should be one.
Else the bitrate is twice as fast as intended when the external can_clk
is not available.

> +       .multi_channel_irqs = 1,
> +       .ch_interface_mode = 1,
> +       .shared_can_regs = 1,
> +       .external_clk = 1,
> +};
> +
>  static const struct rcar_canfd_hw_info rzg2l_hw_info = {
>         .nom_bittiming = &rcar_canfd_gen3_nom_bittiming_const,
>         .data_bittiming = &rcar_canfd_gen3_data_bittiming_const,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
