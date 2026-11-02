Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635404;
	b=qOAfhNpgXHT4HyqQFMrLZ/mtET6r6Unbf4QY43X8BmoP9zqSgaVrW5/jjhT/fgJpfKkx
	 J4+apnuhY91CG7TO97rQhydu6VuY8Yok9OyI/u+lI2ohPD5J9n7gM8KgNSGvoE4hVYlIh
	 /zwbPIm8BDsEE6CbH7dxQy2ffCfwjDF1b/VxbTfxze0prq5fI+ocuP8ccsKdZeWpl4C8c
	 W9OJLzwCySiVggrHbZp4qdkmlssD7ijrBLHyyUZETJcMuHQzgTqO/Ec6pLwwRcIQzu0ye
	 S/GsCLxomLL27UxG+r/PQVoxfMTaNXXJhjvM00w0b1O0dqfJpYBclMvm9FPvnI+n0LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635404;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=3vbLOX9hUXZuFkvJUQUq81vQYgMMNAerq8+/A9OKKiU=;
	b=29xymR2OIaEcBenHaHY7FY2IUX/IMVAJwe2IKPhVhOLVOL1ERZVN7PMgn3iHghg4ZPfa
	 PAwObfSEOEKwHyp8FMkKDo1qHtduExvfiqYMi/LHt2UW7W5RloxG8hp0wiUjQbQ2XnxsM
	 4ZxJSPiPEvws84dr4rtf7WVXNA+xdFVT8F8iyLwBcTp/vvJbFBkXdVZX19MxY2iohNdUj
	 Y1AMc6jj6oF3EoCVBCi1atJ+3B+2mBnQRQc5qjCaPogull/tbfrPNtFgim6PlmP3YcjpQ
	 Hv0ijmyvXzZ5myvoJkCqsNYiLmbJwKITnIetTm6gvQEwZta4vQeTdzdCdYHeDnqU8eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F1606A5A3
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Nov 2026 16:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 202F1606A5A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e30c26a4so810229866b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 08:03:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635402; x=1794240202;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3vbLOX9hUXZuFkvJUQUq81vQYgMMNAerq8+/A9OKKiU=;
        b=lnIQBXg7HKexO+vAGX22Dw6X5QxN1xHXyCsKNCV/PZcO0ozYFZQmc8YY6XR9cQsGM3
         v2cLVhDPdG/vDqdb19/G1VulBHs5bNgjUz0HVr7Sauw7ypi/6KNvxpCduG/Ay8eLajWz
         tGafrf1gYWFoN6/BUOng5r1LAY0MLI34dXiLprXvcpVS587tCu3Zx4NvFX+U6GLFSOzo
         VZHVu7fsy69IMfoHb6hgfBb1P1T9ZFuTCZcspZZiS8qfV4CvzjnKsBPfw8+HORULsIbQ
         NKeY9pNPf2Ax7Nwf/Au2YdHw8ZHQyWN7Wkpx4babaHR7X/y5ShIQT0aZkR80JKQi2tGx
         IXKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXrfav2iJDU0X8egPlPTo203WtF3GFStDxgvEyQYrxmtpNuk++mfPevqnTtWRHvtRfoiXOLcrl3pnQgTtA0xupGw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLP1Jk2G379qxRQhNu6XAL5o7+V1K4AmlTnR23uDajpOFPgVaU6
	JqMz4Z5T8LhvYalSaPnC+z52vzvMQpAyVhlirOYYwwWvXtgMhpZNh91gg4HJ0YB1CP8=
X-Gm-Gg: AYBFou3zPYVzRjLya6ciE77PaIbvl1UuqI+YLs+U5THcmPbAsfasWcbDzoGxe2cumyJ
	PsAtR70l+XeOT33xH9tFTk/ndMMHTj1Ju4kI6Q0Pu1Obdbu115wRbNaCuJ7Dg8DcYAAQgKATE39
	Hn4nVB/sFS3x8Ecoqp9FvUjqcWN+d0xbNpJE4k4kUN3v6d4EZSFl0BOnnTQotJtal/6CCaFaUss
	6peyFeyE8SRDRQAmhJguAyTHsqq4EAGv/ODplmxHa6bVMLl5AlunonRtjr0WXfPboTXa32rblJ0
	dQeEom1vVGxskY6iRUKxxSQIFUh6oGLK2dHJGam8MdyQFJdwPDgijpwvGmvL7WdK7XBE/W+l6qv
	Fqbp18+sJpvffYqD9ifyr7hoylfrVNxXpVBmzMQ6g/n4pVSYRZ0mVTIC3AlrNCKF7/fmwlqkcv5
	xZRWK7ITxdc+U0M2Yn17jMD1PyHkH8peGe9l6NjsqRHOsKvc6WwyjKs/w34tgmcvvD12aJTw415
	h1Fc62CEOPebViDaC/Vb8JTWratMqLiMcw9BPiLaZHuL9Zjt6jep2X9OQoylQY4B2zScZ2QRCt/
	/T10474roQsp0GwtyPhlybtv/q8LfHBXc8thN5TOlkrM6R6VwiC11ghzvxoD39DyS3ckgviv+bj
	tB5u787h0spQ=
X-Received: by 2002:a17:907:934e:b0:c3e:d0ca:d30a with SMTP id a640c23a62f3a-c4ca7a423acmr896143666b.4.1793635402314;
        Mon, 02 Nov 2026 08:03:22 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebd348c7sm4825066b.12.2026.11.02.08.03.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:03:21 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so4433831a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 08:03:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzABYe8bhjMToLBrGpo/+x2IvgNe74Rx4nwzpXxmk6WLREmBM8x/zEQgNd/I6N5zplPoReWaQlZ8sUcyy054Chebg==@vger.kernel.org
X-Received: by 2002:a05:6402:234a:b0:6b1:a67b:d378 with SMTP id
 4fb4d7f45d1cf-6b4d6d83607mr7493394a12.17.1793635401030; Mon, 02 Nov 2026
 08:03:21 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-0-47f23de6bdb1@bp.renesas.com>
 <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-1-47f23de6bdb1@bp.renesas.com>
In-Reply-To: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-1-47f23de6bdb1@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 17:03:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVv8JW2fdZ80qw+TUBjG3Rt7o3wKvbbm+T9vQCzd_mMYw@mail.gmail.com>
X-Gm-Features: AclHuK9e8kCdmujm3UbBsCP_C2y2QUNK5imSGIGpgUeiTEwk-YufKAJHK9WyYf0
Message-ID: <CAMuHMdVv8JW2fdZ80qw+TUBjG3Rt7o3wKvbbm+T9vQCzd_mMYw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: rzv2h: Forward PLLDSI mux rate requests
 to the parent
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, tomm.merciai@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 15:26, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The PLLDSI mux determines rates itself, and on the LVDS path it reads the
> PLL instance from a parent that is not the PLL, addressing the per instance
> parameters past their end.
>
> Forward both inputs to clk_mux_ops.determine_rate() and let the parents
> carry the request up to the PLL. The parent encodes the output type and is
> selected through .set_duty_cycle(), hence CLK_SET_RATE_NO_REPARENT.
>
> The mux wrapper is left unused, so register a plain struct clk_mux.
>
> Fixes: 3afccee4a3b8 ("clk: renesas: rzv2h: Add PLLDSI clk mux support")
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
