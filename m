Return-Path: <SRS0=UKHE=Q4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D83C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 14:03:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D5F72084D
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 14:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbfBUOD6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Feb 2019 09:03:58 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:40759 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfBUOD5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Feb 2019 09:03:57 -0500
Received: by mail-vk1-f195.google.com with SMTP id 89so2111774vkq.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Feb 2019 06:03:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VZBqXEYg1N5kBQ1zR+tJA1p6jVZKHyxbjk/f37VfhcA=;
        b=D2lHnrG169HpnFNc/ki3iA8j+bQsTd00u9L7cdZV41cNgmkKQ/UIXpKHotp6j0u5dY
         zhaIGc2PVy6lOpcR6tFZT7yLID1dLgymF8c9Sg9HFpaeBfLrUEXWMNobXbeq0ahQynSG
         irhRvhqzgQa0UAl+w8I2HUx6HvLgG8aZlx0+D25mN7q4CfCafIr1XwGyMX9CUjeaMQOq
         /ROaG8X2vPrFKR4Md8lC/V4kHeVivNAI0cRBv7bQwoXwSWeIvqsp4eNsWTU0dALO0Duj
         cTMoTKjhDGdbZkth6z7OBrJL8dZ/Fc0y8E1ZtbbyR/dec0e9jui86h/6wo5PMpSPyhuK
         01Rg==
X-Gm-Message-State: AHQUAubQh281EiiTo0pQgckD0kMA2kqJtU6aMxp6aQ3UzT7HPg8gwGBH
        UN36E6FTg9+HYsIPE9puhJR1t9jqXVtFqr5w0HCSpg==
X-Google-Smtp-Source: AHgI3IaKcID58xR/qHtaqS0nByZ725yAm4KE5MYpYFrtZycMy9B7SM0sK6QzqgSWwaOrx6kkGGO4Ymr6u7jbDreWJxg=
X-Received: by 2002:a9f:30dc:: with SMTP id k28mr13861173uab.75.1550757836357;
 Thu, 21 Feb 2019 06:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20190221125938.12279-1-geert+renesas@glider.be> <TY1PR01MB177015CEE83F9802C50FC6F7C07E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB177015CEE83F9802C50FC6F7C07E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Feb 2019 15:03:44 +0100
Message-ID: <CAMuHMdVvDxnmkcP82zJ_OK4iM-Qgp=9b4dhSJfaQ7w0rPmSGeQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Fix SCIF5 DMA channels
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        TAKESHI KIHARA <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Thu, Feb 21, 2019 at 2:17 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert+renesas@glider.be>
> > Sent: 21 February 2019 13:00
> > Subject: [PATCH] arm64: dts: renesas: r8a77990: Fix SCIF5 DMA channels
> >
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > According to the R-Car Gen3 Hardware Manual Errata for Rev 1.50 of Feb
> > 12, 2019, the DMA channels for SCIF5 are corrected from 16..47 to 0..15
> > on R-Car E3.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Fixes: a5ebe5e49a862e21 ("arm64: dts: renesas: r8a77990: Add SCIF-{0,1,3,4,5} device nodes")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> > ---
> > Verified on Ebisu-4D using an oscilloscope probing the right pad for
> > unpopulated R631 (I couldn't find CP45).
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > index f8f48a262200aba1..a16ffeecad30b653 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > @@ -2,7 +2,7 @@
> >  /*
> >   * Device Tree Source for the R-Car E3 (R8A77990) SoC
> >   *
> > - * Copyright (C) 2018 Renesas Electronics Corp.
> > + * Copyright (C) 2018-2019 Renesas Electronics Corp.
> >   */
> >
> >  #include <dt-bindings/clock/r8a77990-cpg-mssr.h>
> > @@ -1067,9 +1067,8 @@
> >                                <&cpg CPG_CORE R8A77990_CLK_S3D1C>,
> >                                <&scif_clk>;
> >                       clock-names = "fck", "brg_int", "scif_clk";
> > -                     dmas = <&dmac1 0x5b>, <&dmac1 0x5a>,
> > -                            <&dmac2 0x5b>, <&dmac2 0x5a>;
> > -                     dma-names = "tx", "rx", "tx", "rx";
> > +                     dmas = <&dmac0 0x5b>, <&dmac0 0x5a>;
> > +                     dma-names = "tx", "rx";
>
> This should be the same for the r8a774c0 as well, but unfortunately we can't test it.
> Do you want to send the patch for the r8a774c0 yourself or do you prefer me to do it?

Cooking a patch...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
