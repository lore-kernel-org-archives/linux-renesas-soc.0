Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:43460 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753262AbdEWGAY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 May 2017 02:00:24 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "balbi@kernel.org" <balbi@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/5] usb: gadget: udc: renesas_usb3: add DMAC support
Date: Tue, 23 May 2017 06:00:19 +0000
Message-ID: <TY1PR06MB09923F1ACA6B07A4D43ED674D8F90@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1493207411-24416-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1493207411-24416-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Felipe,

> -----Original Message-----
> From: Yoshihiro Shimoda
> Sent: Wednesday, April 26, 2017 8:50 PM
>=20
> This patch set is based on the latest Feribe's usb.git / testing/next bra=
nch
> (the commit id =3D 28ea6be01e2cf244c461a40c8e9593816f894412.)

I'm afraid but, would you review this patch set?
This patch set can be applied on the today's testing/next branch.

Best regards,
Yoshihiro Shimoda

> This patch set has 2 things:
>  - Fixes some minor issues.
>  - Add support for dedicated DMAC.
>=20
> If possible, I want the patches [1/5] to [4/5] to be applied to v4.12-rcN=
.
> I think the patch [5/5] will be applied to v4.13 (or later).
> Should I submit them sepaletely?
>=20
> Yoshihiro Shimoda (5):
>   usb: gadget: udc: renesas_usb3: fix pm_runtime functions calling
>   usb: gadget: udc: renesas_usb3: fix deadlock by spinlock
>   usb: gadget: udc: renesas_usb3: lock for PN_ registers access
>   usb: gadget: udc: renesas_usb3: Fix PN_INT_ENA disabling timing
>   usb: gadget: udc: renesas_usb3: add support for dedicated DMAC
>=20
>  drivers/usb/gadget/udc/renesas_usb3.c | 438 ++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 425 insertions(+), 13 deletions(-)
>=20
> --
> 1.9.1
