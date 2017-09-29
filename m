Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:19545 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751042AbdI2CDx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2017 22:03:53 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "kishon@ti.com" <kishon@ti.com>, "sre@kernel.org" <sre@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
CC: "heiko@sntech.de" <heiko@sntech.de>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
        "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>,
        "wens@csie.org" <wens@csie.org>,
        "chanwoo@kernel.org" <chanwoo@kernel.org>,
        "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org"
        <linux-rockchip@lists.infradead.org>
Subject: RE: [PATCH] extcon: Split out extcon header file for consumer and
 provider device
Date: Fri, 29 Sep 2017 02:03:47 +0000
Message-ID: <TY1PR06MB0992097F0FBBE04CD282EEE7D87E0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <CGME20170929000148epcas2p200e56186b067ec626a033c7ae2d4bbdb@epcas2p2.samsung.com>
 <1506643305-4581-1-git-send-email-cw00.choi@samsung.com>
In-Reply-To: <1506643305-4581-1-git-send-email-cw00.choi@samsung.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Chanwoo Choi
> Sent: Friday, September 29, 2017 9:02 AM
>=20
< snip >
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c      |   2 +-
< snip >
>  drivers/usb/gadget/udc/renesas_usb3.c         |   2 +-

These two drivers need the modification.
But...

< snip >
> diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usb=
hs/common.h
> index 8c5fc12ad778..a78764bc23eb 100644
> --- a/drivers/usb/renesas_usbhs/common.h
> +++ b/drivers/usb/renesas_usbhs/common.h
> @@ -17,7 +17,7 @@
>  #ifndef RENESAS_USB_DRIVER_H
>  #define RENESAS_USB_DRIVER_H
>=20
> -#include <linux/extcon.h>
> +#include <linux/extcon-provider.h>

Since this driver doesn't use any extcon-provider APIs for now,
we doesn't need the modification, IIUC.

Best regards,
Yoshihiro Shimoda
