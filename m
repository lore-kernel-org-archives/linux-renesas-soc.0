Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:42268 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725844AbeH3HEs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 03:04:48 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: r8a77965: Fix clock/reset for
 usb2_phy1
Date: Thu, 30 Aug 2018 03:04:48 +0000
Message-ID: <OSBPR01MB22938CB79DF68D66A40D7E9DD8080@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20180828141327.6916-1-geert+renesas@glider.be>
In-Reply-To: <20180828141327.6916-1-geert+renesas@glider.be>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Tuesday, August 28, 2018 11:13 PM
>=20
> usb2_phy1 accidentally uses the same clock/reset as usb2_phy0.
>=20
> Fixes: b5857630a829a8d5 ("arm64: dts: renesas: r8a77965: add usb2_phy nod=
es")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda
