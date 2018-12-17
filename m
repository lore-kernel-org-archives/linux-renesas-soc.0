Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7468DC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:45:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FAD22133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:45:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732943AbeLQOpl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:45:41 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:33447 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727453AbeLQOpk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:45:40 -0500
Received: by mail-vs1-f68.google.com with SMTP id p74so7851247vsc.0;
        Mon, 17 Dec 2018 06:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CaxQK1GSAA78sYWtv1JD459vOkkm942MikB7j6Qdbbs=;
        b=jmOHDMdHz/yDuNVWNNtsTddncSTGYp9n0ZpJQS4T7YAH569smjRHv2iRyRvn5L95mT
         CxYwvAPGtwpPl3l/lgFPgyuxu5Gzu5GEGeuh88QmR2OwI+y/eIcyaqzaX9NC4K2m3DSx
         x3+3sv9ZKxGNjvwh2DV5QRNAVtXGxX54HWE0phchLMrHI3D54mHm3+3Jf4Z4lMutdxu1
         F6/QTkZ0fbESIGy5lEcwsRMnGHqcR6Fc1Ozl+cKTirBHVWFZmwScgGYQk/tJB9mEWNSm
         zpppOUzgJYsd61aoNXYrQvkMbKprCqNuWa950sHYNQPEJWa32wiWfftw0l0qOM4dG0Ti
         2JwA==
X-Gm-Message-State: AA+aEWYVUsHPIWqQ46traxHXF1RR3PeLsp0N5uAaKY3rWgWBmTPGrANV
        XhKkzC2oF3ivGxxgREIF21+stj58BrFE3cs5gyY=
X-Google-Smtp-Source: AFSGD/XqH1IPM8rINioioxhZ05k2i2iixuU54yhp1D7cktuP9vM4anmh5rvQUDxYBY6xaJv/3Sse1/kkt4Kj7LaL+0E=
X-Received: by 2002:a67:c202:: with SMTP id i2mr5913072vsj.11.1545057938599;
 Mon, 17 Dec 2018 06:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-11-geert+renesas@glider.be> <20181217143742.4qsndrcickp3hsyw@verge.net.au>
In-Reply-To: <20181217143742.4qsndrcickp3hsyw@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 15:45:26 +0100
Message-ID: <CAMuHMdW-r42PNxESV4w26F=D=xTFpeyWX0WuOEcNYZWMRsXS4w@mail.gmail.com>
Subject: Re: [PATCH 10/15] pinctrl: sh-pfc: sh7734: Fix shifted values in IPSR10
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Mon, Dec 17, 2018 at 3:37 PM Simon Horman <horms@verge.net.au> wrote:
> On Thu, Dec 13, 2018 at 07:27:09PM +0100, Geert Uytterhoeven wrote:
> > Some values in the Peripheral Function Select Register 10 descriptor are
> > shifted by one position, which may cause a peripheral function to be
> > programmed incorrectly.
> >
> > Fixing this makes all HSCIF0 pins use Function 4 (value 3), like was
> > already the case for the HSCK0 pin in field IP10[5:3].
> >
> > Fixes: ac1ebc2190f575fc ("sh-pfc: Add sh7734 pinmux support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Based on the SH7734 Hardware User's Manual Rev. 1.00.
> > Compile-tested only.
> >
> > Noticed when investigating a different bug in the same register
> > description.
> > ---
> >  drivers/pinctrl/sh-pfc/pfc-sh7734.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7734.c b/drivers/pinctrl/sh-pfc/pfc-sh7734.c
> > index cad70f9cf5699f0c..748a32a3af82d368 100644
> > --- a/drivers/pinctrl/sh-pfc/pfc-sh7734.c
> > +++ b/drivers/pinctrl/sh-pfc/pfc-sh7734.c
> > @@ -2210,22 +2210,22 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
> >           /* IP10_22 [1] */
> >               FN_CAN_CLK_A, FN_RX4_D,
> >           /* IP10_21_19 [3] */
> > -             FN_AUDIO_CLKOUT, FN_TX1_E, FN_HRTS0_C, FN_FSE_B,
> > -             FN_LCD_M_DISP_B, 0, 0, 0,
> > +             FN_AUDIO_CLKOUT, FN_TX1_E, 0, FN_HRTS0_C, FN_FSE_B,
>
> FN_FSE_B does no appear to be documented for this field in Users' Manual
> Hardware v1.00 (Jun 12, 2012). Should it be 0?

None of the FSE bits seem to be documented in the public datasheet, so I
just retained it, maintaining consistency with the surrounding fields.

> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
