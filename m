Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:20434 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436604AbeKVWyn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Nov 2018 17:54:43 -0500
From: Avri Altman <Avri.Altman@wdc.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC PATCH 1/3] mmc: core: validate user input for RPMB block
 count
Date: Thu, 22 Nov 2018 12:15:33 +0000
Message-ID: <SN6PR04MB49251A94A2BF6E60D12919E1FCDB0@SN6PR04MB4925.namprd04.prod.outlook.com>
References: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
 <20181120230832.1840-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181120230832.1840-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

>=20
> For RPMB, block count is a non-zero 16 bit wide number. Reject invalid
Actually this is not what limits the number of rpmb frames to be read,
As those are not indicated in the block_count field of the rpmb frame,
But in CMD23.
While it is true that by eMMCv52 RPMB_SIZE_MULT max value is 0x80,
Which limits the RPMB are to 16M, or 65535 rpmb frames,
I don't think that it is up to the host to validate the rpmb frame content =
-=20
The device will return the appropriate error should such an error occur.
Also, specs are changing from time to time, so hard-coding 65535 is less ap=
propriate.

> values from userspace instead of just masking the unneeded bits. Tested
> with a modified 'mmc-utils' package.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/mmc/core/block.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index c35b5b08bb33..9e0f7e4aa8c6 100644
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -550,6 +550,9 @@ static int __mmc_blk_ioctl_cmd(struct mmc_card
> *card, struct mmc_blk_data *md,
>  	}
>=20
>  	if (idata->rpmb) {
> +		if (data.blocks > 65535 || !data.blocks)
> +			return -EINVAL;
> +

Other than my comment above, this series looks fine to me.

Thanks,
Avri
