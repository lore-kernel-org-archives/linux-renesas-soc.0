Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:31022 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbeLCOD4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 09:03:56 -0500
From: Avri Altman <Avri.Altman@wdc.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>, Chris Ball <chris@printf.net>
Subject: RE: [PATCH mmc-utils] fix GCC7 build by refactoring trimming routines
Date: Mon, 3 Dec 2018 14:02:45 +0000
Message-ID: <SN6PR04MB4925AE1C9D8FB94687CE1E15FCAE0@SN6PR04MB4925.namprd04.prod.outlook.com>
References: <20181203131923.1487-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181203131923.1487-1-wsa+renesas@sang-engineering.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

>=20
> I got a compile error with GCC7. When trimming white spaces from strings
> lsmmc uses strncpy with overlapping memory areas. This is not allowed.
> In addition, the implementation was not efficient with calling strlen
> and strncpy once per iteration. Refactor the code to be valid and more
> effective.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  lsmmc.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/lsmmc.c b/lsmmc.c
> index c4faa00..9737b37 100644
> --- a/lsmmc.c
> +++ b/lsmmc.c
> @@ -316,8 +316,9 @@ int parse_ids(struct config *config)
>  /* MMC/SD file parsing functions */
>  char *read_file(char *name)
>  {

See Uwe's note - https://www.spinics.net/lists/linux-mmc/msg51882.html

Cheers,
Avri
