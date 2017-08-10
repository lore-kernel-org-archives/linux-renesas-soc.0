Return-Path: <devicetree-owner@vger.kernel.org>
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>, Simon Horman <horms@verge.net.au>
CC: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 2/2] ARM: dts: r8a7743: Add IIC cores to dtsi
Date: Thu, 10 Aug 2017 13:49:05 +0000
Message-ID: <TY1PR06MB0702EA22AFE7D8145BF623A6B7880@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <1502196418-31341-1-git-send-email-biju.das@bp.renesas.com>
 <12d923ba-184c-ef59-f27b-41a7592a5f93@cogentembedded.com>
 <20170810080121.GE16647@verge.net.au> <20170810112411.GA4380@katana>
In-Reply-To: <20170810112411.GA4380@katana>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

> From: Wolfram Sang [mailto:wsa@the-dreams.de]
> Sent: 10 August 2017 12:24
>=20
>=20
> > > >+		i2c6: i2c@e60b0000 {
> > >
> > >    I'd use iic0 as the label.
> >
> > I have no preference here other than that we try to be consistent in
> > DT for different R-Car SoCs. Wolfram, do you have an opinion on this?
>=20
> Back then, for M2-W, I decided to go with the schematics/datasheets.
> And those mentioned i2c6 rather than iic0. For that reason, the comment

The M2 schematics still use i2c6, and for consistency I'd vote to use the s=
ame with RZ/G1M.

>=20
> "/* The memory map in the User's Manual maps the cores to bus numbers */"
>=20
> exists in r8a7791.dtsi. Dunno the manual of this SoC here.

The manual for r8a7743 uses the same terminology as the r8a7791 manuals.

Kind regards, Chris
