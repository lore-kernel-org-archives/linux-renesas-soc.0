Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yb1-f196.google.com ([209.85.219.196]:46094 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbeKZJFa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 04:05:30 -0500
MIME-Version: 1.0
References: <20181120230832.1840-1-wsa+renesas@sang-engineering.com> <20181120230832.1840-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181120230832.1840-3-wsa+renesas@sang-engineering.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 25 Nov 2018 23:13:11 +0100
Message-ID: <CAJiuCcdoELfNASYjmdRyQD_BL3FD2+dFFRJ-ZVdPmEaVFeuzwg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] mmc: core: use mrq->sbc when sending CMD23 for RPMB
To: wsa+renesas@sang-engineering.com
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        masaharu.hayakawa.ry@renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, 21 Nov 2018 at 00:11, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> When sending out CMD23 in the blk preparation, the comment there
> rightfully says:
>
>          * However, it is not sufficient to just send CMD23,
>          * and avoid the final CMD12, as on an error condition
>          * CMD12 (stop) needs to be sent anyway. This, coupled
>          * with Auto-CMD23 enhancements provided by some
>          * hosts, means that the complexity of dealing
>          * with this is best left to the host. If CMD23 is
>          * supported by card and host, we'll fill sbc in and let
>          * the host deal with handling it correctly.
>
> Let's do this behaviour for RPMB as well, and not send CMD23
> independently. Otherwise IP cores (like Renesas SDHI) may timeout
> because of automatic CMD23/CMD12 handling.
>
> Reported-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>
> I also noticed that write_flag is an int, and we are playing with the sig=
n bit
> on 32-bit systems. But sadly this is exported to userspace...
>
>  drivers/mmc/core/block.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index 9e0f7e4aa8c6..66fc425615cd 100644
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -472,7 +472,7 @@ static int ioctl_do_sanitize(struct mmc_card *card)
>  static int __mmc_blk_ioctl_cmd(struct mmc_card *card, struct mmc_blk_dat=
a *md,
>                                struct mmc_blk_ioc_data *idata)
>  {
> -       struct mmc_command cmd =3D {};
> +       struct mmc_command cmd =3D {}, sbc =3D {};
>         struct mmc_data data =3D {};
>         struct mmc_request mrq =3D {};
>         struct scatterlist sg;
> @@ -553,10 +553,11 @@ static int __mmc_blk_ioctl_cmd(struct mmc_card *car=
d, struct mmc_blk_data *md,
>                 if (data.blocks > 65535 || !data.blocks)
>                         return -EINVAL;
>
> -               err =3D mmc_set_blockcount(card, data.blocks,
> -                       idata->ic.write_flag & (1 << 31));
> -               if (err)
> -                       return err;
> +               sbc.opcode =3D MMC_SET_BLOCK_COUNT;
> +               /* copy the 'Reliable Write' bit */
> +               sbc.arg =3D data.blocks | (idata->ic.write_flag & BIT(31)=
);
> +               sbc.flags =3D MMC_RSP_R1 | MMC_CMD_AC;
> +               mrq.sbc =3D &sbc;
>         }
>
>         if ((MMC_EXTRACT_INDEX_FROM_ARG(cmd.arg) =3D=3D EXT_CSD_SANITIZE_=
START) &&
> --
> 2.11.0
>
