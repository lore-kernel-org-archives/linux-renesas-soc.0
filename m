Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631302;
	b=UVMLvCYj1sG7NMQnVjiF35VcEJx6k8qISODvD+364FBADdhU5PIk5wx85dXLuD7Kmwz8
	 gaKK19Ro/CSgTjaWva+I7hf2tKRt/X5LZizmbZEX8YnE1I8O/nLJA0RM1WZMD81pK9Yym
	 1OozrZFve7pZzp4R6eBUOEIIKvbRPqnWqJHY5CL185OpWmquxFZC/uENj4J8r2NZrC8fJ
	 AURmtxeAHyEvckX6PK4GiMIckP9RK73VuKi7RHvCobIW0dyaBuQ023pqEiOJ8umcRZpzm
	 icaEM0/2/Ih/Dd3VI5OEDT1mOwfiQ/XOSA254IF0ijdZeg8ZDTGKaJjzGgfp8iQdG5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631302;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=eoXHqv1rfEc+TJjF3CsngnCxXTqYRvHqAmrtTn1BgMo=;
	b=v5hK6IrfSq6BI4RlEgriOhaSBd4+Im71XW4d1jWkog2u4k0Gb1N099XA/PFUmE0D0VnD
	 zbHTVXUcSJXa4EfoRR3LHyKhMGLaEMrj4krUiBI4BeOhfMeLRr2c7B4/xckZKxMiUa9sb
	 RQmFNCDWCZsO7QkBdtCXTbNTdQlzmdfqNYdbFHbONWhwcxt9ETLglG7lwH36izW64wAWG
	 ClMVrC3BZ2F9q97GQdF4ajnmZvHA0ha98uJ58oNKxzWRmSh5kRXZ8gRlvCTPWxXLYUPFc
	 G6WeDub5C139yiHghYwdsXdFom2CF3Fd3x6rJ/Y2NU3l/89ssBPlUGxP1n1IzVmbmlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B08606A596
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Nov 2026 14:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12B08606A596
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7c3b6e8225dso2163409137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 06:55:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631301; x=1794236101;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eoXHqv1rfEc+TJjF3CsngnCxXTqYRvHqAmrtTn1BgMo=;
        b=OwQvSPNx37YCCvBEAqrNg9+AAOGOmPs3ib2wolJO4L2JExla62UCac4R/4P2hbXPOM
         jeVv3UrHUIabMp9kEwqCCmI6DOQ10Sj2YCJI2bBQYGnEigsBF4vypjqWm75C2r47fJ1v
         U85+2XkUKP/SpprkpHk8Jxfdzq6uEdfcdtUNa5rnWTjFzpdkIuz5B8+XNb7XVpbif2jn
         ufewpe3kYj2kaGzbPSLAqIfcbSlRi2Xdw1NbIMqyTtvv+w5u2bNQKkOTIksRkUux8vuq
         lL/KkZBclJLgw0r0LNHeKukPFgxuq+PiypTfDZofb48JdTRvA3F5Uw1dwSVgkHbvEcxq
         0asA==
X-Forwarded-Encrypted: i=1; AKwUvBzaYYggVFuxRgUXrmkPtbmMO7+QAh+Vj7jfYvrNuyY6HM1JQhu3hRcudFXQi2n5mUhkYue8vR1TjeJayMWN5mi9+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+U4SJP4jWfLoO8lPjbUIwfvVB0iNDtf0WrPyg+9bGYWHffzbEF
	V9444q+6IeVnoHpVi4L8/bNPRBpkvgV127wK7MatIDacwywUDMEtLErAGgfA1/uZpl8=
X-Gm-Gg: AYBFou2SljzmQkmPIU1JaKqfscIPGWfEgfAc09tuJNpEnuNF4H04hBMxqwIqnc45r2h
	Ze7EpqEFGc5AhIFtW+IPuawcM9NaThoEfFLEMhubzP9pl4UkQu8T3V+RLYxhcefMCKw03/ELboC
	kl1f8wIFYLTW1J0nAD3hAFrCVx80e78b4T8bqRZgX7BsY5d7rRjS5Fm4qCQjI8ltLqzXeBifdal
	+iB3izCTM+jlM4vOLK7jOUyYmEHOuZpBasi5Rb59V9du9RUCz0tmbVwfOSrwDtxsEhWUzC6acmU
	sdfhr11Utl6qajGAXeRiLT+7Mo0arkqW3TsPFSOwgnU2Xl4lsRO2mli0Akm2T9Jp1D3mTM0Cqlt
	UdpGZalbhVbmU36UhGaV3B0Zd3e+bFfOSbNh2prx3OX8jC2ZalqHdBDQOg1nZREl0RZOnrN5hNr
	EVKDY+2aBao/GkAk4vU75Sj7v/R8HOSP2efgnRKoKMmKjiu2LNLpDzwH6gIUiXAw252zkM0SF++
	JUDdBvgZ/NvEV2OiwtZuaNBLfLaSbQfCUZ+hh3+Jznvs16Pd9bnOImScDXXd8KMIaFIpZgGEZiw
	7P5ha8oQmg3h8rU/SxCzodcTvd/xvS/W3GUkfBct8dC05PGJ1gy5pjdoM4LDPGwoIA==
X-Received: by 2002:a05:6102:5811:b0:7b4:879c:bb8d with SMTP id ada2fe7eead31-7d0727b10fdmr4067408137.37.1793631300981;
        Mon, 02 Nov 2026 06:55:00 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d077393404sm10074537137.2.2026.11.02.06.54.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:54:58 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9950a7530d9so708714241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 06:54:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzRO2T2hZaTOrq7yONQJ0jTxAq9TOwYtgG8QRxmU9qCreoCGl0gsM1cRakvr4SIivFtnEL6eX92DWR/4g8Pc9p1dQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3f44:b0:7cc:24e1:77b with SMTP id
 ada2fe7eead31-7d072270da8mr4006528137.4.1793631297177; Mon, 02 Nov 2026
 06:54:57 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031194225.118516-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20261031194225.118516-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 15:54:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWp_Hozv0AV6utNDDPP1=gGZqBa+rRUhguDxJg=ZXssDg@mail.gmail.com>
X-Gm-Features: AclHuK8owA5gBLpZ-YfZBpEjdWIL1T2us-ie8-rr38WVdKeR-uDunLB-LXslBB4
Message-ID: <CAMuHMdWp_Hozv0AV6utNDDPP1=gGZqBa+rRUhguDxJg=ZXssDg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l: Use str_enable_disable() helper
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Oct 2026 at 20:42, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Replace the open-coded "enable" : "disable" ternary in
> rzg3l_cpg_pll_clk_endisable() with the str_enable_disable() helper from
> <linux/string_choices.h>. This keeps the strings consistent across the
> kernel and avoids duplicating the literals.
>
> No functional change intended.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202610301526.XkacnSyK-lkp@intel.com/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
