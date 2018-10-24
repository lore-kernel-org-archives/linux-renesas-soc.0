Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-os2jpn01on0130.outbound.protection.outlook.com ([104.47.92.130]:14752
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725979AbeJXLPq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Oct 2018 07:15:46 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] arm64: dts: renesas: add/enable USB2.0 peripheral for
 R-Car [DE]3
Date: Wed, 24 Oct 2018 01:05:18 +0000
Message-ID: <OSBPR01MB2293AE3D7213D255E2416B28D8F60@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1539669909-25767-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181017085345.sbzrcxbxyajyvvop@verge.net.au>
In-Reply-To: <20181017085345.sbzrcxbxyajyvvop@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon-san,

> From: Simon Horman, Sent: Wednesday, October 17, 2018 5:54 PM
>=20
> On Tue, Oct 16, 2018 at 03:05:09PM +0900, Yoshihiro Shimoda wrote:
> > This patch adds/enables USB2.0 peripheral for R-Car [DE]3 boards.
> > So, the default mode on each board is:
> >  - R-Car D3 Draak board (has a type-A connector) =3D host.
> >  - R-Car E3 Ebisu board (has a type-B micro connector) =3D peripheral.
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
However, I'm afraid but, would you wait to apply this patch for a moment?
I realized this board also connects the ID pin to the SoC. So. I'd like to =
try to use
the pin like other R-Car Gen3 boards.

Best regards,
Yoshihiro Shimoda
