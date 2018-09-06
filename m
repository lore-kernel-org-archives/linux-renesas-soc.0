Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:56915 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725850AbeIFJQW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Sep 2018 05:16:22 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        John Garry <john.garry@huawei.com>
Subject: RE: [PATCH] usb: Change usb_of_get_companion_dev() place to
 usb/common
Date: Thu, 6 Sep 2018 04:42:47 +0000
Message-ID: <OSBPR01MB22938980AD699D73E501A352D8010@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1534734626-16767-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <OSBPR01MB2293D762881D192E7C4CAC46D8310@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2293D762881D192E7C4CAC46D8310@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Greg, Felipe,
(Add John's email to CC)

> From: Yoshihiro Shimoda, Sent: Tuesday, August 21, 2018 10:59 AM
>=20
> Hi,
>=20
> > From: Yoshihiro Shimoda, Sent: Monday, August 20, 2018 12:10 PM
> >
> > Since renesas_usb3 udc driver calls usb_of_get_companion_dev()
> > which is on usb/core/of.c, build error like below happens if we
> > disable CONFIG_USB because the usb/core/ needs CONFIG_USB:
> >
> > ERROR: "usb_of_get_companion_dev" [drivers/usb/gadget/udc/renesas_usb3.=
ko] undefined!
> >
> > According to the usb/gadget/Kconfig, "NOTE:  Gadget support
> > ** DOES NOT ** depend on host-side CONFIG_USB !!".
> > So, to fix the issue, this patch changes the usb_of_get_companion_dev()
> > place from usb/core/of.c to usb/common/common.c to be called by both
> > host and gadget.
> >
> > Reported-by: John Garry <john.garry@huawei.com>
> > Fixes: 39facfa01c9f ("usb: gadget: udc: renesas_usb3: Add register of u=
sb role switch")
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> On other email thread [1], Arnd said I have his Ack on this patch.
> So,
>=20
> Acked-by: Arnd Bergmann <arnd@arndb.de>
>=20
> [1]
> https://lkml.org/lkml/2018/8/20/216

I'm afraid but, would you apply this patch for linux v4.19?

Best regards,
Yoshihiro Shimoda
