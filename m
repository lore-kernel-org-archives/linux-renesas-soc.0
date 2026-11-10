Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317968;
	b=B2jgwa0EmBk+h2gaJbrmZCAd2b7VDTNJnD9eV0KdwMhKxOxGhDsmEBmn2Yi2w/nsZKmE
	 uZz4hYEI+jieKXbRGCbpbxBXXB8hNrF928F5255jpacJe9gAr5HsUnpK3g7JXcc9CCr3T
	 LcB+oqHunR8nYAwMiLed2lXxK3fEir1lQmXTzn86kRuweH95hZTat8hT/FlijD/V7tl8Z
	 r7xNypWYthpgSy68Ax0TJdOdNVoNaHcHiJvLc9qtOZbPW33LtV0dycBX8A8mBbwXkc2F6
	 zCYsWHtw+G9i/VDS/VWQ2vw0oEAh6EG2v4t57wqjxAgXIHjRRGm5FDzbr1H5YWzW81Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317968;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=kSnlaqH2icJsjwNTkwpevxyVadDJDL69yr1qt1A0z9U=;
	b=0SH/MW2mvsCo1Ksd5UUGcVfZkwB5SQ96dxPdmkOHjP4D2sSdCBLkYmvy+RGnkN6vpxwV
	 +IKTkEFD63AdkEVndwkTCXgbfD4HnA+LDFnUl2BaV9EdcmNLd9KfYfLxxr3t0cam5HC5O
	 TKF6B8IADIMM8lfBSfA8U2OE6TBZ95ap9biV0+MLGwt6Gw+KXlwoLFaictDhiEJpMqujS
	 QLgnAjS4BD3qLp7StwXjpfSAiz849dwn2jyhne2k/n0XPx3oCI4VkZ2QF74HPQpGGHNTt
	 QfyVnuLvRdHTA2yJlEu66DkgjzWliUz5EeohGUcKky0y2KixFCcJpiTSN7JizzBQW2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD89606A752
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 13:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDD89606A752
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4682977f9aso254471366b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 05:39:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317966; x=1794922766;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kSnlaqH2icJsjwNTkwpevxyVadDJDL69yr1qt1A0z9U=;
        b=BjqdNttoJH/vwjdSRBDtBIlVIDwSFbbnHaSUHL7bSvshUgOPUnCJp+r1vG/y4FkXgi
         iAMsb+K+njKL1uPx+CbTqY5lXH+wRBRTdTwAExj+uxgkqeNXe+3fOfUs2qvjMaUm9zKG
         p9+8n+norDZ5SkvdnBjGDXv+E2Y7/jedI2UpwWpj7OEiZSEnJ2rP8fEBD2riYjEC4r1L
         jCV6e1IYpyaQcg8bsxGLdgmlb/6GrLfyPcRiD+4L7st/6PNv4D0ZMmi5CeV7k7oZcOT1
         5Uapc3ovDtb8xEdH1HBlLUQTS+cC2DQcpFAOh5aKZyL5i6PpaP0e2JdqckLw1cYRI/Bc
         wUEQ==
X-Forwarded-Encrypted: i=1; AL+hErH6/XCJSTNmugJvFSHNVFFJgwPNE38hs1yMftcMo7qZIoAUBCfcNnebEsCWxPpz6NVOOKGyro5dNp0OSdJ3uqGDbg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/p0DRZNR+SFRG+8kDdXCWaiHIoC93Hppi7NATAKzwWFDZYS9Yy
	B9A4iQDRHaxKkXlOzodQNJGYR508sLnby94/9gNvkJ5oQzeEnghXxNT4Tq0hvDGiuAw=
X-Gm-Gg: AYBFou1KvMxKVFY7w53T6qXa4e2UwmbHGLp0q1TZwV+iGT2gTkXEqsvsudG7DeQG+vM
	WvOBW4u9Y8Rpb/nEtGURuq3wRu39StFcsEAXVMdOaqVbxlG8NvfY31d070ARc/pIBNRBQPsT74J
	94sEzjtFTxPo1FDoQWpOROQsaDbFtt3b66Kuzls6k/Kry4zvYrQNFrnUQLWSWO/e0J1INu29POm
	AXSTPgHy9mzdGIazkfuTO1VyR9KPePDYNC4fwLMbrz101vZYiu/VO6U+P8qO6Wl7RQbQZdPOjWb
	1h8+OMH8qDmIHj69IzBJa6pdH7kjwBqQz0P0GWDpM4wsfj0M3wUHQR723sZUk/gJqEM8Ku87OJe
	awtlU5DTxuicatBHIN84Ssgv/T7eSwOvGsZpafDTkgyvcsT3IGAh50hnCaH7OK9qawDPmcAMZ+W
	CUDL3+6vpQeaL8EnA9Q/PUe99vsS4IqGY6K0U0fkP/9xkzBciWLfaj+e0MGd0JrRvvY7nIsllVs
	1S2tYVKJ0qakBvdpEOLgB9ftiBrn9GZSKpAaEwF9hf6EgUhf7zdrv4//bc2XK8RRb5VhTpUKzH8
	BeZcn8HdSETxooO07Ps4iLT0JaItzW4oZBYqTv/GLJGv3EgLheWiBLMQ5yZM5PBg94c=
X-Received: by 2002:a17:907:da16:b0:c49:b952:5425 with SMTP id a640c23a62f3a-c50496547b0mr222439366b.45.1794317966166;
        Tue, 10 Nov 2026 05:39:26 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a683d72sm108297166b.81.2026.11.10.05.39.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:39:21 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3128377a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 05:39:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGEvsA+03AeEipOZyejhGebwzDDAEI9SQQrmz+EQ7TFd9ic5JrVdOHSjicJV/2qx6nF0u/ASV74ntcdmgMmi9EacA==@vger.kernel.org
X-Received: by 2002:a17:907:2d06:b0:c46:a607:6922 with SMTP id
 a640c23a62f3a-c5049585db5mr235694366b.25.1794317961521; Tue, 10 Nov 2026
 05:39:21 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106110923.164090-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261106110923.164090-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261106110923.164090-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 14:39:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXppNKiFH-Q+q_fZNwCABWw8KG2Jcwc9jL5+GmNFuouHw@mail.gmail.com>
X-Gm-Features: AclHuK_lqFzG1K7YY8lxHYxynu6A8iqMxQa89_kBquxOkn_I_cpIfpAejrm3I1U
Message-ID: <CAMuHMdXppNKiFH-Q+q_fZNwCABWw8KG2Jcwc9jL5+GmNFuouHw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 12:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clocks and reset entries for the ADC controller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Renamed adc_pclk_gear to pllcm33_adc_pclk_gear
> - Renamed adc_pclk_gear_div2 to pllcm33_adc_pclk_gear_div2
> - Renamed adc_adclk_gear to pllcm33_adc_adclk_gear
> - Renamed adc_0_pclk to adc_0_pclk
> - Renamed adc_0_adclk to adc_adclk

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
