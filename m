Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:45605 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731895AbeHBNZq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Aug 2018 09:25:46 -0400
MIME-Version: 1.0
References: <1532683322-30684-1-git-send-email-biju.das@bp.renesas.com> <20180802113049.ylypnhsshwz3ftcy@verge.net.au>
In-Reply-To: <20180802113049.ylypnhsshwz3ftcy@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Aug 2018 13:34:48 +0200
Message-ID: <CAMuHMdUyUf9z5a_3kifQG5bm0+voei6XCy2B_2fMue70oEm9=g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77470: Add EtherAVB pin groups
To: Simon Horman <horms@verge.net.au>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Aug 2, 2018 at 1:30 PM Simon Horman <horms@verge.net.au> wrote:
> On Fri, Jul 27, 2018 at 10:22:02AM +0100, Biju Das wrote:
> > Add EtherAVB groups and functions definitions for R8A77470 SoC.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> > This patch is based on the following discussion
> > https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg27480.html
> >
> > and
> >
> > https://en.wikipedia.org/wiki/Media-independent_interface
> > ---
> >  drivers/pinctrl/sh-pfc/pfc-r8a77470.c | 133 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 133 insertions(+)
> >
> > diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> > index 9d3ed43..995c959 100644
> > --- a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> > @@ -1093,6 +1093,110 @@ static const struct sh_pfc_pin pinmux_pins[] = {
> >       PINMUX_GPIO_GP_ALL(),
> >  };
> >
> > +/* - AVB -------------------------------------------------------------------- */
> > +static const unsigned int avb_col_pins[] = {
> > +     RCAR_GP_PIN(5, 18),
> > +};
>
> I feel that I am missing something painfully obvious, but this does not
> seem to match page 4-36 of R01UH0695EJ0100 Rev.1.00 (Oct 13 2017).

Please check Function VIII (The table extends horizontally to page 4-37!).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
