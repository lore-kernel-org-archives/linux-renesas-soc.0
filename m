Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:12740 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752620AbeACPTz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jan 2018 10:19:55 -0500
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: iwg20d display driver
Date: Wed, 3 Jan 2018 15:19:51 +0000
Message-ID: <TY1PR06MB070244C938DAB20E6E3C4ADCB71E0@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <TY1PR06MB0702E8B2778BD1E5FB76AA10B71E0@TY1PR06MB0702.apcprd06.prod.outlook.com>
 <1562100.VQODLR5xyG@avalon>
In-Reply-To: <1562100.VQODLR5xyG@avalon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Laurent,

> From: Laurent Pinchart [mailto:laurent.pinchart@ideasonboard.com]
> Sent: 03 January 2018 13:34
>=20
> Hi Chris,
>=20
> On Wednesday, 3 January 2018 12:09:48 EET Chris Paterson wrote:
> > Hello Laurent,
> >
> > Happy new year!
>=20
> Onnellista uutta vuotta to you too :)
>=20
> > We are looking at upstreaming support for the display provided in the
> > iwg20d development kit [1]. The setup is slightly unusual in the sense
> > that the display is an RGB panel (EDT etm070001adh6), connected to the
> > RZ/G1M via an LVDS/RGB transmitter (DS90CF384AMTDX/NOPB).
> >
> > We think that the correct driver to use is
> > drivers/gpu/drm/panel/panel-lvds.c as as far as the SoC/Kernel is
> > aware there is an LVDS display connected. However the bindings
> > documentation
> > states: "compatible: Shall contain "panel-lvds" in addition to a
> > mandatory panel-specific compatible string defined in individual panel
> > bindings. The "panel-lvds" value shall never be used on its own."
> >
> > As the development kit uses an RGB panel there are no suitable LVDS
> > panel-specific bindings. Would it be okay in this case to used
> > panel-lvds on its own?
>=20
> The rationale is that there's no such thing as a fully generic LVDS panel=
. The
> panel-lvds compatible string allows supporting panels that are compatible
> with the interface defined by the panel-lvds driver, but using the compat=
ible
> string on its own would mean that the operating system would have no way
> to tweak operation for a particular panel. It might be that using the pan=
el-
> lvds driver works today, but that you will realize tomorrow that you need
> some panel-specific quirks. Being able to identify the exact panel model =
is
> thus crucial to be future-proof.

Agreed.

>=20
> The exact compatible string for your panel should be "edt,etm070001adh6".
> Using
>=20
> 	compatible =3D "edt,etm070001adh6", "panel-lvds";
>=20
> will work today and be somehow future-proof, but is a bit of a hack as th=
e
> panel isn't an LVDS panel.

This was our thought. Would using this compatible string be acceptable (for=
 now), even if it isn't the preferred option?

>=20
> The right solution would be to model the full display pipeline in DT, inc=
luding
> the DS90CF384AMTDX. However, the DU driver doesn't support that yet.
> Some Gen2 boards suffer from a similar issue in the sense that the device
> tree pretends that a RGB to HDMI encoder is connected directly to the LVD=
S
> output of the SoC, while an LVDS to RGB decoder is present in-between.
>=20
> Fixing this is somewhere in my todo list but with a low priority I'm afra=
id.
> Would you like to give it a go ?

Depends on your answer to the above ;)

Chris

>=20
> > [1]
> > http://www.iwavesystems.com/product/development-platform/qseven-
> evalua
> > tion->
> > board/rz-g1m-qseven-development-kit-49/rz-g1m-qseven-development-
> kit.h
> > tml
>=20
> --
> Regards,
>=20
> Laurent Pinchart
