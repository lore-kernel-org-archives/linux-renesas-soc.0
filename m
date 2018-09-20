Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:8261 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726295AbeITLgp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Sep 2018 07:36:45 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: revise properties for usb 2.0
Date: Thu, 20 Sep 2018 05:55:00 +0000
Message-ID: <OSBPR01MB22938356A189FF10698CDBC4D8130@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1535703651-5152-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180905103326.lsn57rilweolpews@verge.net.au>
In-Reply-To: <20180905103326.lsn57rilweolpews@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon-san,

> From: Simon Horman, Sent: Wednesday, September 5, 2018 7:33 PM
>=20
> On Fri, Aug 31, 2018 at 05:20:51PM +0900, Yoshihiro Shimoda wrote:
> > R-Car Gen3 needs to enable/deassert clocks/resets of both usb 2.0
> > host (included phy) and peripheral. Otherwise, other side device
> > cannot work correctly. So, this patch revises properties of clocks
> > and resets. After that, each device driver can enable/deassert
> > clocks/resets by its self.
> >
> > Notes:
> >  - To work the renesas_usbhs driver correctly when host side drivers
> >    are disabled and the renesas_usbhs driver doesn't have multiple
> >    clock management, this patch doesn't change the order of the clocks
> >    property in each hsusb node.
> >  - This patch doesn't have any side-effects even if the renesas_usbhs
> >    driver doesn't have reset_control and multiple clock management.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> Thanks Shimoda-san,
>=20
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
>=20
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thank you for your review!
However, since clock-names will be not used by renesas_usbhs driver,
I'll submit v2 patch to remove the properties.

Best regards,
Yoshihiro Shimoda
