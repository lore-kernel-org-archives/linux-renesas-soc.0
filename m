Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:64837 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751358AbdJPKwz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2017 06:52:55 -0400
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Biju Das <biju.das@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH RESEND] phy: rcar-gen2: Add r8a7743/5 support
Date: Mon, 16 Oct 2017 10:52:51 +0000
Message-ID: <TY1PR06MB0702439B7CD95E771FAC001DB74F0@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <1507544543-28654-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1507544543-28654-1-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Kishon,

> From: Biju Das [mailto:biju.das@bp.renesas.com]
> Sent: 09 October 2017 11:22
>=20
> Add USB PHY support for r8a7743/5 SoC. Renesas RZ/G1[ME] (R8A7743/5)
> USB PHY is identical to the R-Car Gen2 family.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Acked-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Does this patch look okay to you?

Thanks, Chris


> ---
> This patch is tested against Linux next tag next-20170929.
>=20
>  Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> index 91da947..eeb9e18 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> @@ -4,10 +4,13 @@ This file provides information on what the device node
> for the R-Car generation
>  2 USB PHY contains.
>=20
>  Required properties:
> -- compatible: "renesas,usb-phy-r8a7790" if the device is a part of R8A77=
90
> SoC.
> +- compatible: "renesas,usb-phy-r8a7743" if the device is a part of R8A77=
43
> SoC.
> +	      "renesas,usb-phy-r8a7745" if the device is a part of R8A7745 SoC.
> +	      "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC.
>  	      "renesas,usb-phy-r8a7791" if the device is a part of R8A7791 SoC.
>  	      "renesas,usb-phy-r8a7794" if the device is a part of R8A7794 SoC.
> -	      "renesas,rcar-gen2-usb-phy" for a generic R-Car Gen2 compatible
> device.
> +	      "renesas,rcar-gen2-usb-phy" for a generic R-Car Gen2 or
> +					  RZ/G1 compatible device.
>=20
>  	      When compatible with the generic version, nodes must list the
>  	      SoC-specific version corresponding to the platform first
> --
> 1.9.1
