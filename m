Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pu1apc01on0118.outbound.protection.outlook.com ([104.47.126.118]:34569
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726720AbeJXRNE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Oct 2018 13:13:04 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] arm64: dts: renesas: add/enable USB2.0 peripheral for
 R-Car [DE]3
Date: Wed, 24 Oct 2018 08:45:46 +0000
Message-ID: <TY2PR01MB2297BF50E7789F54C1FDAE05D8F60@TY2PR01MB2297.jpnprd01.prod.outlook.com>
References: <1539669909-25767-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181017085345.sbzrcxbxyajyvvop@verge.net.au>
 <OSBPR01MB2293AE3D7213D255E2416B28D8F60@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2293AE3D7213D255E2416B28D8F60@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon-san again,

> From: Yoshihiro Shimoda, Sent: Wednesday, October 24, 2018 10:05 AM
>=20
> Hi Simon-san,
>=20
> > From: Simon Horman, Sent: Wednesday, October 17, 2018 5:54 PM
> >
> > On Tue, Oct 16, 2018 at 03:05:09PM +0900, Yoshihiro Shimoda wrote:
> > > This patch adds/enables USB2.0 peripheral for R-Car [DE]3 boards.
> > > So, the default mode on each board is:
> > >  - R-Car D3 Draak board (has a type-A connector) =3D host.
> > >  - R-Car E3 Ebisu board (has a type-B micro connector) =3D peripheral=
.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > Thanks Shimoda-san,
> >
> > This looks fine to me but I will wait to see if there are other reviews
> > before applying.
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>=20
> Thank you for your review!
> However, I'm afraid but, would you wait to apply this patch for a moment?
> I realized this board also connects the ID pin to the SoC. So. I'd like t=
o try to use
> the pin like other R-Car Gen3 boards.

The R-Car E3 Ebisu board can use the ID pin.
# Main problem is my using usb connector converter for R-Car E3 doesn't con=
nect the ID pin to the GND.
# If I used other usb connector converter, it worked correctly...

So, I submitted v3 patch like below:
https://patchwork.kernel.org/patch/10654395/

Best regards,
Yoshihiro Shimoda
