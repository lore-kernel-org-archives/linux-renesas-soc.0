Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:12680 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751318AbdJEKgY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 06:36:24 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Felipe Balbi <balbi@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: gadget: udc: renesas_usb3: Use
 of_device_get_match_data() helper
Date: Thu, 5 Oct 2017 10:36:19 +0000
Message-ID: <TY1PR06MB0992CC6C50B0A076F8742C33D8700@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1507119811-13053-1-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1507119811-13053-1-git-send-email-geert+renesas@glider.be>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Geert Uytterhoeven, Sent: Wednesday, October 4, 2017 9:24 PM
>=20
> Use the of_device_get_match_data() helper instead of open coding,
> postponing the matching until when it's really needed.
> Note that the renesas_usb3 driver is used with DT only, so there's
> always a valid match.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda
