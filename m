Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:48756 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752490AbdC2CBD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 22:01:03 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Felipe Balbi <balbi@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/4] usb: gadget: udc: renesas_usb3: add sysfs "role" to
 set "b-device" mode
Date: Wed, 29 Mar 2017 02:00:51 +0000
Message-ID: <PS1PR06MB1692F6A720410D53A6972379D8350@PS1PR06MB1692.apcprd06.prod.outlook.com>
References: <1490702004-8167-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1490702004-8167-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <87efxhhahj.fsf@linux.intel.com>
In-Reply-To: <87efxhhahj.fsf@linux.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Felipe-san,

> From: Felipe Balbi, Sent: Tuesday, March 28, 2017 9:06 PM
>=20
> Hi,
>=20
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> > Sadly, to change the role ("host" and "peripheral") of USB3.0 DRD
> > controller on R-Car Gen3, software has to set the DRD_CON register
> > which is included in a usb3.0 peripheral controler's register.
> > To simply implementation, the previous code always set peripheral mode
> > as hardcoded. However, to support usb role swap in the future,
> > the hardcoded is not good. So, this patch adds sysfs "role" to set
> > the mode by a user.
> > After applied this patch, since the DRD controller will act as host
> > mode after probed, a user needs to change the mode via the sysfs.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> in patch 3, you add extcon to monitor ID and VBUS pins. Do you really
> need this sysfs file at all?

Yes. This is because this "role" sysfs file cannot monitor the ID and VBUS =
pins.
The "role" only monitors the mode which is "host" or "peripheral".

Best regards,
Yoshihiro Shimoda

> --
> balbi
