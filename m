Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw1-f66.google.com ([209.85.161.66]:37560 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbeKZJFJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 04:05:09 -0500
MIME-Version: 1.0
References: <20181120230832.1840-1-wsa+renesas@sang-engineering.com> <20181120230832.1840-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181120230832.1840-2-wsa+renesas@sang-engineering.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 25 Nov 2018 23:12:51 +0100
Message-ID: <CAJiuCccVQfMWNbfbznfb+baAf4aFZ0Cj7Ayz=p_PXND22Xa30Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] mmc: core: validate user input for RPMB block count
To: wsa+renesas@sang-engineering.com
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, 21 Nov 2018 at 00:10, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> For RPMB, block count is a non-zero 16 bit wide number. Reject invalid
> values from userspace instead of just masking the unneeded bits. Tested
> with a modified 'mmc-utils' package.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  drivers/mmc/core/block.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index c35b5b08bb33..9e0f7e4aa8c6 100644
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -550,6 +550,9 @@ static int __mmc_blk_ioctl_cmd(struct mmc_card *card,=
 struct mmc_blk_data *md,
>         }
>
>         if (idata->rpmb) {
> +               if (data.blocks > 65535 || !data.blocks)
> +                       return -EINVAL;
> +
>                 err =3D mmc_set_blockcount(card, data.blocks,
>                         idata->ic.write_flag & (1 << 31));
>                 if (err)
> --
> 2.11.0
>
