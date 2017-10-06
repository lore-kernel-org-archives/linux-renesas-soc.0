Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:15997 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751363AbdJFCN4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 22:13:56 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "kishon@ti.com" <kishon@ti.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 0/4] phy: rcar-gen3-usb2: add support for r8a77995
Date: Fri, 6 Oct 2017 02:13:52 +0000
Message-ID: <TY1PR06MB099287B2AD911D64C62BD5CBD8710@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1504233685-17947-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1504233685-17947-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kishon,

Would you review this patch set?
I checked this can apply your latest linux-phy.git / next branch (the commi=
t id =3D 415060b21f31).

Best regards,
Yoshihiro Shimoda

> -----Original Message-----
> From: Yoshihiro Shimoda
> Sent: Friday, September 1, 2017 11:41 AM
> To: kishon@ti.com
> Cc: linux-kernel@vger.kernel.org; linux-renesas-soc@vger.kernel.org; Yosh=
ihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com>
> Subject: [PATCH v3 0/4] phy: rcar-gen3-usb2: add support for r8a77995
>=20
> This patch set is based on the latest phy.git / next branch
> (the commit id =3D d9c51f4c53ae2af03aa8bd001d46f21b0adcdab8).
>=20
> After this patch set is applied, a usb 2.0 host node that is combined
> with usb 2.0 peripheral needs 'dr_mode =3D "otg";' property.
>=20
> Changes from v2:
>  - Revise the commit log ("SoCs" is not third-person singular present).
>=20
> Changes from v1:
>  - Revise typo "wronly" to "wrongly".
>  - Remove RCAR_GEN3_PHY_HAS_DEDICATED_PINS from generic gen3 entry in
>    patch 3/4
>  - Remove the driver change from patch 4/4.
>  - Revise the commit log of patch 4/4.
>=20
> Yoshihiro Shimoda (4):
>   phy: rcar-gen3-usb2: check dr_mode for otg mode
>   phy: rcar-gen3-usb2: split the two meaning of "has_otg"
>   phy: rcar-gen3-usb2: add SoC-specific parameter for dedicated pins
>   phy: rcar-gen3-usb2: add binding for r8a77995
>=20
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 +
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 93 ++++++++++++++++=
------
>  2 files changed, 69 insertions(+), 26 deletions(-)
>=20
> --
> 1.9.1
