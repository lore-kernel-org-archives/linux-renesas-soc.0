Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:33032 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbeLEOXx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 09:23:53 -0500
Received: by mail-vs1-f68.google.com with SMTP id p74so12179991vsc.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Dec 2018 06:23:51 -0800 (PST)
MIME-Version: 1.0
References: <20181126133814.1185-1-wsa+renesas@sang-engineering.com> <20181126133814.1185-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181126133814.1185-3-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Dec 2018 15:23:14 +0100
Message-ID: <CAPDyKFqbbW0vyi=+p1M9rP6TOr=zAF78H2Juh+J4TXURaJPP+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: core: remove obsolete mmc_set_blockcount() function
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Avri Altman <Avri.Altman@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, 26 Nov 2018 at 14:38, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The only user was converted to fill a sbc command which is the proper
> way to do it because of AutoCMD23 feature of some hosts.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/core/core.c | 14 --------------
>  drivers/mmc/core/core.h |  2 --
>  2 files changed, 16 deletions(-)
>
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 50a5c340307b..d3085f70e9a4 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -2413,20 +2413,6 @@ int mmc_set_blocklen(struct mmc_card *card, unsign=
ed int blocklen)
>  }
>  EXPORT_SYMBOL(mmc_set_blocklen);
>
> -int mmc_set_blockcount(struct mmc_card *card, unsigned int blockcount,
> -                       bool is_rel_write)
> -{
> -       struct mmc_command cmd =3D {};
> -
> -       cmd.opcode =3D MMC_SET_BLOCK_COUNT;
> -       cmd.arg =3D blockcount & 0x0000FFFF;
> -       if (is_rel_write)
> -               cmd.arg |=3D 1 << 31;
> -       cmd.flags =3D MMC_RSP_SPI_R1 | MMC_RSP_R1 | MMC_CMD_AC;
> -       return mmc_wait_for_cmd(card->host, &cmd, 5);
> -}
> -EXPORT_SYMBOL(mmc_set_blockcount);
> -
>  static void mmc_hw_reset_for_init(struct mmc_host *host)
>  {
>         mmc_pwrseq_reset(host);
> diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
> index 087ba68b2920..8fb6bc37f808 100644
> --- a/drivers/mmc/core/core.h
> +++ b/drivers/mmc/core/core.h
> @@ -118,8 +118,6 @@ int mmc_erase_group_aligned(struct mmc_card *card, un=
signed int from,
>  unsigned int mmc_calc_max_discard(struct mmc_card *card);
>
>  int mmc_set_blocklen(struct mmc_card *card, unsigned int blocklen);
> -int mmc_set_blockcount(struct mmc_card *card, unsigned int blockcount,
> -                       bool is_rel_write);
>
>  int __mmc_claim_host(struct mmc_host *host, struct mmc_ctx *ctx,
>                      atomic_t *abort);
> --
> 2.11.0
>
