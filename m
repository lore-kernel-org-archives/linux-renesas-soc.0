Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:37404 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751373AbdJMGXF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2017 02:23:05 -0400
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 04/13] ARM: dts: r8a7743: Add missing clock for secondary
 CA15 CPU core
Date: Fri, 13 Oct 2017 06:23:01 +0000
Message-ID: <TY1PR06MB0702D56DCCEA688E8F643F5FB7480@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
 <1507800916-11509-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1507800916-11509-5-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Geert,

> From: linux-renesas-soc-owner@vger.kernel.org [mailto:linux-renesas-soc-
> owner@vger.kernel.org] On Behalf Of Geert Uytterhoeven
> Sent: 12 October 2017 10:35
>=20
> Currently only the primary CPU in the CA15 cluster has a clocks property,
> while the secondary CPU core is driven by the same clock.
> Add the missing clocks property to fix this.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks okay to me, thanks.

Reviewed-by: Chris Paterson <chris.paterson2@renesas.com

> ---
>  arch/arm/boot/dts/r8a7743.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/r8a7743.dtsi
> b/arch/arm/boot/dts/r8a7743.dtsi index
> d541fd9ffafb34ce..e09517bce30db2e8 100644
> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -63,6 +63,7 @@
>  			compatible =3D "arm,cortex-a15";
>  			reg =3D <1>;
>  			clock-frequency =3D <1500000000>;
> +			clocks =3D <&cpg CPG_CORE R8A7743_CLK_Z>;
>  			power-domains =3D <&sysc R8A7743_PD_CA15_CPU1>;
>  			next-level-cache =3D <&L2_CA15>;
>  		};
> --
> 2.7.4
