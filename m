Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24E144BC87
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 12:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710740; cv=none; b=gmtzgzH19aMlhoHbSbdLbe6HgYXBclAHgQ8EJZPXqKFMBD6xyRzYjbrZgIiXpi2KdCPsSZg9PrcOrl4kQ89nCutmPzZzku9xvIYuby322TokPheR+dzKBU/mpPXYF079ALUc4sGPjWn/bKZIYtvHbevycXPDeKS3KyZFarY+hgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710740; c=relaxed/simple;
	bh=sxaBBBN0zEuMV865K0dBZi/0kgS7VdceuSbNoNUPIq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itYpETTwul36hHl14obyQz++1qUgbjF6Xsl2bRIyp4VdFduZTr+gZIhFcuTLAMvMbTlfeT4PbeIXvf3vOKiT8JbNR7cCfvJhLlUAFWYVcgvYGcOOpZBfWsrLTwa9GvvTusnB8egp+A5zaLvAuknF1j1xPoeutHD8W6R7rr0/TDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso139576666b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710736; x=1787315536;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MwFvu+QAfOdqUmiQz3HyTrV8yaD0qjlQFuANuOajKio=;
        b=CIHQsAHtFbhur4PeLhkuL4tvbjBvKf/2jomh0S48Wo+zGBj+6UwpHzknAf3NgtMZRu
         C/O11qmLgXwwSshhXJLH6lRTZnBAFv2hFouFIoSRf6G6IgaG6Z/frzHG+bj5vOkDDI2i
         yTCGVge5mJU5YjF0LaK8XZNfgx70xsSg2EeugC8PYTbkV4+QfkyBLeAQKR4b6XKPDmcf
         yAoqHuMqkhqecD9c5lz+S4Cl187IVlbsU56O8WyPoNm+4xlBAOlCBqDn+1DNO5luI2f6
         LYhysyNiCKaUGK6oGwJJLoVQ6gwATpS82R9AYas4feAKBh4i2ljMCaWrXTTBIiz8rlHE
         tCbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrL0QyVTbDEvEc49l/Mv4xx4P6tfxW7I9OWKvmqlWX0uht8uJN3dab7Xr09EPgkLc3cKZAiudiacA2yCgq14sVOvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlgq46Vj+4gtDY1igce53bmUfMoeu8fFzB1yGW3Mja6EHy5M2T
	68FrcYW+gLrjh5JpFw5jO9s/KMIyY91DTk4z3U4dWF6ofEQVKogwPzybvSIu/YfG1as=
X-Gm-Gg: AR+sD10QPF7gSgxI7JfcHO6+bJRU9iwy56iyju5mZXl+YRYLRkdwy/u+mb5rRYsTRBo
	yZx7NwtGg7LkUqJq1/TW+dpCKn5DPu1PP1E6ZHhyUX3ak61qr5NZdAKhntMrLmLpVnMV/qvWSwd
	S9EFhh1BYwijBGA8w2yFsFFgWfWbRUh3UxbasPov5jpirWgbPglrpAWd1Ad53eMoh7Uy81y0Wjh
	egrLVcKMKQhU3VNocnrR6KQdbK/76DV/7vX3MHvlJf2DMkomZX/R/423QUJY1bvttJInFSbGZfT
	pptTo9qvfwEeRMBvZYGRrCavBIIjFl2gP3cxLBHgDAy8SQQWx+1Lthszf9My7QorHZ577A5w5Dh
	cAMo11Tn1yID995+5g4tEryeNPHynYy8Q5CIqw7QbzAygE9zZ0MALeD/OQhCvjZX/Sbq0D3bk1e
	8Ahy7cm4jbQzF3TBaRj+nfl9jhGLLwHaDafr80GyzbmURQUfs5COS0ynpexhtKVwjfolelHF0ru
	Fl0rurd1C/K/WGNKlFb3140rkEUHPs=
X-Received: by 2002:a17:906:6290:b0:c20:3733:a8c5 with SMTP id a640c23a62f3a-c212a0ea0a2mr252027466b.8.1786710735691;
        Fri, 14 Aug 2026 05:32:15 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21238443adsm96862366b.59.2026.08.14.05.32.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:32:15 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso1374096a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:32:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr3Y4RQBN5FTcoAqgz30NjjF4bHmAhsNGq1qgur40dvn64p2CYHbXcrJn5JOm2Y9roaP1sfp8j2nhrIqzEWzgjL9A==@vger.kernel.org
X-Received: by 2002:a05:6402:2352:b0:6a1:e8f4:8236 with SMTP id
 4fb4d7f45d1cf-6a38a9b342dmr2549519a12.21.1786710734920; Fri, 14 Aug 2026
 05:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:32:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdViJB2qvzbOkX7exqpq7gF4tbBcNYMHmCmEXHSh6AYfew@mail.gmail.com>
X-Gm-Features: AUfX_myLNki-Fq81a3NfDSUS9sVpJd6vtqPz5Vj64H1v1xbp8C0TezxjP2g5L3I
Message-ID: <CAMuHMdViJB2qvzbOkX7exqpq7gF4tbBcNYMHmCmEXHSh6AYfew@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] clk: renesas: rzg2l: Add DSI divider clock support
 for RZ/G3L
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 11 Aug 2026 at 20:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a new DSI divider clock type (CLK_TYPE_G3L_PLLDSI_DIV) for the RZ/G3L
> SoC, which requires a different divider implementation than the existing
> RZ/G2L DSI divider clock.
>
> The RZ/G3L DSI divider uses two cascaded dividers, DIV_DSI_A and
> DIV_DSI_B, where the effective divider is:
>
>   rate = parent_rate / ((1 << div_a) * (div_b + 1))
>
> DIV_DSI_A is a power-of-two divider with values in the range [0, 5],
> and DIV_DSI_B is a linear divider with values in the range [1, 16].
>
> Introduce the g3l_dsi_div_hw_data structure, rzg3l_cpg_dsi_div_ops, and
> rzg3l_cpg_dsi_div_clk_register() to implement the new clock type, and add
> the DEF_G3L_PLLDSI_DIV() macro for use in clock table definitions.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Introduced the macro DIV_DSI_{A,B}_SET and used inside
>    rzg3l_cpg_dsi_div_recalc_rate() and rzg3l_cpg_dsi_div_set_rate()
>  * Simplified the divider to "(div_b + 1) << div_a" in
>    rzg3l_cpg_dsi_div_recalc_rate().
>  * Replaced the data type u32->unsigned int for the variable divider in
>    rzg3l_cpg_dsi_div_determine_rate()
>  * Moved the declarations of the loop counters inside the for()-statements
>  * Updated the comment sections in rzg3l_cpg_dsi_div_determine_rate().
>  * Updated loop logic in rzg3l_cpg_dsi_div_determine_rate().

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> +static int rzg3l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
> +                                           struct clk_rate_request *req)
> +{
> +       struct g3l_dsi_div_hw_data *dsi_div = to_g3l_dsi_div_hw_data(hw);
> +       struct rzg2l_cpg_priv *priv = dsi_div->priv;
> +       unsigned int divider = dsi_div_ab_desired;
> +       bool divider_found = false;
> +
> +       if (dsi_div_target) {
> +               /* Calculate DIV_DSI_A and DIV_DSI_B */
> +               for (unsigned int div_a = 0; div_a <= 5 && !divider_found; div_a++) {
> +                       unsigned int div_a_tmp = 5 - div_a;

So div_a_tmp is the actual value of div_a... That is confusing, so I'll do
s/div_a/i/ and s/div_a_tmp/div_a/ while applying.

> +
> +                       for (unsigned int div_b = 0; div_b < 16; div_b++) {
> +                               divider = (div_b + 1) << div_a_tmp;
> +                               if (divider == dsi_div_ab_desired) {
> +                                       dsi_div->div_a = div_a_tmp;
> +                                       dsi_div->div_b = div_b;
> +                                       divider_found = true;
> +                                       break;
> +                               }
> +                       }
> +               }
> +       } else {
> +               dsi_div->div_b = 0;
> +               /* Calculate DIV_DSI_A */
> +               for (unsigned int div_a = 0; div_a <= 5 && !divider_found; div_a++) {
> +                       unsigned int div_a_tmp = 5 - div_a;
> +
> +                       divider = 1 << div_a_tmp;
> +                       if (divider == dsi_div_ab_desired) {
> +                               dsi_div->div_a = div_a_tmp;
> +                               divider_found = true;
> +                               break;
> +                       }
> +               }

This is basically the same code as in the other branch, just looping
over a single value of div_b:

    unsigned int div_b_max = dsi_div_target ? 15 : 0;

    for (unsigned int div_b = 0; div_b <= div_b_max; div_b++)

> +       }

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
