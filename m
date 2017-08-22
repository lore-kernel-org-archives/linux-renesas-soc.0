Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:65380 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932077AbdHVINY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 04:13:24 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH  0/3] Add SDHI Support
Date: Tue, 22 Aug 2017 08:13:19 +0000
Message-ID: <KL1PR06MB170244954ECB471B0212746FB8840@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1502711389-16040-1-git-send-email-biju.das@bp.renesas.com>
 <20170822080258.GF30838@verge.net.au>
In-Reply-To: <20170822080258.GF30838@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



> -----Original Message-----
> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: 22 August 2017 09:03
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Magnus Damm <magnus.damm@gmail.com>;
> Chris Paterson <Chris.Paterson2@renesas.com>; Wolfram Sang
> <wsa+renesas@sang-engineering.com>; devicetree@vger.kernel.org; linux-
> renesas-soc@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 0/3] Add SDHI Support
>
> On Mon, Aug 14, 2017 at 12:49:46PM +0100, Biju Das wrote:
> > This series aims to add SDHI support for r8a7743 SoC.
> >
> > This series has been compiled and tested against renesas-dev tag
> > renesas-devel-20170814-v4.13-rc5.
> >
> > There is no compile time dependencies.It has run time dependency on
> > [PATCH ] mmc: renesas_sdhi: Add r8a7743/5 support.
> > https://patchwork.kernel.org/patch/9898611/
> >
> > Biju Das (3):
> >   ARM: dts: r8a7743: Add SDHI controllers
> >   ARM: dts: iwg20m: Enable SDHI0 controller
> >   ARM: dts: iwg20d-q7: Add SDHI1 support
>
> Thanks, applied for v4.15 with Wolfram's tags.
>
> There was some fuzz when applying the last patch.
> Please check that is is correct once I push today's devel tag to the rene=
sas tree.

Thanks. I will check and let you know if there is any issues.




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
