Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:61864 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbeLAAdI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 19:33:08 -0500
From: Avri Altman <Avri.Altman@wdc.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>, Chris Ball <chris@printf.net>
Subject: RE: [PATCH mmc-utils] use proper type for RPMB blocks_cnt
Date: Fri, 30 Nov 2018 13:23:48 +0000
Message-ID: <SN6PR04MB492571316E97ADB6D9C2B0B9FCD30@SN6PR04MB4925.namprd04.prod.outlook.com>
References: <20181130125447.32218-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181130125447.32218-1-wsa+renesas@sang-engineering.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

>=20
> The JEDEC standard is confusing. The number of max blocks for reading
> RPMB is determined by CMD23 which can hold an unsigned int and not only
> u16. It is true that the current maximum is 64K of blocks, yet this may
> be extended in the future. Let's not apply a limit here which should be
> checked by the card.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>


> ---
>=20
> It is a bit academic, since we will be limited by MMC_IOC_MAX_BYTES in th=
e
> kernel anyhow. Still, because this is a subtle issue, I think it is worth
> documenting the proper use.
>=20
>  mmc_cmds.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/mmc_cmds.c b/mmc_cmds.c
> index 44623fe..69485e9 100644
> --- a/mmc_cmds.c
> +++ b/mmc_cmds.c
> @@ -2070,7 +2070,12 @@ int do_rpmb_read_counter(int nargs, char
> **argv)
>  int do_rpmb_read_block(int nargs, char **argv)
>  {
>  	int i, ret, dev_fd, data_fd, key_fd =3D -1;
> -	uint16_t addr, blocks_cnt;
> +	uint16_t addr;
> +	/*
> +	 * for reading RPMB, number of blocks is set by CMD23 only, the
> packet
> +	 * frame field for that is set to 0. So, the type is not u16 but uint!
> +	 */
> +	unsigned int blocks_cnt;
>  	unsigned char key[32];
>  	struct rpmb_frame frame_in =3D {
>  		.req_resp    =3D htobe16(MMC_RPMB_READ),
> --
> 2.11.0
