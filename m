Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:25230 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725731AbeHUFRc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Aug 2018 01:17:32 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "balbi@kernel.org" <balbi@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: RE: [PATCH] usb: Change usb_of_get_companion_dev() place to
 usb/common
Date: Tue, 21 Aug 2018 01:59:26 +0000
Message-ID: <OSBPR01MB2293D762881D192E7C4CAC46D8310@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1534734626-16767-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1534734626-16767-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Yoshihiro Shimoda, Sent: Monday, August 20, 2018 12:10 PM
>=20
> Since renesas_usb3 udc driver calls usb_of_get_companion_dev()
> which is on usb/core/of.c, build error like below happens if we
> disable CONFIG_USB because the usb/core/ needs CONFIG_USB:
>=20
> ERROR: "usb_of_get_companion_dev" [drivers/usb/gadget/udc/renesas_usb3.ko=
] undefined!
>=20
> According to the usb/gadget/Kconfig, "NOTE:  Gadget support
> ** DOES NOT ** depend on host-side CONFIG_USB !!".
> So, to fix the issue, this patch changes the usb_of_get_companion_dev()
> place from usb/core/of.c to usb/common/common.c to be called by both
> host and gadget.
>=20
> Reported-by: John Garry <john.garry@huawei.com>
> Fixes: 39facfa01c9f ("usb: gadget: udc: renesas_usb3: Add register of usb=
 role switch")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

On other email thread [1], Arnd said I have his Ack on this patch.
So,

Acked-by: Arnd Bergmann <arnd@arndb.de>

[1]
https://lkml.org/lkml/2018/8/20/216

Best regards,
Yoshihiro Shimoda
