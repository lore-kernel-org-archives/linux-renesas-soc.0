Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409BCC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 13:32:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 16F2D2147A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 13:32:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730568AbfBRNcv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 08:32:51 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:39756 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728394AbfBRNcv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 08:32:51 -0500
Received: by mail-vs1-f65.google.com with SMTP id w14so2665365vso.6;
        Mon, 18 Feb 2019 05:32:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0STmeVpSTgGi6OHopzAuKw8M4ly4E7YHVVKyp/3Nu+0=;
        b=WZsP+w3odOHz/Ft8KFMYYd+7UqJeNnsSSNPfRjUFonCYu3eNoihuXEFqaJuYTEn5rn
         IWtGQNcSgk33u3t2RCXOhc9jec1iWVNAanb3UaLKPpwoD/ukRkkUVS4ETgmNvqBAdui1
         1GBLPa+CyHcVB3k3V41mOMhUB0Ab+WQylER3Tr11lpZ6hGYNoLLIGcraJSqGG6urzajS
         BLUUb6mIt5SuFJY/SGEFtdIWjTkbDLs5HQg3se7zFRJgSy5CHRJgOCX+scYzSZVtPxxn
         SKLRGMANrYkZHhcIg9+Rw45ieQqvUcFbztfDu2MZQ3ddRUNBIXbtnkVLkXJ2H67XPHdC
         6jbw==
X-Gm-Message-State: AHQUAuZiQMbMMzOw9ZBfAYdE2IEJdUHAk7QXUVoHzSD7FvPqTsd8DFwv
        wSEdncVZsai8/qu5OuWND+bAPJfn7Nx+AltOF6g=
X-Google-Smtp-Source: AHgI3IallVMIfdli/4e8ngIkSxE3+4ta7Pn9ClM0U/gMzfB9EzEAKwpOd3b+mXpAF2MMWcB2oGlc3Tpa6eqNp6yT3ik=
X-Received: by 2002:a67:ead0:: with SMTP id s16mr8373374vso.63.1550496769978;
 Mon, 18 Feb 2019 05:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20190216134923.7277-1-marek.vasut@gmail.com> <CAMuHMdVkAEmLjUb12iNw49ecwJZU=9Cqsg_d1iEftbF6R7yd7g@mail.gmail.com>
 <4d8e6d25-8e08-161a-8d6f-2fdb4b3a3223@gmail.com>
In-Reply-To: <4d8e6d25-8e08-161a-8d6f-2fdb4b3a3223@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Feb 2019 14:32:36 +0100
Message-ID: <CAMuHMdW-596oYGuj1VXgYEn6NuARhOAttZEw4QPc+9a7MrYniA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Retain TDSELCTRL register across suspend/resume
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Mon, Feb 18, 2019 at 1:59 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 2/18/19 9:43 AM, Geert Uytterhoeven wrote:
> > On Sat, Feb 16, 2019 at 2:49 PM <marek.vasut@gmail.com> wrote:
> >> The TDSELCTRL register is responsible for configuring the SDHI clock
> >> return path delay and may be adjusted by the bootloader. Retain the
> >> value across suspend/resume to prevent hardware instability after
> >> resume.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >
> > Thanks for your patch!
> >
> > Looks good to me. Two comments though.
> >
> > R-Car D3 (r8a77995) also has a TDSEL register, but it is not handled by
> > your patch.  Adding that would mean s/SDHI/SDHI and MMC/.
>
> Added

Thanks!

> >> --- a/drivers/pinctrl/sh-pfc/core.c
> >> +++ b/drivers/pinctrl/sh-pfc/core.c
> >> @@ -657,6 +657,10 @@ static unsigned int sh_pfc_walk_regs(struct sh_pfc *pfc,
> >>                 for (i = 0; pfc->info->ioctrl_regs[i].reg; i++)
> >>                         do_reg(pfc, pfc->info->ioctrl_regs[i].reg, n++);
> >>
> >> +       if (pfc->info->tdsel_regs)
> >> +               for (i = 0; pfc->info->tdsel_regs[i].reg; i++)
> >> +                       do_reg(pfc, pfc->info->tdsel_regs[i].reg, n++);
> >> +
> >>         return n;
> >>  }
> >
> >> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> >> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> >> @@ -176,6 +176,10 @@ struct pinmux_ioctrl_reg {
> >>         u32 reg;
> >>  };
> >>
> >> +struct pinmux_tdsel_reg {
> >> +       u32 reg;
> >> +};
> >> +
> >>  struct pinmux_data_reg {
> >>         u32 reg;
> >>         u8 reg_width;
> >> @@ -270,6 +274,7 @@ struct sh_pfc_soc_info {
> >>         const struct pinmux_drive_reg *drive_regs;
> >>         const struct pinmux_bias_reg *bias_regs;
> >>         const struct pinmux_ioctrl_reg *ioctrl_regs;
> >> +       const struct pinmux_tdsel_reg *tdsel_regs;
> >>         const struct pinmux_data_reg *data_regs;
> >>
> >>         const u16 *pinmux_data;
> >
> > Is there any special reason why you added a new block of registers with
> > separate handling, instead of adding TDSEL to the existing
> > pinmux_ioctrl_reg[] arrays, which list other IOCTRL registers like
> > POCCTRL?
>
> For one, It's unrelated register to POCCTRL, so I don't want to mix them

That's why the array is called pinmux_ioctrl_reg[], not pinmux_pocctrl_reg[]:
it is meant to cover various I/O control registers, including POCCTRL and
TDSEL, to be saved/restored for PSCI system suspend.

> together. The other reason is this r8a779*_pin_to_pocctrl(), which uses
> the ioctrl_regs[] array ; if I added the TDSEL there, that'd just make
> things extra confusing.

How r8a779*_pin_to_pocctrl() gets the registers is an implementation detail,
IMHO (The function used to contain hardcoded register addresses).

So I think you should just add the TDSEL registers to pinmux_ioctrl_reg[].

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
