Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:10229 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751780AbdHQJEJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2017 05:04:09 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH  2/2] ARM: shmobile: Enable BQ32000 rtc in
 shmobile_defconfig
Date: Thu, 17 Aug 2017 09:04:03 +0000
Message-ID: <SG2PR06MB17113348ACF043CD7453CACEB8830@SG2PR06MB1711.apcprd06.prod.outlook.com>
References: <1502197465-61546-1-git-send-email-biju.das@bp.renesas.com>
 <1502197465-61546-3-git-send-email-biju.das@bp.renesas.com>
 <20170809090421.GN2705@verge.net.au> <20170817090112.GE27693@verge.net.au>
In-Reply-To: <20170817090112.GE27693@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> -----Original Message-----
> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: 17 August 2017 10:01
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Magnus Damm <magnus.damm@gmail.com>;
> Russell King <linux@armlinux.org.uk>; Chris Paterson
> <Chris.Paterson2@renesas.com>; devicetree@vger.kernel.org; linux-renesas-
> soc@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 2/2] ARM: shmobile: Enable BQ32000 rtc in
> shmobile_defconfig
>
> On Wed, Aug 09, 2017 at 11:04:21AM +0200, Simon Horman wrote:
> > On Tue, Aug 08, 2017 at 02:04:25PM +0100, Biju Das wrote:
> > > The iWave RZ/G1M Q7 SOM supports RTC (TI BQ32000).
> > > To increase hardware support enable the driver in the
> > > shmobile_defconfig multiplatform configuration.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> >
> > Thanks, applied for v4.14.
>
> Please consider posting a similar patch for multi_v7_defconfig.

Thanks , I will do this.


Regards,
Biju



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
