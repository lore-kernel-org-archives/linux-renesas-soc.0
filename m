Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ty1jpn01on0125.outbound.protection.outlook.com ([104.47.93.125]:2272
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726263AbeKFOsH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 09:48:07 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Marek Vasut <marek.vasut@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC: TAKESHI KIHARA <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] pinctrl: sh-pfc: r8a77990: Add voltage switch
 operations for SDHI
Date: Tue, 6 Nov 2018 05:24:36 +0000
Message-ID: <OSBPR01MB229322D571690B77B9A42501D8CB0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181105214012.11626-1-marek.vasut+renesas@gmail.com>
 <20181105214012.11626-2-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181105214012.11626-2-marek.vasut+renesas@gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Marek-san,

> From: Marek Vasut, Sent: Tuesday, November 6, 2018 6:40 AM
>=20
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>=20
> This patch supports the {get,set}_io_voltage operations of SDHI.
>=20
> This operates the IOCTRL30 register on the R8A77990 SoC and makes
> 1.8V/3.3V signal voltage switch possible.
>=20
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda
