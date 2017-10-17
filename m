Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:28034 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755776AbdJQBjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2017 21:39:37 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH  2/2] ARM: dts: r8a7743: Add xhci support to SoC dtsi
Date: Tue, 17 Oct 2017 01:39:33 +0000
Message-ID: <TY1PR06MB0992D251A9DB8DB83E7099C9D84C0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1508148769-47488-1-git-send-email-biju.das@bp.renesas.com>
 <1508148769-47488-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1508148769-47488-3-git-send-email-biju.das@bp.renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju-san,

IIUC, when we submitted a patch for dts[i] file,
we don't need to submit such a patch to usb maintainers.

> From: Biju Das, Sent: Monday, October 16, 2017 7:13 PM
>=20
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>=20
> Add node for xhci. Boards DT files will enable it if needed.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm/boot/dts/r8a7743.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.d=
tsi
> index 699c040..386bf07 100644
> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -931,6 +931,26 @@
>  			status =3D "disabled";
>  		};
>=20
> +		/*
> +		 * pci1 and xhci share the same phy, therefore only one of them
> +		 * can be active at any one time. If both of them are enabled,
> +		 * a race condition will determine who'll control the phy.
> +		 * A firmware file is needed by the xhci driver in order for
> +		 * USB 3.0 to work properly.
> +		 */
> +		xhci: usb@ee000000 {
> +			compatible =3D "renesas,xhci-r8a7743",
> +				     "renesas,rcar-gen2-xhci";
> +			reg =3D <0 0xee000000 0 0xc00>;
> +			interrupts =3D <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 328>;
> +			power-domains =3D <&sysc R8A7743_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 328>;
> +			phys =3D <&usb2 1>;
> +			phy-names =3D "usb";
> +			status =3D "disabled";
> +		};
> +
>  		sdhi0: sd@ee100000 {
>  			compatible =3D "renesas,sdhi-r8a7743";
>  			reg =3D <0 0xee100000 0 0x328>;

It seems good to me. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> --
> 1.9.1
