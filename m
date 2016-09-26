Return-Path: <devicetree-owner@vger.kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Rob Herring <robh@kernel.org>
CC: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] mmc: sh_mmcif: Document r7s72100 DT bindings
Date: Mon, 26 Sep 2016 20:58:41 +0000
Message-ID: <SG2PR06MB11650CDC26D69220278ED4C78ACD0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20160920154620.18653-1-chris.brandt@renesas.com>
 <20160920154620.18653-3-chris.brandt@renesas.com>
 <20160923191519.GA28901@rob-hp-laptop>
In-Reply-To: <20160923191519.GA28901@rob-hp-laptop>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


On 9/23/2016, Rob Herring wrote:
> > diff --git a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> > b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> > index ff611fa..1443edb 100644
> > --- a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> > +++ b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> > @@ -8,12 +8,16 @@ Required properties:
> >
> >  - compatible: should be "renesas,mmcif-<soctype>", "renesas,sh-mmcif"
> as a
> >    fallback. Examples with <soctype> are:
> > +	- "renesas,mmcif-r7s72100" for the MMCIF found in r7s72100 SoCs
> >  	- "renesas,mmcif-r8a7740" for the MMCIF found in r8a7740 SoCs
> >  	- "renesas,mmcif-r8a7790" for the MMCIF found in r8a7790 SoCs
> >  	- "renesas,mmcif-r8a7791" for the MMCIF found in r8a7791 SoCs
> >  	- "renesas,mmcif-r8a7793" for the MMCIF found in r8a7793 SoCs
> >  	- "renesas,mmcif-r8a7794" for the MMCIF found in r8a7794 SoCs
> >
> > +- interrupts: either 1 shared interrupt, 2 separate interrupts (error
> > +and int),
> > +  or 3 separate interrupts (error, int, card detect)
>=20
> This should be based on the compatible strings. Surely, 1, 2, or 3 is not
> valid for all compatibles.


That is true. What is your suggestion? Add the specific number of interrupt=
s for each SoC to the documentation so there is no confusion?

For example:

- interrupts: Some SoCs have only 1 shared interrupt, while others have eit=
her
  2 or 3 individual interrupts (error, int, card detect). Below is the numb=
er
  of interrupts for each SoC.
    3: r7s72100 SoC
    2: r8a7740 SoC
    1: r8a7790 SoC
    1: r8a7791 SoC
    1: r8a7793 SoC
    1: r8a7794 SoC


Chris
