Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:49499 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726534AbeKPDDd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 22:03:33 -0500
Date: Thu, 15 Nov 2018 17:54:44 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Dave Airlie <airlied@linux.ie>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Inki Dae <inki.dae@samsung.com>,
        Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3] drm/bridge/sii902x: Fix EDID readback
Message-ID: <20181115175444.3d0fce9c@bbrezillon>
In-Reply-To: <TY1PR01MB1770CD25E936A7DE3421E61DC0DC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1541505156-8097-1-git-send-email-fabrizio.castro@bp.renesas.com>
        <CACRpkda+YcxCOQeSo=2Jk5S2b4Sa7WcROeaJitzgPcBzM1qBrA@mail.gmail.com>
        <20181115111611.783e5c42@bbrezillon>
        <TY1PR01MB1770CD25E936A7DE3421E61DC0DC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, 15 Nov 2018 11:39:30 +0000
Fabrizio Castro <fabrizio.castro@bp.renesas.com> wrote:

> Hello Boris,
> 
> > From: Boris Brezillon <boris.brezillon@bootlin.com>
> > Sent: 15 November 2018 10:16
> > Subject: Re: [PATCH v3] drm/bridge/sii902x: Fix EDID readback
> >
> > On Thu, 15 Nov 2018 11:13:52 +0100
> > Linus Walleij <linus.walleij@linaro.org> wrote:
> >  
> > > On Tue, Nov 6, 2018 at 12:52 PM Fabrizio Castro
> > > <fabrizio.castro@bp.renesas.com> wrote:
> > >  
> > > > While adding SiI9022A support to the iwg23s board, it came
> > > > up that when the HDMI transmitter is in pass through mode the
> > > > device is not compliant with the I2C specification anymore,
> > > > as it requires a far bigger tbuf, due to a delay the HDMI
> > > > transmitter is adding when relaying the STOP condition on the
> > > > monitor i2c side of things.
> > > >
> > > > When not providing an appropriate delay after the STOP condition
> > > > the i2c bus would get stuck. Also, any other traffic on the bus
> > > > while talking to the monitor may cause the transaction to fail
> > > > or even cause issues with the i2c bus as well.
> > > >
> > > > I2c-gates seemed to reach consent as a possible way to address
> > > > these issues, and as such this patch is implementing a solution
> > > > based on that. Since others are clearly relying on the current
> > > > implementation of the driver, this patch won't require any DT
> > > > changes.
> > > >
> > > > Since we don't want any interference during the DDC Bus
> > > > Request/Grant procedure and while talking to the monitor, we
> > > > have to use the adapter locking primitives rather than the
> > > > i2c-mux locking primitives.
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > >
> > > > ---
> > > > v2->v3:
> > > > * Incorporated comments from Boris Brezillon and Peter Rosin  
> > >
> > > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > >
> > > Do you need help to apply this to drm-misc or do you
> > > have commit access?  
> >
> > I can do it if needed.  
> 
> Yes, please, your help is very much appreciated.

Queued to drm-misc-next.

Thanks,

Boris
