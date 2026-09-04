Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48399477E57
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 12:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525871; cv=none; b=S1nLE18zFYrXCqaToDsUy5mjWBEM/Q2yHXiuBBVRbTwZ6OpDGzmxtq6SRsKHKP2VkURtzqExBY7m1tIxOXPxO79jOLNLpSPo1BS3uWBdHzpJrQuuTzqOlfIUlD33/nH51Q0pXNc1ev1mFdXgJGcYSwP/O0GTwwgjmmBcKaiacfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525871; c=relaxed/simple;
	bh=rHB7rehoOlZbxstD6lbTIinMurFJh6tn3L0YtYVOH+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=drMweSwScdHpybAxwVbZTxuQ4jE2k68EE/aUpZodpuCW83gxdRgtW0+EG9+ObcVsB/XGHtIzckSVTFUXIfOshKFSaqo5gubPvZYj4JZhRGzG8u2W1sAXq4X9op1zi0nxgvaARWLQSF/rlN7BgOeUCVxNR/7yJj/SRtW23Rklf/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-782af6c753cso945798137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 05:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525867; x=1789130667;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X7GYFb8ObjcCzbJF1jAT3MEmY5+IWm6xkKfaRZugkok=;
        b=aJjAoHN9ziBWmBujXmwmIrvXUS8ctcUf9UvxGFTM9mcJlMm0Skp1Z3C/QLAylnc1er
         AT41YFpyFWWTTWPLZ4QqVfGnOrn0PxkXM0iRhJydk0Cz5QOpoM4nq3NHEIvav27aLEVm
         XEGNjihrQb5T5qGdOLfdXKXDpiz762yRXvfpJ+DX/4SMeqzj0MriPO6mktvhNy051Qt/
         5kVT1X+YoQ+Iy280Jvp6PCd3Cnei9RKAhRm0mwS9Fjp6rkwYJ70KbicolYUWUvj6+Z5i
         TAgNb30ySZ5qjo6cGeb61kVzsiY25AeM1YwmQA9Pjdtr1J1ps9D5NR0K4Pe1hkW/S4K2
         cIaQ==
X-Gm-Message-State: AFuF++n3OLHeECYz30Cs5g4YPE+UPuSYXJRc3djI5CYh0qpN7yAR2LML
	yRkTeMoN9NVYE2DfRLx7w0+p4Bq6h1zXAAUAZR+rx4K+jk1qph1UJTpvD458gRE5tdI=
X-Gm-Gg: AYBFou0Uy3c7otWuKb8J3E9PmaCRhDchogXGNY1025lnu5nyu0EwAmCEiqgDtu1+bKd
	X0HuQNaeFp12RXmkmFeB2KoQiMq4BFzFw1h4uqLWxi/j6DdajBiZFd4XwKJoqSGV71MxKeY+CEw
	vLFNorfkUyb86m0qiUZfmFimt5NpJ+CpiijWr26UiyaWuvvTFOHxg0uYbujrRdEdqjNZ1/y1O4H
	jOlVBfvMXIEKAm8e4GiCCLAwRegBAQ9HVSi+Er6NDb+6N7XQNKFoPJ4suJEiFApvRCVXDxLhHNS
	dVdDZhPAZMMtUsFKZuls7ozA1zpWhTLN/mcW2p5lNR7qzjWulZ+qoXjswLs5v6sMkFvHiul2x0M
	InY/EGOVWGS4CBFkBmla/m0kzJNyorM+QtFT2Ovd2SeEUh1XLcK4k2/PkNH+HffMW1WDa5NlxRZ
	IQCN6saK9kvM51+IGT/JExVuo7zIKWFkf4wxp2TYsjzS1FQoiyzMkxTD7IqQn/yhGUx0gbpqXwa
	SOfVuqQ8H2QaOo5WUPl6ZmZ0A==
X-Received: by 2002:a05:6102:5126:b0:785:5a17:739b with SMTP id ada2fe7eead31-78a4a4944femr2107708137.0.1788525867062;
        Fri, 04 Sep 2026 05:44:27 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98097de57d4sm539113241.10.2026.09.04.05.44.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 05:44:26 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-73720e58dafso634029137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 05:44:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8e:b0:786:e7a0:603e with SMTP id
 ada2fe7eead31-78a4a8b86demr2120669137.7.1788525866617; Fri, 04 Sep 2026
 05:44:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com> <20260825141542.30901-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260825141542.30901-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 14:44:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXj14sZXrcPhNA7HZ8+nB9FYypcOhNEYpkhYj7YZsMQhg@mail.gmail.com>
X-Gm-Features: AcwNN1XPYwq96qhQmx4WPVu51XNqxvA6TQNjfaLRuNelQJUi_vPdQl2bb7NiYmg
Message-ID: <CAMuHMdXj14sZXrcPhNA7HZ8+nB9FYypcOhNEYpkhYj7YZsMQhg@mail.gmail.com>
Subject: Re: [PATCH 2/4] dmaengine: sh: rcar-dmac: SMMU doesn't need IPMMU workaround
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 25 Aug 2026 at 16:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> R-Car Gen5 doesn't use an IPMMU anymore, but a SMMU. So, the workaround
> for the IPMMU becomes optional. Add a flag to distinguish. No functional
> change.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -219,10 +219,12 @@ struct rcar_dmac {
>   * struct rcar_dmac_of_data - This driver's OF data
>   * @chan_offset_base: DMAC channels base offset
>   * @chan_offset_stride: DMAC channels offset stride
> + * @has_ipmmu: flag telling if DMAC is connected to an IPMMU
>   */
>  struct rcar_dmac_of_data {
>         u32 chan_offset_base;
>         u32 chan_offset_stride;
> +       unsigned int has_ipmmu:1;

broken_ipmmu_microTLB_0?

>  };
>
>  /* -----------------------------------------------------------------------------
> @@ -1877,8 +1879,9 @@ static int rcar_dmac_probe(struct platform_device *pdev)
>          * can't use it with the IPMMU. As the IOMMU API operates at the device
>          * level we can't disable it selectively, so ignore channel 0 for now if
>          * the device is part of an IOMMU group.
> +        * Not applicable if system uses something else than IPMMU like SMMU.
>          */
> -       if (device_iommu_mapped(&pdev->dev))
> +       if (data->has_ipmmu && device_iommu_mapped(&pdev->dev))
>                 dmac->channels_mask &= ~BIT(0);
>
>         dmac->channels = devm_kcalloc(&pdev->dev, dmac->n_channels,
> @@ -2000,11 +2003,13 @@ static void rcar_dmac_shutdown(struct platform_device *pdev)
>  static const struct rcar_dmac_of_data rcar_dmac_data = {
>         .chan_offset_base = 0x8000,
>         .chan_offset_stride = 0x80,
> +       .has_ipmmu = 1,

The issue this fixes was seen on R-Car H2 and M2-W.
R-Car H3 ES1.0 already existed at that time, so R-Car Gen3 might be
affected or not.

>  };
>
>  static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
>         .chan_offset_base = 0x0,
>         .chan_offset_stride = 0x1000,
> +       .has_ipmmu = 1,

Let's hope this issue was fixed in R-Car Gen4.  Perhaps someone can
verify this using the test Laurent shared[1] a long time ago?

>  };
>
>  static const struct of_device_id rcar_dmac_of_ids[] = {

[1] https://lore.kernel.org/1422137953-30156-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
