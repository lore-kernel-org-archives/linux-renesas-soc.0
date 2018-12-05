Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:45438 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbeLEOXr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 09:23:47 -0500
Received: by mail-vs1-f68.google.com with SMTP id v10so12144714vsv.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Dec 2018 06:23:47 -0800 (PST)
MIME-Version: 1.0
References: <20181126133814.1185-1-wsa+renesas@sang-engineering.com> <20181126133814.1185-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181126133814.1185-2-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Dec 2018 15:23:10 +0100
Message-ID: <CAPDyKFpNSKyVGrKmvDO=qekv+2CZur25+t_aURwLOQP-B3U2rg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: core: use mrq->sbc when sending CMD23 for RPMB
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Avri Altman <Avri.Altman@wdc.com>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, 26 Nov 2018 at 14:38, Wolfram Sang
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
> Tested-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>

Applied for next and by adding a stable tag, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/core/block.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index c35b5b08bb33..111934838da2 100644
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
> @@ -550,10 +550,15 @@ static int __mmc_blk_ioctl_cmd(struct mmc_card *car=
d, struct mmc_blk_data *md,
>         }
>
>         if (idata->rpmb) {
> -               err =3D mmc_set_blockcount(card, data.blocks,
> -                       idata->ic.write_flag & (1 << 31));
> -               if (err)
> -                       return err;
> +               sbc.opcode =3D MMC_SET_BLOCK_COUNT;
> +               /*
> +                * We don't do any blockcount validation because the max =
size
> +                * may be increased by a future standard. We just copy th=
e
> +                * 'Reliable Write' bit here.
> +                */
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
