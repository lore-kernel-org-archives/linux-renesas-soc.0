Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317949;
	b=bDR/VwjMPYyJLXcR/JI90JXNh+TbfkTzS4SRP/lnbveVRR+ivf0uXDvoZoVpuGTPVTWJ
	 ARzqQFQCnYNdpQRXcCO1H0dIafqKqAIS7g/aj83EBtxRKtl/EPo41M2MreaR5LrPNs7b1
	 Ys0cUdyA0tpDOVDBhgYLnJx1529bEWNwSGh1fsuHoe0muBzTwTY2eiPRQDGGhphsObW1/
	 18kPntSKDx8mqBa4E7DImcY9V4Hq3GjElg10bAusWc4wjb90jJukJ0RP+keFnWftkxp9j
	 MmOj66KJqNATeiiiIhNG+/+TZ/j65XeXdSqVMDHXxSfSYvpTN4B/FttOoos+T1g+t5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317949;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ZMeMfQvmt78dPYrMMtAW9VPm9Yugc+D1ue2Bsz1Cqzg=;
	b=ctgheWVbeNGQSwLqNgGwlRFpfffIW+RYU84ngNUeRVxT2RBDnfXn2/EeIto8/XcAmwCF
	 WR71FT38C1V746tBM78/Iol5LQA7OFBoxQZNjy/fCo2VnFIKLsbh2gOu7nNfCYWgV0OhY
	 qmGOdfL5XK4FHsMx7Dl9hNSdc9ZHmgVEk9koV4DoSfyH6GwpDG5hlB9UcpbFR4Imumsss
	 elC/+6qgw4oQmug19/OtrScYaS9MfSmKll773dS5atyYGX+SgfsShdDztaM+BailhH30F
	 UhhmMWqeHX9qm1dzzRCwiwmCx0jAIVoKhTnGCMB7xdudGIuPkW5Fde2/pFyO8ulpwJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2187C606A32E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 13:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2187C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so2286938a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 05:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317947; x=1794922747;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZMeMfQvmt78dPYrMMtAW9VPm9Yugc+D1ue2Bsz1Cqzg=;
        b=Pf70YFYM6SExYL68/dnti6Tcax+yBS7hUp4AeRRJ1YVGSxQQvWyQ7ZP2YFHR5uAhfv
         bPNWsTWNuhZIasxAn9kMXE8dGgB+IXiqLBS0fSpL/0pYpXdrYJmRgXvY93ujHjkUjbUH
         j7w7Nq6BzGiFPNIpgDOKLkReYNP1LdamVKu1XDcyRuU/KMBh3jrvnCrpHGRpSCnc81Dl
         ShtdGc4S2PAVPaxTjEIQBJgj3+/wYN9P2ZKk1xckz+uYLoF+HN4Qgaat/qOL/YY1AHNM
         MmFa4OUMiNjl9IQXFVBIGG38lNEOoGhih/DHCsq/6/ZJlxxiiAJL/GGjUB6ySUl3wcpD
         hKcw==
X-Forwarded-Encrypted: i=1; AL+hErE+SNpazHjFip6bk9JsJ3lYkBcEKE5cOitP55X67AR78Exo2+iFN80tM4U/8ZKbRSJhnnHZ4YrNUKCTUBsY9wSu/A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9NZHZNs/iK3OXlr7Xi2LukEx2Lkz5V5zGL2y6hI9rN1brfaIu7
	5c/BdbCuIcuyWSNslm5wN/Sz8+hIXeauvcQRkhUqHIcsnK3ZXlEORk+OsZY8IUg91o4=
X-Gm-Gg: AYBFou2bPIyncoqrlsdZf78JdajEDbjFluAmMKjmnEvfsFtFfcqFbTrN35yRV2+BLIj
	yMoXYbNHo7NRfMoUH9Mt2vpRm1yX7b/s8rTESA23dx10HWp+0OMkVKoWcmCPCnWSQ4RIyuA/le4
	uryC55D09ttmdqghqJZQTpMvvGGxdkJ33DKfNBOn8AuKKOk60a7TbCgJz4I1+x8YL3ip6X5K9q7
	LLu6bVybHKeVKCK90gRIr2GdLQuAGXCLAI/RZCrD3nf91W2RmGc/RgQsnwwspxA9Ayjfxq+nCy3
	rFFxAkjDKcf3vdpOLibhlFJrMWSFbk5xbLA/+lHfvCqGtOeR3pL084PSnQi5oBl4hHjmwerlxmX
	zf1zcXbKZhoVhHaivI7OB7zRhZaAJ7FOq6zqOlsMK9PN5G9o8XEIwwbUBmIgC6xldMo1ilyCPKa
	fA2aRwF8ZXsymjyLU/y9jFdSYbRIIxWtRnimYbWe4b70M4JqboXQOFb/YYGDa2VL/9BrprOBeVE
	c3Vp3CXHDPNg54yL1RemFQcHilP/kGhHkTXG3C6HINnXV6nSZaj659GO0A1v4vRlm8Mut2N2E51
	wrynYcz1ZYzz+K4A+oNof78kURJZRX+dth8TkoScUX4xc8nO+YDh0DZgqx/AKhcxwTI=
X-Received: by 2002:a05:6402:270d:b0:6b6:f429:47de with SMTP id 4fb4d7f45d1cf-6b7564ea184mr2026908a12.13.1794317947314;
        Tue, 10 Nov 2026 05:39:07 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578bdb1bsm1152959a12.11.2026.11.10.05.39.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:39:01 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso3000140a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 05:39:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGox0wAsiqTTHybnuMI5u0RYPMj149ZNMeIA1Z9DId8cTXLrqo1MAB2JLT/Dx/DkhraOdr05CkgnQurlasRjFFBRQ==@vger.kernel.org
X-Received: by 2002:a05:6402:22d0:b0:6b6:f429:47fa with SMTP id
 4fb4d7f45d1cf-6b7564ea318mr1526088a12.9.1794317940664; Tue, 10 Nov 2026
 05:39:00 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106110923.164090-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261106110923.164090-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261106110923.164090-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 14:38:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQxTK6R17jxbiMH2ZxbH5j6B8x8h2XeysJHFXsskS0rA@mail.gmail.com>
X-Gm-Features: AclHuK8Uhzs21jwItIeAcI6lu6EJ0iz-5HN7a0XG0Ev7COfmQG9EuJKsPYXnOHI
Message-ID: <CAMuHMdVQxTK6R17jxbiMH2ZxbH5j6B8x8h2XeysJHFXsskS0rA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: r9a09g057: Add ADC clocks and reset
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
> - Renamed ADC_ADRST_N to ADC_0_ADRST_N

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
