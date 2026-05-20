Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2193B3A5429
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 08:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264556; cv=none; b=CKlutgZesksog8YkPz6W0GNi01Xs7B4Gol8IuciYPBW0K4nIShGxXl2/EeS00xujOdKDF78C5OwBGXVfxxqi34XgIeoqpL9Y7vYwajp3FzzUXCLulBc+4bWFLchSu0qSjSQAEnEbzelKsIQXTwothSLIr7R6lYDSDjgGCAOFFS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264556; c=relaxed/simple;
	bh=43paf5cDb3CO+Z9mDkg/D4V5hF13GuV8SaLe2Di137w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p+11WwUZYroZ0Eeyh2g+vYJifdOCN4iven4Kjavu9Iu5xMUoM6Bn7NbuhTZ0JlFmisLp1ocBf3fIFNXxcaNuqP9NfQAT2xlezfvsOWlPwEoW1PZ77vWmqQVHQkXMHZtJTyb1RsHw4UvlgR584ETOWkHo+Q8OPV3BnRs3XxmIG/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-57746408b3eso2646822e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 01:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264553; x=1779869353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98iWXm37oeIZJPcRwOA5t0U2vMQXmomEgxuUhcgETnA=;
        b=BGIsRPHR+xMYuK2TbCI908eooXfHIC+qLAntLR+iiSM/Vo0tpi4vz/vasqPyX7wOXP
         GiKTuOjLWqsrn/Q8cbinX86+8HDJ/UsBIZBdUZ8sksy771hKRMr2JfrBpTl4iznqBegR
         u8kItbV9g2eLdmXk+7szjSVJhHgU4EzwGnOYgl0lek2x60k72YwlnWiWyKKFIg2jx97M
         9C+DpM32Fo6TTj8dWX6ynPvdsQhQa4vyFDVdrgoCokCuwwnvmdPdLvcc/ZRTbszR4UOA
         BVK7kdDebPrZj6cNi18qQNFVNRfJCPzpYvCrz6ju+RMur3hk13WPg+wYFrdOEzLpTudy
         Z+hQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eM6221GqHhwCw9UZ5bmReghEPCZVAadcBzdbJga1ixIs1nH9z/Tm6GpVr/ppxWZfeW5x6+Kt93vOTW7l0RC/uow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH0fJe7P5f2Rb6Uyf0N89iS7Y7yd5MvQ5rpzydpFUm7eZK/48u
	dFGzaKjZsbzG+iw4REuMiCdfYYaK1/LCU2mXNvPFRdK2+iLGPHmBxhV4R6p9y8e9qsM=
X-Gm-Gg: Acq92OG5vdrCaKNnm/Cglmp88x2jM25/GvOhsXCvbjXCKKqgHUnO0rhcqTfzPwH+TgR
	phrJbcehMN76drL4x5WHL+Bbs8tLr1nNT0JaHnUjOMt4Le00XfIZ1uNE/PKhht0M4UraH0kTZO8
	OfiOhytSg54LTGpF4jELHv5P5ZsWlpNvzl09yS+J9AEjzXCVRzwbgQNPdTVfsj2UhfAKDkvmdy7
	xyVz3zijC664jij6I1jn392gTXnmmdZQaQUyiRiTND+irQbjPjnbrz9M+nRQ6SEhwI6Ia5KflIe
	3iv34Sk0QzA+ZRYuL/IOKCMnU8JgmbvGMMeqh9A0iOeoI7fmImHsIvkBI0Go4cnoCBbSsC8IsQp
	PVjqzr+MjAWkxUrsAtpx9V9boBM5+gMTruZEeK8atnRcbBA9xcP5r/oek/kmAaD+n6GZmOBKzdc
	23nUit96kMofwt50g0FbgCkjNeZk7rvUtOWq/KylFV5SI5eGi/ZPbpTH5Lpg1nrVAr7KcWxfq7d
	t0=
X-Received: by 2002:a05:6122:6e0e:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-5760be6ea63mr13729193e0c.4.1779264552925;
        Wed, 20 May 2026 01:09:12 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760f5db452sm10590706e0c.6.2026.05.20.01.09.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:09:12 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-57746f02da7so2956429e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 01:09:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+qHlrIsV6md8lJ6PyKACX6BFK6aXUkgIFKRg3yhwEwzzbomhPlCA3fFMnxDBHjk40WNi0Q1fec9nxI/OjsWYyiog==@vger.kernel.org
X-Received: by 2002:a05:6102:509f:b0:632:a084:c0f7 with SMTP id
 ada2fe7eead31-63a3ef80e90mr12544737137.17.1779264551194; Wed, 20 May 2026
 01:09:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519141518.389670-1-biju.das.jz@bp.renesas.com> <20260519141518.389670-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519141518.389670-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2026 10:09:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5MO=Yd_vWeMe4R52XNPQW=8qAH0te+62SeMBx3g3SGg@mail.gmail.com>
X-Gm-Features: AVHnY4Jdv__xMD4uqX0rmclGKJdz7gNLxB1vTLBnb24KZE9jBc4jZp50p-9Si-A
Message-ID: <CAMuHMdV5MO=Yd_vWeMe4R52XNPQW=8qAH0te+62SeMBx3g3SGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] clk: renesas: rzg2l: Simplify SAM PLL
 configuration macro
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 May 2026 at 16:15, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace the PLL146_CONF() macro and its associated CPG_SAMPLL_CLK{1,2}(n)
> helpers with a single CPG_SAM_PLL_CONF(stby) macro that takes the PLL
> standby register offset directly.
>
> This removes the implicit coupling between PLL index n and register layout
> and eliminates the now-redundant GET_REG_SAMPLL_CLK2() macro. The RZ/V2M
> PLL4 definition is also updated to use the new macro with its explicit
> standby offset (0x100), removing the local PLL4_CONF define.
>
> No functional changes.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Rebased to renesas-clk.

Thanks, will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
