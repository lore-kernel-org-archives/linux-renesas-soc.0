Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:40620 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751067AbdHCIBu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2017 04:01:50 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc-owner@vger.kernel.org" <linux-mmc-owner@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH 4/4] mmc: sdhi: use maximum width for the sdbuf register
Date: Thu, 3 Aug 2017 08:01:45 +0000
Message-ID: <KL1PR06MB17029D34B970C8C59602ED42B8B10@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <20170630105649.16137-1-wsa+renesas@sang-engineering.com>
 <20170630105649.16137-5-wsa+renesas@sang-engineering.com>
 <TY1PR06MB07023DF77FC5A4453B09D82AB7B00@TY1PR06MB0702.apcprd06.prod.outlook.com>
 <KL1PR06MB1702B525F5A03DD74B960928B8B00@KL1PR06MB1702.apcprd06.prod.outlook.com>
 <20170802190427.GA1474@katana>
 <KL1PR06MB1702544BC4FD755C76314608B8B10@KL1PR06MB1702.apcprd06.prod.outlook.com>
 <20170803074304.GB1500@katana>
In-Reply-To: <20170803074304.GB1500@katana>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> -----Original Message-----
> From: Wolfram Sang [mailto:wsa@the-dreams.de]
> Sent: 03 August 2017 08:43
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>; linux-renesas-
> soc@vger.kernel.org; Simon Horman <horms@verge.net.au>; Yoshihiro
> Shimoda <yoshihiro.shimoda.uh@renesas.com>; linux-mmc-
> owner@vger.kernel.org
> Subject: Re: [PATCH 4/4] mmc: sdhi: use maximum width for the sdbuf regis=
ter
>
> > [    1.162808] sh_mobile_sdhi ee140000.sd: Got CD GPIO
> > [    1.167721] sh_mobile_sdhi ee140000.sd: Got WP GPIO
> > [    1.225803] bus_width: 0
>
> This should be '1'.
>

> Which tree is this based on? I can't find SDHI nodes for r8a7743 in its d=
tsi file in
> linux-next? I'd think the node is not correct.


It is not upstreamed yet. I am going to upstream this patches with in a wee=
k or two.
Currently this patch is under internal review.
It is identical to R-Car M2.I believe this issue should reproducible with R=
-Car M2-W board(r8a7791).

I first rebased my SDHI patches with renesas-dev branch and it worked fine.

Then I rebased the same patches on linux-next + relevant patches from renes=
as-dev , it is started showing the issue.
Then I found that this patch is causing the issue.

Please find the  DT related entries here.

diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documenta=
tion/devicetree/bindings/mmc/tmio_mmc.txt
index 4fd8b7a..0d507ec 100644
--- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
@@ -15,6 +15,8 @@ Required properties:
 "renesas,sdhi-r7s72100" - SDHI IP on R7S72100 SoC
 "renesas,sdhi-r8a73a4" - SDHI IP on R8A73A4 SoC
 "renesas,sdhi-r8a7740" - SDHI IP on R8A7740 SoC
+"renesas,sdhi-r8a7743" - SDHI IP on R8A7743 SoC
+"renesas,sdhi-r8a7745" - SDHI IP on R8A7745 SoC
 "renesas,sdhi-r8a7778" - SDHI IP on R8A7778 SoC
 "renesas,sdhi-r8a7779" - SDHI IP on R8A7779 SoC
 "renesas,sdhi-r8a7790" - SDHI IP on R8A7790 SoC
@@ -34,8 +36,8 @@ Required properties:
   "core" and "cd". If the controller only has 1 clock, naming is not
   required.
   Below is the number clocks for each supported SoC:
-   1: SH73A0, R8A73A4, R8A7740, R8A7778, R8A7779, R8A7790
-      R8A7791, R8A7792, R8A7793, R8A7794, R8A7795, R8A7796
+   1: SH73A0, R8A73A4, R8A7740, R8A7743, R8A7745, R8A7778, R8A7779,
+      R8A7790, R8A7791, R8A7792, R8A7793, R8A7794, R8A7795, R8A7796
    2: R7S72100

 Optional properties:
diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts b/arch/arm/boot/dts/r8=
a7743-iwg20d-q7.dts
index b3a1efa..b5ac0ff 100644
--- a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
+++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
@@ -19,6 +19,29 @@
 serial0 =3D &scif0;
 ethernet0 =3D &avb;
 };
+
+vcc_sdhi1: regulator-vcc-sdhi1 {
+compatible =3D "regulator-fixed";
+
+regulator-name =3D "SDHI1 Vcc";
+regulator-min-microvolt =3D <3300000>;
+regulator-max-microvolt =3D <3300000>;
+
+gpio =3D <&gpio1 16 GPIO_ACTIVE_LOW>;
+};
+
+vccq_sdhi1: regulator-vccq-sdhi1 {
+compatible =3D "regulator-gpio";
+
+regulator-name =3D "SDHI1 VccQ";
+regulator-min-microvolt =3D <1800000>;
+regulator-max-microvolt =3D <3300000>;
+
+gpios =3D <&gpio2 30 GPIO_ACTIVE_LOW>;
+gpios-states =3D <1>;
+states =3D <3300000 1
+  1800000 0>;
+};
 };

 &pfc {
@@ -36,6 +59,18 @@
 groups =3D "i2c2";
 function =3D "i2c2";
 };
+
+sdhi1_pins: sd1 {
+groups =3D "sdhi1_data4", "sdhi1_ctrl";
+function =3D "sdhi1";
+power-source =3D <3300>;
+};
+
+sdhi1_pins_uhs: sd1_uhs {
+groups =3D "sdhi1_data4", "sdhi1_ctrl";
+function =3D "sdhi1";
+power-source =3D <1800>;
+};
 };

 &scif0 {
@@ -72,3 +107,16 @@
 reg =3D <0x68>;
 };
 };
+
+&sdhi1 {
+pinctrl-0 =3D <&sdhi1_pins>;
+pinctrl-1 =3D <&sdhi1_pins_uhs>;
+pinctrl-names =3D "default", "state_uhs";
+
+vmmc-supply =3D <&vcc_sdhi1>;
+vqmmc-supply =3D <&vccq_sdhi1>;
+cd-gpios =3D <&gpio6 14 GPIO_ACTIVE_LOW>;
+wp-gpios =3D <&gpio6 15 GPIO_ACTIVE_HIGH>;
+sd-uhs-sdr50;
+status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/r8a7743-iwg20m.dtsi b/arch/arm/boot/dts/r8a7=
743-iwg20m.dtsi
index ff79938..4119737 100644
--- a/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
+++ b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
@@ -9,6 +9,7 @@
  */

 #include "r8a7743.dtsi"
+#include <dt-bindings/gpio/gpio.h>

 / {
 compatible =3D "iwave,g20m", "renesas,r8a7743";
@@ -42,6 +43,12 @@
 groups =3D "mmc_data8_b", "mmc_ctrl";
 function =3D "mmc";
 };
+
+sdhi0_pins: sd0 {
+groups =3D "sdhi0_data4", "sdhi0_ctrl";
+function =3D "sdhi0";
+power-source =3D <3300>;
+};
 };

 &mmcif0 {
@@ -53,3 +60,13 @@
 non-removable;
 status =3D "okay";
 };
+
+&sdhi0 {
+pinctrl-0 =3D <&sdhi0_pins>;
+pinctrl-names =3D "default";
+
+vmmc-supply =3D <&reg_3p3v>;
+vqmmc-supply =3D <&reg_3p3v>;
+cd-gpios =3D <&gpio7 11 GPIO_ACTIVE_LOW>;
+status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dts=
i
index 5c2b140..8945cc7 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -834,6 +834,48 @@
 max-frequency =3D <97500000>;
 status =3D "disabled";
 };
+
+sdhi0: sd@ee100000 {
+compatible =3D "renesas,sdhi-r8a7743";
+reg =3D <0 0xee100000 0 0x328>;
+interrupts =3D <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+clocks =3D <&cpg CPG_MOD 314>;
+dmas =3D <&dmac0 0xcd>, <&dmac0 0xce>,
+       <&dmac1 0xcd>, <&dmac1 0xce>;
+dma-names =3D "tx", "rx", "tx", "rx";
+max-frequency =3D <195000000>;
+power-domains =3D <&sysc R8A7743_PD_ALWAYS_ON>;
+resets =3D <&cpg 314>;
+status =3D "disabled";
+};
+
+sdhi1: sd@ee140000 {
+compatible =3D "renesas,sdhi-r8a7743";
+reg =3D <0 0xee140000 0 0x100>;
+interrupts =3D <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+clocks =3D <&cpg CPG_MOD 312>;
+dmas =3D <&dmac0 0xc1>, <&dmac0 0xc2>,
+       <&dmac1 0xc1>, <&dmac1 0xc2>;
+dma-names =3D "tx", "rx", "tx", "rx";
+max-frequency =3D <97500000>;
+power-domains =3D <&sysc R8A7743_PD_ALWAYS_ON>;
+resets =3D <&cpg 312>;
+status =3D "disabled";
+};
+
+sdhi2: sd@ee160000 {
+compatible =3D "renesas,sdhi-r8a7743";
+reg =3D <0 0xee160000 0 0x100>;
+interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+clocks =3D <&cpg CPG_MOD 311>;
+dmas =3D <&dmac0 0xd3>, <&dmac0 0xd4>,
+       <&dmac1 0xd3>, <&dmac1 0xd4>;
+dma-names =3D "tx", "rx", "tx", "rx";
+max-frequency =3D <97500000>;
+power-domains =3D <&sysc R8A7743_PD_ALWAYS_ON>;
+resets =3D <&cpg 311>;
+status =3D "disabled";
+};
 };

 /* External root clock */
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/re=
nesas_sdhi_sys_dmac.c
index 642a0dc..a90edb5 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -93,6 +93,8 @@
 { .compatible =3D "renesas,sdhi-r7s72100", .data =3D &of_rz_compatible, },
 { .compatible =3D "renesas,sdhi-r8a7778", .data =3D &of_rcar_gen1_compatib=
le, },
 { .compatible =3D "renesas,sdhi-r8a7779", .data =3D &of_rcar_gen1_compatib=
le, },
+{ .compatible =3D "renesas,sdhi-r8a7743", .data =3D &of_rcar_gen2_compatib=
le, },
+{ .compatible =3D "renesas,sdhi-r8a7745", .data =3D &of_rcar_gen2_compatib=
le, },
 { .compatible =3D "renesas,sdhi-r8a7790", .data =3D &of_rcar_gen2_compatib=
le, },
 { .compatible =3D "renesas,sdhi-r8a7791", .data =3D &of_rcar_gen2_compatib=
le, },
 { .compatible =3D "renesas,sdhi-r8a7792", .data =3D &of_rcar_gen2_compatib=
le, },







Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
