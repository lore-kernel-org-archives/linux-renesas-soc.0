Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B407041C300
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 11:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907017; cv=none; b=ajLPHGlua9JV3qpySmjaShFiMskOFM9RzCakFrLvpGaIectG9DSSlDaOm/7jEB5rWZ3mNvRBrsZcl6c2D0eijWCxmI8ohaG9iiX/ZZ06lX4MXtxz2VblwgNOJE3GTDWBDDjZFIq+DOiVSMBVe/RuQeqQC+pVLyVgOIlCRTX20cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907017; c=relaxed/simple;
	bh=Yt74Pwf1lMdOPJDNa5I9rk37qMEnD4Vx9P4hWUTzXJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKb2OtsVpkRvS5GtNxa2TpJlkotH8ljVHcx5+c81vVk92rW0tnf9YWvf4iLLQmFODow3qu6hAiUBuxF9H09ZIjwnyvmSuIzJxkF9PYCtmmFqiaiAVTsbfXyYGtrH/K3JUvuXHgDLmrEJWAuXmqAZYcSlBL7GMteCO5K/IM7vIfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-563610de035so4008408e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 03:03:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907015; x=1769511815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mc4ovVXcdd2t1CG9+kKl14hd1FxE21SIum3OHqj6bo8=;
        b=WqviFzPe+ztMnudeLCDq6U4NtmveNdNfaX5HUqzObdwix0BmZ3r+y4HI0SudhBYTlU
         T0mc+Y0zguTwC3ZMS9D27mIcWJW1U3MrVDkH5wqoJsbuq0L6RUo2uPJ/ykS1yTSnuyeN
         wsuxZX6N7Y/bDx8UeA7eZ9KpMtGasBk/kG2jY/nyQfdvcKCYpIPIZLdwd55CmQ2eGzJJ
         xWEdgnPFgmoOfwA2OWnZ6vUguWZJ7cqxhWKJNjUPliZS03d3ASZut1PRRsG4IG4Kp4VZ
         kv9/J3z901X1zRKK2dfpklXN5uUcJoAgJaaSoDuxL0/VtNTK9/jXYTaSGiz1A2MZsaKG
         5rmA==
X-Forwarded-Encrypted: i=1; AJvYcCUjF9q+7IYfGx92yN/ySSQXwdcAb1gPGluXSAQxgcij69GmUEXbpLR8oNrOedCMjfr0X+UtfeAyX/MKmfOEk8fprg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Xs0fmPqkyee122/lvr1xLlcG4rfuifMmuUr+sFazcSZx5zdh
	g4CEUs/9Cgq+ANTqO2bLOCVhATf3ebep0Dl3FcfBBKoT3OEBf3KYX+v36TkMehlv
X-Gm-Gg: AZuq6aIZKaLiq2NsPBQhpvBQX0u31BrEsA7DJTrJE/1OmO4Hjanmc24ioX/a/cY1LXF
	oGCLSqN3T6OzSC4ufwGjZGJKQpk6qqCWrVlgBltsJwZ7iUKLvIeOhNx91CIX1IoNZgH2hZdDDsS
	1zrPGMcdM5umIZ2IZ6zkX+axgRAMBCninIEzH4CSur9+NPWcdlHfHUambZVmu6Y8AMoSaQoxmYn
	0N1s+uz8LC3FnP9PG9ZKhxOW40OREh1PWnw0vxkOuTae8qwEllzR0GgJyi6SHXwE8BWmpVuzWxn
	qQJ91906tZquGfwE4W1xxy3Y/fKCLvz/nDKeMQCdkR4PStkggbKarXtEYv9N1gsz6MnNYpKsOgp
	jOP7aghZnmzgJyXO9PcgHlR/DtCMANiX/fNM/qNO+/+3EBlyUsBMKcCJRkXGLpq8FBB7EgpMgXI
	AT2U2tx7NvSNe7/xJk7wALvWNa5A6my09JU+RCbdiwstdbn6ab
X-Received: by 2002:a05:6102:304f:b0:5ee:9fef:68d5 with SMTP id ada2fe7eead31-5f50a9e7091mr388320137.41.1768907014535;
        Tue, 20 Jan 2026 03:03:34 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a69444f0sm4229393137.7.2026.01.20.03.03.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 03:03:33 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9413e5ee53eso3285797241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 03:03:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjPyZ9+KQLZ0q2S+3dXEcFkDIXPCz1l19TobpPX0QB9X/LwvVINcNK6LP+Jv5EOIMYYjK0vLRNLNllaue7jbRQnw==@vger.kernel.org
X-Received: by 2002:a05:6102:390b:b0:5ef:a59e:617a with SMTP id
 ada2fe7eead31-5f50a95f019mr413993137.21.1768907013323; Tue, 20 Jan 2026
 03:03:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com> <20260114153337.46765-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260114153337.46765-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 12:03:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXKvfRr2us9YhXh5a_qtZcv8wCvz_EnVa4PEANocg_0_Q@mail.gmail.com>
X-Gm-Features: AZwV_QgrKR7tnicz6yGCyKjhkngXRza_8zoEMe8PqpfHwLCDwwFyDmgdfB6vgIY
Message-ID: <CAMuHMdXKvfRr2us9YhXh5a_qtZcv8wCvz_EnVa4PEANocg_0_Q@mail.gmail.com>
Subject: Re: [PATCH 04/16] clk: renesas: r9a09g047: Add PCIe clocks and reset
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 14 Jan 2026 at 16:36, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add necessary clocks and reset entries for the PCIe controller
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -438,6 +438,10 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, 10,
>                                                 BUS_MSTOP(2, BIT(15))),
> +       DEF_MOD_INIT_OFF("pcie_aclk",           CLK_PLLDTY_ACPU_DIV2, 12, 4, 6, 4,

"pcie_0_aclk", to match the documentation.

> +                                               BUS_MSTOP(1, BIT(15))),
> +       DEF_MOD_INIT_OFF("pcie_clk_pmu",        CLK_PLLDTY_ACPU_DIV2, 12, 5, 6, 5,

"pcie_0_clk_pmu"

> +                                               BUS_MSTOP(1, BIT(15))),

Do you need pcie_refclk_in and pcie_coreclkin?
Especially the latter seems to be document sparsely.

>  };
>
>  static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
> @@ -503,6 +507,7 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
>         DEF_RST(10, 15, 5, 0),          /* USB2_0_PRESETN */
>         DEF_RST(11, 0, 5, 1),           /* GBETH_0_ARESETN_I */
>         DEF_RST(11, 1, 5, 2),           /* GBETH_1_ARESETN_I */
> +       DEF_RST(11, 2, 5, 3),           /* PCIE_ARESETN */

PCIE_0_ARESETN

>         DEF_RST(12, 5, 5, 22),          /* CRU_0_PRESETN */
>         DEF_RST(12, 6, 5, 23),          /* CRU_0_ARESETN */
>         DEF_RST(12, 7, 5, 24),          /* CRU_0_S_RESETN */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
