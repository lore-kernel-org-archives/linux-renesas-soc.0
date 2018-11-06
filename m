Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-os2jpn01on0096.outbound.protection.outlook.com ([104.47.92.96]:6202
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726263AbeKFOqm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 09:46:42 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Marek Vasut <marek.vasut@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mmc: renesas_sdhi: Whitelist R8A77990 SDHI
Date: Tue, 6 Nov 2018 05:23:12 +0000
Message-ID: <OSBPR01MB229354EB9E8A056CDB0F92F4D8CB0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181105213935.11572-1-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181105213935.11572-1-marek.vasut+renesas@gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Marek-san,

> From: Marek Vasut, Sent: Tuesday, November 6, 2018 6:40 AM
>=20
> Whitelist R8A77990 E3 SoC in the SDHI driver. The SDHI core
> present in the SoC is an 8tap variant of the Gen3 SDHI core.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-renesas-soc@vger.kernel.org
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda
