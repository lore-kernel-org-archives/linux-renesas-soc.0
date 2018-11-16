Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:35853 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728195AbeKQDZK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 22:25:10 -0500
Message-Id: <1542387884.1134874.1579436592.07F916C5@webmail.messagingengine.com>
From: Fernando <greenfoo@gluegarage.com>
To: Lucas Stach <l.stach@pengutronix.de>,
        dri-devel@lists.freedesktop.org
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        Gerd Hoffmann <kraxel@redhat.com>, cocci@systeme.lip6.fr,
        Marek Vasut <marex@denx.de>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        etnaviv@lists.freedesktop.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        virtualization@lists.linux-foundation.org,
        Sean Paul <sean@poorly.run>,
        linux-arm-kernel@lists.infradead.org,
        Michal Marek <michal.lkml@markovi.net>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
In-Reply-To: <1542363310.23489.22.camel@pengutronix.de>
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
 <20181115221634.22715-4-greenfoo@gluegarage.com>
 <1542363310.23489.22.camel@pengutronix.de>
Subject: Re: [PATCH 3/9] drm: replace "drm_dev_unref" function with "drm_dev_put"
Date: Fri, 16 Nov 2018 18:04:44 +0100
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 16, 2018, at 11:15 AM, Lucas Stach wrote:
> Am Donnerstag, den 15.11.2018, 23:16 +0100 schrieb Fernando Ramos:
> > This patch unifies the naming of DRM functions for reference counting as
> > requested on Documentation/gpu/todo.rst
> >=20
> > > Signed-off-by: Fernando Ramos <greenfoo@gluegarage.com>
> > ---
> > =C2=A0drivers/gpu/drm/arc/arcpgu_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 4 ++--
> > =C2=A0drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 4 ++--
> > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| 4 ++--
>=20
> At least the etnaviv part of the patch is already fixed in linux-next.
>=20
> Regards,
> Lucas
=20

Thanks for the notice.

I'm new on this, how should I proceed? Should I create a new (V2) patch ser=
ies with these changes reverted? Or will the maintainer automatically take =
care of this when merging?

And, related to this, what is the "good" branch to start developing new drm=
 patches? Is is "drm-next" or "linux-next"? Or does it change depending on =
how much time until the merge window closes?

Thanks!
