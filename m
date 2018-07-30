Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:34952 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbeG3Qhc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 12:37:32 -0400
MIME-Version: 1.0
References: <1532683322-30684-1-git-send-email-biju.das@bp.renesas.com> <OSBPR01MB2103966E65019705AC2C03B9B82A0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2103966E65019705AC2C03B9B82A0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jul 2018 17:01:55 +0200
Message-ID: <CAMuHMdVy9t5Fu5Yyzs_0+16boWgEJJC+J_BWXmg8dTP0dL0Jng@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77470: Add EtherAVB pin groups
To: Biju Das <biju.das@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Fri, Jul 27, 2018 at 11:29 AM Biju Das <biju.das@bp.renesas.com> wrote:
>
> + sergie
>
> > -----Original Message-----
> > From: Biju Das [mailto:biju.das@bp.renesas.com]
> > Sent: 27 July 2018 10:22
> > To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Geert
> > Uytterhoeven <geert+renesas@glider.be>; Linus Walleij
> > <linus.walleij@linaro.org>
> > Cc: Biju Das <biju.das@bp.renesas.com>; linux-renesas-
> > soc@vger.kernel.org; linux-gpio@vger.kernel.org; Simon Horman
> > <horms@verge.net.au>; Chris Paterson <Chris.Paterson2@renesas.com>;
> > Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Subject: [PATCH] pinctrl: sh-pfc: r8a77470: Add EtherAVB pin groups
> >
> > Add EtherAVB groups and functions definitions for R8A77470 SoC.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> > This patch is based on the following discussion https://www.mail-
> > archive.com/linux-renesas-soc@vger.kernel.org/msg27480.html
> >
> > and
> >
> > https://en.wikipedia.org/wiki/Media-independent_interface
> > ---
> >  drivers/pinctrl/sh-pfc/pfc-r8a77470.c | 133

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'll wait to see if Sergei has some comments before applying...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
