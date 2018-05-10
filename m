Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:22650 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1756582AbeEJH0C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 May 2018 03:26:02 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "balbi@kernel.org" <balbi@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2 0/6] usb: gadget: udc: renesas_usb3: fix some major
 issues
Date: Thu, 10 May 2018 07:25:58 +0000
Message-ID: <OSBPR01MB229317DA6F56C0E875285DF2D8980@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1523338734-20474-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1523338734-20474-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Felipe,

> From: Yoshihiro Shimoda, Sent: Tuesday, April 10, 2018 2:39 PM
>=20
> This patch set is based on v4.16.

Would you review this patch set?
I checked this is able to be applied on your testing/fixes branch.

Best regards,
Yoshihiro Shimoda

> Changes from v1:
>  - Add Reviewed-by in patch 1, 2, 3 and 4.
>  - Revise typo in patch 4.
>  - Add new patches as patch 5 and 6.
>=20
> Yoshihiro Shimoda (6):
>   usb: gadget: udc: renesas_usb3: fix double phy_put()
>   usb: gadget: udc: renesas_usb3: should remove debugfs
>   usb: gadget: udc: renesas_usb3: should call pm_runtime_enable() before
>     add udc
>   usb: gadget: udc: renesas_usb3: should call devm_phy_get() before add
>     udc
>   usb: gadget: udc: renesas_usb3: should fail if devm_phy_get() returns
>     error
>   usb: gadget: udc: renesas_usb3: disable the controller's irqs for
>     reconnecting
>=20
>  drivers/usb/gadget/udc/renesas_usb3.c | 37 +++++++++++++++++++++++------=
------
>  1 file changed, 25 insertions(+), 12 deletions(-)
>=20
> --
> 1.9.1
