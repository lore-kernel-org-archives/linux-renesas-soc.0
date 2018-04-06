Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:63125 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754636AbeDFOH5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Apr 2018 10:07:57 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [RFC PATCH] mmc: renesas_sdhi_internal_dmac: use more generic
 whitelisting
Date: Fri, 6 Apr 2018 14:07:53 +0000
Message-ID: <TY1PR06MB0992B109555E82B9B7F47DA5D8BA0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <20180404164507.3394-1-wsa@the-dreams.de>
 <20180405164216.7175-1-wsa@the-dreams.de>
In-Reply-To: <20180405164216.7175-1-wsa@the-dreams.de>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Friday, April 6, 2018 1:42 AM
>=20
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Whitelisting every ES version does not scale. So, we whitelist whole
> SoCs independent of ES version. If we need specific handling for an ES
> version, we put it to the front, so it will be matched first.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Shimoda-san: here is my example how to re-arrange the whitelisting if we =
assume
> that the DMA RX fix is going to work out (so this patch depends on it). I
> tested this patch on H3 ES1.0 and ES2.0 with some additional debug output=
 to
> prove that the correct table entry was matched.
>=20
> What do you think?

It looks like nice to me! So, I checked this patch and looks good.

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, our test team tested this patch and works correctly. So,

Tested-by: Nguyen Viet Dung <dung.nguyen.aj@renesas.com>

Best regards,
Yoshihiro Shimoda
