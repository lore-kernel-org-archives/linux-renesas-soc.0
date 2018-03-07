Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:6274 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754279AbeCGLzU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Mar 2018 06:55:20 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Simon Horman <horms+renesas@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a7795: Add IPMMU-PV1 device node
Date: Wed, 7 Mar 2018 11:55:16 +0000
Message-ID: <TY1PR06MB09925629ADC09D1DA9FE43E6D8D80@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <20180306093430.12486-1-horms+renesas@verge.net.au>
In-Reply-To: <20180306093430.12486-1-horms+renesas@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon-san,

> From: Simon Horman, Sent: Tuesday, March 6, 2018 6:35 PM
>=20
> Add r8a7795 IPMMU-PV1 and keep it disabled by default.
>=20
> This device is not present in r8a7795 ES1.x and
> is removed from the DT of those SoCs.
>=20
> This corrects an omission in
> 3b7e7848f0e8 ("arm64: dts: renesas: r8a7795: Add IPMMU device nodes")
>=20
> This does not have any runtime effect.
>=20
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda
