Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031493F410D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158179; cv=none; b=RXmNOJTsSruuxcFNLzh4x8oGmzHEkY03db6d/K0t8Jwscl3miMlHKV8eemg1+/sUtLJ5qR8MZxZwzi0ksfhudBMgi6q3iUt7wbGVK4msBmYt0HAk358LWGTgkM0vqNBgV8gNLvSsdtkxFi5AGl7CU9tAaLYgOcucK0Im26bJ0t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158179; c=relaxed/simple;
	bh=2LdCcTq4LNtMTs4VP/lve2MGkZ+oDMGD2pGvHN7osSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QyKS0sewI3VxmNLfFyjVjF+AtcT72o00hmzEu5wp7VWxNbH0mRXwvQJBUCMuxigCCc2oeSvBTkX6vGrlx8SQq61H5UjHMYW5E+QEADaC5AvkWCfuijY9/1SgXrhysXx3SuDhrxo+tTl5yU2AiHnPQR8f2/+KSWPMztSE6NEpV4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee6so299716e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 03:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158175; x=1790762975;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5JmHt/Rh/an+rJjkQKYQn4lwdATJnF0qKTKMvhSPsOo=;
        b=09aOrQYFs+KvM3hj+OU1jiNd8ILYFSqHtH+fahfyZTkf1U/fTpJ2eBjR5L/6qpdHPh
         XajycUy5CYqCcG1t3fKoMsIi3BU7hygMjtwCzl5dIjYbDDKIE/GzCM7T5HTpP6FPs3lN
         gIJsr3mTFNLOFV5RTOsKGhFplfi3ZLom5W+A2aJx793M9qG5tfiwnXKWxG4W+HcRH7Q6
         EOEPA1KHtVhX06LG/bc5S2gJMhKAL6JRw1zp4FYO521wVzdt5sk/xF2wGi+Pd/eNhI37
         bJkOp0J6u3sRi4mlIb4XxpXOgVv6fm6kbP0y52jTTSb08dnmTK71lJj/TJx4NYbZhTz3
         m1eA==
X-Forwarded-Encrypted: i=1; AKwUvBymKk/UQWxpv2g1E0TiAU5tTCnH7dqW3/ttNReDgiSM/Ut6/qaOesFU2PigYPwIP7VU4E/OMzmHv9SIA9vk4wWGTQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kIK9DbBORKk8tSlD+9RArtLSrTvASrys5FpxBoUuOxedHF/rnr
	o5AShhRryfeCkODDipQTXyIJLzb+k9cLlSw5cOSd+0cYN5MbUsQ3w6R+KZGRsDaFrcw=
X-Gm-Gg: AYBFou0mdknH0ECPFzgjJjgJ7qc2+H7k9hu4PIYZpdnQsCGJ0tpRc8hxam9mfh4g7NI
	qA9DwEnk1zHja9IrfzGmPd0VPpbTj082mRTpv9/jw7Pw4QKdREes/EbtpbqPSAQ3/4csHo5L7K+
	xA6WrRBjGoWr1UE/btTrjlv0duMbgvvCe5/UgDzL2glthHGhMil+QZr+dHkDxLj9muMCI7fQHr5
	Fi702vjGKVu26LhuXwEB4zQV0kORSL++a+mz2u4KJM+QFAfp8nCqqK7IiFu/J871ndoiQhneAT4
	KpZOA/ZF51Db66LuUniowMcWgUChha0KVKgvUQv3PXwoDes/7nvB5POHl0WWcxNoRHqLtH0uxvw
	iqv7t092Z2ZYIQ2zaR2COCvFVmAL8K+HjkqNAspE7slHRpwtU7LRi1RWHb8sqVSx+VdUK4kuKcC
	VPQlcSYUw4faj3CyVIFdPQUIzZrozZdXPir+a2wS6RQjsdavQRccMJ6u7TfQthBsNpP0xnWh7BW
	ys3lXQ38eFT7fa4Ypz4qLecEmKb321PodhJGA==
X-Received: by 2002:a05:6102:c12:b0:7a7:198a:c2c7 with SMTP id ada2fe7eead31-7ac1eb9760emr1675980137.37.1790158175478;
        Wed, 23 Sep 2026 03:09:35 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f053f9b2sm2485184e0c.14.2026.09.23.03.09.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:09:35 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c72bfe7so273252241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 03:09:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx+YWg7Eb7qxJjOSwDRGr7hMArmEZInSUY1gt9oz2mTVfM8QnAp57qjDtt7Sm434dOww/gTYkqFDXFPDb43JX/Igg==@vger.kernel.org
X-Received: by 2002:a05:6102:148c:b0:7a2:2068:6b5e with SMTP id
 ada2fe7eead31-7ac1db33915mr1747643137.24.1790158175046; Wed, 23 Sep 2026
 03:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922042707.116378-1-biju.das.jz@bp.renesas.com> <20260922042707.116378-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260922042707.116378-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 12:09:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyxEY1qOeq7EEHN+o-Buw9pv-Onb0+PBM=Sr-KUaBH_Q@mail.gmail.com>
X-Gm-Features: AclHuK90RfgbLCVpd5oXAGDuN45J9ZOaUMmASuNEB-lgAPFfCrXT51zAR35pjWI
Message-ID: <CAMuHMdUyxEY1qOeq7EEHN+o-Buw9pv-Onb0+PBM=Sr-KUaBH_Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] clk: renesas: r9a08g046: Add TSU,ADC1 clocks and reset
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 22 Sept 2026 at 06:27, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add clock P20 (PLL2_DIV2/8), module clocks for ADC1 (ADCLK, PCLK)
> and TSU (PCLK), along with the corresponding module resets for
> ADC1 and TSU on the RZ/G3S (R9A08G046) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -559,6 +560,12 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
>                                         MSTOP(BUS_MCPU2, BIT(0))),
>         DEF_MOD("gpio_hclk",            R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
>                                         MSTOP(BUS_PERI_CPU, BIT(6))),
> +       DEF_MOD("adc1_adclk",           R9A08G046_ADC1_ADCLK, R9A08G046_CLK_P20, 0x5a8, 2,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(14))),
> +       DEF_MOD("adc1_pclk",            R9A08G046_ADC1_PCLK, R9A08G046_CLK_P20, 0x5a8, 3,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(14))),
> +       DEF_MOD("tsu_pclk",             R9A08G046_TSU_PCLK, R9A08G046_CLK_P20, 0x5ac, 0,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(15))),

Table 4.5-10 ("Registers for Module Standby Mode (2/2)") states the
TSU bit is located in the MCPU2 MSTOP registers, but that seems to be
a typo.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
