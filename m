Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:18476 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752333AbdHIJLt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 05:11:49 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/2] ARM: shmobile: document iWave's
 iW-RainboW-G22D-SODIMM RZ/G1E SODIMM development platform
Date: Wed, 9 Aug 2017 09:11:44 +0000
Message-ID: <TY1PR06MB089565B1EA8E40857A2DDD59C08B0@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <cover.1502190772.git.fabrizio.castro@bp.renesas.com>
 <TY1PR06MB07023F6BECCA3E86D00EBE23B78A0@TY1PR06MB0702.apcprd06.prod.outlook.com>
 <20170809090918.GO2705@verge.net.au>
In-Reply-To: <20170809090918.GO2705@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Thank you Simon.

Best regards,
Fab

-----Original Message-----
From: Simon Horman [mailto:horms@verge.net.au]
Sent: 09 August 2017 10:09
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>; robh+dt@kernel.org; m=
ark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.o=
rg; Biju Das <biju.das@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: shmobile: document iWave's iW-RainboW-G22D-SO=
DIMM RZ/G1E SODIMM development platform

On Tue, Aug 08, 2017 at 02:14:50PM +0000, Chris Paterson wrote:
> + linux-renesas-soc

Thanks Chris,

I would not have seen these patches otherwise.

Fabrizio,

these patches seem find to me.
Please repost them with myself and linux-renesas-soc@vger.kernel.org CCed s=
o they hit the patchwork of that ML and I can apply them.

Please add any "Acked-by" or other tags that you may have received - patchw=
ork can't currently see them either.

I would also consider dropping the CC of linux-kernel@vger.kernel.org, ther=
e is no need to circulate these patches there.



>
> > From: Fabrizio Castro [mailto:fabrizio.castro@bp.renesas.com]
> > Sent: 08 August 2017 13:28
> > To: robh+dt@kernel.org; mark.rutland@arm.com
> >
> > Hello,
> >
> > This series aims to add the documentation for the device tree
> > bindings of the iWave iW-RainboW-G22D-SODIMM RZ/G1E SODIMM development =
kit:
> > http://www.iwavesystems.com/product/development-platform/sodimm-
> > evaluation-boards/rz-g1e-sodimm-development-kit-28/rz-g1e-sodimm-
> > development-kit.html
> >
> > which consists of a System on Module (iW-RainboW-G22M-SM) and a
> > carrier card (iW-RainboW-G22D).
> >
> > Regards,
> >
> > Fabrizio Castro (2):
> >   ARM: shmobile: document iW-RainboW-G22M-SM SODIMM System on Module
> >   ARM: shmobile: document iW-RainboW-G22D SODIMM SOM Development
> >     Platform
> >
> >  Documentation/devicetree/bindings/arm/shmobile.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > --
> > 1.9.1
>



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
