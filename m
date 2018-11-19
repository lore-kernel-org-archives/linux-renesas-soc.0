Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:42448
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725937AbeKTFYG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Nov 2018 00:24:06 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Peter Rosin <peda@axentia.se>,
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
Subject: RE: [PATCH v3] drm/bridge/sii902x: Add missing dependency on I2C_MUX
Date: Mon, 19 Nov 2018 18:59:04 +0000
Message-ID: <TY1PR01MB177034C8979E0EC2C7EA7172C0D80@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1542633978-22064-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181119175511.3992cf03@bbrezillon>
In-Reply-To: <20181119175511.3992cf03@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Boris,

> From: Boris Brezillon <boris.brezillon@bootlin.com>
> Sent: 19 November 2018 16:55
> Subject: Re: [PATCH v3] drm/bridge/sii902x: Add missing dependency on I2C=
_MUX
>
> Hi Fabrizio,
>
> On Mon, 19 Nov 2018 13:26:18 +0000
> Fabrizio Castro <fabrizio.castro@bp.renesas.com> wrote:
>
> > kbuild test robot reports:
> >
> > >> ERROR: "i2c_mux_add_adapter" [drivers/gpu/drm/bridge/sii902x.ko]
> > undefined!
> > >> ERROR: "i2c_mux_alloc" [drivers/gpu/drm/bridge/sii902x.ko]
> > undefined!
> > >> ERROR: "i2c_mux_del_adapters" [drivers/gpu/drm/bridge/sii902x.ko]
> > undefined!
> >
> > Quite obviously the driver depends on I2C_MUX, but adding a "depends on=
"
> > introduces a recursive dependency, therefore this patch selects I2C_MUX
> > instead.
> >
> > Fixes: 21d808405fe4 ("drm/bridge/sii902x: Fix EDID readback")
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Link: https://lists.01.org/pipermail/kbuild-all/2018-November/054924.ht=
ml
>
> I don't see the patch on the dri-devel ML, and it does not appear in
> patchwork either :-/.

Mmm, my email address may have been blocked somehow by the dri-devel ML,
I can't think of anything else that could get in the way, as the dri-devel =
ML was
in copy in every email. Maybe that's because I am not subscribed? I have st=
arted
the subscription process, once I am subscribed I'll try and repost.

Thanks,
Fab

>
> > ---
> > v2->v3:
> > * Changed the title
> >
> > v1->v2:
> > * Added "Fixes" tag
> >
> >  drivers/gpu/drm/bridge/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kc=
onfig
> > index 9eeb8ef..2fee47b 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -95,6 +95,7 @@ config DRM_SII902X
> >  depends on OF
> >  select DRM_KMS_HELPER
> >  select REGMAP_I2C
> > +select I2C_MUX
> >  ---help---
> >    Silicon Image sii902x bridge chip driver.
> >




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
