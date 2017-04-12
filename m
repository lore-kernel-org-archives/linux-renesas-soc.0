Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:60006 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751396AbdDLAq5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Apr 2017 20:46:57 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/3] usb: host: xhci-plat: add support suspend/resume for
 R-Car
Date: Wed, 12 Apr 2017 00:46:41 +0000
Message-ID: <PS1PR06MB1692F1F7FCB02AC52E227FFCD8030@PS1PR06MB1692.apcprd06.prod.outlook.com>
References: <1489744955-29553-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1489744955-29553-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Mathias,

> From: Yoshihiro Shimoda, Sent: Friday, March 17, 2017 7:03 PM
>=20
> This patch adds support suspend/resume for R-Car controllers.
> The controllers need firmware downloading and the current code has
> such process only when probe timing. After suspend the system and
> the power of controller down, the driver needs to re-download the firmwar=
e
> in resume timing. This patch adds such a process.
> Also, since previous xhci-plat code didnn't handle the clk in suspend/res=
ume,
> this patch set has such process.

I'm afraid but would you review this patch set?
This can be applied on the latest Greg's usb.git / usb-next branch at the m=
oment.

Best regards,
Yoshihiro Shimoda

> Yoshihiro Shimoda (3):
>   usb: host: xhci-plat: enable clk in resume timing
>   usb: host: xhci-plat: add resume_quirk()
>   usb: host: xhci-plat: set resume_quirk() for R-Car controllers
>=20
>  drivers/usb/host/xhci-plat.c | 29 ++++++++++++++++++++++++++++-
>  drivers/usb/host/xhci-plat.h |  1 +
>  drivers/usb/host/xhci-rcar.c | 11 +++++++++++
>  drivers/usb/host/xhci-rcar.h |  6 ++++++
>  4 files changed, 46 insertions(+), 1 deletion(-)
>=20
> --
> 1.9.1
