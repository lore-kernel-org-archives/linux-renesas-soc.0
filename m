Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B5149E5DC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163969; cv=none; b=ONZlUVueS+QmboSSzSHlVak9GklZAdZebTIEetwgIITEm7tXDOo9xeEP1ApQTb5c63GWBPRT2mUav5IWwB+bm6nwaCh7LivFVKINvCIT+ec/OgilynTmm3KHV/mECEe+Qj1PmTf11TEVKRxmZs6U57Fl1S0Fbir7hOftWIMw22U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163969; c=relaxed/simple;
	bh=qBZsBwNLRX+g5XOly40nZlG/H+p+IdNWLBlhUC/CHn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fwGGwpTdtwA1nWtoGtrvwOy/pdqT3+gRYVX5BHxGzTBDt+h49fwYNHGMVg6iJcU/P7yL44HCgELqFBcVsSiYe52NlnbEhDMdhWjFs6o/LCe2yCx5iqCvJOBA9kSOjnwj9nOmYB2mJ0ZwQscB8pcGDhylt58V4AlQT7SQsKGRNkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c72bfe9so276331241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 04:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163948; x=1790768748;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pEC4AigJ1rNzvkNiOygWPr/6PCYaFxhpSnly8JjX1tA=;
        b=iF9oPMKclowM1hPioIYpwJWfCRH2NltP/pMigMQhTtWr/rcM0OucNjK/l8Z1sq/1X9
         65m0DWORqWgmhjAizsMLqyBdFPFeovjnwcwN0rUz83JuPc1QaYpsHZVeEsMAdCZbUZEP
         HknmUHhHnVQPAGyzblQ8rWbqoJbp1UN4pnt05OtsJrSj9opCYuDPsHG6YiZ48pL3LSQI
         6uOsfETx/1RR1BqkZxDAGBV1FcMNbsYDt4smccZE+fxy+h8r3TIb9GeQh8pibBKZxpmE
         6d5/9k7spL1bADEHCJtE3wIy7oRpe1oMyG/l0iE3Wy1hHYJhWIx/mvCYrfFk1NyhhszM
         0Bdw==
X-Forwarded-Encrypted: i=1; AKwUvBzntCZqT12/KPSdnq+lQOo0ONnffDrAkO150wJe4STlyjqIsYt3YdtGI0fx3OcNLI8A4ywcFAEGwX9Mtmwol81vdg==@vger.kernel.org
X-Gm-Message-State: AFuF++n+48PgN6SRPwZ9ItBG/m7+acyT+7bbr/hbCbi6+8YzDnNFGD2p
	zX6Hr95zGWfA04WSE2YALDocWJ8KQFeM50U9jnrrF4lUCpEfHPAwrlLu3aJt8xjv2d8=
X-Gm-Gg: AYBFou2wiSm+ktVAIpeRJ5LjkMhZcjGroFxuQhewRdLqPUatzsrTqmHcjm+eBCZLAun
	XsoBeUIUh/pScwn6Z7LUh87Ir0xhNjkKR12Zta4vEXjlwppbz5/0v+NrJxZh667fzRfirksdJEG
	I5j8fZmUX+ScHkiopBp5EZYvawZ9pT9F3q3MknPD5+nKb6/ShTw+ODT908FWXVnC1830/RkISGd
	szPKWqmq5nwpYYGUXgz19xYzW7RtWlfA6gZG/KfTphyGyolM/R8L6vgm/xIleUI1d0xQuTm+L58
	l6ro9T6t1Hg8PNmaKZSquJEaqS0xtUjy1kV4iEQEpeGLDMsbGvtPCVznFahYiiIrAWs4khWQNQn
	vNdDrT5f0UM6PI+cPVRC/DtwkCA0faRd0aKQtT+2gA4s1jWY7V8SShGtxCqEsQ4O1wFap8c82zX
	wjoMXDNpNojGQ/D2RI5JLKEdcpOjVf3hjuv2EmK+0ZFuJ6UtZMbb7Kq0HobtKx3jCjMaX3igoyw
	VCyTkgCWx/xubbAozoet/ZBNKqHhg4ZogRthdkZGFw2XtTT
X-Received: by 2002:a05:6102:644d:b0:79c:2e36:a2e8 with SMTP id ada2fe7eead31-7ac1bd59f19mr1980290137.5.1790163948151;
        Wed, 23 Sep 2026 04:45:48 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf65b6a0esm3167529137.12.2026.09.23.04.45.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:45:47 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c72bfebso273880241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 04:45:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFggAvE6kSrPsLOoAWTJYkpJZ02yU+oWMeIPYmyomTLQW6OtrSPrEsuK6HAEy3DYlWAiwNn+ENJG9UZhkGmvKqhw==@vger.kernel.org
X-Received: by 2002:a05:6102:f85:b0:7a7:198a:c2c4 with SMTP id
 ada2fe7eead31-7ac1ea9919bmr2233594137.34.1790163947325; Wed, 23 Sep 2026
 04:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-7-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-7-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:45:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_jhgBFpUUBzYb_U8sp5u-M=h=4g87iSvgBK=2VULGLA@mail.gmail.com>
X-Gm-Features: AclHuK_h5MxsrDxhcMUS1bBcJVK5M781CZwgtQ6JdKTzUMPjzqK2NUlscu8dT_k
Message-ID: <CAMuHMdX_jhgBFpUUBzYb_U8sp5u-M=h=4g87iSvgBK=2VULGLA@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] clk: renesas: Add support for RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC,
> including basic core clocks, and SCIF2 (serial console) and INTC-AP
> (GIC) module clocks. The RZ/G2M v3.0 CPG is similar to the RZ/G2M v1.3,
> however it lacks some modules such as the FCPCI.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Updated include path to CPG dt-bindings
> - Added Reviewed-by tag

Thanks, will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
