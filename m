Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:34233 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753480AbeD0HTh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 03:19:37 -0400
Date: Fri, 27 Apr 2018 09:19:33 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77965: use r8a77965-sysc binding
 definitions
Message-ID: <20180427071933.GS4235@w540>
References: <20180426193447.29565-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zROEGoKAXsG5UqGB"
Content-Disposition: inline
In-Reply-To: <20180426193447.29565-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--zROEGoKAXsG5UqGB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, Apr 26, 2018 at 09:34:47PM +0200, Niklas S=C3=B6derlund wrote:
> Replace the hardcoded power domain indices by R8A77965_PD_* symbols.
>

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 95 ++++++++++++-----------
>  1 file changed, 48 insertions(+), 47 deletions(-)
>
> Hi Simon,
>
> This is based on top of your trees devel branch from earlier today.
>
> // Nikls
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77965.dtsi
> index b12f41755aeafea1..054ac6be43fac6f3 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -10,6 +10,7 @@
>
>  #include <dt-bindings/clock/renesas-cpg-mssr.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/r8a77965-sysc.h>
>
>  #define CPG_AUDIO_CLK_I		10
>
> @@ -60,7 +61,7 @@
>  			compatible =3D "arm,cortex-a57", "arm,armv8";
>  			reg =3D <0x0>;
>  			device_type =3D "cpu";
> -			power-domains =3D <&sysc 0>;
> +			power-domains =3D <&sysc R8A77965_PD_CA57_CPU0>;
>  			next-level-cache =3D <&L2_CA57>;
>  			enable-method =3D "psci";
>  		};
> @@ -69,14 +70,14 @@
>  			compatible =3D "arm,cortex-a57","arm,armv8";
>  			reg =3D <0x1>;
>  			device_type =3D "cpu";
> -			power-domains =3D <&sysc 1>;
> +			power-domains =3D <&sysc R8A77965_PD_CA57_CPU1>;
>  			next-level-cache =3D <&L2_CA57>;
>  			enable-method =3D "psci";
>  		};
>
>  		L2_CA57: cache-controller-0 {
>  			compatible =3D "cache";
> -			power-domains =3D <&sysc 12>;
> +			power-domains =3D <&sysc R8A77965_PD_CA57_SCU>;
>  			cache-unified;
>  			cache-level =3D <2>;
>  		};
> @@ -146,7 +147,7 @@
>  			#interrupt-cells =3D <2>;
>  			interrupt-controller;
>  			clocks =3D <&cpg CPG_MOD 912>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 912>;
>  		};
>
> @@ -161,7 +162,7 @@
>  			#interrupt-cells =3D <2>;
>  			interrupt-controller;
>  			clocks =3D <&cpg CPG_MOD 911>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 911>;
>  		};
>
> @@ -176,7 +177,7 @@
>  			#interrupt-cells =3D <2>;
>  			interrupt-controller;
>  			clocks =3D <&cpg CPG_MOD 910>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 910>;
>  		};
>
> @@ -191,7 +192,7 @@
>  			#interrupt-cells =3D <2>;
>  			interrupt-controller;
>  			clocks =3D <&cpg CPG_MOD 909>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 909>;
>  		};
>
> @@ -206,7 +207,7 @@
>  			#interrupt-cells =3D <2>;
>  			interrupt-controller;
>  			clocks =3D <&cpg CPG_MOD 908>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 908>;
>  		};
>
> @@ -221,7 +222,7 @@
>  			#interrupt-cells =3D <2>;
>  			interrupt-controller;
>  			clocks =3D <&cpg CPG_MOD 907>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 907>;
>  		};
>
> @@ -236,7 +237,7 @@
>  			#interrupt-cells =3D <2>;
>  			interrupt-controller;
>  			clocks =3D <&cpg CPG_MOD 906>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 906>;
>  		};
>
> @@ -251,7 +252,7 @@
>  			#interrupt-cells =3D <2>;
>  			interrupt-controller;
>  			clocks =3D <&cpg CPG_MOD 905>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 905>;
>  		};
>
> @@ -293,7 +294,7 @@
>  				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
>  				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&cpg CPG_MOD 407>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 407>;
>  		};
>
> @@ -347,7 +348,7 @@
>  			reg =3D <0 0xe60b0000 0 0x425>;
>  			interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&cpg CPG_MOD 926>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 926>;
>  			dmas =3D <&dmac0 0x11>, <&dmac0 0x10>;
>  			dma-names =3D "tx", "rx";
> @@ -366,7 +367,7 @@
>  			renesas,buswait =3D <11>;
>  			phys =3D <&usb2_phy0>;
>  			phy-names =3D "usb";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 704>;
>  			status =3D "disabled";
>  		};
> @@ -379,7 +380,7 @@
>  				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names =3D "ch0", "ch1";
>  			clocks =3D <&cpg CPG_MOD 330>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 330>;
>  			#dma-cells =3D <1>;
>  			dma-channels =3D <2>;
> @@ -393,7 +394,7 @@
>  				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names =3D "ch0", "ch1";
>  			clocks =3D <&cpg CPG_MOD 331>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 331>;
>  			#dma-cells =3D <1>;
>  			dma-channels =3D <2>;
> @@ -406,7 +407,7 @@
>  			clocks =3D <&cpg CPG_MOD 328>, <&usb3s0_clk>,
>  				 <&usb_extal_clk>;
>  			clock-names =3D "usb3-if", "usb3s_clk", "usb_extal";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 328>;
>  			#phy-cells =3D <0>;
>  			status =3D "disabled";
> @@ -440,7 +441,7 @@
>  					"ch12", "ch13", "ch14", "ch15";
>  			clocks =3D <&cpg CPG_MOD 219>;
>  			clock-names =3D "fck";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 219>;
>  			#dma-cells =3D <1>;
>  			dma-channels =3D <16>;
> @@ -474,7 +475,7 @@
>  					"ch12", "ch13", "ch14", "ch15";
>  			clocks =3D <&cpg CPG_MOD 218>;
>  			clock-names =3D "fck";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 218>;
>  			#dma-cells =3D <1>;
>  			dma-channels =3D <16>;
> @@ -508,7 +509,7 @@
>  					"ch12", "ch13", "ch14", "ch15";
>  			clocks =3D <&cpg CPG_MOD 217>;
>  			clock-names =3D "fck";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 217>;
>  			#dma-cells =3D <1>;
>  			dma-channels =3D <16>;
> @@ -551,7 +552,7 @@
>  					  "ch20", "ch21", "ch22", "ch23",
>  					  "ch24";
>  			clocks =3D <&cpg CPG_MOD 812>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 812>;
>  			phy-mode =3D "rgmii";
>  			#address-cells =3D <1>;
> @@ -565,7 +566,7 @@
>  			#pwm-cells =3D <2>;
>  			clocks =3D <&cpg CPG_MOD 523>;
>  			resets =3D <&cpg 523>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			status =3D "disabled";
>  		};
>
> @@ -575,7 +576,7 @@
>  			#pwm-cells =3D <2>;
>  			clocks =3D <&cpg CPG_MOD 523>;
>  			resets =3D <&cpg 523>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			status =3D "disabled";
>  		};
>
> @@ -585,7 +586,7 @@
>  			#pwm-cells =3D <2>;
>  			clocks =3D <&cpg CPG_MOD 523>;
>  			resets =3D <&cpg 523>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			status =3D "disabled";
>  		};
>
> @@ -595,7 +596,7 @@
>  			#pwm-cells =3D <2>;
>  			clocks =3D <&cpg CPG_MOD 523>;
>  			resets =3D <&cpg 523>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			status =3D "disabled";
>  		};
>
> @@ -605,7 +606,7 @@
>  			#pwm-cells =3D <2>;
>  			clocks =3D <&cpg CPG_MOD 523>;
>  			resets =3D <&cpg 523>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			status =3D "disabled";
>  		};
>
> @@ -615,7 +616,7 @@
>  			#pwm-cells =3D <2>;
>  			clocks =3D <&cpg CPG_MOD 523>;
>  			resets =3D <&cpg 523>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			status =3D "disabled";
>  		};
>
> @@ -625,7 +626,7 @@
>  			#pwm-cells =3D <2>;
>  			clocks =3D <&cpg CPG_MOD 523>;
>  			resets =3D <&cpg 523>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			status =3D "disabled";
>  		};
>
> @@ -641,7 +642,7 @@
>  			dmas =3D <&dmac1 0x51>, <&dmac1 0x50>,
>  			       <&dmac2 0x51>, <&dmac2 0x50>;
>  			dma-names =3D "tx", "rx", "tx", "rx";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 207>;
>  			status =3D "disabled";
>  		};
> @@ -658,7 +659,7 @@
>  			dmas =3D <&dmac1 0x53>, <&dmac1 0x52>,
>  			       <&dmac2 0x53>, <&dmac2 0x52>;
>  			dma-names =3D "tx", "rx", "tx", "rx";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 206>;
>  			status =3D "disabled";
>  		};
> @@ -672,7 +673,7 @@
>  				 <&cpg CPG_CORE 20>,
>  				 <&scif_clk>;
>  			clock-names =3D "fck", "brg_int", "scif_clk";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 310>;
>  			status =3D "disabled";
>  		};
> @@ -688,7 +689,7 @@
>  			clock-names =3D "fck", "brg_int", "scif_clk";
>  			dmas =3D <&dmac0 0x57>, <&dmac0 0x56>;
>  			dma-names =3D "tx", "rx";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 204>;
>  			status =3D "disabled";
>  		};
> @@ -704,7 +705,7 @@
>  			clock-names =3D "fck", "brg_int", "scif_clk";
>  			dmas =3D <&dmac0 0x59>, <&dmac0 0x58>;
>  			dma-names =3D "tx", "rx";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 203>;
>  			status =3D "disabled";
>  		};
> @@ -721,7 +722,7 @@
>  			dmas =3D <&dmac1 0x5b>, <&dmac1 0x5a>,
>  			       <&dmac2 0x5b>, <&dmac2 0x5a>;
>  			dma-names =3D "tx", "rx", "tx", "rx";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 202>;
>  			status =3D "disabled";
>  		};
> @@ -735,7 +736,7 @@
>  			dmas =3D <&dmac1 0x41>, <&dmac1 0x40>,
>  			       <&dmac2 0x41>, <&dmac2 0x40>;
>  			dma-names =3D "tx", "rx", "tx", "rx";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 211>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> @@ -751,7 +752,7 @@
>  			dmas =3D <&dmac1 0x43>, <&dmac1 0x42>,
>  			       <&dmac2 0x43>, <&dmac2 0x42>;
>  			dma-names =3D "tx", "rx", "tx", "rx";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 210>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> @@ -766,7 +767,7 @@
>  			clocks =3D <&cpg CPG_MOD 209>;
>  			dmas =3D <&dmac0 0x45>, <&dmac0 0x44>;
>  			dma-names =3D "tx", "rx";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 209>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> @@ -781,7 +782,7 @@
>  			clocks =3D <&cpg CPG_MOD 208>;
>  			dmas =3D <&dmac0 0x47>, <&dmac0 0x46>;
>  			dma-names =3D "tx", "rx";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 208>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> @@ -864,7 +865,7 @@
>  			reg =3D <0 0xee000000 0 0xc00>;
>  			interrupts =3D <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&cpg CPG_MOD 328>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 328>;
>  			status =3D "disabled";
>  		};
> @@ -875,7 +876,7 @@
>  			reg =3D <0 0xee020000 0 0x400>;
>  			interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&cpg CPG_MOD 328>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 328>;
>  			status =3D "disabled";
>  		};
> @@ -887,7 +888,7 @@
>  			clocks =3D <&cpg CPG_MOD 703>;
>  			phys =3D <&usb2_phy0>;
>  			phy-names =3D "usb";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 703>;
>  			status =3D "disabled";
>  		};
> @@ -899,7 +900,7 @@
>  			clocks =3D <&cpg CPG_MOD 702>;
>  			phys =3D <&usb2_phy1>;
>  			phy-names =3D "usb";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 702>;
>  			status =3D "disabled";
>  		};
> @@ -912,7 +913,7 @@
>  			phys =3D <&usb2_phy0>;
>  			phy-names =3D "usb";
>  			companion =3D <&ohci0>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 703>;
>  			status =3D "disabled";
>  		};
> @@ -925,7 +926,7 @@
>  			phys =3D <&usb2_phy1>;
>  			phy-names =3D "usb";
>  			companion =3D <&ohci1>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 702>;
>  			status =3D "disabled";
>  		};
> @@ -936,7 +937,7 @@
>  			reg =3D <0 0xee080200 0 0x700>;
>  			interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&cpg CPG_MOD 703>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 703>;
>  			#phy-cells =3D <0>;
>  			status =3D "disabled";
> @@ -947,7 +948,7 @@
>  				     "renesas,rcar-gen3-usb2-phy";
>  			reg =3D <0 0xee0a0200 0 0x700>;
>  			clocks =3D <&cpg CPG_MOD 703>;
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 703>;
>  			#phy-cells =3D <0>;
>  			status =3D "disabled";
> @@ -986,7 +987,7 @@
>  					(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
>  			clocks =3D <&cpg CPG_MOD 408>;
>  			clock-names =3D "clk";
> -			power-domains =3D <&sysc 32>;
> +			power-domains =3D <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 408>;
>  		};
>
> --
> 2.17.0
>

--zROEGoKAXsG5UqGB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJa4s8FAAoJEHI0Bo8WoVY8ylkQAI29wxin080AhWRsbuUAbVX7
SHaQq3a+Nd2r8wk81sWhxQQTxZs1L77FkjroHpL3Al9gyHWJSbWmIXkiRP9IvP03
zBOdEbYEADv1vtZCO2Pnt3TaPunJav8vg8CMnEcKyMDRaVITYQFkXNIHn0aB2TSG
nxeyguUOLaU20HcOPuypDk0xMTAozUeYErHq70Jow3QLn3KkI1G753ZqmEhwn+kc
NoR16NrRnSWjbbZjpnNtJ1L8BbDQKSyCTVkW3uc3icKbaHqFJEvWfP14jqV93xXI
EmNvJQoh9Oq7nChlyFEcIjF0t4LNzLQQqGJCSFJW1yvaDQLt+BMmm2oZgSOI6q07
MF1Zhd3Goiu8vfrCrl1nRZ8G7nAhxr8J1WvUJiRoRzQgqUxKWyzGCh6vi+YzU09k
JbFBc1UcZpSC+KoFwG80EI+palSSNf47iynK4oCLX3QVNv55XEJTTgfISWuntNMP
DcGEiyglVO86oNEzUlmuzu03L+ZjTBZtC/iakTs9PjdxHx6u4AGA8OfT18LOGpOz
SAZU5QTxxYa28rP7/209yur0PRN29OYlSILlmGrbLcKBJhLiyl/tQCF9fmots4a8
i7w4dYhDJsyjNHUAaQKHMS8nADJzGm5GWXHPP2K5ro27kISNG6GzBVXSacF98tjE
4Wtt88mXS0QnyUUq5SQY
=4X6V
-----END PGP SIGNATURE-----

--zROEGoKAXsG5UqGB--
