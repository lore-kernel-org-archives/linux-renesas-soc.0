Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:62720 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753707AbdC2HY5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 03:24:57 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Felipe Balbi <balbi@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/4] usb: gadget: udc: renesas_usb3: add sysfs "role" to
 set "b-device" mode
Date: Wed, 29 Mar 2017 07:24:46 +0000
Message-ID: <PS1PR06MB1692C364D1D62FB487BD12F5D8350@PS1PR06MB1692.apcprd06.prod.outlook.com>
References: <1490702004-8167-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1490702004-8167-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <87efxhhahj.fsf@linux.intel.com>
 <PS1PR06MB1692F6A720410D53A6972379D8350@PS1PR06MB1692.apcprd06.prod.outlook.com>
 <87d1d0fx4j.fsf@linux.intel.com>
In-Reply-To: <87d1d0fx4j.fsf@linux.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> -----Original Message-----
> From: Felipe Balbi, Sent: Wednesday, March 29, 2017 2:52 PM
>=20
> Hi,
>=20
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> > Hi Felipe-san,
> >
> >> From: Felipe Balbi, Sent: Tuesday, March 28, 2017 9:06 PM
> >>
> >> Hi,
> >>
> >> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> >> > Sadly, to change the role ("host" and "peripheral") of USB3.0 DRD
> >> > controller on R-Car Gen3, software has to set the DRD_CON register
> >> > which is included in a usb3.0 peripheral controler's register.
> >> > To simply implementation, the previous code always set peripheral mo=
de
> >> > as hardcoded. However, to support usb role swap in the future,
> >> > the hardcoded is not good. So, this patch adds sysfs "role" to set
> >> > the mode by a user.
> >> > After applied this patch, since the DRD controller will act as host
> >> > mode after probed, a user needs to change the mode via the sysfs.
> >> >
> >> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >>
> >> in patch 3, you add extcon to monitor ID and VBUS pins. Do you really
> >> need this sysfs file at all?
> >
> > Yes. This is because this "role" sysfs file cannot monitor the ID and V=
BUS pins.
> > The "role" only monitors the mode which is "host" or "peripheral".
>=20
> Right, I understand it can't monitor the state of ID/VBUS, but do you
> have a usecase for that file that's not covered by the other patches in
> the series? :-)

Thank you for the comment. Since my English skill is not good,
I don't understand your question.
But,

> If you want to force renesas controller to peripheral mode, then
> shouldn't you use dr-mode device_property() instead?

I agree with you. I will use the dr-mode property on this driver,
instead of this sysfs' "b-device" argument.

Best regards,
Yoshihiro Shimoda

> --
> balbi
