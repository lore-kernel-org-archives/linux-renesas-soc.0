Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46142 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbeJQRzH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 13:55:07 -0400
Date: Wed, 17 Oct 2018 12:00:07 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH v4 2/6] pinctrl: sh-pfc: r8a77470: Add SDHI support
Message-ID: <20181017100006.jvoojxiir32vkg4l@verge.net.au>
References: <1539686023-7487-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181017084358.zq5lnxvcba2kftkv@verge.net.au>
 <TY1PR01MB1770CFA1D3E90130BC97BB76C0FF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770CFA1D3E90130BC97BB76C0FF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 17, 2018 at 09:14:19AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> Thank you for your feedback.
> 
> > >
> > > +static int r8a77470_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
> > > +   u32 *pocctrl)
> > > +{
> > > +int bit = -EINVAL;
> > > +
> > > +*pocctrl = 0xe60600b0;
> > > +
> > > +if (pin >= RCAR_GP_PIN(0, 5) && pin <= RCAR_GP_PIN(0, 10))
> > > +bit = 0;
> >
> > Is it intentional that the range above excludes GP0_11 and 12?
> 
> Yes, it is, GPO_11 and GPO_12 can't be voltage controlled, they only work at 3.3V
> 
> >
> > > +
> > > +if (pin >= RCAR_GP_PIN(0, 13) && pin <= RCAR_GP_PIN(0, 22))
> > > +bit = 2;
> > > +
> > > +if (pin >= RCAR_GP_PIN(4, 14) && pin <= RCAR_GP_PIN(4, 19))
> >
> > And likewise GP4_20 and 21 here.
> 
> Same thing here, GP4_20 and GP4_21 can't be voltage controlled, they only work at 3.3V

Thanks for the follow-up. This patch looks fine to me.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
