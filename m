Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:27395 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751952AbeB0IUD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 03:20:03 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: host: xhci-rcar: add support for r8a77965
Date: Tue, 27 Feb 2018 08:19:55 +0000
Message-ID: <TY1PR06MB09923E52BDCB88BA23CB04C9D8C00@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1519719092-27729-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1519719092-27729-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

I'm afraid but I will re-submit this patch because we should get review by =
device tree maintainers.

Best regards,
Yoshihiro Shimoda

> From: Yoshihiro Shimoda, Sent: Tuesday, February 27, 2018 5:12 PM
>=20
> This patch adds support for r8a77965 (R-Car M3-N).
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>  drivers/usb/host/xhci-rcar.c                       | 4 ++++
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documen=
tation/devicetree/bindings/usb/usb-xhci.txt
> index e2ea59b..1651483a 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -13,6 +13,7 @@ Required properties:
>      - "renesas,xhci-r8a7793" for r8a7793 SoC
>      - "renesas,xhci-r8a7795" for r8a7795 SoC
>      - "renesas,xhci-r8a7796" for r8a7796 SoC
> +    - "renesas,xhci-r8a77965" for r8a77965 SoC
>      - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 or RZ/G1 compati=
ble
>        device
>      - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 compatible devic=
e
> diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> index f0b5596..f33ffc2 100644
> --- a/drivers/usb/host/xhci-rcar.c
> +++ b/drivers/usb/host/xhci-rcar.c
> @@ -83,6 +83,10 @@
>  		.soc_id =3D "r8a7796",
>  		.data =3D (void *)RCAR_XHCI_FIRMWARE_V3,
>  	},
> +	{
> +		.soc_id =3D "r8a77965",
> +		.data =3D (void *)RCAR_XHCI_FIRMWARE_V3,
> +	},
>  	{ /* sentinel */ },
>  };
>=20
> --
> 1.9.1
