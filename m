Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:50212 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727018AbeI0RL2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Sep 2018 13:11:28 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v2 3/3] arm64: dts: renesas: r8a774a1: Add CAN nodes
Date: Thu, 27 Sep 2018 10:53:41 +0000
Message-ID: <TY1PR01MB1770B42824076BF5C57F12DDC0140@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1536576195-11520-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1536576195-11520-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180911133220.3kjx5dqp65drx3qs@verge.net.au>
In-Reply-To: <20180911133220.3kjx5dqp65drx3qs@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Simon,

> Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a774a1: Add CAN nodes
>
> On Mon, Sep 10, 2018 at 11:43:15AM +0100, Fabrizio Castro wrote:
> > From: Chris Paterson <chris.paterson2@renesas.com>
> >
> > Add the device nodes for both RZ/G2M CAN channels.
> >
> > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >
> > v1->v2:
> > * replaced "renesas,rzg-gen2-can" with "renesas,rcar-gen3-can" as per
> >   Geert's comment.
> >
> > This patch applies on top of renesas-devel-20180906-v4.19-rc2.
>
> Thanks Fabrizio,
>
> I would like to waif for the bindings to be accepted before accepting thi=
s
> patch.

Marc has taken the bindings, I guess we can unblock this patch now?

Thanks,
Fab

>
> >
> >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 24 +++++++++++++++++++++++=
+
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a774a1.dtsi
> > index 046fc93..867e875 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > @@ -874,6 +874,30 @@
> >  status =3D "disabled";
> >  };
> >
> > +can0: can@e6c30000 {
> > +compatible =3D "renesas,can-r8a774a1",
> > +     "renesas,rcar-gen3-can";
> > +reg =3D <0 0xe6c30000 0 0x1000>;
> > +interrupts =3D <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 916>, <&can_clk>;
> > +clock-names =3D "clkp1", "can_clk";
> > +power-domains =3D <&sysc 32>;
> > +resets =3D <&cpg 916>;
> > +status =3D "disabled";
> > +};
> > +
> > +can1: can@e6c38000 {
> > +compatible =3D "renesas,can-r8a774a1",
> > +     "renesas,rcar-gen3-can";
> > +reg =3D <0 0xe6c38000 0 0x1000>;
> > +interrupts =3D <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 915>, <&can_clk>;
> > +clock-names =3D "clkp1", "can_clk";
> > +power-domains =3D <&sysc 32>;
> > +resets =3D <&cpg 915>;
> > +status =3D "disabled";
> > +};
> > +
> >  pwm0: pwm@e6e30000 {
> >  compatible =3D "renesas,pwm-r8a774a1", "renesas,pwm-rcar";
> >  reg =3D <0 0xe6e30000 0 0x8>;
> > --
> > 2.7.4
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
