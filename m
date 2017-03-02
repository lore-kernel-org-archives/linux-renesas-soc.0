Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57595 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751895AbdCBMZR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Mar 2017 07:25:17 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Andy Yan <andy.yan@rock-chips.com>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nickey Yang <nickey.yang@rock-chips.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/9] drm: bridge: dw-hdmi: Refactor PHY support
Date: Thu, 02 Mar 2017 13:30:32 +0200
Message-ID: <1513947.Nx6VK9nQUT@avalon>
In-Reply-To: <d674fff6-da52-3863-2fe0-d7c02bc83ec6@baylibre.com>
References: <20170301223915.29888-1-laurent.pinchart+renesas@ideasonboard.com> <d674fff6-da52-3863-2fe0-d7c02bc83ec6@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Neil,

On Thursday 02 Mar 2017 12:27:52 Neil Armstrong wrote:
> On 03/01/2017 11:39 PM, Laurent Pinchart wrote:
> > Hello,
> >=20
> > This patch series refactors all the PHY handling code in order to a=
llow
> > support of vendor PHYs and Synopsys DWC HDMI 2.0 TX PHYs.
> >=20
> > The series starts with a few cleanups and small fixes. Patch 1/9 ju=
st
> > removes unused code, patch 2/9 moves the color converter code out o=
f the
> > PHY configure function as it isn't PHY-dependent, and patch 3/9 ena=
bles
> > color conversion even for DVI as it is needed to output RGB when th=
e
> > input format is YUV.
> >=20
> > The next two patches fix the power down (4/9) and up (5/9) sequence=
s to
> > comply with the HDMI TX PHY specifications. They are the biggest
> > functional changes in the whole set, and have been tested successfu=
lly
> > (with the rest of the series) on i.MX6Q and R-Car H3. I'll try to p=
erform
> > tests on RK3288 tomorrow if nobody beats me to it (Neil, that's for=
 you
> > :-)).
>=20
> Done !
>=20
> Tested on RK3288 on ACT8846 EVB Board and Amlogic S905X P230 Board.
>=20
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>

Thank you ! I manage to test it on a remote RK3288 board too today, and=
 the=20
PLL lock delay was between 150=B5s and 450=B5s.

> > The PLL PHY lock delay has been measured to be between 300=B5s and =
350=B5s on
> > R-Car H3 and between 400=B5s and 600=B5s on i.MX6Q. The PHY power d=
own delay
> > has been measured to be less than 50=B5s on both platforms, and was=
 often
> > close to instant with power down reported in the first poll iterati=
on. We
> > should thus be more than safe with a 5ms timeout.
> >=20
> > Patch 6/9 breaks the PHY operations out. Glue code is then allowed =
to pass
> > a PHY operations structure to support vendor PHYs. The existing PHY=

> > support code is turned into a default Synopsys PHYs implementation =
for
> > those PHY operations.
> >=20
> > Patch 7/9 further refactors the Synopsys PHY configuration function=
 to
> > make
> > it modular, in order to support DWC HDMI 2.0 TX PHYs that have a ve=
ry
> > different register layout compared to the currently supported PHYs.=
 Glue
> > code is again allowed to provide a custom PHY configuration
> > implementation, with the existing PHY support code turned into the
> > default implementation for all currently supported Synopsys PHYs.
> >=20
> > Patch 8/9 is a small cleanup that removes the now unneeded device t=
ype for
> > glue code platform data, and patch 9/9 follows by switching the dri=
ver to
> > regmap in order to support vendor-specific register access more eas=
ily.
> >=20
> > Kieran Bingham (2):
> >   drm: bridge: dw-hdmi: Add support for custom PHY configuration
> >   drm: bridge: dw-hdmi: Remove device type from platform data
> >=20
> > Laurent Pinchart (5):
> >   drm: bridge: dw-hdmi: Remove unused functions
> >   drm: bridge: dw-hdmi: Move CSC configuration out of PHY code
> >   drm: bridge: dw-hdmi: Fix the PHY power down sequence
> >   drm: bridge: dw-hdmi: Fix the PHY power up sequence
> >   drm: bridge: dw-hdmi: Create PHY operations
> >=20
> > Neil Armstrong (2):
> >   drm: bridge: dw-hdmi: Enable CSC even for DVI
> >   drm: bridge: dw-hdmi: Switch to regmap for register access
> > =20
> >  drivers/gpu/drm/bridge/dw-hdmi.c            | 467 +++++++++++++---=
------
> >  drivers/gpu/drm/imx/dw_hdmi-imx.c           |   2 -
> >  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |   1 -
> >  include/drm/bridge/dw_hdmi.h                |  33 +-
> >  4 files changed, 304 insertions(+), 199 deletions(-)

--=20
Regards,

Laurent Pinchart
