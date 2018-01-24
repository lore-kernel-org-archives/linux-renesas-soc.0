Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:16322 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S964810AbeAXRWr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jan 2018 12:22:47 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
CC: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "Fabrizio Castro" <fabrizio.castro@bp.renesas.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: RE: [PATCH 1/8] dt-bindings: can: rcar_can: document r8a774[35] can
 support
Date: Wed, 24 Jan 2018 17:22:41 +0000
Message-ID: <SG2PR06MB0886FFF48DD9DBE7693EEDBDC0E20@SG2PR06MB0886.apcprd06.prod.outlook.com>
References: <1510067449-17017-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1510067449-17017-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1510067449-17017-2-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Marc,

thank you for Acking the patch, just wondering if this patch has any chance=
 to end up in v4.16?

Thanks,
Fab

> Subject: [PATCH 1/8] dt-bindings: can: rcar_can: document r8a774[35] can =
support
>
> Document "renesas,can-r8a7743" and "renesas,can-r8a7745" compatible
> strings. Since the fallback compatible string ("renesas,rcar-gen2-can")
> activates the right code in the driver, no driver change is needed.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/net/can/rcar_can.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/net/can/rcar_can.txt b/Doc=
umentation/devicetree/bindings/net/can/rcar_can.txt
> index 06bb7cc..94a7f33 100644
> --- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
> +++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
> @@ -2,7 +2,9 @@ Renesas R-Car CAN controller Device Tree Bindings
>  -------------------------------------------------
>
>  Required properties:
> -- compatible: "renesas,can-r8a7778" if CAN controller is a part of R8A77=
78 SoC.
> +- compatible: "renesas,can-r8a7743" if CAN controller is a part of R8A77=
43 SoC.
> +      "renesas,can-r8a7745" if CAN controller is a part of R8A7745 SoC.
> +      "renesas,can-r8a7778" if CAN controller is a part of R8A7778 SoC.
>        "renesas,can-r8a7779" if CAN controller is a part of R8A7779 SoC.
>        "renesas,can-r8a7790" if CAN controller is a part of R8A7790 SoC.
>        "renesas,can-r8a7791" if CAN controller is a part of R8A7791 SoC.
> @@ -12,7 +14,8 @@ Required properties:
>        "renesas,can-r8a7795" if CAN controller is a part of R8A7795 SoC.
>        "renesas,can-r8a7796" if CAN controller is a part of R8A7796 SoC.
>        "renesas,rcar-gen1-can" for a generic R-Car Gen1 compatible device=
.
> -      "renesas,rcar-gen2-can" for a generic R-Car Gen2 compatible device=
.
> +      "renesas,rcar-gen2-can" for a generic R-Car Gen2 or RZ/G1
> +      compatible device.
>        "renesas,rcar-gen3-can" for a generic R-Car Gen3 compatible device=
.
>        When compatible with the generic version, nodes must list the
>        SoC-specific version corresponding to the platform first
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
