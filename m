Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:34414 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750947AbcJSGNi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Oct 2016 02:13:38 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/4] usb: host: xhci: plat: add support for Renesas
 r8a7796 SoC
Date: Wed, 19 Oct 2016 06:13:32 +0000
Message-ID: <SIXPR06MB05599768043BB3A95EFAD5FDD8D20@SIXPR06MB0559.apcprd06.prod.outlook.com>
References: <1472028762-6640-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1472028762-6640-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> -----Original Message-----
> From: Yoshihiro Shimoda
> Sent: Wednesday, August 24, 2016 5:53 PM
> To: mathias.nyman@intel.com; gregkh@linuxfoundation.org; robh+dt@kernel.o=
rg; mark.rutland@arm.com
> Cc: linux-usb@vger.kernel.org; linux-renesas-soc@vger.kernel.org; Yoshihi=
ro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Subject: [PATCH 0/4] usb: host: xhci: plat: add support for Renesas r8a77=
96 SoC
>=20
> This patch is based on the latest Greg's usb.git / usb-next branch.
> (commit id =3D 1aaaa9acaea1dd2878d6c92b45e4c117ef425baf)
>=20
> Yoshihiro Shimoda (4):
>   usb: host: xhci: rcar: add a new firmware version for r8a7796
>   usb: host: xhci: rcar: add a macro XHCI_PLAT_RENESAS_RCAR_PRIV
>   usb: host: xhci: plat: use XHCI_PLAT_RENESAS_RCAR_PRIV macro for R-Car
>   usb: host: xhci: plat: add support for Renesas r8a7796 SoC
>=20
>  Documentation/devicetree/bindings/usb/usb-xhci.txt |  1 +
>  drivers/usb/host/xhci-plat.c                       | 17 ++++++----------=
-
>  drivers/usb/host/xhci-rcar.c                       | 18 +++++++++++++---=
--
>  drivers/usb/host/xhci-rcar.h                       |  9 +++++++++
>  4 files changed, 29 insertions(+), 16 deletions(-)

I found a problem this patch set, so please ignore this.
I will modify this and submit v2 patch set later.

Best regards,
Yoshihiro Shimoda

> --
> 1.9.1
