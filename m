Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:52264 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751251AbeD3IOX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Apr 2018 04:14:23 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH  2/2] ARM: dts: iwg23s-sbc: Add EtherAVB support
Date: Mon, 30 Apr 2018 08:14:16 +0000
Message-ID: <OSBPR01MB210395D01BEFBA374D6ECD82B8820@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1524584253-52936-1-git-send-email-biju.das@bp.renesas.com>
 <1524584253-52936-3-git-send-email-biju.das@bp.renesas.com>
 <20180430080005.pisthehpcwgeuceo@verge.net.au>
In-Reply-To: <20180430080005.pisthehpcwgeuceo@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

> -----Original Message-----
> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: 30 April 2018 09:00
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Magnus Damm <magnus.damm@gmail.com>;
> Geert Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>; devicetree@vger.kernel.org; linux-
> renesas-soc@vger.kernel.org
> Subject: Re: [PATCH 2/2] ARM: dts: iwg23s-sbc: Add EtherAVB support
>
> On Tue, Apr 24, 2018 at 04:37:33PM +0100, Biju Das wrote:
> > Define the iW-RainboW-G23S board dependent part of the EtherAVB
> device
> > node.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
>
> Thanks, applied.
>
> > ---
> > * currently u-boot sets the AVB pin configuration.
>
> Understood, I assume at some point the pins will be described in DT.

Yes that is correct.  Will submit after the r8a77470 PFC driver acceptance.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
