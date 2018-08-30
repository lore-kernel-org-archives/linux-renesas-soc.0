Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:31203 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725844AbeH3HEG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 03:04:06 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>
CC: Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: r8a77965: Fix HS-USB compatible
Date: Thu, 30 Aug 2018 03:04:06 +0000
Message-ID: <OSBPR01MB22935B8A7C939E2E185CA868D8080@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20180828135702.3748-1-geert+renesas@glider.be>
In-Reply-To: <20180828135702.3748-1-geert+renesas@glider.be>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Tuesday, August 28, 2018 10:57 PM
>=20
> Should be "renesas,usbhs-r8a77965", not "renesas,usbhs-r8a7796".
>=20
> Fixes: a06e8af801760a98 ("arm64: dts: renesas: r8a77965: add HS-USB node"=
)
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda
