Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45925 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbeHIN0Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Aug 2018 09:26:16 -0400
Date: Thu, 9 Aug 2018 13:01:52 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77470: Add EtherAVB pin groups
Message-ID: <20180809110151.rretzcdwejgaivew@verge.net.au>
References: <1532683322-30684-1-git-send-email-biju.das@bp.renesas.com>
 <20180802113049.ylypnhsshwz3ftcy@verge.net.au>
 <CAMuHMdUyUf9z5a_3kifQG5bm0+voei6XCy2B_2fMue70oEm9=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUyUf9z5a_3kifQG5bm0+voei6XCy2B_2fMue70oEm9=g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 02, 2018 at 01:34:48PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Thu, Aug 2, 2018 at 1:30 PM Simon Horman <horms@verge.net.au> wrote:
> > On Fri, Jul 27, 2018 at 10:22:02AM +0100, Biju Das wrote:
> > > Add EtherAVB groups and functions definitions for R8A77470 SoC.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > ---
> > > This patch is based on the following discussion
> > > https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg27480.html
> > >
> > > and
> > >
> > > https://en.wikipedia.org/wiki/Media-independent_interface
> > > ---
> > >  drivers/pinctrl/sh-pfc/pfc-r8a77470.c | 133 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 133 insertions(+)
> > >
> > > diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> > > index 9d3ed43..995c959 100644
> > > --- a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> > > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> > > @@ -1093,6 +1093,110 @@ static const struct sh_pfc_pin pinmux_pins[] = {
> > >       PINMUX_GPIO_GP_ALL(),
> > >  };
> > >
> > > +/* - AVB -------------------------------------------------------------------- */
> > > +static const unsigned int avb_col_pins[] = {
> > > +     RCAR_GP_PIN(5, 18),
> > > +};
> >
> > I feel that I am missing something painfully obvious, but this does not
> > seem to match page 4-36 of R01UH0695EJ0100 Rev.1.00 (Oct 13 2017).
> 
> Please check Function VIII (The table extends horizontally to page 4-37!).

Thanks, that is the obvious thing that I was missing.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
