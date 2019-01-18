Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334EEC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 12:48:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F5C62086D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 12:48:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfARMsy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 07:48:54 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:33901 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbfARMsy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 07:48:54 -0500
Received: by mail-vk1-f194.google.com with SMTP id y14so3049316vkd.1;
        Fri, 18 Jan 2019 04:48:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MGHxZvar3aJSyhV6FYsz9unmCxH9bJQPd00a/d+ft+U=;
        b=fqtwpyRW8wP/dCQJUK5irfJSJY/zOGz+TmELPkJ4aISaquEwFIKUA3W+TBQjM0rGUb
         1qCm8qwB1WUudM0xU1WB9SotBxRhhzS8Aqz3udzJMsbEp6OyTMu8zRFQQRpMxdS4HvJP
         +Cj43FCrPjQG8THpEwUmZQ/0tyj7Wekfn1EMXmGW7tD5iQwULlx8VxI7z/hX3YV0lcka
         DkcxXR+km4glXr9ql/p1iOQ/WivO+IFWF+o3zpQwbOk0OJyIRPU9mDl0aPMdjjEYweuZ
         XUgz7Ytbs4QK0y70AWxWAzp2kvtZbgGFVaVyqSc1wR58cXnq/b72sFUWfvBdG3ye/x4I
         3KJg==
X-Gm-Message-State: AJcUukeLiVkt49JMxBd9kMfCdQNH9TuXdWgoYuySvWlWl7vNWAN/b4eL
        GhRlVWy1BPW+4kqU5HmXyJHbntEU88zIqWVhFss=
X-Google-Smtp-Source: ALg8bN5sLwD3ubbc6X+M2L0I86sJq8HWw+OvsBmG7Hb66MrUGKfK2vLX6ZDDxbHOWRpN0ER0hu0leoMwbEfB5bQiHRA=
X-Received: by 2002:a1f:91cb:: with SMTP id t194mr7156197vkd.74.1547815733373;
 Fri, 18 Jan 2019 04:48:53 -0800 (PST)
MIME-Version: 1.0
References: <1547808495-19509-1-git-send-email-uli+renesas@fpond.eu>
 <1547808495-19509-3-git-send-email-uli+renesas@fpond.eu> <CAMuHMdUw0HHFhqYikL_YBHWhbC-FUOfA-EGFvY29b5SPOLLWwg@mail.gmail.com>
 <20190118121853.fv6ozq52rfahuxfm@verge.net.au>
In-Reply-To: <20190118121853.fv6ozq52rfahuxfm@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jan 2019 13:48:41 +0100
Message-ID: <CAMuHMdX016xkHqseCk9rNJCONLSufKKMvMnfFmmjkiheo0VzRA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7779: Add HSCIF0/1 device nodes
To:     Simon Horman <horms@verge.net.au>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Fri, Jan 18, 2019 at 1:18 PM Simon Horman <horms@verge.net.au> wrote:
> On Fri, Jan 18, 2019 at 12:58:55PM +0100, Geert Uytterhoeven wrote:
> > On Fri, Jan 18, 2019 at 11:48 AM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> > > --- a/arch/arm/boot/dts/r8a7779.dtsi
> > > +++ b/arch/arm/boot/dts/r8a7779.dtsi
> >
> > > +       hscif1: serial@ffe49000 {
> > > +               compatible = "renesas,hscif-r8a7779",
> > > +                            "renesas,rcar-gen1-hscif", "renesas,hscif";
> > > +               reg = <0xffe49000 96>;
> > > +               interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> > > +               clocks = <&mstp0_clks R8A7779_CLK_HSCIF1,
> >
> > Missing closing ">".
> >
> > With the above fixed:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks, applied with that fixed.

Thanks!

> Ulrich, do we need a patch to add the renesas,hscif-r8a7779 binding?

I believe you were CCed by Greg's bot for

    patch "dt-bindings: serial: sh-sci: Document r8a7778/9 HSCIF
bindings" added to tty-testing

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
