Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:24028 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754749AbdLOK1K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 05:27:10 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
CC: "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
        "kishon@ti.com" <kishon@ti.com>, "arnd@arndb.de" <arnd@arndb.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] phy: rcar-gen3-usb2: add dependency on USB
Date: Fri, 15 Dec 2017 10:27:06 +0000
Message-ID: <TY1PR06MB0992DB1C0BCB81617E1E8583D80B0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1513333220-44070-1-git-send-email-vladimir.murzin@arm.com>
In-Reply-To: <1513333220-44070-1-git-send-email-vladimir.murzin@arm.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> -----Original Message-----
> From: Vladimir Murzin, Sent: Friday, December 15, 2017 7:20 PM
>=20
> Following error showed up:
>=20
> drivers/phy/renesas/phy-rcar-gen3-usb2.o: In function `rcar_gen3_phy_usb2=
_probe':
> /work/tools/linux/drivers/phy/renesas/phy-rcar-gen3-usb2.c:444: undefined=
 reference to `of_usb_get_dr_mode_by_phy'
> Makefile:993: recipe for target 'vmlinux' failed
> make: *** [vmlinux] Error 1
>=20
> with CONFIG_USB_SUPPORT=3Dn
>=20
> Add dependency on USB_SUPPORT and select USB_COMMON to make sure that
> of_usb_get_dr_mode_by_phy() is available.
>=20
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>

Thank you for the patch! However, Arnd already sent such a patch before.

https://lkml.org/lkml/2017/11/2/373

The latest Linux-phy.git doesn't apply it yet though...

Best regards,
Yoshihiro Shimoda
