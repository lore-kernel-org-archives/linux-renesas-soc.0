Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:11377 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751186AbdH3Hql (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 03:46:41 -0400
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Simon Horman <horms@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC: Wolfram Sang <wsa@the-dreams.de>,
        Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>
Subject: RE: [PATCH v2] ARM: dts: r8a7743: add IIC cores to dtsi
Date: Wed, 30 Aug 2017 07:46:34 +0000
Message-ID: <SG2PR06MB069465C0EF929D98E5FEC2D0B79C0@SG2PR06MB0694.apcprd06.prod.outlook.com>
References: <12d923ba-184c-ef59-f27b-41a7592a5f93@cogentembedded.com>
 <1502704398-28378-1-git-send-email-biju.das@bp.renesas.com>
 <TY1PR06MB07027D9A55FBFE2D591CEDCFB7840@TY1PR06MB0702.apcprd06.prod.outlook.com>
 <b7434757-b151-5971-2b5f-525eeaf11467@cogentembedded.com>
 <20170830073214.GL10398@verge.net.au>
In-Reply-To: <20170830073214.GL10398@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: 30 August 2017 08:32
>=20
> On Tue, Aug 22, 2017 at 03:23:39PM +0300, Sergei Shtylyov wrote:
> > On 08/22/2017 12:10 PM, Chris Paterson wrote:
> >
> > >>From: Biju Das [mailto:biju.das@bp.renesas.com]
> > >>Sent: 14 August 2017 10:53
> > >>
> > >>Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > >>---
> > >>v1-->v2
> > >>    Corrected the resets property for i2c6 device node.
> > >
> > >Are you happy with this version of the patch?
> > >
> > >Or is the discussion for moving to 'iic' still alive?
> >
> >    Yes, appears so. I'd like the labels to be named iic<n>.
>=20
> Chirs, I'm marking this as "Changes Requested" and expecting to see iic i=
n v3
> when you are ready.

Sure, thanks.
