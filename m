Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:56162 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726989AbeJQRKY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 13:10:24 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "horms@verge.net.au" <horms@verge.net.au>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: revise hsusb's reg size
Date: Wed, 17 Oct 2018 09:15:33 +0000
Message-ID: <OSBPR01MB2103A44A3F6CF4AB0024F6AEB8FF0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1539669890-25719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1539669890-25719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-San,

Thanks for the patch.

> -----Original Message-----
> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-
> owner@vger.kernel.org> On Behalf Of Yoshihiro Shimoda
> Sent: 16 October 2018 07:05
> To: horms@verge.net.au; magnus.damm@gmail.com
> Cc: linux-renesas-soc@vger.kernel.org; Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com>
> Subject: [PATCH] arm64: dts: renesas: revise hsusb's reg size
>
> This patch revises the reg size of each hsusb device node for r8a7795, r8=
a7796
> and r8a77965.
>
> Reported-by: Biju Das <biju.das@bp.renesas.com>
> Fixes: d2422e108812 ("arm64: dts: r8a7795: Add HSUSB device node")
> Fixes: 4725f2b88057 ("arm64: dts: renesas: r8a7795: add hsusb ch3 device
> node")
> Fixes: b9535853777f ("arm64: dts: r8a7796: Add HSUSB device node")
> Fixes: 9e1b00a2ef43 ("arm64: dts: renesas: r8a77965: Add "reg" properties=
")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Regards,
Biju



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
