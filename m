Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:43911 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752206AbdC2IjX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 04:39:23 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Felipe Balbi <balbi@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/4] usb: gadget: udc: renesas_usb3: add sysfs "role" to
 set "b-device" mode
Date: Wed, 29 Mar 2017 08:39:16 +0000
Message-ID: <PS1PR06MB1692295968CBE06D989A7633D8350@PS1PR06MB1692.apcprd06.prod.outlook.com>
References: <1490702004-8167-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1490702004-8167-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <87efxhhahj.fsf@linux.intel.com>
 <PS1PR06MB1692F6A720410D53A6972379D8350@PS1PR06MB1692.apcprd06.prod.outlook.com>
 <87d1d0fx4j.fsf@linux.intel.com>
 <PS1PR06MB1692C364D1D62FB487BD12F5D8350@PS1PR06MB1692.apcprd06.prod.outlook.com>
 <87inmsldc4.fsf@linux.intel.com>
In-Reply-To: <87inmsldc4.fsf@linux.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Felipe-san,

> From: Felipe Balbi, Sent: Wednesday, March 29, 2017 5:03 PM
>=20
> Yoshihiro-san
>=20
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> >> >> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> >> >> > Sadly, to change the role ("host" and "peripheral") of USB3.0 DRD
> >> >> > controller on R-Car Gen3, software has to set the DRD_CON registe=
r
> >> >> > which is included in a usb3.0 peripheral controler's register.
> >> >> > To simply implementation, the previous code always set peripheral=
 mode
> >> >> > as hardcoded. However, to support usb role swap in the future,
> >> >> > the hardcoded is not good. So, this patch adds sysfs "role" to se=
t
> >> >> > the mode by a user.
> >> >> > After applied this patch, since the DRD controller will act as ho=
st
> >> >> > mode after probed, a user needs to change the mode via the sysfs.
> >> >> >
> >> >> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.co=
m>
> >> >>
> >> >> in patch 3, you add extcon to monitor ID and VBUS pins. Do you real=
ly
> >> >> need this sysfs file at all?
> >> >
> >> > Yes. This is because this "role" sysfs file cannot monitor the ID an=
d VBUS pins.
> >> > The "role" only monitors the mode which is "host" or "peripheral".
> >>
> >> Right, I understand it can't monitor the state of ID/VBUS, but do you
> >> have a usecase for that file that's not covered by the other patches i=
n
> >> the series? :-)
> >
> > Thank you for the comment. Since my English skill is not good,
> > I don't understand your question.
>=20
> oh, that's alright. I'll try to explain:
>=20
> I'm asking if you have any situation where you need userspace to change
> the role manually. I understand it's a very nice feature to have during
> development because it frees us from searching for "the right cable";
> but if the only application of this sysfs file is durinb development,
> then perhaps it should be exposed using debugfs instead ;-)
>=20
> Hopefully that's easier to understand now.

Thank you for the explanation! I understood this :)

This "b-device" mode is totally for development purpose.
 - The old version SoC has a restriction (cannot monitor ID pin!),
   So even if a board has B connector, I should turn the mode to peripheral=
.
 - I would like to develop this driver using A connector on a board that is=
 related
   to SoC and board environment specification :)

So, I think this code is low priority thing for now.
Thus, I will remove this patch 1 and rebase other patches and resubmit late=
r today.

Best regards,
Yoshihiro Shimoda

> --
> balbi
