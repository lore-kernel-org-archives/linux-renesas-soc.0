Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:36733 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726070AbeKTFca (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Nov 2018 00:32:30 -0500
Date: Mon, 19 Nov 2018 20:07:20 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Peter Rosin <peda@axentia.se>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3] drm/bridge/sii902x: Add missing dependency on
 I2C_MUX
Message-ID: <20181119200720.3b459743@bbrezillon>
In-Reply-To: <TY1PR01MB177034C8979E0EC2C7EA7172C0D80@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1542633978-22064-1-git-send-email-fabrizio.castro@bp.renesas.com>
        <20181119175511.3992cf03@bbrezillon>
        <TY1PR01MB177034C8979E0EC2C7EA7172C0D80@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, 19 Nov 2018 18:59:04 +0000
Fabrizio Castro <fabrizio.castro@bp.renesas.com> wrote:

> Hello Boris,
> 
> > From: Boris Brezillon <boris.brezillon@bootlin.com>
> > Sent: 19 November 2018 16:55
> > Subject: Re: [PATCH v3] drm/bridge/sii902x: Add missing dependency on I2C_MUX
> >
> > Hi Fabrizio,
> >
> > On Mon, 19 Nov 2018 13:26:18 +0000
> > Fabrizio Castro <fabrizio.castro@bp.renesas.com> wrote:
> >  
> > > kbuild test robot reports:
> > >  
> > > >> ERROR: "i2c_mux_add_adapter" [drivers/gpu/drm/bridge/sii902x.ko]  
> > > undefined!  
> > > >> ERROR: "i2c_mux_alloc" [drivers/gpu/drm/bridge/sii902x.ko]  
> > > undefined!  
> > > >> ERROR: "i2c_mux_del_adapters" [drivers/gpu/drm/bridge/sii902x.ko]  
> > > undefined!
> > >
> > > Quite obviously the driver depends on I2C_MUX, but adding a "depends on"
> > > introduces a recursive dependency, therefore this patch selects I2C_MUX
> > > instead.
> > >
> > > Fixes: 21d808405fe4 ("drm/bridge/sii902x: Fix EDID readback")
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Link: https://lists.01.org/pipermail/kbuild-all/2018-November/054924.html  
> >
> > I don't see the patch on the dri-devel ML, and it does not appear in
> > patchwork either :-/.  
> 
> Mmm, my email address may have been blocked somehow by the dri-devel ML,
> I can't think of anything else that could get in the way, as the dri-devel ML was
> in copy in every email. Maybe that's because I am not subscribed? I have started
> the subscription process, once I am subscribed I'll try and repost.

That's weird. Your previous were visible on the dri-devel patchwork [1].

[1]https://patchwork.freedesktop.org/patch/260693/
