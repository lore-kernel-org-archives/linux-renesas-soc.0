Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5594C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 15:38:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89CAF20685
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 15:38:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728872AbfAJPiP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 10:38:15 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:38974 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727819AbfAJPiP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 10:38:15 -0500
Received: by mail-vs1-f68.google.com with SMTP id h78so7252938vsi.6;
        Thu, 10 Jan 2019 07:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3tU4jG+S+kUHseK59N0A5vKkAI8CHGlVnMwe8Z1QWTQ=;
        b=B8pVO2m6d9RRPJk+16S2R4VL8EItFuhA0IHb0JS+VdBtc1rAVovKGEjnrX7MBfEFOk
         op/8Rbmk9v1eOQ6u2ilABYhoBSDkPHNDBAguqFNbDwOu4BfzG3tOYEFUIyyQnZlEYUGx
         AHaXh1jIos/RtkUpCl6yjIGPjC/8WlpqK39VKBwuKGd5WV0D0JObrCLlJAx+Wx2irqww
         dAnAJiOrZKh1DO9xKcLRBcrxfWG35fBjSfX3eBw1D9Y8Q2x7dOJQm0ZbTz4nC4S69o2t
         CIs7P7ttLk8SGdXWZHlvN8BNrPzj0tkG92Bl5YhdT8IBoHRejodwkVBFkFdlQT6mzFOB
         tZTQ==
X-Gm-Message-State: AJcUuke09z3cigyks664icZbSwLastARsgSbcPndH5bEIt44187p1ziP
        Uzn52y/+2S1Ikmlw5ZamnLsE8QwFJs6yTASfQQ0=
X-Google-Smtp-Source: ALg8bN6x+xVUu322lyhL8CUGLTWCvzn9kKTuP9gCkOl48tvqEkpprEc4aMLYVcxqnx0IAP5hvdqmU46S6pAeSMhB4Fg=
X-Received: by 2002:a67:f43:: with SMTP id 64mr4424113vsp.166.1547134692765;
 Thu, 10 Jan 2019 07:38:12 -0800 (PST)
MIME-Version: 1.0
References: <1458148210-21800-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1458148210-21800-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1458148210-21800-4-git-send-email-ulrich.hecht+renesas@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Jan 2019 16:38:00 +0100
Message-ID: <CAMuHMdXAqEteqyCsR-+-hwcefzYNwJCW3DtB4qsWVAGRcsw3UQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: r8a7779: Add HSCIF0/1 device nodes
To:     Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Wed, Mar 16, 2016 at 6:10 PM Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Based on Rev. 1.00 of the R-Car H1 datasheet.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Thanks for your patch!

A  few more comments below. Sorry for not noticing these issues
before.

This will be hard to test with remote access, as the normal console
cannot be rerouted to HSCIF, unlike on Bock-W.
Note that pfc-r8a7779.c lacks HSCIF pin groups and functions, so
these have to be added first, too.

> --- a/arch/arm/boot/dts/r8a7779.dtsi
> +++ b/arch/arm/boot/dts/r8a7779.dtsi
> @@ -285,6 +285,32 @@
>                 status = "disabled";
>         };
>
> +       hscif0: serial@ffe48000 {
> +               compatible = "renesas,hscif-r8a7779",
> +                            "renesas,rcar-gen1-hscif", "renesas,hscif";
> +               reg = <0 0xffe48000 0 96>;

R-Car Gen1 does not use LPAE, hence #address-cells = <1> and
#size-cells are 1, not 2, so the zeroes must be dropped.

> +               interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&mstp0_clks R8A7779_CLK_HSCIF0>,
> +                        <&cpg_clocks R8A7779_CLK_S>,
> +                        <&scif_clk>;
> +               clock-names = "fck", "brg_int", "scif_clk";
> +               power-domains = <&cpg_clocks>;
> +               status = "disabled";
> +       };
> +
> +       hscif1: serial@ffe49000 {
> +               compatible = "renesas,hscif-r8a7779",
> +                            "renesas,rcar-gen1-hscif", "renesas,hscif";
> +               reg = <0 0xffe49000 0 96>;

Likewise.

> +               interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&mstp0_clks R8A7779_CLK_HSCIF0>,

R8A7779_CLK_HSCIF1

> +                        <&cpg_clocks R8A7779_CLK_S>,
> +                        <&scif_clk>;
> +               clock-names = "fck", "brg_int", "scif_clk";
> +               power-domains = <&cpg_clocks>;
> +               status = "disabled";
> +       };
> +
>         pfc: pfc@fffc0000 {
>                 compatible = "renesas,pfc-r8a7779";
>                 reg = <0xfffc0000 0x23c>;
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
