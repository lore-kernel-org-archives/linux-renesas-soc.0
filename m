Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30C8C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:18:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 751DA2133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:18:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="kX9ytFPF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbeLQPSW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 10:18:22 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:42722 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbeLQPSW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 10:18:22 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2AF5E25B7CF;
        Tue, 18 Dec 2018 02:18:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545059898; bh=gQf6lQH36qbmucZFq/X8t5s5wvVZmstdeslnBQ6oYy8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kX9ytFPFPMwJmTnsgOW7IVygtDqWugYJv8qsnaZOHl8xZG+EA2GQySGxnNB05vBSS
         /j63nSa3lXdvd2pN6meV7sUaV0hC/pcKA7JZCChjB7EeKKeemVXTe4GI/kEYC8Lxmh
         pByyl9Ir8tslzwno4viO9oxBrmPD5Qto9s5vYCNY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4A8AF94048A; Mon, 17 Dec 2018 16:18:16 +0100 (CET)
Date:   Mon, 17 Dec 2018 16:18:16 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 10/15] pinctrl: sh-pfc: sh7734: Fix shifted values in
 IPSR10
Message-ID: <20181217151810.ab3tq22t4fulpqun@verge.net.au>
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-11-geert+renesas@glider.be>
 <20181217143742.4qsndrcickp3hsyw@verge.net.au>
 <CAMuHMdW-r42PNxESV4w26F=D=xTFpeyWX0WuOEcNYZWMRsXS4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW-r42PNxESV4w26F=D=xTFpeyWX0WuOEcNYZWMRsXS4w@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 03:45:26PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Dec 17, 2018 at 3:37 PM Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Dec 13, 2018 at 07:27:09PM +0100, Geert Uytterhoeven wrote:
> > > Some values in the Peripheral Function Select Register 10 descriptor are
> > > shifted by one position, which may cause a peripheral function to be
> > > programmed incorrectly.
> > >
> > > Fixing this makes all HSCIF0 pins use Function 4 (value 3), like was
> > > already the case for the HSCK0 pin in field IP10[5:3].
> > >
> > > Fixes: ac1ebc2190f575fc ("sh-pfc: Add sh7734 pinmux support")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Based on the SH7734 Hardware User's Manual Rev. 1.00.
> > > Compile-tested only.
> > >
> > > Noticed when investigating a different bug in the same register
> > > description.
> > > ---
> > >  drivers/pinctrl/sh-pfc/pfc-sh7734.c | 16 ++++++++--------
> > >  1 file changed, 8 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7734.c b/drivers/pinctrl/sh-pfc/pfc-sh7734.c
> > > index cad70f9cf5699f0c..748a32a3af82d368 100644
> > > --- a/drivers/pinctrl/sh-pfc/pfc-sh7734.c
> > > +++ b/drivers/pinctrl/sh-pfc/pfc-sh7734.c
> > > @@ -2210,22 +2210,22 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
> > >           /* IP10_22 [1] */
> > >               FN_CAN_CLK_A, FN_RX4_D,
> > >           /* IP10_21_19 [3] */
> > > -             FN_AUDIO_CLKOUT, FN_TX1_E, FN_HRTS0_C, FN_FSE_B,
> > > -             FN_LCD_M_DISP_B, 0, 0, 0,
> > > +             FN_AUDIO_CLKOUT, FN_TX1_E, 0, FN_HRTS0_C, FN_FSE_B,
> >
> > FN_FSE_B does no appear to be documented for this field in Users' Manual
> > Hardware v1.00 (Jun 12, 2012). Should it be 0?
> 
> None of the FSE bits seem to be documented in the public datasheet, so I
> just retained it, maintaining consistency with the surrounding fields.

That is fine by me.

> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
