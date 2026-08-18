Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C132D9484
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 06:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787036291; cv=none; b=two6fR5UNrW0poxEgdrHObd4QX3NYxqhOpAKd3Rym4gAUKGuodLqWXZT8+0vbx7frIPfO+z6BeNLBUDXZppS2iq49mTODctI5ZkxCdry1kTfxxGd1aq8Np2WLcRpossQn4wdvPNNGgcPmAjUhhrGfcukit1xx1ueoI2qbcsHsRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787036291; c=relaxed/simple;
	bh=b4NZfzsXInAfqDzBfnXs78PKv4Oy3tSAAU8GhHt2f3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjdGXSvoZBiw7wx7C8EgZ6aJfqvFx8YqLrAzugIWL3tpFC5tztc+i79dpvUyh1i78mqdaMr1gyvvkCLpaeuGaaZrmeBOXy4DWZgLFt+yoE38FV+NP1hsgAZNcDEt2WppJOs6CpuL/6DtYkzrJpnR8O8cAdKyMXEimHzALUdFZqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-74748e3a4d1so2131389137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 23:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787036289; x=1787641089;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ELu0AhEyCl7g57UsYbLgfglrPLTlAwPkVEKgX34T5NE=;
        b=i6mPDgXMstEtEPWR6xj+PLEMtmKetYGwXBQZ84ZCYsTNrxVHH56egJ6w9Qbr4071z5
         0rQkvDkjPoDKUkQRINg4gxpWLyjVWoDqOszjcSTUSxaioIFMyxHDiZTv+bdVj5ed/ilo
         xOVF3gcqEiPwCvYk6tsbs2kW2aZyCl1vXBZPVmtZGNfGRtOZqzH4xMuD9QoMpHxoyL8O
         iPVAOCRamHXI0Y8IbFfGziwEGy6MGuUQiJJQlBBUnmxDr7BB0h9Da+XQLWq7Fzj1f9K/
         C4u/NLP+0YLzNhHJAiQOmRNEAYQFTlrE9fTxn/BdK/1KdzcHQWB0Xn63dw8KqFWUWOI+
         8BPA==
X-Forwarded-Encrypted: i=1; AHgh+RpMNeOtk65Xk3tQAxa1Zyu8ojqCPUS+KGUpF3Wl4MvhYTITR7e5C+xaQOM4fRaNHaAG5Hb932Mg0KYbLvVD4JjG7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU+5FRKxNfqbyEtZ0SaLwJj8SlbBznYmE91LI07d4gp5RT7iag
	zrfYHZfERZHLXh2yd2aqjJou6U9hIK/3XTp6OkiplmOTBpcGppgJ0crFy9Eqbv4b
X-Gm-Gg: AR+sD11msOW0XFZaW/Oh8H0y2Z7sv2FrTvULodxr2i2IREFbMsqE7PxkPEI4C/WqIPG
	VXe/9Co4EOQ++Zvb+ILUl81DslITMDByC5UmE88sH9djRvC4Hmhe3RvCXfWy0tllE9deqzZypy0
	gD0ETiuyF9E9fxuSRQ1hR+3L2LzX08PhQ4iSEK9qeDVDUy5nxt1L45opFH8m+FtjBew6XK9Op5E
	7mxY2Q8sqSElc7OPT7/v06LGKxPqMWOW+5yTTdDh1U78r/Ut1sR2DST5b5iqyu1MrnBQraofKz7
	T6lfqhCuw6tXD3ysuGq/0WhwRw9NczAhvN1s42urtE+PRw2arWqfMurPr0N+95BxXgzueBLmLDq
	1ZZYnA8e3TEl3RYZ4qJYH0JEvKBZvLZkINRUUKrXxhU2neqKfcbqs9cZ39MlPLlFFQuUhFSLjcV
	4N9NjOYjTzm0Bo4HerU1aK1xcKEl7ZauKx4su6kuWDeDlPVVHoOVvF69Utj2FfhZ55gcNNMTjIZ
	CHnlux5Fw1sDA3f8uIclBpvAg==
X-Received: by 2002:a05:6102:3354:b0:745:1c72:cf72 with SMTP id ada2fe7eead31-76f2ebb0c2cmr7197458137.13.1787036288970;
        Mon, 17 Aug 2026 23:58:08 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-773c508ab92sm2701076137.7.2026.08.17.23.58.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 23:58:07 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-73791ee3612so2447038137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 23:58:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrWjuiRlFOIBWscI87EGrk48TuQgAyPxqfrqNcdtDTFk8MmUBUEDEpZcJamNB3xYjKsDmJt7ol76gQt1gDwv44SQQ==@vger.kernel.org
X-Received: by 2002:a05:6102:1496:b0:738:9c30:2b7c with SMTP id
 ada2fe7eead31-76f2c541b8bmr7363952137.6.1787036286929; Mon, 17 Aug 2026
 23:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813091925.71363-1-marek.vasut+renesas@mailbox.org> <h43onk4priskfkvdrheml4ttx2b7udavnulxvftj45midvcs3c@lec5rx7mrgys>
In-Reply-To: <h43onk4priskfkvdrheml4ttx2b7udavnulxvftj45midvcs3c@lec5rx7mrgys>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Aug 2026 08:57:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAph2fbR94k8RDaAeVH=OTKWAWe1dJne9D-YbQQrYHsA@mail.gmail.com>
X-Gm-Features: AcwNN1V_vBBvui0ICUc760n-rTYHtfhaEcvZ01hKtas0lQM66m-P4QIf_6RReAo
Message-ID: <CAMuHMdUAph2fbR94k8RDaAeVH=OTKWAWe1dJne9D-YbQQrYHsA@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc: rcar-gen4: Fix potential unclocked access in rcar_gen4_pcie_ep_deinit()
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den-san,

On Tue, 18 Aug 2026 at 07:55, Koichiro Den <den@valinux.co.jp> wrote:
> On Thu, Aug 13, 2026 at 11:18:22AM +0200, Marek Vasut wrote:
> > Initialize PCIEDMAINTSTSEN in rcar_gen4_pcie_ep_pre_init() to 0,
> > and in case rcar_gen4_pcie_common_init() fails and the result
> > propagates to dw_pcie_ep_init(), the invoke common deinit instead
> > of endpoint deinit, because we are certain the PCIEDMAINTSTSEN
> > register is already 0 and the common deinit does not do any register
> > accesses.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > @@ -487,6 +487,8 @@ static int rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
> >       struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> >       int ret;
> >
> > +     writel(0, rcar->base + PCIEDMAINTSTSEN);
> > +
>
> 1. The new writel(0, PCIEDMAINTSTSEN) runs before clk_bulk_prepare_enable().
>    Is MSTP024 expected to be already released at this point? I added the quick
>    check like below on Spider, and confirmed that the clock was already enabled.
>
>    --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
>    +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
>    @@ -9,6 +9,7 @@
>      */
>
>     #include <linux/delay.h>
>    +#include <linux/clk-provider.h>
>     #include <linux/firmware.h>
>     #include <linux/interrupt.h>
>     #include <linux/io.h>
>    @@ -487,6 +488,10 @@ static int rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
>            struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
>            int ret;
>
>    +       if (__clk_is_enabled(dw->core_clks[DW_PCIE_CORE_CLK].clk))
>    +               dev_info(dw->dev,
>    +                        "PCIEC module clock was already enabled\n");
>    +
>            writel(0, rcar->base + PCIEDMAINTSTSEN);
>
>            ret = rcar_gen4_pcie_common_init(rcar);
>
>    If that is not guaranteed, wouldn't this write rely on firmware or some
>    earlier user leaving the module clock enabled?

The module clock is enabled through Runtime PM:

    rcar_gen4_pcie_probe
    -> rcar_gen4_pcie_prepare
            -> pm_runtime_resume_and_get

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
