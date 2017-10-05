Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:15372 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751418AbdJEKn4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 06:43:56 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: host: xhci-plat: Use of_device_get_match_data()
 helper
Date: Thu, 5 Oct 2017 10:38:50 +0000
Message-ID: <TY1PR06MB0992A55B59D6052760CC29E1D8700@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1507119903-13148-1-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1507119903-13148-1-git-send-email-geert+renesas@glider.be>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Geert Uytterhoeven, Sent: Wednesday, October 4, 2017 9:25 PM
>=20
> Use the of_device_get_match_data() helper instead of open coding.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

But, it seems too late about this Reviewed-by though...
https://marc.info/?l=3Dlinux-usb&m=3D150719811907415&w=3D2

Best regards,
Yoshihiro Shimoda
