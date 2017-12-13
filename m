Return-Path: <devicetree-owner@vger.kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 0/5] Add Sound support for iWave RZ/G1M board
Date: Wed, 13 Dec 2017 09:27:30 +0000
Message-ID: <KL1PR06MB170226A1E9F3CA011EBF3E2DB8350@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1513103111-45830-1-git-send-email-biju.das@bp.renesas.com>
 <20171213090240.xqgihh4bqsfzeaip@verge.net.au>
In-Reply-To: <20171213090240.xqgihh4bqsfzeaip@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

Thanks.

There is a typo in the documentation dependency link.
The correct one is https://patchwork.kernel.org/patch/10108015/

Regards,
Biju

> -----Original Message-----
> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: 13 December 2017 09:03
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Russell King <linux@armlinux.org.uk>; Magnus
> Damm <magnus.damm@gmail.com>; Chris Paterson
> <Chris.Paterson2@renesas.com>; devicetree@vger.kernel.org; linux-renesas-
> soc@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 0/5] Add Sound support for iWave RZ/G1M board
>
> On Tue, Dec 12, 2017 at 06:25:06PM +0000, Biju Das wrote:
> > This series aims to add sound support for iWave RZ/G1M board.
> >
> > This patch series has documentation dependency on
> > https://patchwork.kernel.org/patch/10108014/
> >
> > Biju Das (5):
> >   ARM: shmobile: defconfig: Enable SGTL5000 audio codec
> >   ARM: dts: r8a7743: Add audio clocks
> >   ARM: dts: r8a7743: Add audio DMAC support
> >   ARM: dts: r8a7743: Add sound support
> >   ARM: dts: iwg20d-q7-common: Enable SGTL5000 audio codec
> >
> >  arch/arm/boot/dts/iwg20d-q7-common.dtsi |  24 +++
> >  arch/arm/boot/dts/r8a7743.dtsi          | 270
> ++++++++++++++++++++++++++++++++
> >  arch/arm/configs/shmobile_defconfig     |   1 +
> >  3 files changed, 295 insertions(+)
>
> These patches seem clean to me although I do not have sufficient
> documentation to properly review the last patch.
>
> I will leave these sit for a few days to allow others to review them.


[https://www2.renesas.eu/media/email/unicef_2017.jpg]

This Christmas, instead of sending out cards, Renesas Electronics Europe ha=
ve decided to support Unicef with a donation. For further details click her=
e<https://www.unicef.org/> to find out about the valuable work they do, hel=
ping children all over the world.
We would like to take this opportunity to wish you a Merry Christmas and a =
prosperous New Year.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
