Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:8795 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754493AbcKBAnV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2016 20:43:21 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Peter Chen <hzpeterchen@gmail.com>
CC: "kishon@ti.com" <kishon@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "Peter.Chen@nxp.com" <Peter.Chen@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] phy: rcar-gen3-usb2: add sysfs for usb role swap
Date: Wed, 2 Nov 2016 00:43:15 +0000
Message-ID: <HK2PR06MB0548F0CB64D8B6A2E32A052DD8A00@HK2PR06MB0548.apcprd06.prod.outlook.com>
References: <1477983718-4145-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20161101113743.GC28525@b29397-desktop>
In-Reply-To: <20161101113743.GC28525@b29397-desktop>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Peter,

> From: Peter Chen [mailto:hzpeterchen@gmail.com]
> Sent: Tuesday, November 01, 2016 8:38 PM
>=20
> On Tue, Nov 01, 2016 at 04:01:58PM +0900, Yoshihiro Shimoda wrote:
> > This patch adds sysfs "otg_inputs" for usb role swap. This parameter
> > is write-only and if you use them as the following, you can swap
> > the usb role.
> >
> > For example:
> >  1) connect a usb cable using 2 salvator-x boards
> >  2) On A-device (as host), you input the following command:
> >    # echo a_bus_req/ > /sys/devices/platform/soc/ee080200.usb-phy/otg_i=
nputs
> >  3) On B-device (as peripheral), you input the following command:
> >    # echo b_bus_req > /sys/devices/platform/soc/ee080200.usb-phy/otg_in=
puts
> >
> > Then, the A-device acts as a peripheral (A-peripheral) and the B-device
> > acts as a host (B-host).
> > Please note that A-device must input the following command if you
> > want the board to act as a host again. (even if you disconnect the usb
> > cable, since id state may be the same, the condition keeps "A-periphera=
l".)
> >  # echo a_bus_drop > /sys/devices/platform/soc/ee080200.usb-phy/otg_inp=
uts
> >
> > Also you can use the following command if you want the B-device board t=
o
> > act as a peripheral again.
> >  # echo b_bus_req/ > /sys/devices/platform/soc/ee080200.usb-phy/otg_inp=
uts
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  This patch is based on the latest linux-phy.git / next branch.
> >  (commit id =3D 7809cd2ce6abd4f431e4b14e6b1276a7cc842ac4)
> >
> >  Since this patch is related to usb, I added email addresses of Greg, F=
elipe,
> >  Peter and USB ML as CC. (This patch doesn't use USB OTG FSM though.)
> >
> >  Changed from v1:
> >   - rebase the latest next branch.
> >
> >  .../ABI/testing/sysfs-platform-phy-rcar-gen3-usb2  |  11 ++
> >  drivers/phy/phy-rcar-gen3-usb2.c                   | 124 +++++++++++++=
+++++++-
> >  2 files changed, 134 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/ABI/testing/sysfs-platform-phy-rcar-g=
en3-usb2
> >
> > diff --git a/Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb=
2
> b/Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb2
> > new file mode 100644
> > index 0000000..c7e715af
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb2
> > @@ -0,0 +1,11 @@
> > +What:		/sys/devices/platform/<phy-name>/otg-inputs
> > +Date:		October 2016
> > +KernelVersion:	4.10
> > +Contact:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > +Description:
> > +		This write-only file changes the phy mode for role swap of usb.
> > +		This file accepts the following strings:
> > +		 "a_bus_req/" - switching from A-Host to A-Peripheral
> > +		 "a_bus_drop" - switching from A-Peripheral to A-Host
> > +		 "b_bus_req"  - switching from B-Peripheral to B-Host
> > +		 "b_bus_req/" - switching from B-Host to B-Peripheral
>=20
> Would you really care OTG FSM state machine? If not, you could just use
> "host" and "peripheral" to stand for current USB role, and implement
> role switch sysfs like: /sys/devices/platform/<phy-name>/role.

Thank you for the comment!
Since I would not care OTG FSM state machine for now, I will modify the pat=
ch to
use "host" and "peripheral" that you suggested.

Best regards,
Yoshihiro Shimoda

> Peter
>=20
