Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:65161 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1756334AbeDFOIA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Apr 2018 10:08:00 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [RFC PATCH] mmc: renesas_sdhi_internal_dmac: limit DMA RX for old
 SoCs
Date: Fri, 6 Apr 2018 14:07:50 +0000
Message-ID: <TY1PR06MB0992C4D564358E2EBC77112DD8BA0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <20180404164507.3394-1-wsa@the-dreams.de>
In-Reply-To: <20180404164507.3394-1-wsa@the-dreams.de>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Thursday, April 5, 2018 1:45 AM
>=20
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Early revisions of certain SoCs cannot do multiple DMA RX streams in
> parallel. To avoid data corruption, only allow one DMA RX channel and
> fall back to PIO, if needed.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
<snip>
> Shimoda-san: what do you think of this approach? Please note that I didn'=
t
> remove the 'revision' from the whitelist yet. This will be done increment=
ally.
> I thought to first fix the data corruption issue.

This approach is nice to me.

I checked this patch and looks good. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, our test team tested this patch and works correctly. So,

Tested-by: Nguyen Viet Dung <dung.nguyen.aj@renesas.com>

Best regards,
Yoshihiro Shimoda
