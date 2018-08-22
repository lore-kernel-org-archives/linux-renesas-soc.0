Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49906 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728219AbeHVNYZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 09:24:25 -0400
Date: Wed, 22 Aug 2018 12:00:07 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add CSI2/VIN support
Message-ID: <20180822100007.hf7yhsxcemdtzp43@verge.net.au>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
 <758a8c87-272c-e861-4aab-01309cff2f84@cogentembedded.com>
 <20180809130854.65nvmnuuz6gffjjr@verge.net.au>
 <6032159b-ad2b-9a19-77f1-fc7a0ce3c5b0@cogentembedded.com>
 <20180817085109.ekvnhcuei5aexpx4@verge.net.au>
 <ea1ae505-d03a-6993-73f1-0ee2ad935c44@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ea1ae505-d03a-6993-73f1-0ee2ad935c44@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 17, 2018 at 02:13:55PM +0300, Sergei Shtylyov wrote:
> On 08/17/2018 11:51 AM, Simon Horman wrote:
>=20
> >>>> Describe the CSI2 and VIN (and their interconnections) in the R8A779=
80
> >>>> device tree.
> >>>>
> >>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>>>
> >>>> ---
> >>>> This patch is against the 'renesas-devel-20180802v2-v4.18-rc7' branc=
h of
> >>>> Simon Horman's 'renesas.git' repo.
> >>>>
> >>>> The R8A77980 CSI2/VIN DT binding updates have been posted earlier to=
day...
> >>>>
> >>>>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |  374 ++++++++++++++++++=
++++++++++++
> >>>>  1 file changed, 374 insertions(+)
> >>>>
> >>>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> >>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> >>>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> [...]
> >>>> +		csi41: csi2@feab0000 {
> >>>> +			compatible =3D "renesas,r8a77980-csi2";
> >>>> +			reg =3D <0 0xfeab0000 0 0x10000>;
> >>>> +			interrupts =3D <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
> >>>
> >>> The use of GIC_SPI 246 for both csi40 and csi41 seems suspicious.
> >>> Is this intentional?
> >>
> >>     No, must be copy/paste artefact... Sorry about that, it should be =
241 instead.
> >>
> >>>> +			clocks =3D <&cpg CPG_MOD 716>;
> >>>
> >>> Should this clock be 715 rather than 716?
> >>
> >>    Yes, sure.
> >>
> >>    I'm seeing this patch merged despite your remarks. Please either fi=
x it up or
> >> pull it out!
> >=20
> > Oops, that was not intended.
> >=20
> > I have fixed up the patch as you suggested.
> > The result is as follows:
>=20
>    Still buggy... :-)
>=20
> > From c703c196b847c654b392f027d3fa995e378792ac Mon Sep 17 00:00:00 2001
> > From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > Date: Mon, 6 Aug 2018 22:55:00 +0300
> > Subject: [PATCH] arm64: dts: renesas: r8a77980: add CSI2/VIN support
> >=20
> > Describe the CSI2 and VIN (and their interconnections) in the R8A77980
> > device tree.
> >=20
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77980.dtsi | 374 ++++++++++++++++++++++=
++++++++
> >  1 file changed, 374 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a77980.dtsi
> > index 4bc99d6763ce..71636fd1a819 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> [...]
> > @@ -769,6 +1065,84 @@
> >  			resets =3D <&cpg 603>;
> >  		};
> > =20
> > +		csi40: csi2@feaa0000 {
> > +			compatible =3D "renesas,r8a77980-csi2";
> > +			reg =3D <0 0xfeaa0000 0 0x10000>;
> > +			interrupts =3D <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&cpg CPG_MOD 716>;
> > +			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
> > +			resets =3D <&cpg 716>;
> > +			status =3D "disabled";
> > +
> > +			ports {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +
> > +				port@1 {
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> > +
> > +					reg =3D <1>;
> > +
> > +					csi40vin0: endpoint@0 {
> > +						reg =3D <0>;
> > +						remote-endpoint =3D <&vin0csi40>;
> > +					};
> > +					csi40vin1: endpoint@1 {
> > +						reg =3D <1>;
> > +						remote-endpoint =3D <&vin1csi40>;
> > +					};
> > +					csi40vin2: endpoint@2 {
> > +						reg =3D <2>;
> > +						remote-endpoint =3D <&vin2csi40>;
> > +					};
> > +					csi40vin3: endpoint@3 {
> > +						reg =3D <3>;
> > +						remote-endpoint =3D <&vin3csi40>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		csi41: csi2@feab0000 {
> > +			compatible =3D "renesas,r8a77980-csi2";
> > +			reg =3D <0 0xfeab0000 0 0x10000>;
> > +			interrupts =3D <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&cpg CPG_MOD 715>;
> > +			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
> > +			resets =3D <&cpg 716>;
>=20
>    You forgot to fix up this prop...

Thanks, I now have the following in my tree:

=46rom f3e8d4c1e3c3a826310a220d7373ac7c076e7120 Mon Sep 17 00:00:00 2001
=46rom: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Mon, 6 Aug 2018 22:55:00 +0300
Subject: [PATCH] arm64: dts: renesas: r8a77980: add CSI2/VIN support

Describe the CSI2 and VIN (and their interconnections) in the R8A77980
device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 374 ++++++++++++++++++++++++++=
++++
 1 file changed, 374 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dt=
s/renesas/r8a77980.dtsi
index 4bc99d6763ce..c099053cf5fe 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -579,6 +579,302 @@
 			status =3D "disabled";
 		};
=20
+		vin0: video@e6ef0000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6ef0000 0 0x1000>;
+			interrupts =3D <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 811>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 811>;
+			status =3D "disabled";
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@1 {
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+
+					reg =3D <1>;
+
+					vin0csi40: endpoint@2 {
+						reg =3D <2>;
+						remote-endpoint=3D <&csi40vin0>;
+					};
+				};
+			};
+		};
+
+		vin1: video@e6ef1000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6ef1000 0 0x1000>;
+			interrupts =3D <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 810>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			status =3D "disabled";
+			resets =3D <&cpg 810>;
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@1 {
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+
+					reg =3D <1>;
+
+					vin1csi40: endpoint@2 {
+						reg =3D <2>;
+						remote-endpoint=3D <&csi40vin1>;
+					};
+				};
+			};
+		};
+
+		vin2: video@e6ef2000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6ef2000 0 0x1000>;
+			interrupts =3D <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 809>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 809>;
+			status =3D "disabled";
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@1 {
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+
+					reg =3D <1>;
+
+					vin2csi40: endpoint@2 {
+						reg =3D <2>;
+						remote-endpoint=3D <&csi40vin2>;
+					};
+				};
+			};
+		};
+
+		vin3: video@e6ef3000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6ef3000 0 0x1000>;
+			interrupts =3D <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 808>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 808>;
+			status =3D "disabled";
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@1 {
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+
+					reg =3D <1>;
+
+					vin3csi40: endpoint@2 {
+						reg =3D <2>;
+						remote-endpoint=3D <&csi40vin3>;
+					};
+				};
+			};
+		};
+
+		vin4: video@e6ef4000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6ef4000 0 0x1000>;
+			interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 807>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 807>;
+			status =3D "disabled";
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@1 {
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+
+					reg =3D <1>;
+
+					vin4csi41: endpoint@2 {
+						reg =3D <2>;
+						remote-endpoint=3D <&csi41vin4>;
+					};
+				};
+			};
+		};
+
+		vin5: video@e6ef5000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6ef5000 0 0x1000>;
+			interrupts =3D <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 806>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 806>;
+			status =3D "disabled";
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@1 {
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+
+					reg =3D <1>;
+
+					vin5csi41: endpoint@2 {
+						reg =3D <2>;
+						remote-endpoint=3D <&csi41vin5>;
+					};
+				};
+			};
+		};
+
+		vin6: video@e6ef6000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6ef6000 0 0x1000>;
+			interrupts =3D <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 805>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 805>;
+			status =3D "disabled";
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@1 {
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+
+					reg =3D <1>;
+
+					vin6csi41: endpoint@2 {
+						reg =3D <2>;
+						remote-endpoint=3D <&csi41vin6>;
+					};
+				};
+			};
+		};
+
+		vin7: video@e6ef7000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6ef7000 0 0x1000>;
+			interrupts =3D <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 804>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 804>;
+			status =3D "disabled";
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@1 {
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+
+					reg =3D <1>;
+
+					vin7csi41: endpoint@2 {
+						reg =3D <2>;
+						remote-endpoint=3D <&csi41vin7>;
+					};
+				};
+			};
+		};
+
+		vin8: video@e6ef8000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6ef8000 0 0x1000>;
+			interrupts =3D <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 628>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 628>;
+			status =3D "disabled";
+		};
+
+		vin9: video@e6ef9000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6ef9000 0 0x1000>;
+			interrupts =3D <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 627>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 627>;
+			status =3D "disabled";
+		};
+
+		vin10: video@e6efa000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6efa000 0 0x1000>;
+			interrupts =3D <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 625>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 625>;
+			status =3D "disabled";
+		};
+
+		vin11: video@e6efb000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6efb000 0 0x1000>;
+			interrupts =3D <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 618>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 618>;
+			status =3D "disabled";
+		};
+
+		vin12: video@e6efc000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6efc000 0 0x1000>;
+			interrupts =3D <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 612>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 612>;
+			status =3D "disabled";
+		};
+
+		vin13: video@e6efd000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6efd000 0 0x1000>;
+			interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 608>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 608>;
+			status =3D "disabled";
+		};
+
+		vin14: video@e6efe000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6efe000 0 0x1000>;
+			interrupts =3D <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 605>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 605>;
+			status =3D "disabled";
+		};
+
+		vin15: video@e6eff000 {
+			compatible =3D "renesas,vin-r8a77980";
+			reg =3D <0 0xe6eff000 0 0x1000>;
+			interrupts =3D <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 604>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 604>;
+			status =3D "disabled";
+		};
+
 		dmac1: dma-controller@e7300000 {
 			compatible =3D "renesas,dmac-r8a77980",
 				     "renesas,rcar-dmac";
@@ -769,6 +1065,84 @@
 			resets =3D <&cpg 603>;
 		};
=20
+		csi40: csi2@feaa0000 {
+			compatible =3D "renesas,r8a77980-csi2";
+			reg =3D <0 0xfeaa0000 0 0x10000>;
+			interrupts =3D <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 716>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 716>;
+			status =3D "disabled";
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@1 {
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+
+					reg =3D <1>;
+
+					csi40vin0: endpoint@0 {
+						reg =3D <0>;
+						remote-endpoint =3D <&vin0csi40>;
+					};
+					csi40vin1: endpoint@1 {
+						reg =3D <1>;
+						remote-endpoint =3D <&vin1csi40>;
+					};
+					csi40vin2: endpoint@2 {
+						reg =3D <2>;
+						remote-endpoint =3D <&vin2csi40>;
+					};
+					csi40vin3: endpoint@3 {
+						reg =3D <3>;
+						remote-endpoint =3D <&vin3csi40>;
+					};
+				};
+			};
+		};
+
+		csi41: csi2@feab0000 {
+			compatible =3D "renesas,r8a77980-csi2";
+			reg =3D <0 0xfeab0000 0 0x10000>;
+			interrupts =3D <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 715>;
+			power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets =3D <&cpg 715>;
+			status =3D "disabled";
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@1 {
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+
+					reg =3D <1>;
+
+					csi41vin4: endpoint@0 {
+						reg =3D <0>;
+						remote-endpoint =3D <&vin4csi41>;
+					};
+					csi41vin5: endpoint@1 {
+						reg =3D <1>;
+						remote-endpoint =3D <&vin5csi41>;
+					};
+					csi41vin6: endpoint@2 {
+						reg =3D <2>;
+						remote-endpoint =3D <&vin6csi41>;
+					};
+					csi41vin7: endpoint@3 {
+						reg =3D <3>;
+						remote-endpoint =3D <&vin7csi41>;
+					};
+				};
+			};
+		};
+
 		du: display@feb00000 {
 			compatible =3D "renesas,du-r8a77980",
 				     "renesas,du-r8a77970";
--=20
2.11.0

ATCH] =C3=91=06
