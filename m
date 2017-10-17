Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:18501 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752987AbdJQBd6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2017 21:33:58 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mathias Nyman <mathias.nyman@intel.com>
CC: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH  1/2] dt-bindings: usb-xhci: Document r8a7743 support
Date: Tue, 17 Oct 2017 01:33:51 +0000
Message-ID: <TY1PR06MB0992CBE8ED62C52D6412BF28D84C0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1508148769-47488-1-git-send-email-biju.das@bp.renesas.com>
 <1508148769-47488-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1508148769-47488-2-git-send-email-biju.das@bp.renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju-san,
(and added Mathias-san of the XHCI maintainer as TO)

Thank you for the patch!

> From: Biju Das, Sent: Monday, October 16, 2017 7:13 PM
>=20
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>=20
> Document r8a7743 xhci support. The driver will use the fallback
> compatible string "renesas,rcar-gen2-xhci", therefore no driver
> change is needed.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documen=
tation/devicetree/bindings/usb/usb-xhci.txt
> index 2d80b60..4125d02 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -7,12 +7,14 @@ Required properties:
>      - "marvell,armada3700-xhci" for Armada 37xx SoCs
>      - "marvell,armada-375-xhci" for Armada 375 SoCs
>      - "marvell,armada-380-xhci" for Armada 38x SoCs
> +    - "renesas,xhci-r8a7743" for r8a7743 SoC
>      - "renesas,xhci-r8a7790" for r8a7790 SoC
>      - "renesas,xhci-r8a7791" for r8a7791 SoC
>      - "renesas,xhci-r8a7793" for r8a7793 SoC
>      - "renesas,xhci-r8a7795" for r8a7795 SoC
>      - "renesas,xhci-r8a7796" for r8a7796 SoC
> -    - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 compatible devic=
e
> +    - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 or RZ/G1 compati=
ble
> +      device
>      - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 compatible devic=
e
>      - "xhci-platform" (deprecated)
>

It seems good to me. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda
