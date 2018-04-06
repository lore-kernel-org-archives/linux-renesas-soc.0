Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:64130 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1756321AbeDFOH6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Apr 2018 10:07:58 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [RFC PATCH] mmc: renesas_sdhi_internal_dmac: fall back to PIO if
 scatterlist doesn't match
Date: Fri, 6 Apr 2018 14:07:52 +0000
Message-ID: <TY1PR06MB09927F9647E55AD4B6D565C0D8BA0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <20180404170035.5507-1-wsa@the-dreams.de>
In-Reply-To: <20180404170035.5507-1-wsa@the-dreams.de>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Thursday, April 5, 2018 2:01 AM
>=20
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> If we detect an incompatible scatterlist, we should fall back to PIO,
> too.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> I found this while working on the RX DMA issue. I don't see a reason why =
we
> shouldn't fall back in this case as well. But maybe I am missing somethin=
g.
>=20
> Shimoda-san: what do you think?
>=20
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/=
host/renesas_sdhi_internal_dmac.c
> index 380570a26a09..561e90755a3b 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -161,11 +161,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc=
_host *host,
>  	enum dma_data_direction dir;
>  	int ret;
>=20
> -	/* This DMAC cannot handle if sg_len is not 1 */

I would like to keep this comment.

> -	WARN_ON(host->sg_len > 1);
> -
> -	/* This DMAC cannot handle if buffer is not 8-bytes alignment */
> -	if (!IS_ALIGNED(sg->offset, 8))
> +	if (WARN_ON(host->sg_len > 1) || !IS_ALIGNED(sg->offset, 8))

As Ulf-san said on other thread about this WARN_ON(),
I think dropping the WARN_ON() is better.

Best regards,
Yoshihiro Shimoda
