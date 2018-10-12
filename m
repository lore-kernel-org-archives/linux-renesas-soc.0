Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:51385 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727524AbeJLQD2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Oct 2018 12:03:28 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: "horms@verge.net.au" <horms@verge.net.au>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: add/enable USB2.0 peripheral for
 R-Car [DE]3
Date: Fri, 12 Oct 2018 08:32:02 +0000
Message-ID: <OSBPR01MB2103D2A8BA4D556D7234D470B8E20@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1539081911-9020-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TYAPR01MB228597FF192B13D50AE16FC7B7E20@TYAPR01MB2285.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB228597FF192B13D50AE16FC7B7E20@TYAPR01MB2285.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-San,

Thanks for the patch.

> -----Original Message-----
> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-
> owner@vger.kernel.org> On Behalf Of Yoshihiro Shimoda
> Sent: 09 October 2018 11:45
> To: horms@verge.net.au; magnus.damm@gmail.com
> Cc: linux-renesas-soc@vger.kernel.org; Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com>
> Subject: [PATCH] arm64: dts: renesas: add/enable USB2.0 peripheral for R-
> Car [DE]3
>
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts |  8 +++++
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi      | 45
> ++++++++++++++++++++++++++
>  4 files changed, 106 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index 7278cd5..e3726307 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -357,6 +357,51 @@
>  resets =3D <&cpg 407>;
>  };
>
> +hsusb: usb@e6590000 {
> +compatible =3D "renesas,usbhs-r8a77990",
> +     "renesas,rcar-gen3-usbhs";
> +reg =3D <0 0xe6590000 0 0x100>;

is it not 0x200?

Renesas_usbhs driver("drivers/usb/renesas_usbhs/common.c ")  maps the addre=
ss up to 0x100 using "devm_ioremap_resource" function

where as the  "drivers/usb/renesas_usbhs/rcar3"  access  addresses beyond 0=
x100 (for eg:- 0x102,0x180,0x184,0x188) using iowrite32/16 calls.

This issue is present in other R-Car Gen3 variant as well(for eg:- R-Car H3=
/M3-W,..... etc).

> +interrupts =3D <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> +clocks =3D <&cpg CPG_MOD 704>, <&cpg CPG_MOD
> 703>;
> +dmas =3D <&usb_dmac0 0>, <&usb_dmac0 1>,
> +       <&usb_dmac1 0>, <&usb_dmac1 1>;
> +dma-names =3D "ch0", "ch1", "ch2", "ch3";
> +renesas,buswait =3D <11>;
> +phys =3D <&usb2_phy0>;
> +phy-names =3D "usb";
> +power-domains =3D <&sysc
> R8A77990_PD_ALWAYS_ON>;
> +resets =3D <&cpg 704>, <&cpg 703>;
> +status =3D "disabled";
> +};
> +
> +usb_dmac0: dma-controller@e65a0000 {
> +compatible =3D "renesas,r8a77990-usb-dmac",
> +     "renesas,usb-dmac";
> +reg =3D <0 0xe65a0000 0 0x100>;
> +interrupts =3D <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
> +      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +interrupt-names =3D "ch0", "ch1";
> +clocks =3D <&cpg CPG_MOD 330>;
> +power-domains =3D <&sysc
> R8A77990_PD_ALWAYS_ON>;
> +resets =3D <&cpg 330>;
> +#dma-cells =3D <1>;
> +dma-channels =3D <2>;
> +};
> +
> +usb_dmac1: dma-controller@e65b0000 {
> +compatible =3D "renesas,r8a77990-usb-dmac",
> +     "renesas,usb-dmac";
> +reg =3D <0 0xe65b0000 0 0x100>;
> +interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
> +      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +interrupt-names =3D "ch0", "ch1";
> +clocks =3D <&cpg CPG_MOD 331>;
> +power-domains =3D <&sysc
> R8A77990_PD_ALWAYS_ON>;
> +resets =3D <&cpg 331>;
> +#dma-cells =3D <1>;
> +dma-channels =3D <2>;
> +};
> +
>  dmac0: dma-controller@e6700000 {
>  compatible =3D "renesas,dmac-r8a77990",
>       "renesas,rcar-dmac";
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index 2405eaa..48bb1d7 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -179,6 +179,7 @@
>  };
>
>  &ehci0 {
> +dr_mode =3D "host";
>  status =3D "okay";
>  };
>
> @@ -186,6 +187,11 @@
>  clock-frequency =3D <48000000>;
>  };
>
> +&hsusb {
> +dr_mode =3D "host";
> +status =3D "okay";
> +};
> +
>  &i2c0 {
>  pinctrl-0 =3D <&i2c0_pins>;
>  pinctrl-names =3D "default";
> @@ -337,6 +343,7 @@
>  };
>
>  &ohci0 {
> +dr_mode =3D "host";
>  status =3D "okay";
>  };
>
> @@ -445,6 +452,7 @@
>  pinctrl-0 =3D <&usb0_pins>;
>  pinctrl-names =3D "default";
>
> +renesas,no-otg-pins;
>  status =3D "okay";
>  };
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index 214f495..186f477 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -344,6 +344,51 @@
>  status =3D "disabled";
>  };
>
> +hsusb: usb@e6590000 {
> +compatible =3D "renesas,usbhs-r8a77995",
> +     "renesas,rcar-gen3-usbhs";
> +reg =3D <0 0xe6590000 0 0x100>;

Same as above.

> +interrupts =3D <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> +clocks =3D <&cpg CPG_MOD 704>, <&cpg CPG_MOD
> 703>;
> +dmas =3D <&usb_dmac0 0>, <&usb_dmac0 1>,
> +       <&usb_dmac1 0>, <&usb_dmac1 1>;
> +dma-names =3D "ch0", "ch1", "ch2", "ch3";
> +renesas,buswait =3D <11>;
> +phys =3D <&usb2_phy0>;
> +phy-names =3D "usb";
> +power-domains =3D <&sysc
> R8A77995_PD_ALWAYS_ON>;
> +resets =3D <&cpg 704>, <&cpg 703>;
> +status =3D "disabled";
> +};
> +
> +usb_dmac0: dma-controller@e65a0000 {
> +compatible =3D "renesas,r8a77995-usb-dmac",
> +     "renesas,usb-dmac";
> +reg =3D <0 0xe65a0000 0 0x100>;
> +interrupts =3D <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
> +      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +interrupt-names =3D "ch0", "ch1";
> +clocks =3D <&cpg CPG_MOD 330>;
> +power-domains =3D <&sysc
> R8A77995_PD_ALWAYS_ON>;
> +resets =3D <&cpg 330>;
> +#dma-cells =3D <1>;
> +dma-channels =3D <2>;
> +};
> +
> +usb_dmac1: dma-controller@e65b0000 {
> +compatible =3D "renesas,r8a77995-usb-dmac",
> +     "renesas,usb-dmac";
> +reg =3D <0 0xe65b0000 0 0x100>;
> +interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
> +      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +interrupt-names =3D "ch0", "ch1";
> +clocks =3D <&cpg CPG_MOD 331>;
> +power-domains =3D <&sysc
> R8A77995_PD_ALWAYS_ON>;
> +resets =3D <&cpg 331>;
> +#dma-cells =3D <1>;
> +dma-channels =3D <2>;
> +};
> +
>  canfd: can@e66c0000 {
>  compatible =3D "renesas,r8a77995-canfd",
>       "renesas,rcar-gen3-canfd";
> --
> 1.9.1




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
