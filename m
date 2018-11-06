Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-os2jpn01on0112.outbound.protection.outlook.com ([104.47.92.112]:19992
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387491AbeKFTuV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 14:50:21 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Inki Dae <inki.dae@samsung.com>,
        Boris Brezillon <boris.brezillon@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: RE: [PATCH v2] drm/bridge/sii902x: Fix EDID readback
Date: Tue, 6 Nov 2018 10:25:43 +0000
Message-ID: <TY1PR01MB17705AC915A25FF046375B4EC0CB0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1541426208-25434-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181105221523.4b90c87e@bbrezillon>
In-Reply-To: <20181105221523.4b90c87e@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Boris,

Thank you for your feedback!

> Subject: Re: [PATCH v2] drm/bridge/sii902x: Fix EDID readback
>
> Hi Fabrizio,
>
> Thanks for working on that. I think your solution fixes the issue we had
> on atmel boards [1] in a clean way (still have to find some time to
> test it).
>
> On Mon,  5 Nov 2018 13:56:48 +0000
> Fabrizio Castro <fabrizio.castro@bp.renesas.com> wrote:
>
> > @@ -441,6 +558,9 @@ static int sii902x_remove(struct i2c_client *client=
)
> >  {
> >  struct sii902x *sii902x =3D i2c_get_clientdata(client);
> >
> > +if (sii902x->i2cmux)
> > +i2c_mux_del_adapters(sii902x->i2cmux);
> > +
>
> Just one tiny detail: I think you can safely call i2c_mux_del_adapters()
> unconditionally since ->remove() will only be called if ->probe()
> succeeded, which guarantees that sii902x->i2cmux !=3D NULL.

Fair point, will change in the next version.

Cheers,
Fab

>
>
> >  drm_bridge_remove(&sii902x->bridge);
> >
> >  return 0;
>
> [1]https://patchwork.kernel.org/patch/9532005/



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
