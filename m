Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1400100.outbound.protection.outlook.com ([40.107.140.100]:18976
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726862AbeKVKfl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Nov 2018 05:35:41 -0500
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Magnus <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: add SSIU support for sound
Date: Wed, 21 Nov 2018 23:58:59 +0000
Message-ID: <875zwqng8c.wl-kuninori.morimoto.gx@renesas.com>
References: <87y39n1c2y.wl-kuninori.morimoto.gx@renesas.com>
        <20181121095154.3e4e3l2wjaugjyuq@verge.net.au>
In-Reply-To: <20181121095154.3e4e3l2wjaugjyuq@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <91756AE7CAE99D49B46DBD16413A2788@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Hi Simon

> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >=20
> > rsnd driver supports SSIU now, let's use it.
> > Then, BUSIF DMA settings on rcar_sound,ssi (=3D rxu, txu) are
> > no longer needed.
> > To avoid git merge timing issue / git bisect issue,
> > this patch doesn't remove it so far, but will be removed in
> > the future.
> >=20
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 211 +++++++++++++++++++++++=
++++++++
> >  1 file changed, 211 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot=
/dts/renesas/r8a7796.dtsi
> > index 449eb33..5cc9b8b 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > @@ -1826,6 +1826,217 @@
> >  				};
> >  			};
> > =20
> > +			rcar_sound,ssiu {
> > +				ssiu00: ssiu-0 {
> > +					dmas =3D <&audma0 0x15>, <&audma1 0x16>;
> > +					dma-names =3D "rx", "tx";
> > +				};
>=20
> Hi Morimoto-san,
>=20
> I am having a little trouble finding documentation of the audma port
> numbers used in this patch.

?? Sorry what do you mean ?
You can find it on

	Table 48.5 Selecting On-Chip Peripheral Module Request Modes

Best regards
---
Kuninori Morimoto
