Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:8431 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755266AbdLTLg5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 06:36:57 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Magnus Damm" <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] ARM: dts: r8a7743: Add thermal device to DT
Date: Wed, 20 Dec 2017 11:36:51 +0000
Message-ID: <KL1PR06MB17029FA8C7AD57F067777E11B80C0@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1513689449-2700-1-git-send-email-biju.das@bp.renesas.com>
 <1513689449-2700-3-git-send-email-biju.das@bp.renesas.com>
 <20171220085036.gdcnbhonyqlewyi4@verge.net.au>
In-Reply-To: <20171220085036.gdcnbhonyqlewyi4@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

Just noticed that

# make dtbs W=3D1 is giving below warning message.

arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dtb: Warning (simple_bus_reg): =
Node /soc/thermal-zones missing or empty reg/ranges property

Do you prefer a fix patch or a v2 ?

Regards,
Biju


> -----Original Message-----
> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: 20 December 2017 08:51
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Zhang Rui <rui.zhang@intel.com>; Eduardo Valentin
> <edubezval@gmail.com>; Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Magnus Damm <magnus.damm@gmail.com>;
> Chris Paterson <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>; devicetree@vger.kernel.org; linux-renes=
as-
> soc@vger.kernel.org; linux-pm@vger.kernel.org
> Subject: Re: [PATCH v2 2/2] ARM: dts: r8a7743: Add thermal device to DT
>
> On Tue, Dec 19, 2017 at 01:17:29PM +0000, Biju Das wrote:
> > This patch instantiates the thermal sensor module with thermal-zone
> > support.
> >
> > This patch is based on the commit cac68a56e34b
> > ("ARM: dts: r8a7791: enable to use thermal-zone") by Kuninori Morimoto.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v1->v2
> >  * Fixed the size.
>
> Thanks, applied.


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
